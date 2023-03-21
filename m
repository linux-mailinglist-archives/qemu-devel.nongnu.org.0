Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B46C33B8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecf4-0007UA-CW; Tue, 21 Mar 2023 10:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pecf2-0007Mj-2a
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:08:24 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pecez-0004Vy-Ly
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:08:23 -0400
Received: by mail-pf1-x435.google.com with SMTP id q23so3238439pfs.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679407699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2Q3NUziH0RZqPAJ/+dGBLw7E5Cd/nWPiwlHzkRcnVio=;
 b=Qk3N0dx27L5w3bYcVz1k3+V3+e8HbzbjIBaYrSOX+SYJM/3G7NSiMEtXVZ5C6msjg1
 e05d4jYLDe+8YBJPxghdljMVYNh8ZxFJfgVxGKFb3gluAG5OKPDj2R1Os6yjTUJJVIDn
 jfdxWr4Cpm2CBx6xQBxNdnMYRF5E+JLC2pQJ/j3y3cTYSdSZmQhP9q+7Z9Xucn/IF9C5
 P6gk9PVXBZoCiX0s8Jr/6D1YYKfmVKaQc2od7X1VECa4zBF7u7ECZw8ip8YcPLwu/lGZ
 GPqtZUz2ZjZuGXMe4OoJLTRgsHTiMvigPxYw9td6tfXr2DqZHs2SRBBoM2W6KnndzJ47
 uvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679407699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Q3NUziH0RZqPAJ/+dGBLw7E5Cd/nWPiwlHzkRcnVio=;
 b=BUJrMwJlb5jaxQVR1DiSuSo/ACgdCLndezyBLHHrhL6GreTu85N8bSh4URlvaS228t
 LYQNi/qySrXS+rPPWDSh0C/JJTbkal/EDMtMFvdulTUM+UxZ8UwhO0xBB6ZLVFX60tf5
 /90grG5a63SgrO3ZNR2wsxpcOXVBZEELNCvKv4USTZeYCA12WrodBahO6YfmECn7bAA5
 9kRJkWo0zAjnDZM4hNo0vVLQ+1he4ygG4fLnDM0m11jGdQLtAsPNSi/7/z2ZDieoFiBB
 lTOrI/qO7aG20fuCjprVIeDLSU7QaN6HnhF7WidmM/ZwMTi3H6i8LOSQKAuRvthllSYD
 zHkg==
X-Gm-Message-State: AO0yUKUR8n/zmF3OZ0Q19nOv4xBFxEt6sQ/frk966susOtpvoLo7GXGy
 H3aTNN++3MouF19voa+ENRQhFu+y3p1CXdkWu0mf7Q==
X-Google-Smtp-Source: AK7set/06j9KuVB4rBDHVjkYZ6sjzMMSC/f6/H+yO+FUOf+LeJ0Ndzy2YkSkokTnyiHMSLfY103RJt8kO3gDTNQj98k=
X-Received: by 2002:a05:6a00:2449:b0:625:659e:65c with SMTP id
 d9-20020a056a00244900b00625659e065cmr17747pfj.1.1679407699365; Tue, 21 Mar
 2023 07:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
 <ZBm3M7A8nnBweDE3@google.com>
In-Reply-To: <ZBm3M7A8nnBweDE3@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 14:08:07 +0000
Message-ID: <CAFEAcA96cg-7Et3OpA_xxCRYFNjGAGoeQJAuoieqExw689O68w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
To: Mostafa Saleh <smostafa@google.com>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, jean-philippe@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Mar 2023 at 13:55, Mostafa Saleh <smostafa@google.com> wrote:
>
> Hi Peter,
>
> On Tue, Mar 21, 2023 at 01:34:55PM +0000, Peter Maydell wrote:
> > > >>> +     */
> > > >>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> > > >>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> > > >> is this working in accelerated mode?
> > > > I didn't try with accel, I will give it a try, but from what I see, that
> > > > ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> > > > accel/kvm-all.c, so it seems this would work for accelerated mode.
> > >
> > > yeah I ma not familiar enough with that code but it is worth to be checked.
> >
> > I'm a bit unsure about fishing around in the CPU ID registers for this.
> > That's not what you would do in real hardware, you'd just say "the
> > system is supposed to configure the CPU and the SMMU correctly".
> >
> > Also, there is no guarantee that CPU 0 is related to this SMMU in
> > particular.
> Sorry, missed this point in last email.
>
> So, we leave it this way, or there is a better way to discover PARANGE?

If you really need to know it, put a QOM property on the SMMU device
and have the board code set it. (This is analogous to how it works
in hardware: there are tie-off signals on the SMMU for the OAS value.)

-- PMM

