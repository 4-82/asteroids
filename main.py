import pygame
from constants import SCREEN_HEIGHT, SCREEN_WIDTH, PLAYER_RADIUS
from player import Player

def main():
    pygame.init()
    player = Player((SCREEN_WIDTH / 2), (SCREEN_HEIGHT / 2))
    clock = pygame.time.Clock()
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    dt = 0 

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return

        screen.fill("#000000")
        player.draw(screen)
        pygame.display.flip()
        clock.tick(60)
        dt = (clock.tick(60) / 1000)

if __name__ == "__main__":
    main()
