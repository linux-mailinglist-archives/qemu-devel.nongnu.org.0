Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A775EF865
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:11:21 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvC3-0000lQ-Qo
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odtuI-0007Vf-5a
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:48:54 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odtuG-0006Ye-3X
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:48:53 -0400
Received: by mail-ej1-x629.google.com with SMTP id lh5so2900574ejb.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 06:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xWVqCTEvkhdiKQSA1p/GWQsJG4PqlnQ0FZ/IfqujimE=;
 b=QKSHuxJ36iIagzwsNa3pa6FPHa0ji2VewrWxgWe/asICs+16Z7VSmGDjtF9WhCJEzj
 J8NprVSggFFKCYeXWVDVtTK2o8Q04c7MrI+DGfauoOmDiJOoGuYcfmEinHffjrvmzL8L
 4s7MGd12EHQu6tQS4RvyCOwLn7DGxG2Emj5WDaYhL+n1GF0K4IMwrPssDpvSEogDDiHz
 /jSyMohdx9gz9KfwJNVLq2qxZ8NEg3DnTVpMKoPwa0ZiPXe3zYKJ194dvKeOugIyIglE
 99sKQU3KTI3CWdUdr8ROdjBOSFYZnZz3GZJt8u12/8AgwW7XZYwXe4QKuTTGmEaEdwd1
 YjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xWVqCTEvkhdiKQSA1p/GWQsJG4PqlnQ0FZ/IfqujimE=;
 b=eyJVDQ8TtJhxGa9SI7QbI5VZ5qiO2PlxzmM/3+M1L/7/qESgLRxSxl8XBQWKI1/29x
 Zse7BpwdMUX//UotvjctgVskpSgNsFF0AXtyEbwB4jFbSwBPS24Z2NeXCvRDp84Q6N7X
 Itf1/aABrqaFgdwXRPDlYsaI/IGR1dSUP0eCNXcDxFV+ykvnLd3h5c3XWNs1UBtkKAgu
 KtMf6klyrN9OsJeMou6IqtLIwzrA/SrTHIJwN/TBzbeoovwPntZXyBC6tw//QLQciTlR
 uvePINDS97wovaTwQRJJulnb6wo9jtdIsK7KMdhJaHvNd+CXf8WqH3bvnQ+/1CTK+KaR
 SuDA==
X-Gm-Message-State: ACrzQf1plsKybLbCTy9opwuOxPui5b26hrxnLpdun/j8iQFAKTZsFoyy
 5dWy1ETh8f+gffuJVcKRleC/ol8efSQd/b3Tm08CTQ==
X-Google-Smtp-Source: AMsMyM7CSh1XPwMjYX9pE7zyHXMC2yKveCG9tmXKQFpElZdjqnS8J4gAeJcTvdb5sJ5HArYTQ5K58whCqaiGbcgI37s=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr2984226ejc.36.1664459330201; Thu, 29
 Sep 2022 06:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9dcDNw6QvKSs8BZgjzueEPi0v6R5LAPpsiJU3J_p=AXw@mail.gmail.com>
 <20220929133144.4k6dbwopkljrbkqt@sirius.home.kraxel.org>
In-Reply-To: <20220929133144.4k6dbwopkljrbkqt@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 14:48:38 +0100
Message-ID: <CAFEAcA9LiwxQTKfs0G71YQrv17Oynm8SuPFEcxtnuvseTvPxsQ@mail.gmail.com>
Subject: Re: missing entries from docs/specs/pci-ids.txt ?
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 29 Sept 2022 at 14:31, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Sep 27, 2022 at 01:05:36PM +0100, Peter Maydell wrote:
> > I noticed today that docs/specs/pci-ids.txt doesn't have
> > an entry for the virtio-iommu, which is defined in pci.h as
> >
> > #define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
> >
> > There seem to be a few other virtio ID values defined in the
> > header but not in the txt file too -- do we need to update it?
>
> Yep.
>
> > Conversely, none of the "modern" ID values in the txt file seem
> > to have a #define. I suspect I'm missing something about how
> > this works.
>
> Added a short paragraph explaining this.
>
> Not sure what to do with the modern device list.  Add everything ?
> Or just point to include/standard-headers/linux/virtio_ids.h ?

At the moment we have entries for 9 of the 41 'modern' devices.
We should either (a) have entries for all of them or
(b) delete the existing individual 'modern' entries and instead
document the range as being used for modern devices with a
suitable pointer to where to find the list of virtio IDs.
(How far up does the range go? All the way to 01ef?)

If we are strictly following the virtio-ID-to-modern-PCI-ID
rule then it seems like we're just making work for ourselves
if we add a line to this file for every virtio ID, so I
would favour option b.

thanks
-- PMM

