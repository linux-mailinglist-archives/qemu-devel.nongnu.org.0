Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4046FE432
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:47:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoqL-0004X8-9F; Wed, 10 May 2023 14:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwoqF-0004Wr-L8
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:47:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwoqE-0000Uf-38
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:47:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so11617916a12.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683744428; x=1686336428;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRYW5LB64+PS8Y4ZLUPSrBFav/aKLHjldYiaB64hO0Q=;
 b=aErB8AWMk1fdW7GXrWmcgy2FL+Ue13wAND3ao079DpHYzWrU0IHBf6uIiUiZg3N2R5
 4Hkcdtir9YNagl8F4QX6Z0oqWwTrk7qCQHdR8jd6upuqakmgwqFOJOWGDBguhcLEduhv
 k6KsbjYfksHk6nO4NyX30EvNI8IfeKkRROPHL5XlHwLbu5ossR+bVcfHWEgJIlcNrHN4
 o6sJo3vO2pSg+Hwo75EOnmdU28lAyKLfaJwyKZa01J70UaXm2Xuqf+shfGaTRRujd3L6
 oU8sJh7d5+I802tmnEmiAhITISs7PqQtGT4zbn2NIk865pXGp9i5F5sgQYKiqcXwQPC0
 DvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683744428; x=1686336428;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRYW5LB64+PS8Y4ZLUPSrBFav/aKLHjldYiaB64hO0Q=;
 b=PRQgkjJ0UnUrPzL4LP6fJf06I+8cluio/VYm3QUYK2UvxMzYAukyxUpBfOCZql4QY7
 HvpwfoqX7pgO+ZqeqHLVpbk9pI6rRtmSVQ9m9WYhYGdlt26IbS7iN6fXjP6RX9ZMKIyQ
 CIQ2zRyfYqMtVUayI2huhxR93I/a03cCxhKsUKtN/Hi4oZNZVMjHmeaqej+D2t/PscKR
 F0s7J1cs9uCvO1yK4RH95XQDtL8E6lYEQa8v9PuLpdgIKacbEVfVHSYqGTW5mdgntuYq
 ZYGUgDzjP6n/qzZuS88ustRRW+hSXBizwBjNenQuIViyDwRVE8akd8RqVNebH0s9591p
 eyBA==
X-Gm-Message-State: AC+VfDzcPlUwxMRh5t8tdPPnXFCwOQM+oVs8XoMv/K2OP98vGa/+jXSd
 6o9W3bCsJvF+uXfTCdx52tNBcBMI+rQ=
X-Google-Smtp-Source: ACHHUZ5vTtm5TxjaBXucI3AlcRMzaaf5tnQYYFfH5OslHPCLvgH7YQi1sndZksIUKshgMO7Ig1ZsMA==
X-Received: by 2002:aa7:c597:0:b0:508:3b23:d84c with SMTP id
 g23-20020aa7c597000000b005083b23d84cmr16575981edq.1.1683744428440; 
 Wed, 10 May 2023 11:47:08 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-021-051.89.12.pool.telefonica.de.
 [89.12.21.51]) by smtp.gmail.com with ESMTPSA id
 j5-20020aa7de85000000b0050bc4600d38sm2099860edv.79.2023.05.10.11.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 11:47:08 -0700 (PDT)
Date: Wed, 10 May 2023 18:47:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 0/2] SDL2 usability fixes
In-Reply-To: <20230417192139.43263-1-shentey@gmail.com>
References: <20230417192139.43263-1-shentey@gmail.com>
Message-ID: <02EA6A11-AFDA-47AD-85BE-A4C74413A8AE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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



Am 17=2E April 2023 19:21:37 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>I'm trying to use QEMU on Windows hosts for fun and for profit=2E While t=
he GTK
>
>GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does=2E Hen=
ce I
>
>used the SDL2 GUI where I ran into several issues of which two are fixed =
in
>
>this series, which are:
>
>
>
>* Alt+Tab switches tasks on the host rather than in the guest in fullscre=
en mode
>
>* Alt+F4 closes QEMU rather than a graphical task in the guest
>
>
>
>More information about each issue is provided in the patches=2E
>
>
>
>v2:
>
>* Omit AltGr patch since Voker is taking care of it
>
>* Protect Alt+Tab hint with #ifdef (Volker)
>
>
>
>Bernhard Beschow (2):
>
>  ui/sdl2: Grab Alt+Tab also in fullscreen mode
>
>  ui/sdl2: Grab Alt+F4 also under Windows

Ping

All patches reviewed


>
>
>
> ui/sdl2=2Ec | 4 ++++
>
> 1 file changed, 4 insertions(+)
>
>
>
>-- >
>2=2E40=2E0
>
>
>

