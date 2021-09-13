Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57813408A8D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:53:16 +0200 (CEST)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkWR-0003QR-EN
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkSq-0000A5-R7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:49:32 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkSp-0008IM-A9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:49:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b6so14198631wrh.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GDHrVdxoq0ovrAkHvH9Qo7YGWd/Zy0Kwy/fWHQ0Jmiw=;
 b=kvMxcdSyqj9A1niPKSYIj0eCSZ+X4hCu8CYdBKLILMisKCsLKHwSzVNcon9IXkFtoE
 GF++hM1hKJJEXx+H/XX8BFNltG0QApkRQxTpV6OPkWBZ1aiSH7Q43OTkJ+p65Kf5xOMn
 4bhBTv3gAFofla4x0210wMsOBsAWal+snZPy8uD3QCcdtlnn9gBO5hUhUpBZKot2pMPj
 zc01oBTIA752Tpoagb+ZxLo9qr0rTP5NjMZXQDLmAlp0GsYT7AesZ4VkdFBiQ5p/IPJF
 wQTq7BrSQqQfN5VeU21xIX5iSsbcE3NWbgM7km0bqLDHRSHkCR6X4fmtkUTaw4GDoHqA
 Q2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GDHrVdxoq0ovrAkHvH9Qo7YGWd/Zy0Kwy/fWHQ0Jmiw=;
 b=K7Yy0jvxmP/2Ua64H0QZ7ZcVZ4b8AYbKieFiPE4b52fh/2TSHurT5VDQSk2Z4lY3iU
 4kLIp+ZGOY6cqkHqSwz5CugZz7Ry/4XWwc123l1Z8P9sBJlE7i7wPfEh+sfolh12xOkU
 egbKPVUk9EcpMFw2E9pKdKXCSO1dg38DF/BhbfKGy1L76stiW3D7eWdPrKKLHhvVmCfv
 mirptQiO3jv93SdMN8bwdblczerQHtl1aSHer+LeFnU9nHkeA3bwGMOlujZRMyLQxNAI
 xWJSsjSCp+6nFA18AimDVVuzl75+ql/9L+uC7JEFaqpGu3X+DGSEIyAFpjPTjzfMSlKE
 T4jw==
X-Gm-Message-State: AOAM532veatmZdxbkvkpBCmd+OAndfuuTsJEwmAL1NFx41jbcVzpoT7X
 NWq9ztnnwRRZxp92exzAK85WGWFnZRYejBPo78SVBg==
X-Google-Smtp-Source: ABdhPJzgX+iF/ml4YBefQ5U8gDuK2XNSQIi2t5cCedBUpHBKyzw4Ja69itbBtXAAm1+MtcduKm4cWdEmhbkH+sKd1ac=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr11731852wrr.376.1631533769397; 
 Mon, 13 Sep 2021 04:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
 <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
 <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
 <CAFEAcA9b0TLs1mF5LWThE7007WuFb0rXUGqpbCpG5zsHj4UUyw@mail.gmail.com>
 <ee7b2202-115f-0461-cbb1-d856199b884e@csgraf.de>
In-Reply-To: <ee7b2202-115f-0461-cbb1-d856199b884e@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 12:48:39 +0100
Message-ID: <CAFEAcA90+XWoH9qAh5nJbtpDAaEXASLy+wLbtw15Uda_Y19DqQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 12:46, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 13.09.21 12:52, Peter Maydell wrote:
> > On Mon, 13 Sept 2021 at 11:46, Alexander Graf <agraf@csgraf.de> wrote:
> >> Why? You only get to this code path if you already selected -accel hvf.
> >> If even a simple "create scratch vcpu" syscall failed then, pretty
> >> failure when you define -cpu host is the last thing you care about. Any
> >> CPU creation would fail.
> > General design principle -- low level functions should report
> > errors upwards, not barf and exit.
>
>
> Usually I would agree with you, but here it really does not make sense
> and would make the code significantly harder to read.

It's an unnecessary difference from how we've structured the
KVM code. I don't like those. Every time you put one in to
the code you write you can be fairly sure I'm going to question
it during review... I want to be able to look at the hvf code
and say "ah, yes, this is just the hvf version of the kvm code
we already have".

-- PMM

