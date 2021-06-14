Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8613A62FB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:06:25 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskQC-0004po-R8
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lskP2-0003qV-3x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:05:12 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lskOw-0006fN-9z
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:05:11 -0400
Received: by mail-ej1-x62e.google.com with SMTP id k25so15996712eja.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3xvEQx4cPjshDFhyeA5Zcglt5CZHRCgNfqmEMNvzBM=;
 b=K/nRT6Sj8X78f4ZqWwgi2RQffRLjkqvnAl57Xu5oih1GTIhcpSK0HPGqEtMibo9PQu
 JwTPFFGs15arAh+B0+mk2zs6flJvMioSUzEztv4cg4FPhyRPA/29Rg7GmE0z+7fvZAIv
 eMgKAopioOYajgFFddsIsisNzVU1FHnhPK1/9WWVxu0bzyPA4FokGcY4van1lfCjOK49
 IjeOAp1rwiMqDZ1xTt5VoH/7SGlCRx0ko90aPdBE2lBcw3gUoAMgWhjwLqypstcL81q5
 Z3F72/1iu/H6JoLiCCi4sCy+1iZeua/JHa4PFYVMou5s0vz3Df04uElr09J/YA22DMfU
 gdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3xvEQx4cPjshDFhyeA5Zcglt5CZHRCgNfqmEMNvzBM=;
 b=LNtdsCOhdjcIccRfrtXXgNl8YzoF1LCnm0e/EuJRqQ5lcpVV4OneHygwNq3T+xcHo/
 f27W4BVu7eidtyTRVlq+p8MRw1FLAMQLeWiE0GQHhOS80ewypEeAMPDpU8yDzXe9hAA/
 K6LVjwEmZndC2gqmZw/0PqkIYF9P+jWo2T3qfjyPRUiUvao/br0E2yHQIR4MmMtjnT6Z
 Gbo1P930nOPnSzrJClTxuPuWSJaclrp1TATfaqXfrUTeb8RB8jQCGCoaHXvyZDA2reHL
 OxCXJAqNbaA6w02+Yp6nJSRX5XJJgstupkOv+aMgFEasjlqTTLVqGKz/b2eXEMiULnrz
 maFw==
X-Gm-Message-State: AOAM533S1+i7POqxnL+8Gxay4krxU8yKYERBVBp3w+kpJoWuCge6BSr5
 vPl8pmsvqA/FfBGqBiOo+8Oh8RryATTQSONLVDrNQw==
X-Google-Smtp-Source: ABdhPJyf4FhGZtBh3UvTnRUuIH5EUrTeAZu+yVjICwBBTX5eD9yAzUk1hpj6QN4kz5TIrfObx388yX0tK835p+JMX/Y=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14554157ejy.407.1623668704368; 
 Mon, 14 Jun 2021 04:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-44-peter.maydell@linaro.org>
 <5aaa6d24-2b1f-0cc9-5bde-cf0fe73cc55b@linaro.org>
In-Reply-To: <5aaa6d24-2b1f-0cc9-5bde-cf0fe73cc55b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 12:04:29 +0100
Message-ID: <CAFEAcA92O_8E6CortSu==UHzwWC5-ARbP5T=H1Ok5zZC8tnhrw@mail.gmail.com>
Subject: Re: [PATCH 43/55] target/arm: Implement MVE VQSHL (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 20:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:58 AM, Peter Maydell wrote:
> > Implement the MVE VQSHL insn (encoding T4, which is the
> > vector-shift-by-vector version).
> >
> > The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
> > the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.
>
> Ah, from before the sve2 merge, and associated cleanup.
> There are now helper functions in vec_internal.h for this.

Ah, that's helpful. Annoyingly, the helper wants to take a
uint32_t* for the "write to this when saturating" argument,
and I have a bool*...

-- PMM

