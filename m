Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52031B035
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:29:29 +0100 (CET)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFai-0002HR-GZ
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBFYW-0000ij-Um
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:27:13 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBFYU-0006Yq-Ax
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:27:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id g6so5147100wrs.11
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 03:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fgpf2oSanHx19OymtjolGlxytQ4BcgHG1wsnBAtY3Pw=;
 b=rWC/ltCcxLJOeYYM9N+/Q5H6tnNgrjNajpoqT0JbDAjUh1iwEyKlF3ciaukTnrFfHi
 /tsFgrrTUaJV3yMm5/rquLLGDYySl67x89vWIX0E0+Ihf4pWEfz/VWTYjVnhOPf/XC8/
 ufS2K3FwjDFF4VJ5A1t2BcaR1oIGS0O3cpTeAQa7cjeUE0d4l4nwvpSO5xcnH9RBF8u8
 GrRWunhNrzd3xOHkjci7ClQoAXGZJJmD9MQS5oPhN/jNoQFf/LIx8ds7vgfOW/zEguFU
 7jVHguPZ3R7peQ4r+eV8bKgyEvhqS+Cd81vQ8jOPxItQ3/KGL52b5BvKZo26U18msW2U
 r5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fgpf2oSanHx19OymtjolGlxytQ4BcgHG1wsnBAtY3Pw=;
 b=m5vSBLpqDjfI4/w0hbCTeDDaKfbnsYkcLkMj2oQ/nt8REc2D8NmAhSn8k43/9P60Hk
 Sakr0Tt0zyK8R1ucQJLqncPQJtArM+PQffM1TJ43TiPjBihsoHl8kjBGutjQZ4aCr8e5
 aLie1CozyuHdMu36pSqgl8E6B+BINRB++Z6m0/ZBKzJ9HrIslYubgdiuFSI0c9omqQ4a
 OtJuQsHLoAJBfc9EUhewWLYYM4mrT6HdxQip61tO2ri3GdJ7BTObyYOV/Y4tys00SaEV
 fEl90af6w31Kn+fmMB+vrZ1I6siBtXkUVub5bv+7ScVNEA4wKwLjDIN4KvPKZPCITmdG
 rlzw==
X-Gm-Message-State: AOAM533QuxfBCFAoVA4tJxLe9rAiIT/QvjnlxHFfUg1msF/oH3Aolmux
 ezSQAHN7+80ErQZTOR8uIZGk1A==
X-Google-Smtp-Source: ABdhPJwH/XOjgHceGfHEv/yaMSOjbNj2mcL2I8Jbwp5RUCfF7hUO+Bbda6PZ1qEdBmaapz0VeRHHNQ==
X-Received: by 2002:adf:dc83:: with SMTP id r3mr13755198wrj.53.1613302028237; 
 Sun, 14 Feb 2021 03:27:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm19081653wmi.48.2021.02.14.03.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 03:27:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 509201FF7E;
 Sun, 14 Feb 2021 11:27:06 +0000 (GMT)
References: <20210131061930.14554-1-vfazio@xes-inc.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
Date: Sun, 14 Feb 2021 11:24:57 +0000
In-reply-to: <20210131061930.14554-1-vfazio@xes-inc.com>
Message-ID: <87o8gmc2k5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
> Previously, pgd_find_hole_fallback assumed that if the build host's libc
> had MAP_FIXED_NOREPLACE defined that the address returned by mmap would
> match the requested address. This is not a safe assumption for Linux
> kernels prior to 4.17

It doesn't as we have in osdep.h:

  #ifndef MAP_FIXED_NOREPLACE
  #define MAP_FIXED_NOREPLACE 0
  #endif

which is to say to assume if MAP_FIXED_NOREPLACE is defined the kernel
should have given us what we want otherwise we do the check.

>
> Now, we always compare mmap's resultant address with the requested
> address and no longer short-circuit based on MAP_FIXED_NOREPLACE.
>
> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fa=
llback")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  linux-user/elfload.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5f5f23d2e5..8d425f9ed0 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2217,8 +2217,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t g=
uest_size, uintptr_t brk,
>                                       PROT_NONE, flags, -1, 0);
>              if (mmap_start !=3D MAP_FAILED) {
>                  munmap(mmap_start, guest_size);
> -                if (MAP_FIXED_NOREPLACE !=3D 0 ||
> -                    mmap_start =3D=3D (void *) align_start) {
> +                if (mmap_start =3D=3D (void *) align_start) {
>                      return (uintptr_t) mmap_start + offset;
>                  }
>              }


--=20
Alex Benn=C3=A9e

