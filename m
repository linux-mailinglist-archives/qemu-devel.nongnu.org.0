Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D5531B037
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:34:26 +0100 (CET)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFfV-0004Vn-Ky
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBFeG-0003o4-FR
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:33:08 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBFeD-0008MC-Jp
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:33:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id u14so5220316wri.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fPw1fF0Kvb/PF9f7QnjG8boPggpC6coxDNQGB1L0TFs=;
 b=pfQ04+pAkESyQknPLuy7dnM5OPw/HwsBlB+KG7YXFiObe/iO13W+AWhj5dHKAsaM+Y
 5VjlYw3AFYTOioxy/SXPN/sPDDNnPPj2ETbF8hMICCQdm+Y00Q/cmqv6BbANQmzGmYLi
 k8MD5O5OiIicYPgQAvrREUwg3zZjjTLk9Eq5l1em0s2OmKG10qcBM8pLXCZvp8RbwyXW
 j0iBWna7rdCUh64hDBbFgfTrULXOPv4yW1ZV51sNNsnQ4MpPKh/B8CwR8XKcjkYZt4cB
 E/Q9NOtj4xifWaMb1+FHA76D8xCeQoL2ylVY7yfOcUMsoCC/8PIUcD6mwbFAM/+GXH+P
 e6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fPw1fF0Kvb/PF9f7QnjG8boPggpC6coxDNQGB1L0TFs=;
 b=stcx05BoJ+ZluckzDmptehx/oJZNYn5UFUlioahXRbblKQ+dB/06uyECPwts2oUanU
 HaGbUiwPcry0mmvCdzv7LOfkudA43nutU91A4zIKvPomnz8+FqN1Efy5wJ+W/amsJlUr
 PuTy4v41UlH5GuqYe9kakcY+PO12paMahyMl7y4FeQ9e12gU5ZHUqAj98c667Q73LwOT
 A5IPRfD1Wo/pGHOPSQF4dOzuBk8VyOkZ2NHJZRpmb/YkZLJR2a26pMbIqw4+U3m6aFwb
 5W6jPtA42xQ7m8eTiwImFGRn12K1e4AVqTX3plD2MgLnlmIMuCdD6gO3ZTbmsYHVtTqZ
 8irQ==
X-Gm-Message-State: AOAM530ZODy4sxJ9kOCLESfWWIWaNgz6pcpkQyUJMid6CyE8UA4s11SI
 jt+1O9U3WQq+ftw5Co3GBlrpqA==
X-Google-Smtp-Source: ABdhPJw7IthF01bHHnBIGpG4B933lg7M87mSLWwDtceSCcl/QQMZL53RaRuM8Lluu6iuBzcET7b8QA==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr13815472wru.111.1613302382602; 
 Sun, 14 Feb 2021 03:33:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a16sm18231323wrr.89.2021.02.14.03.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 03:33:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 216F91FF7E;
 Sun, 14 Feb 2021 11:33:00 +0000 (GMT)
References: <20210131061849.12615-1-vfazio@xes-inc.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>
Subject: Re: [PATCH] linux-user/elfload: munmap proper address in
 pgd_find_hole_fallback
Date: Sun, 14 Feb 2021 11:32:54 +0000
In-reply-to: <20210131061849.12615-1-vfazio@xes-inc.com>
Message-ID: <87lfbqc2ab.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu,
 Vincent Fazio <vfazio@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vincent Fazio <vfazio@xes-inc.com> writes:

> From: Vincent Fazio <vfazio@gmail.com>
>
> Previously, if the build host's libc did not define MAP_FIXED_NOREPLACE
> or if the running kernel didn't support that flag, it was possible for
> pgd_find_hole_fallback to munmap an incorrect address which could lead to
> SIGSEGV if the range happened to overlap with the mapped address of the
> QEMU binary.
>
>   mmap(0x1000, 22261224, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESER=
VE, -1, 0) =3D 0x7f889d331000
>   munmap(0x1000, 22261224)                =3D 0
>   --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3D0x84b=
817} ---
>   ++ killed by SIGSEGV +++
>
> Now, always munmap the address returned by mmap.
>
> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fa=
llback")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

