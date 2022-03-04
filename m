Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E14CD496
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:57:02 +0100 (CET)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7US-0001ZQ-W0
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7TQ-0000sd-26
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:55:56 -0500
Received: from [2607:f8b0:4864:20::b35] (port=33281
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7TO-0000Uj-IQ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:55:55 -0500
Received: by mail-yb1-xb35.google.com with SMTP id j2so16777300ybu.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 04:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yk1R2bZJ/4PGF+n+eSFHH1wpqaXXfR62EFZxy0OVA8=;
 b=F1FJu4keQr+0A5Q48VrG3NJBKwWz4DLGGQ73YwYDNpOGqezHbByYkiuSc+t2AIgz0u
 SfGpqR7oTb7t4+qansymidjyhpYwSkGYX88LhRw3SMn5MIaTRsOLSmyLytS27k6BDoUX
 JM94Lda/D2OIr/IJnw4OP3jh9992gBlFlX8bwcfSEj7mNYNffesA1ZbEYKvxILpMjL2v
 zc8Ls5ldAawtGiMkv903pZjXDh6lIr7EpVvJBl7l5DCTUZx47o3Cv4SSgQIm1m/nHJiw
 INyOUWe6ivT0qZfBTKSmm7d4aI2c4LFvaKRhAuDSbas52BT+KETjOS9QEcTJSlPm6qCE
 ldvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yk1R2bZJ/4PGF+n+eSFHH1wpqaXXfR62EFZxy0OVA8=;
 b=0XdS5s/e8KEhpu77RKgegZbc5SpNAQw2+FaJ1OViKWxEXfUXo8BBVUtVL8w8VRw56A
 RZbqhi5YaQpX6myYbhcuxEq1L7Rrfh+ORT/zYcMuLW3VEuWjdff/EDFeIMy9czMBwxhu
 7fBAOQv9BUVdAzdCvittRIPunkCLy/hEON6oGYNyESJU7RPnwad3vpQd656jPk5L8vkr
 JLb/IXgLkv0bVxr2jKBWoyjtI4A9p1KMtecESeRKcvmWgMUCZYMXZ8W+jbIJe1yMRIYc
 MupwXedXqB7fCkrtFUEfKxqgogpy6k3+g/sAiSADxSihgvWMEeNGx1Bfk72mseZGX6mG
 ZZAw==
X-Gm-Message-State: AOAM533L+p6QzVVm0JSVssnrAaKrtC8aGMEYFtV+YQLpB0ntn/DF5RAJ
 Q2J5Sk9Oap6U1kdMq6XgcBP/BcZbYBy79A2IG9MErA==
X-Google-Smtp-Source: ABdhPJw0390O2AKoyDR9Cv3wa0Xfnu58aiCTH//Pzxq2iEMsMwm0aVojf0c3bCVkFYWvTP2fE3XO4Uy1+5/S8e1dI2E=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr36998091ybs.140.1646398553590; Fri, 04
 Mar 2022 04:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
 <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
In-Reply-To: <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 12:55:42 +0000
Message-ID: <CAFEAcA-PBnusf1=4SdE_tSo86jkz0Bpdk23ZY8wbd9rVRSqCcA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/intc: Vectored Interrupt Controller (VIC)
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 15:39, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
>
> Implement nios2 Vectored Interrupt Controller (VIC).
> VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
> fields on Nios2CPU before raising an IRQ.
> For that purpose, VIC has a "cpu" property which should refer to the
> nios2 cpu and set by the board that connects VIC.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

