Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E983CD106
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:39:42 +0200 (CEST)
Received: from localhost ([::1]:33972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PkT-0007Q3-3a
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Pgb-0004W9-Uj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:35:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Pga-0005T9-8h
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:35:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u1so21230189wrs.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ipdoVmd080SOOMRC4q3ZbVK9g6UGp9fPaQpZarhFtso=;
 b=uYw7ikqMlcE5tCDZamMO+Ox/CRZA0t6LMb4B2R1qCujLa2EJ5wccGUE6oCbVga0yMM
 SUahy/out7m+fNvDKsjZtaXT8J5vFvHJYpBm0Xu0Kh09lYhYZIVGvGUWR2UNTD0xZMBP
 1iF0j3KT6Kv4sSDJzEDZ7oxgjSlkkvomeF9mjN1eEme16eAmetae623allNz/5xKn2Kt
 WDPCnA9HeLCHkZ6KBn4KkQ9spfQzlpzpXAaPG2oTFF6/wAfLBO9ER3YISB86yzgq5y0I
 wExYFT2bIBh9smrGkcYODPO3QoJNft2auQkGQe3G9BoTnpH/FcWq6hdirzxA+ljjQbqf
 LDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ipdoVmd080SOOMRC4q3ZbVK9g6UGp9fPaQpZarhFtso=;
 b=BJ4x7wW5UpREtw+WYHCH0gSpPgE9HhUtyNUyQCfj8E4AMd2yEHC2glXEDlUtmspSvd
 zcfV1pMuD0UDH1czo1q4yqLKOSjfv0PqPksdNhQ3xMD1UeKQsu7x87Y1c9VdvBkCwL85
 mi5LtwEd8OXkmAzhXxdhEzpdVjAb6NDOxjk8KNOyJwJiL3GSmB9R6JDVSl5xtdri3u99
 VhU9h8c8kXERxGkCesLq8oXgJRU60BrNetNtG8S3DPWJrTHEupmrFQBxeyROoaKEAFha
 RW/UQ4nqoMuOP9960U13WXDVNjQ6jF1VICZFnhhFZs26GanoyNFYIfPDLChJq1tTC+ei
 A92Q==
X-Gm-Message-State: AOAM533A0UHv5BLY/x8BOdtP+bs/UmCnE930ZVyU3Wtqx+D5PqlHOGcz
 DFRM1/s8q5VieVUgDDDReL0p5A==
X-Google-Smtp-Source: ABdhPJxF+7CO4g2wgjx9uiGnh/yK/il8sOJIVb48oAGwiqnx7VI0yqBugZCA3TMjdgNSvkAZZXhG+w==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr28680285wrp.351.1626687338639; 
 Mon, 19 Jul 2021 02:35:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z25sm16665734wmf.9.2021.07.19.02.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 02:35:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBF331FF7E;
 Mon, 19 Jul 2021 10:35:36 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-3-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 2/6] plugins/cache: limited the scope of a mutex lock
Date: Mon, 19 Jul 2021 10:34:48 +0100
In-reply-to: <20210714172151.8494-3-ma.mandourr@gmail.com>
Message-ID: <8735sar6hj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> It's not necessary to lock the address translation portion of the
> vcpu_mem_access callback.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 4a71602639..695fb969dc 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -355,15 +355,14 @@ static void vcpu_mem_access(unsigned int vcpu_index=
, qemu_plugin_meminfo_t info,
>      struct qemu_plugin_hwaddr *hwaddr;
>      InsnData *insn;
>=20=20
> -    g_mutex_lock(&mtx);
>      hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);
>      if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
> -        g_mutex_unlock(&mtx);
>          return;
>      }
>=20=20
>      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : v=
addr;
>=20=20
> +    g_mutex_lock(&mtx);
>      if (!access_cache(dcache, effective_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->dmisses++;

This is fine, but I see an exit leg creeps in later which I think we can
eliminate. I'll comment there:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

