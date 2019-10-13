Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81DD56A1
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 17:35:57 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJfuV-0008F1-Qv
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 11:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1iJftB-0007W9-0G
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 11:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1iJft9-0003fz-Sf
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 11:34:32 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:42628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1iJft9-0003fc-M7
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 11:34:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id BD90C175B;
 Sun, 13 Oct 2019 17:34:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNeFmOFu3r_t; Sun, 13 Oct 2019 17:34:24 +0200 (CEST)
Received: from function (unknown [IPv6:2a01:cb19:979:800:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 0C6991757;
 Sun, 13 Oct 2019 17:34:24 +0200 (CEST)
Received: from samy by function with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1iJft1-0006tV-9N; Sun, 13 Oct 2019 17:34:23 +0200
Date: Sun, 13 Oct 2019 17:34:23 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Matthew Kilgore <mattkilgore12@gmail.com>
Subject: Re: [PATCH v2 1/2] curses: use the bit mask constants provided by
 curses
Message-ID: <20191013153423.kh5bl4bsr7ybfiaz@function>
References: <20191004035338.25601-1-mattkilgore12@gmail.com>
 <20191004035338.25601-2-mattkilgore12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004035338.25601-2-mattkilgore12@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.233.100.1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: philmd@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matthew Kilgore, le jeu. 03 oct. 2019 23:53:37 -0400, a ecrit:
> The curses API provides the A_ATTRIBUTES and A_CHARTEXT bit masks for
> getting the attributes and character parts of a chtype, respectively. We
> should use provided constants instead of using 0xff.
> 
> Signed-off-by: Matthew Kilgore <mattkilgore12@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Tested-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  ui/curses.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/curses.c b/ui/curses.c
> index ec281125acbd..84003f56a323 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -75,8 +75,8 @@ static void curses_update(DisplayChangeListener *dcl,
>      line = screen + y * width;
>      for (h += y; y < h; y ++, line += width) {
>          for (x = 0; x < width; x++) {
> -            chtype ch = line[x] & 0xff;
> -            chtype at = line[x] & ~0xff;
> +            chtype ch = line[x] & A_CHARTEXT;
> +            chtype at = line[x] & A_ATTRIBUTES;
>              ret = getcchar(&vga_to_curses[ch], wch, &attrs, &colors, NULL);
>              if (ret == ERR || wch[0] == 0) {
>                  wch[0] = ch;
> -- 
> 2.23.0
> 

-- 
Samuel
The nice thing about Windows is - It does not just crash, it displays a
dialog box and lets you press 'OK' first.
(Arno Schaefer's .sig)

