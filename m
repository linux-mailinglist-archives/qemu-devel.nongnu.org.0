Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B96EE8E8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:17:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prP4i-0006Up-Bl; Tue, 25 Apr 2023 16:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prP4d-0006UN-Hq
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:15:39 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prP4c-00074E-2I
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:15:39 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504fce3d7fbso9617229a12.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682453736; x=1685045736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LGa2Vu75kfp4BIROOBRetvOgJUYNu0OpvUyEFHoBSOg=;
 b=MkKsugK3uwoCn8ZeLZjuGeFrSstG+GOTpuTiTuFWkeX8IrqpkuHAdMAQjefAN8DvFd
 8hZ2GaPmCbLDEcgam08vjMQPFZ92I5l/sXGPKdBHZVB1mxRx9tO9cuiPH4CskO51KB+w
 SwEI6k1CtVnd3Tv4eDK8TtFJAWH9Zm4SXw9pyIyiA00cGMQWj+AoXgdYON0LdjN0KJX5
 asSap89ViOYblxNGEfpAtmU4fNjQ+QmEGeM02UhA4HLuNHT4aYMKQCzz+tjy5fPM67R0
 +jupxNx63V6FmUavyypn9y4jRf95skN1BeDPpVYnENyqcDf+AKtI2HM5lhERUG0LHnUB
 y6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682453736; x=1685045736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGa2Vu75kfp4BIROOBRetvOgJUYNu0OpvUyEFHoBSOg=;
 b=XI8BfWULK63IyJt+AqqLDWLsZSgDNePLS7uTtoSHzK4JRIJfhmvJGS2oguY2iCWQRZ
 VPp1p+sjtPiN5jhk8UXDx2473b7wpSsUpJjugQnCN7MAFRKr2dxd90kSox8wYAM2SXgT
 iq1J9EDeMG//xK9TrwUG5my4NhzWnjgWt5J7P6WiGjyJJgksKpVr/uFO2CiY7JYr7TUA
 SxcSyrqsRnMSn+fLvvA+9OaJqiP9RXOo+KSbc6wcoQXT7EUQ4ASOAm2MyoXdpmZ8aqhU
 s85KaD/dB7lyymYzjHqtqLRLplIM8n4FZS/LlH3bsgTPkihQMwft9X/3bEDk3UsDMDGv
 QaYg==
X-Gm-Message-State: AAQBX9fpaAmiI5P0QGAOiaYnrIuinoCIZQcrq+kuY+pH8elA2i8WjYT3
 +r8iY4SAeYvSHUT57XPE3vFpJhpHEyPBkIj34Jz5eg==
X-Google-Smtp-Source: AKy350bj5F+Z7Jf5YeMqJ5EyLEsEtYQxRPYthGqNh5G3k/3/eLu4j3y1mY6lZAMFyj+LFEQ3Jt7Jrqui+GWqJJtrg+0=
X-Received: by 2002:a50:ee86:0:b0:506:a446:b926 with SMTP id
 f6-20020a50ee86000000b00506a446b926mr17397729edr.19.1682453736290; Tue, 25
 Apr 2023 13:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
 <20230424164058.00000a3d@Huawei.com>
 <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
 <20230424225626.00001219@huawei.com>
 <CAFEAcA8QXcpkxdXMWP8X9tLem6K8qC3CwZ2-t-fqEpGR-nJBTg@mail.gmail.com>
 <20230425183713.000054c3@huawei.com>
In-Reply-To: <20230425183713.000054c3@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2023 21:15:25 +0100
Message-ID: <CAFEAcA8FCZkU12hmkGX+N5Cokbakm1T8RJkCgO_JHT1ZsbVmxg@mail.gmail.com>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI eXpander
 Bridges
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 25 Apr 2023 at 18:37, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> We could explore only solving the problem for pxb-cxl for now.
> However, we would still be talking infrastructure in kernel only
> to support emulated CXL devices and I can see that being
> controversial. A normal CXL host bridge is not something
> we can enumerate.

Hmm, so what is real hardware doing that our emulation is not?

-- PMM

