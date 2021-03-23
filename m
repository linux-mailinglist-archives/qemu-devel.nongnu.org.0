Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A4346B1C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:33:37 +0100 (CET)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoee-0004aL-Gj
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOocs-00038i-1k
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:31:46 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOocq-00080H-DK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:31:45 -0400
Received: by mail-io1-xd31.google.com with SMTP id k8so19301596iop.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 14:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uHbBiQuEf55ozZQNKCwCO/tSlv1Y2yABBlfFYxPPBHc=;
 b=he1PwhWMkeCRcub8+A9ZlbTvsWFtxtzUoa1Wzam8aQtbygtVUtgcLEvb3g6ssikKuY
 XbkaK7Bw/t8Oaprm30DgwoHHCI1qWC70d9CLG4n2OL8MqQJX7dp6/gSYDD2cQi1GIP0o
 Ua/9kh+jeb5ktpZNFT7ZLqzOdkfK2BhVxkF5Z9wCOzB7gHysu79tkUYyOroBzQKv4fQm
 5gganSAyw6dOO/4mafCtH92iH02f5eAkoRbW634O10NGwcznoj5FM+YZBOD9mczCOHK9
 SdmxQJa3ggIoUUFCbg57xfNeuFWvw7JdIT7VN9ckY3mhyZ1/csZNoYrIGRlvqMYir9zt
 pUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uHbBiQuEf55ozZQNKCwCO/tSlv1Y2yABBlfFYxPPBHc=;
 b=ns5qiRjCuRF5u8E+VppN5CCh0Uu3iKyPrylNv6gXO59b8mfnm+XgRcAx3qRFl00tQr
 qjHRrfp/rs8vR3IdrQTHbneh6nwcoZnRgerSEkWI2P02KkBXCjaTx1GA94quE209xDPW
 CoCROciTzMHoZ8VKLcpxLIeToE8EQEVlIf9Q3q3cz0s2yn1pyOH16x5H0kNnixyhN+/i
 nizHgPc+T4MrxF/kocQBlgCxCATPiuwnQsXINuAq5Qz3SXp//OU+Vih3YZ+8SRwFY3+z
 R8ScvIb3fvnGH49XokW06VRMeDNhI1Ym13rWVl3NI7l5XFcHGe5Btl8Z/szXFHo+OABH
 Er3g==
X-Gm-Message-State: AOAM530YKuYSrnj339dIHon1bA+xh+gOpfU2PxPSdp5X4Mwiwsixf6z1
 Z5IOLIZLmbKrL2i+mivSCqMBI8peNchm7GGCp/Li9bpjdNs=
X-Google-Smtp-Source: ABdhPJwWnTvLxMk36kIIE+9p7CvhNWOuC5QKIrTQhIgn1Ac9hLbl79CAsh8o5hCDGeInL0+lPT/Y3oM0P4puq8eoeGk=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr35332jal.91.1616535103536; 
 Tue, 23 Mar 2021 14:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210323165308.15244-1-alex.bennee@linaro.org>
 <20210323165308.15244-9-alex.bennee@linaro.org>
In-Reply-To: <20210323165308.15244-9-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Mar 2021 17:29:46 -0400
Message-ID: <CAKmqyKObq1tCA6WsYD_xggtmV4e-BmQqHOABsa200RhrXirijg@mail.gmail.com>
Subject: Re: [PATCH v2 08/22] linux-user/riscv: initialise the TaskState
 heap/stack info
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 1:07 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Arguably the target_cpu_copy_regs function for each architecture is
> misnamed as a number of the architectures also take the opportunity to
> fill out the TaskState structure. This could arguably be factored out
> into common code but that would require a wider audit of the
> architectures. For now just replicate for riscv so we can correctly
> report semihosting information for SYS_HEAPINFO.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210312102029.17017-5-alex.bennee@linaro.org>
> Message-Id: <20210320133706.21475-9-alex.bennee@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/riscv/cpu_loop.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 6767f941e8..74a9628dc9 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -135,4 +135,9 @@ void target_cpu_copy_regs(CPUArchState *env, struct t=
arget_pt_regs *regs)
>          error_report("Incompatible ELF: RVE cpu requires RVE ABI binary"=
);
>          exit(EXIT_FAILURE);
>      }
> +
> +    ts->stack_base =3D info->start_stack;
> +    ts->heap_base =3D info->brk;
> +    /* This will be filled in on the first SYS_HEAPINFO call.  */
> +    ts->heap_limit =3D 0;
>  }
> --
> 2.20.1
>
>

