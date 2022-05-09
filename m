Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E251F66D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:14:14 +0200 (CEST)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnyWz-0005xv-G1
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nnyNB-0004Cy-Vp
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:04:06 -0400
Received: from mail-yw1-f176.google.com ([209.85.128.176]:41342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nnyNA-0005Zq-4s
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:04:05 -0400
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2ebf4b91212so135071767b3.8
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 01:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xfpML0cW1EiGbY8IxKryVSoS1n/0mZRE3f8ErhSbggE=;
 b=3JR37Jls3ffsl0SOwpMRbge1D0S9izALiuUyrQS44gyHe9CVACsc462VaI7dtR96oJ
 wlvG6pS1VZ3ku83usOWfSl717DxwFb5CMTB7d2SObgCWT/MDbFmTdonQJ2MjQEeGtgyR
 2eloxv6H+vS9hO+yQTzh8JhQhdwytQ6YxXkmEEWQ5j5iJozQQmEb2U7w7q41C74KUZsD
 I5pgdyqqxVfEDE2Cs9UubCYwu/xXYGFA9ZA0zkjBjYcpBE/qQjGaJrUVlbXgX0IXHGaO
 mPdYiSpBn3AMugFEc3xnoSXObyTr0ZgogVNCrlPKG39YyYCq0qIcrCnjjI72JuijOU5r
 Izcg==
X-Gm-Message-State: AOAM530T4Ydd7ApTuUPF63n5zI0ELIi0+iz8uvcXoavZE2ylpfvDild2
 b1WPQatz2HvxOYMAmXhSUPoB6w/9cqyTg0Apgoo=
X-Google-Smtp-Source: ABdhPJz94jN/3gY864A1sW5dMmqET1auHkQDGeXO3arxjlJfBMW7kedD5M1eQ4JK9W5rBEroB0EcN1u0lyg6gMDKcZQ=
X-Received: by 2002:a0d:d48b:0:b0:2f7:fca3:5432 with SMTP id
 w133-20020a0dd48b000000b002f7fca35432mr13157177ywd.377.1652083442401; Mon, 09
 May 2022 01:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220505113740.75565-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220505113740.75565-1-quic_llindhol@quicinc.com>
Date: Mon, 9 May 2022 10:03:51 +0200
Message-ID: <CAAdtpL6+d9fewpNzjrU_d5Yp45Vj1oXCN83reQtZ3Csk=y-77w@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS/.mailmap: update email for Leif Lindholm
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yw1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, May 5, 2022 at 1:38 PM Leif Lindholm <quic_llindhol@quicinc.com> wr=
ote:
>
> NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
> separate infrastructure for a transitional period. We've now switched
> over to contributing as Qualcomm Innocation Center (quicinc), so update
> my email address to reflect this.
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---

> diff --git a/.mailmap b/.mailmap
> index 2976a675ea..8c326709cf 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -62,7 +62,8 @@ Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
>  Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>  Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> -Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> +Leif Lindholm <quic_llindhol@quicinc.com> <leif.lindholm@linaro.org>
> +Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

