Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FC6E6BD2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 20:12:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1popml-0006gR-M3; Tue, 18 Apr 2023 14:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1popmi-0006fy-IE
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 14:10:32 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1popmg-0005YZ-Cx
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 14:10:32 -0400
Received: by mail-ej1-x634.google.com with SMTP id b16so208587ejz.3
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681841427; x=1684433427;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5WtlRNnNqU5WYL0Ne5EUXDA7D3Mh4l6OW5WAeQsdOK4=;
 b=fU0+DZhfCS5f7KkSEXYLFSXO7bh+5iYUui+8QPjPrBdTa+gEhHXwuRAuJl5xxFTeHs
 d6rSxaKEBH51cFNz3IyUS6Et2Q6R4YmGmprZSpat2267Ngo+3g4UPM26tvZWdsibEyHP
 SZtGy3+w4AHaKNj72Ya4s6scZIZAYFvDdDbvytc1y7bt8ybhgQIFf+nSphph1oWmMaP2
 lkAmzOFhgcKDmF/2TUu5qfe3cLPBeeVWnmtnOkmyyriIaw1YFTH2SwfnBDD2nGzcASot
 V9HQ+AQaeBFfd9qB2rB/oJrB2ZVCF7gQvM4mkOrV7K8va6nrOPumxxZt14XOYAWHl8ln
 E83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681841427; x=1684433427;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5WtlRNnNqU5WYL0Ne5EUXDA7D3Mh4l6OW5WAeQsdOK4=;
 b=SSyszBmsE5llBEd78w2Rmkmu/Kxc7K0Y+6d3rT9U/sn8wIz1ynp+1Q2rSK9t2KQzgi
 h8Ted9ottaogxNH2Iepj/BkVhgWXld5h1HY4VHS1/MEtEDc8y93LbU3zzBOOfaIYEraw
 To3tJRtT6YYFBjX5/nAbwiUnOvuTUGOgFadZ6LNRK8ftU1g/1gOhKHylni6GzU0o9a5/
 JUts0Xpxb+cojsnyQC7iImxdbbkfkf92UCtHvuzFGzga2ZUPgnWq90UetDz7chzN+Ugn
 DL6ta1G1eX+bklGXI/VqYCReca/rdkoVtyPzgPGz+nXG0fUiu0RheHe/t2R1EKaO5Du4
 IAwQ==
X-Gm-Message-State: AAQBX9dfeeMadrnaZtGOetDPE7adIaY0GjEnRyJQLXI3G5a2pBXJrKBq
 z7wunwq2dN9jYeHqO6hP4ig=
X-Google-Smtp-Source: AKy350ZQfizL+lJp/SCnjxK1lfz/x0BjDbgowPIjwHdIT9X5l7dy1010LyyXOZNm/vrh2BdVaRmgaQ==
X-Received: by 2002:a17:906:c7c3:b0:931:c2f0:9437 with SMTP id
 dc3-20020a170906c7c300b00931c2f09437mr10966144ejb.8.1681841427151; 
 Tue, 18 Apr 2023 11:10:27 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b004fbf6b35a56sm7236003edt.76.2023.04.18.11.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 11:10:26 -0700 (PDT)
Date: Tue, 18 Apr 2023 18:09:39 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
CC: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows
In-Reply-To: <20230418062823.5683-1-vr_qemu@t-online.de>
References: <72f7af6f-d22f-c347-db88-b8d9a769d6a3@t-online.de>
 <20230418062823.5683-1-vr_qemu@t-online.de>
Message-ID: <71CB1BDE-27E2-4101-910C-A58DAB6539CC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 18=2E April 2023 06:28:23 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@t-=
online=2Ede>:
>Windows sends an extra left control key up/down input event for
>every right alt key up/down input event for keyboards with
>international layout=2E Since commit 830473455f ("ui/sdl2: fix
>handling of AltGr key on Windows") QEMU uses a Windows low level
>keyboard hook procedure to reliably filter out the special left
>control key and to grab the keyboard on Windows=2E
>
>The SDL2 version 2=2E0=2E16 introduced its own Windows low level
>keyboard hook procedure to grab the keyboard=2E Windows calls this
>callback before the QEMU keyboard hook procedure=2E This disables
>the special left control key filter when the keyboard is grabbed=2E
>
>To fix the problem, disable the SDL2 Windows low level keyboard
>hook procedure=2E
>
>Reported-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online=2Ede>

Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> ui/sdl2=2Ec | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/ui/sdl2=2Ec b/ui/sdl2=2Ec
>index 00aadfae37=2E=2E9d703200bf 100644
>--- a/ui/sdl2=2Ec
>+++ b/ui/sdl2=2Ec
>@@ -855,7 +855,10 @@ static void sdl2_display_init(DisplayState *ds, Disp=
layOptions *o)
> #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available sin=
ce SDL 2=2E0=2E8 */
>     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
> #endif
>+#ifndef CONFIG_WIN32
>+    /* QEMU uses its own low level keyboard hook procecure on Windows */
>     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
>+#endif
> #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
>     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
> #endif

