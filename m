Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F21BA455
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 15:13:07 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT3ZJ-000425-H3
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 09:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3YT-0003Tb-3R
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 09:12:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3YS-0003HB-7p
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 09:12:12 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT3YR-0003Gy-RD
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 09:12:11 -0400
Received: by mail-ot1-x342.google.com with SMTP id m13so25947642otf.6
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fe4tY7v+8FryL6AjQk0StjZNLTgG103DVMbaRRMi5T4=;
 b=FwuQL0g3PXpcHWjvNFHHWWu8C18OuGa0TT8XnsFEdotuT+ujvyIQFvQvZBKnHYQPaI
 /SZ90YsHq1L5MGaNtzfbsHotcNLelzOGvr/0nEcCt6cnEto0nKI+lmDrMYmjjC8eAPnv
 tfqk0lKDY2FIjNOIedD/F1YuLlx0tb2AEy7/J0EV6oECzki/d16pgdIBgabxeKGW1t+9
 ln3bZ6L9ejpKg52rIj2BgqlFXQ0cTTZcHG3M6Pu50SBA8QEnDPUXrBXiw3iH4i+9rKOV
 MGMWBIQs3XWxevTZxalRGoJ3BDAUxQc6e6qP+c9ttQ+KJLnLYve06R0WoMIshrgjClRI
 7n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fe4tY7v+8FryL6AjQk0StjZNLTgG103DVMbaRRMi5T4=;
 b=fBo9jIuZpnnqmCFooy+7gp7jY/Uc62Kwamwk8pUEQZ0s4ZIYZlVmKJhqpoJHJlahg/
 cqdDptykpcva9B2y2wy5C9XwuVMtcnF019cu5il0AUCVc65/nV1d4JXKlmHYAnrrlVg3
 c7gUGKe/ehvyQKidQwizKDXPeF3pqza3iGSTZYGZNqscvO+SWMhvpql4r7Q/cZD+Njvo
 DyGtHKMuKmNTIJ9GV9ihI0iN4EhTu2MCRvxtqdFOhEXnspotFd4YI98mYfPrvwruH1Q3
 cdgQJuUW2Pi1NYYeTib4crCiwspfMbJzTGIisSvp3wi7eEaQnlejibp9W54M3aNcHlhE
 S1Jg==
X-Gm-Message-State: AGi0PubNk5reQvtvbCbw1W1oCNZ7inIW8OO8/YXcVzIEoNo3Y9MB+AeL
 9BXdgfBHZbrbWY5Uk8Ly5bjf+FsO5gZBkFUzOC9YIA==
X-Google-Smtp-Source: APiQypJvq13DfZbBxyQF+JK0DKJ9gEzMi9GehRyMWodPVmzHmnnC9GAzh0Bg1z3DppZv/3RzQsf512QY9CoCPygwOGw=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr18629606otb.135.1587993130396; 
 Mon, 27 Apr 2020 06:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200427121823.8094-1-changbin.du@gmail.com>
In-Reply-To: <20200427121823.8094-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 14:11:59 +0100
Message-ID: <CAFEAcA8jBM5M3FLajekUpSzdqjHV-euBn+jU7GZ_ihHgjvKMjw@mail.gmail.com>
Subject: Re: [PATCH] ui/sdl2: fix segment fault caused by null pointer
 dereference
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Apr 2020 at 13:19, Changbin Du <changbin.du@gmail.com> wrote:
>
> I found SDL_GetWindowFromID() sometimes return NULL when I start qemu via
> ssh forwarding even the window has been crated already. I am not sure
> whether this is a bug of SDL, but we'd better check it carefully.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  ui/sdl2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index 3c9424eb42..7c9c93b951 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -332,6 +332,9 @@ static void handle_keydown(SDL_Event *ev)
>      int gui_key_modifier_pressed = get_mod_state();
>      int gui_keysym = 0;
>
> +    if (!scon)
> +        return;
> +
>      if (!scon->ignore_hotkeys && gui_key_modifier_pressed && !ev->key.repeat) {
>          switch (ev->key.keysym.scancode) {
>          case SDL_SCANCODE_2:
> @@ -412,6 +415,9 @@ static void handle_keyup(SDL_Event *ev)
>  {
>      struct sdl2_console *scon = get_scon_from_window(ev->key.windowID);
>
> +    if (!sconf)
> +        return;

It's generally a good idea to make sure your patch at least compiles
before sending it :-)

QEMU coding style demands {} on all if statements.

thanks
-- PMM

