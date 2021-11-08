Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A3448651
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:52:56 +0100 (CET)
Received: from localhost ([::1]:60756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk611-0005ov-SU
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5yg-0004Z8-SK
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:50:31 -0500
Received: from [2a00:1450:4864:20::435] (port=43531
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5yb-0005c1-TB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:50:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id t30so27339067wra.10
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VRzp0FWK8MYVZPdHdcEq6rLwLfL7m6N+xRuLlCo5WmA=;
 b=ex3QiOh/4Hu71GdjoT9pJdao9Mje6JBDgCmjbmVVqrcBHzl37/fl2pkesOFN5yUtHM
 lLOMs5ZczoQ2zeClt35NqfGJRVaQhKTmRfYzZsXWbLqy2yq634Uq+N1G36p58u5+napr
 4oxPAcANfQQqkHUcnwgNS/IOIbpdGX5yBDaJH/eJWHumK3SV2ahUGaDuYEpKJ4IK7iAh
 FVAg80svdKptqw1pXGB6OQMRmpQ7pmQ0YCRhWvXEDFutE2i5dx1FKG/G/d2fr1DwNQeK
 6TfQC0bygdrFyJSgbgML12s8upnjvMY+y5jbL+s3PxzaKcfYbFDKmaFp9pviDHWLdf4S
 Tp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VRzp0FWK8MYVZPdHdcEq6rLwLfL7m6N+xRuLlCo5WmA=;
 b=rARSkDadBhxcYm0NMhpzu4RpzsHFE+sxQ/rHkvnZiPUQd4necvchWGZvsfaxlLN/u2
 KwMqnTCNlQBvc/eM0EHA+aDpmsCo0AsHJ8nMOL7Z9eQTyWuKkda2I9ZWzCRsxHgRkkpW
 AhhbLDbjadBbvs86+d+P4DG6ddmqZkbYjVI0xmltPrwp1IQ7jFm8zksXsl8ZBvXNS5kH
 RtcVHXHRCpSh0uGg3TFB4tNyp9awvUzcYBIeieVtgpV5BT1I9t6AYqCAy0YAXEN3FsHH
 NX/zPoshnBsPuX8J1ORw8BKv3Tl+vwDAVg7ADbt9v3jbdwGHWvTvkiWD2YQybJ3Ei5W5
 vP0Q==
X-Gm-Message-State: AOAM532Cf5dz+uFWhOsN3oV4tVQ+l5sRSwteWIDegyXSOzIpM9mfioPr
 Sjj5u/QyvBFonP8BnlEPadtAuwrTN3XR5oLaR/toQQ==
X-Google-Smtp-Source: ABdhPJxtX3T2eBi7TOquhLPU+qmkkYwK7igylD/oMGz/QOPMqvEMhUxeqjroz3AQ7QdN1bbyyJdz+h9aOdq4amLZgrQ=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr347046wri.376.1636383024139; 
 Mon, 08 Nov 2021 06:50:24 -0800 (PST)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
In-Reply-To: <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Nov 2021 14:50:12 +0000
Message-ID: <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Nov 2021 at 18:11, Jean-Christophe DUBOIS <jcd@tribudubois.net> w=
rote:
>
> One small question/remark:
>
> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) =
document (chapter 5) PSCI calls can only be issued by "normal world" (EL1 o=
r EL2). Therefore, should we be adding a test for the current secure state =
in the arm_is_psci_call() function? This would prevent calling the built-in=
 Qemu PSCI function if SMC is issued  from secure state.

This shouldn't matter, because if the machine model is configured
to execute guest code in EL3 at all then it should not be enabling
QEMU's internal PSCI support. The internal PSCI stuff is only
there as a kind of "emulated firmware" for when we're running
guest code that starts at EL2 (notably, when directly booting
a Linux kernel).

The problem seems to be that fsl_imx6ul_realize() and
fsl_imx7_realize() unconditionally enable PSCI-via-SMC.
The imx7 code also puts all the secondaries into
PSCI-powered-off mode -- this should be checked to
work out what the right thing is if we're not doing
emulated PSCI and instead starting the guest at EL3.

-- PMM

