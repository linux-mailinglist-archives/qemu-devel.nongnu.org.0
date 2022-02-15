Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A064B6856
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:00:22 +0100 (CET)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJudB-0004p8-BR
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:00:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJuSU-0001Wu-2F
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:49:18 -0500
Received: from [2a00:1450:4864:20::335] (port=42731
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJuSS-0002dc-3n
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:49:17 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1031841wme.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PpU3dsxQ1HcBY2Eb20bMEfHSWxXLppGLA2neLS9FsA0=;
 b=hGkfyJUv229iMuVb4I9tL/H3Rktbdm8PNlO72A5H45bZZMIEFSnHFxfxmOkDgbEt3P
 JcGhfJOBuZuBy7dCWhjv3TxfzOog7KTMe9NXA6vofhoOlOlGRxn++IWwSLf7chAO2vDI
 4esAbueuBzm2Q3SgbTq+LR/lvn38MEE8tUU/pQOC76yL+TZCu6dAEuOyEHHAb+5nlIy1
 Mp7Blb0IGI0uwLL/WeuXCZzG4HVAFYDHngiRhWLRJ/eoeFDGNfYR+KjZUqR68KVt137o
 taFJsj2e9AlfQp+KXhKO3OOhmb9brIAzvsjdvaIDeApd+WIdNxcqzzHTyiFLnBN1Yndd
 0PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PpU3dsxQ1HcBY2Eb20bMEfHSWxXLppGLA2neLS9FsA0=;
 b=TkCnc7HEIVn87tTvchGQwVZvbn/jKp19MCqwIn+hPYXDyekzp1hhkU3zX5ldb6Ug16
 YChaPq6XJqjFROBUIs4fK0zLITqTXp8XtATFUFWvc/vCQgdytDAjcvdF9QCfTNvKak1S
 GhDRcSxP0Fh4MaH+8XJx9EjNea5d3PZHxjxKnuVhoYwkQAASRfVc2RuHbmwVv9gqYvcV
 XIg86MUqiuSAQAb/8GJE4AvbHs5Ot2naV8G9C4pbbKdFv+XMxyxOxf8XxG9B4lbq72eh
 Vj6RZrKsv3q5HNxe3caniMGS46D6NYaxMd4XfSTqNIR3MWkVx+jYyIHKZRiWRCUfD3av
 ODDA==
X-Gm-Message-State: AOAM5311etkE3EO1Ri4wWnaJ1EZg07k6POoEDefvmqJm8SVQwGUa/ew3
 0eqmN/GHIbhs3JEj2T1bpJTaBw==
X-Google-Smtp-Source: ABdhPJzzI+IgeJNpIefxbZPcil0EyxF2Xsp9eaCNckq/Yg0FeQ3O45YLIAAuyvj4yel+y6qKc1NXCw==
X-Received: by 2002:a1c:3586:: with SMTP id c128mr2403538wma.15.1644918554759; 
 Tue, 15 Feb 2022 01:49:14 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id g12sm11189967wmq.28.2022.02.15.01.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:49:14 -0800 (PST)
Date: Tue, 15 Feb 2022 09:48:51 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Message-ID: <Ygt3A4jETnmy0K0Y@myrica>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
 <87o839s67g.fsf@redhat.com>
 <ef945ca8-ee6b-8b17-2fe2-add32dfb9dd4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef945ca8-ee6b-8b17-2fe2-add32dfb9dd4@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 10:16:40AM +0100, Eric Auger wrote:
> Hi Connie,
> 
> On 2/14/22 6:34 PM, Cornelia Huck wrote:
> > On Mon, Feb 14 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> >
> >> Replace the VIRTIO_IOMMU_F_BYPASS feature with
> >> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> >> global bypass on and off.
> >>
> >> Add a boot-bypass option, which defaults to 'on' to be in line with
> >> other vIOMMUs and to allow running firmware/bootloader that are unaware
> >> of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
> >> anymore.
> >>
> >> Since v2 [1]:
> >> * Added the new bypass bits to the migration stream.
> >>   As discussed on the v2 thread, we assume that cross-version
> >>   compatibility is not required for live migration at the moment, so we
> >>   only increase the version number. Patch 2 says: "We add the bypass
> >>   field to the migration stream without introducing subsections, based
> >>   on the assumption that this virtio-iommu device isn't being used in
> >>   production enough to require cross-version migration at the moment
> >>   (all previous version required workarounds since they didn't support
> >>   ACPI and boot-bypass)."
> >>
> >> [1] https://lore.kernel.org/qemu-devel/20220127142940.671333-1-jean-philippe@linaro.org/
> > One thing that we could do to avoid surprises in the unlikely case that
> > somebody has a virtio-iommu device and wants to migrate to an older
> > machine version is to add a migration blocker for the virtio-iommu
> > device for all compat machines for versions 6.2 or older (i.e. only 7.0
> > or newer machine types can have a migratable virtio-iommu device
> > starting with QEMU 7.0.) Not too complicated to implement, but I'm not
> > sure whether we'd add too much code to prevent something very unlikely
> > to happen anyway. I would not insist on it :)
> As nobody has shout and we are not aware of anybody using the device in
> production mode yet due to the missing boot bypass feature this series
> brings, I would be personally in favour of leaving things as is. Now, up
> to Jean if he wants to go and implement your suggestion.

I agree, it seems too unlikely that someone would want to migrate it back
to 6.2 where it wasn't really useable except for experiments

Thanks,
Jean

