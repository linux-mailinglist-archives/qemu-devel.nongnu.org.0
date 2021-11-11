Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7144D704
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:11:52 +0100 (CET)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9rq-0007pO-6p
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ml9oN-0005mD-9L
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:08:15 -0500
Received: from [2a00:1450:4864:20::329] (port=44984
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ml9oL-0004vu-LA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:08:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso4350398wme.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xkT9/kfGaAvaE2+jUb7JGrJJVEpv6aTQKHOQaIUQnI0=;
 b=B6BZ8nEU3p2VcAFlxknTr1du4z5sh/OeARBMh8nOjlUdwvOONp6uTy2P6uZdtt1lq6
 g4hEtGJVnu/DwNqyz+ZQlNi8L9uv6WNPb7Oiyesbd5/LXgzyWv4F37gAifOyWNSFvkTP
 Bv7iHUXjkxMgECT/G6nzSKPZDflsvrMaphMTAbYT6OLF2cTtIo2ewk4owneEt0LsUL8a
 vOisZsO6wAM31sI4rJBPtsKrZfPa1U5mPi+VWE+qZRDI5FYijkPTWtrF+flo/OShH5Sz
 yoSvstCSJshjuzAJfPU/f+PoIKJMQAw1zEDr0y+qem6MvANQ1KhHjR66aay/A72zQCqT
 Ub3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xkT9/kfGaAvaE2+jUb7JGrJJVEpv6aTQKHOQaIUQnI0=;
 b=qGXxcTrhcdhbTWcLZqM0q+TDhP0IIjvWEJdsll9rJuHZj7ShwajmIYm9qmk8Ulm8SZ
 JVfRPBULgirgreN2aLje4uJ/9qtoteHj9Iz4v+GMOYZJhyAJFx67mOaziqOqpKzq2vNH
 OS+XvsnL54eCJd/rMwJruKMPTpHQma2RLGjFqYeY6uVjh8YjuqCxXXywLLLSCNiknu4T
 +DbaK8MrVUB0DjFx2EBnGRUIyMBauWs6IglHXLJSaFoBvpestRDM8lcaF8M0ePKWEAab
 3tf4flUQ3sPxRcBDZWUO4DzPLbNDFMfSYjtN9GMJfXLmgX5oiW1FbnkxNT7efyQsBaae
 qNIA==
X-Gm-Message-State: AOAM533DCFLmS+KwfAkSUvIG9nmRShvTVQF/IFsjI/8prezylr9XMMbL
 BLrUJVgDlv0VoKw4eA5wcpO0fg==
X-Google-Smtp-Source: ABdhPJx/38pN+gG8J7/FI5iIMf1q3UDfQ4aOc/FrKW8IFkQvwg6ef5aPwylXh4TirznOsdMwKvj2Lw==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr24954055wmq.18.1636636091038; 
 Thu, 11 Nov 2021 05:08:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm2841702wmb.7.2021.11.11.05.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 05:08:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B5011FF96;
 Thu, 11 Nov 2021 13:08:09 +0000 (GMT)
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about
 to execute
Date: Thu, 11 Nov 2021 12:20:13 +0000
In-reply-to: <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
Message-ID: <87pmr6j0w6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> When debugging with the watchpoints, qemu may need to create
> TB with single instruction. This is achieved by setting cpu->cflags_next_=
tb.
> But when this block is about to execute, it may be interrupted by another
> thread. In this case cflags will be lost and next executed TB will not
> be the special one.
> This patch checks TB exit reason and restores cflags_next_tb to allow
> finding the interrupted block.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/cpu-exec.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 2d14d02f6c..df12452b8f 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -846,6 +846,16 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, T=
ranslationBlock *tb,
>           * cpu_handle_interrupt.  cpu_handle_interrupt will also
>           * clear cpu->icount_decr.u16.high.
>           */
> +        if (cpu->cflags_next_tb =3D=3D -1
> +            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)

Why check use_icount here? The cflags should always have CF_USE_ICOUNT
set when icount is enabled. Lets not over complicate the inverted ||
tests we have here.

> +                || cpu_neg(cpu)->icount_decr.u16.low >=3D tb->icount))
> {

Is u16.low ever set when icount isn't enabled?

> +            /*
> +             * icount is disabled or there are enough instructions
> +             * in the budget, do not retranslate this block with
> +             * different parameters.
> +             */
> +            cpu->cflags_next_tb =3D tb->cflags;
> +        }
>          return;
>      }
>=20=20


--=20
Alex Benn=C3=A9e

