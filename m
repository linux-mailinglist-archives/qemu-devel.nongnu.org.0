Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE74FA61B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 11:00:58 +0200 (CEST)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nd6xl-0001D3-F3
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 05:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nd6un-0000Vm-8x
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 04:57:54 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nd6ul-0001YE-Ql
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 04:57:52 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id x21so18925029ybd.6
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/OjocjfrF8dmHJgaNKZQmP5fjoeIg0VuaCXCfCGDvE=;
 b=hyJQVQ1RwOqMiaEQ+K17Il7kxHyLq6uDFFs4q5I4kGM2OWRb7Y6Gg5F5G1OiuK9ola
 RcPSxkT8r1pgRI1r05d+C834B2GyfuwluUDjw/7yzpMXT/XgQ8yNO8JfWrrgxIxscQjc
 P/gbKnvXcDK3TGpfOkls1m8PRYrIzpMvl2kre7ckrxbm7wPAJ+pIvq9yiFwjtzSqxFVa
 YRw1JeFhLwTkysi/ULq8M/pM8Rujxh7K8G+wHSBY+GuxZh8nPcQyOXhnYGiarLGey0FQ
 QRK4NF0QjPEP9rgQAibqcOM81HtIcXt6I8onViLGocgqh3mobt7iNI7AK2BlOkvhEfq6
 R85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/OjocjfrF8dmHJgaNKZQmP5fjoeIg0VuaCXCfCGDvE=;
 b=RuOJKgmiOSFxO7u+pqUqt7ZNQtIAaHZOtle440Fd+uZtseiR1b0CD5+rqPBIhcAZRd
 plvdfl6zM1Xl9NVDH2bq27aTCS4/unkZ3abqdLia0J4OHboPt3Nm6YaiPpzK/uL/VKdS
 AxLCPq5bcbpu3W8dmfO8tiHP73FnFJhFvaQL0A0mO5+7PQgClJd7B5FvPdFuYDR+BTaL
 3Xtjx4dE5JUCS8o29gbHOj70E0jt+iGVdSWtPyd+am9X20xqmSXJQOMrHX5jDFmrodiY
 44CDjzMyJDwP1U5rgz6F9qnJKbCztTd3QWJlcM7IFCcnBZijNSKK+fKxiez3BUMfNFA/
 0tNQ==
X-Gm-Message-State: AOAM530PymYUIoB5PFVAwpvP9KWijzVddDxco3eF8g+Gtic8d9j3TwKs
 ut43B4+zB/dLyhVswkXf9eP3eIdfO78NqdhP09WogQ==
X-Google-Smtp-Source: ABdhPJwqa7WD7TDQco31q1YDgDLG74wWt+5v8Ge2wFAbI3DK77SSqs5Ic0MRyBIBw4Qtj9WqXY2XyD+LCKpWI/2vTro=
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr3526724ybf.85.1649494669361; Sat, 09
 Apr 2022 01:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220407095047.50371-1-mst@redhat.com>
 <CAFEAcA8upf6nA8dUPeAyY_Q-F_oscqZonPGCKT2OUZORcX4FuQ@mail.gmail.com>
 <20220407104905-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220407104905-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 9 Apr 2022 09:57:38 +0100
Message-ID: <CAFEAcA8xcWUvPyZj4GOHs8kS0msdh5f6_2aHHpkKpDMW+BxcxA@mail.gmail.com>
Subject: Re: [PATCH for-7.0] virtio-iommu: use-after-free fix
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 Wentao Liang <Wentao_Liang_g@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Apr 2022 at 15:50, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Apr 07, 2022 at 11:03:16AM +0100, Peter Maydell wrote:
> > On Thu, 7 Apr 2022 at 10:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > From: Wentao Liang <Wentao_Liang_g@163.com>
> > >
> > > A potential Use-after-free was reported in virtio_iommu_handle_command
> > > when using virtio-iommu:
> > >
> > > > I find a potential Use-after-free in QEMU 6.2.0, which is in
> > > > virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).
> >
> > So, this isn't a regression. Do you think it's critically necessary
> > it goes in 7.0, or is it in the category "put it into 7.0 if we
> > need an rc4 for some other reason anyway" ?
> >
> > (I have a feeling we'll need an rc4, but we'll see.)
> >
> > thanks
> > -- PMM
>
> I am concerned it can be used to trigger a CVE but I could not
> find a way. So I would say if there's an rc4 pls include it
> but if not then we can pick it up in stable.

We needed an rc4 for a couple of other security fixes, so I've
applied this to master; thanks.

-- PMM

