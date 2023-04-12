Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0496E008E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:13:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhlP-000259-82; Wed, 12 Apr 2023 17:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhlN-00024n-HC
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:12:21 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhlK-0000j6-N2
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:12:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id xi5so32240408ejb.13
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681333937;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wf1HrHBDrJNPbhmZ+cGUXAntHByidP6/tcILxZ2iMuE=;
 b=SwtCUrgSj8TN+IIeM0rmnBz3urAMFvxb2eJM+2gg7IQxeQOq9SNHxKXk3HZo9EYOhB
 fQ+02aLi4wYcKLB5PiiWvpGHDNQm8Mmo44ZFqJdCAnRJTShM8LiTahXtK7vxy/ffkKEL
 qsP8v7tcajT7HMrq8H+B6z/5cysH9HEPz3qCxASMwkf1ahHTT8N9Qlp+Nz4vJkXIMzix
 D2w0RYRBpguuSslb/1ov23Cgpm/5cQhgon+79teo55DVSR5bDdY36natzSKP2nRB7cP6
 h3OKZMbpqmbjN/zuYdIq31oz4wjr0V3T/DKtoB5lSrvP4QjXJ5lYL0/E0pGaNXyl83no
 ccYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333937;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wf1HrHBDrJNPbhmZ+cGUXAntHByidP6/tcILxZ2iMuE=;
 b=OGaGZjf0ZvVaxZSSxT8EpbqjOt+20m5AMwU+uu0YW7qON1BrrQK3htSo/Vn+3meorc
 hChXFaLRn+5Aoa+F9YOzi7ijMvwoq3A6KKWfTCWeMkCEku7KL5YCv4Ts41EH7HSLDhUi
 IDr+bx5StkZdXG/zGqZkHvUafHAMtqEAagrz0eBbkg7xM2YFUhqYKLDd7vDcvbl9K8mf
 kZUlyVHeG86l0CLHuDdsNjB7zJv4JLoWPD1Kh64MX7yfHjC+gQQKlk4QQXDwHaDGBc0B
 nPoe0DfZPELxvRNKhWzHeZjO0fPS8yk+A6Ngn4P4xYFCco9Jznj0e+9uOcogFZ6bAcPp
 Ql0Q==
X-Gm-Message-State: AAQBX9etNTHMlArPCgCMZ2uPH3YChalwmEPggib65/nMudQSfsxKrs0k
 1xSELTUPX2qXqL6qhTT5P0R1dr9NZ5Y=
X-Google-Smtp-Source: AKy350YbVze2SgwvjIQ+wljp/PE6ZfVH2ig4YUxisqHl37FmY+GvXsqJMlcBrXbB05J45c8ke+Y5bA==
X-Received: by 2002:a17:906:d7a9:b0:946:bfb0:de85 with SMTP id
 pk9-20020a170906d7a900b00946bfb0de85mr235779ejb.70.1681333936553; 
 Wed, 12 Apr 2023 14:12:16 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-055-150.89.12.pool.telefonica.de.
 [89.12.55.150]) by smtp.gmail.com with ESMTPSA id
 sb2-20020a1709076d8200b0094a785e362dsm4018664ejc.141.2023.04.12.14.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 14:12:15 -0700 (PDT)
Date: Wed, 12 Apr 2023 21:12:11 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/3] ui/sdl2: Grab Alt+Tab also in fullscreen mode
In-Reply-To: <20230412203425.32566-2-shentey@gmail.com>
References: <20230412203425.32566-1-shentey@gmail.com>
 <20230412203425.32566-2-shentey@gmail.com>
Message-ID: <0AA0603E-68F7-458B-96C3-A27DC89A2127@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 12=2E April 2023 20:34:23 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>By default, SDL grabs Alt+Tab only in non-fullscreen mode=2E This causes =
Alt+Tab
>to switch tasks on the host rather than in the VM in fullscreen mode whil=
e it
>switches tasks in non-fullscreen mode in the VM=2E Fix this confusing beh=
avior
>by grabbing Alt+F4 in fullscreen mode, always causing tasks to be switche=
d in

Typo: s/Alt+F4/Alt+Tab/

>the VM=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> ui/sdl2=2Ec | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/ui/sdl2=2Ec b/ui/sdl2=2Ec
>index b12dec4caf=2E=2E91705e4bce 100644
>--- a/ui/sdl2=2Ec
>+++ b/ui/sdl2=2Ec
>@@ -856,6 +856,7 @@ static void sdl2_display_init(DisplayState *ds, Displ=
ayOptions *o)
>     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
> #endif
>     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
>+    SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
>     memset(&info, 0, sizeof(info));
>     SDL_VERSION(&info=2Eversion);
>=20

