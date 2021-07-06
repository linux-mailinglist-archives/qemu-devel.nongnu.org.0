Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFB3BCABE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:48:54 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0idJ-0007HE-Ik
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1m0i7l-0000iV-Gv; Tue, 06 Jul 2021 06:16:17 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1m0i7j-0001uj-Pb; Tue, 06 Jul 2021 06:16:17 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gn32so33372187ejc.2;
 Tue, 06 Jul 2021 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tsh9az0vJIIQiTanBnUFVZwMAk8L2WxM9kkdKUVKNQ0=;
 b=RZAJkB1jqIMg0a+Dpuv2TwFu6Mi96TQmUTQ1yUd67LMrpYC037STW4MVu3GL6VmGq0
 pInVmmvluAf5PNw66MvNwadtf3sr8LC3EczUw+EJWAI6CMrZqdfbNnK0MF6CJGwzDknc
 fkAGw0fybUic66ahl2y9TJsEIf26LzsAX0dZJ/iASBYZ+WXoDi6QlG+p6vuyb1FYn5K8
 c1ox9+Ay9TBKCc6R1ngrYfwa4FY4/7ZRqRCsaswJwLEL/Ku6jMGoFtfMxL+WvL2by3DS
 pWjtNgLeXr8Yq7mbjAQvi6b+HUb5z2hf6NpnNs6pNjl85WkoEab6QS5LoxiB5DCLJEVU
 al6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tsh9az0vJIIQiTanBnUFVZwMAk8L2WxM9kkdKUVKNQ0=;
 b=ZvKZyouVB9VHggA57loSfiwasxzKDN2Pq95NE6cD1exhZzLWfjxZ9vOpZbDifjjbU9
 LMd3gcMHudFddscjKHYbGLiJaU3gYTDQqQMxA4BFBd6rcYFGqqjUqmPsihKbNECgY7ib
 I0e0IipbuleoT0EryuFDZiI+EdhvPchecM6uW0UQjLRIOU2+KAKS4TLrnhcPT77UKeuh
 XIfMkVyOnoAPXOkP/C5IUt5CF7otBkRAaLxLq71VXqGov2nELZK9ozB5XlibNcD5tOzT
 6VEmKvpnO3xcn0gBQarKl0rGEmVmFy2xgWcKwANePVtlajaNTo/O+ooQsuoeIIUSG6vv
 8y+g==
X-Gm-Message-State: AOAM533c6dHUPotUDc0fvwMYY2MsBTZ+ghMrT6oEXWFf5fcZVvDcfSqd
 rIBj30JDaPYrEyw2Nyenzfko39d6Z+R8nPwAE4g=
X-Google-Smtp-Source: ABdhPJw900DhpzxwPxrBoX9s1kyFGsolm4iRxyTDOEeeAjCW93vS3wI3iGoQaMa99yvd2FSMklcoEH3r1gF7Vb7Gocs=
X-Received: by 2002:a17:906:660f:: with SMTP id
 b15mr17916757ejp.443.1625566573025; 
 Tue, 06 Jul 2021 03:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210706081822.1316551-1-thuth@redhat.com>
In-Reply-To: <20210706081822.1316551-1-thuth@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 6 Jul 2021 03:16:01 -0700
Message-ID: <CAMo8BfKXDE=_q+4rx6At4VM20i+J_Tv6+PCG7D==Eo8Ubh2SHQ@mail.gmail.com>
Subject: Re: [PATCH] target/xtensa/xtensa-semi: Fix compilation problem on
 Haiku
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Zak <richard.j.zak@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 6, 2021 at 1:18 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The errno numbers are very large on Haiku, so the linking currently
> fails there with a "final link failed: memory exhausted" error
> message. We should not use the errno number as array indexes here,
> thus convert the code to a switch-case statement instead. A clever
> compiler should be able to optimize this code in a similar way
> anway.
>
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/xtensa/xtensa-semi.c | 84 +++++++++++++++++--------------------
>  1 file changed, 39 insertions(+), 45 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

