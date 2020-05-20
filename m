Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E811DBBEA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 19:50:42 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbSrY-0005HN-Pj
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 13:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbSqV-0004ar-S9
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:49:35 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbSqU-0007zS-QP
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:49:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id s19so4026337edt.12
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=HHyD8LXaTohh0A3IUpE+dTXMF2vK7ZTyarhHdjrU5pY=;
 b=jxTJS9gk8FydXhDa3C7vJiNXN6imeJAkxgUffPBGBx0zmSI+OyZNWgXdBPDRzCydEz
 c/Br5MnZoRNoW1My6jtJVvBFeT0VNJTbkTEYomSQ6R8Mwe8RKF9lrGrx1cSDVHSTR+jr
 VyIyjhMU9Gd3akNW5NoYQ28XYvMluAmu197lYzSqprUU3zUPleAJreDyOyYaUXfcbQHq
 77Fokk/G6NFLMNIySE5K5VXrB4Ohnq0FdVk3ESSIM0ZOw7xqLh+20rEC70AkHyHYaPgP
 VcKallY7lzV0/Ozh1LmUhyNP6scuf31tVl5KqXlHQaAM4bIQz9SM4FjC7MHn+pnPmC05
 wk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=HHyD8LXaTohh0A3IUpE+dTXMF2vK7ZTyarhHdjrU5pY=;
 b=Ie+0+sAn+SC4DOKPINmOmSKSZqADSHW30RH8+lvxUB0pSB4RYxDk0zXsETJL6QdiSI
 rInNFaOLK7rLTNJvTf0TAPbTwGdkj0Jq/vi+E4Dv5fJBpOcZmfHSjS4nTtxDwkQb6l0E
 04NJLVkU7ZYVIu8Bmf5XRsimnp0XpWbqSIbF5vnI4YIjYI38MnCpiFSlsoBkQfyjF9QF
 d1Mh3rgzdknWeZOrNOmMCugXEBO8Y9Gw2tBaMRFxyObzjqE8eHryRmyVLC0PYLVjnVhn
 GN1MqAqn97TrvhJXrJjFG8ECpiunyTtqJhxj/U5XhHirqaZolrF5FS6/V7MaXHWG1/+L
 Aiqw==
X-Gm-Message-State: AOAM530K86Hf1eDXiYuBaM2VXFgzn7IuP5xAnadGJ9k9swN5YF9dHHsL
 g43fEwiuTBvHoSLg8HwpGGynHw==
X-Google-Smtp-Source: ABdhPJwIrB9ORne4+8Zk/kOm8o58Bw9t2awy4p7V1kF7EsJlICpeG5PU0c2WrI4qRTlk5ezg8SCmtw==
X-Received: by 2002:a05:6402:959:: with SMTP id
 h25mr4381017edz.287.1589996972748; 
 Wed, 20 May 2020 10:49:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x26sm2450218edv.61.2020.05.20.10.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 10:49:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C72A91FF7E;
 Wed, 20 May 2020 18:49:30 +0100 (BST)
References: <20200519025355.4420-1-richard.henderson@linaro.org>
 <20200519025355.4420-18-richard.henderson@linaro.org>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RISU v2 17/17] Add --dump option to inspect trace files
In-reply-to: <20200519025355.4420-18-richard.henderson@linaro.org>
Date: Wed, 20 May 2020 18:49:30 +0100
Message-ID: <87pnayfqdx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Adjust some of the aarch64 code to look at the reginfo struct
> instead of looking at test_sve, so that we do not need to pass
> the --test-sve option in order to dump sve trace files.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  risu.h                 |   1 +
>  risu.c                 | 108 ++++++++++++++++++++++++++++++++++++++++-
>  risu_reginfo_aarch64.c |  55 +++++++++++++--------
>  risu_reginfo_arm.c     |   4 ++
>  risu_reginfo_i386.c    |   4 ++
>  risu_reginfo_m68k.c    |   4 ++
>  risu_reginfo_ppc64.c   |   4 ++
>  7 files changed, 159 insertions(+), 21 deletions(-)
>
> diff --git a/risu.h b/risu.h
> index 054cef7..3bfe765 100644
> --- a/risu.h
> +++ b/risu.h
> @@ -23,6 +23,7 @@
>  extern const struct option * const arch_long_opts;
>  extern const char * const arch_extra_help;
>  void process_arch_opt(int opt, const char *arg);
> +void arch_init(void);
>  #define FIRST_ARCH_OPT   0x100
>=20=20
>  /* GCC computed include to pull in the correct risu_reginfo_*.h for
> diff --git a/risu.c b/risu.c
> index 95b4674..d7c7556 100644
> --- a/risu.c
> +++ b/risu.c
> @@ -249,6 +249,93 @@ static int apprentice(void)
>      }
>  }
>=20=20
> +static int dump_trace(void)
> +{
> +    trace_header_t header;
> +    union {
> +        struct reginfo ri;
> +        unsigned char memblock[MEMBLOCKLEN];
> +    } u;

If you kept a p(rev) copy you could also add an option to:

> +    const char *op_name;
> +
<snip>
> +            printf("%s: (pc %#lx)\n", op_name, (unsigned long)header.pc);
> +            reginfo_dump(&u.ri, stdout);

optionally call reginfo_dump_mismatch(&u.ri, &p.ri, stdout) here so you
can see what is changing for each instruction. It looks a bit ugly
calling them mismatches though ;-)

Anyway:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

