Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6CF4EA6B6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 06:50:20 +0200 (CEST)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ3oB-0003GG-Oe
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 00:50:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ3mq-0002aT-CG
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ3mm-0007Vl-6z
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648529331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nVMEfkNr9lz6A9nD7+ISzCVXvzJYqsQMnpR3IwrU/Tk=;
 b=FjCZ+F0VDDU4rwZbpr0EOXh7jmSH/dem8uj3/hFA+7AssV6lVYFM3Aag7LjxacchoAQdF+
 vVRuEfi1wlzeqtKlSR8085R6Yt3ikBtNvtgE9EpDrV5rgY0JwKKJRlxMxCTBGSnlhI8QjG
 Ogj/TWFMOuoFy/EA6LxAF1H5nJKd9K8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-BKQTm2NFOhmI0Qo0llJthw-1; Tue, 29 Mar 2022 00:48:48 -0400
X-MC-Unique: BKQTm2NFOhmI0Qo0llJthw-1
Received: by mail-lj1-f198.google.com with SMTP id
 v9-20020a2e9909000000b00247ecf60956so6987403lji.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 21:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVMEfkNr9lz6A9nD7+ISzCVXvzJYqsQMnpR3IwrU/Tk=;
 b=mZOPeaue1Bx39lo5lNJovhpuRdAuiLumlLABpjF8PLFU/D3vlFd07tuY6zNiPmMBOO
 KGzbCVJ+QdPzQ/ukGhDRrm1pU1K+4G6lHz89//d7O9+3DP9a9W4EMevmnv5UhyZSFhvQ
 dPKWHAxrt9GBX8rvSftMhp6iY4bkuan8mi/gMeZmcSIbKylYOmTiMHig0y03zeKPVAGD
 UsEX6ihNtrfjvUFQBsto+bGhGMRVuRi70Am0CjDZVilX8fk14oHw0eNrAk/eb2RWfKwI
 vg9q7wewukZAVJKitaO5Ue3lcOy/qDeStJ6tshFxZyG5U6/uitAV+S0G1x2L1vLWcm90
 jitw==
X-Gm-Message-State: AOAM533YWYJktxp+6j16mlBUn1oWlfqqx4qYeh3KAIH3cscvZeBPMowz
 jvEyUX95eosZR/fMIrk7ljbRe/lJYimIH9ZkoGM2aGt72i5QSJhubKOue/NoV/UrJcptspmGvVZ
 WhviRzpB9hq/BXINPFUAIJRE3uGp9/D8=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr941721ljq.300.1648529326916; 
 Mon, 28 Mar 2022 21:48:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6UOEgmAGWOXczE/1tgtLSU1I/BrC/7rTeHFGRXOojIbAxF5+eKG0Y9XGccj4dPwPx4NA9N/WVkEdJjrA5RO0=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr941703ljq.300.1648529326703; Mon, 28
 Mar 2022 21:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 29 Mar 2022 12:48:35 +0800
Message-ID: <CACGkMEv4gN4=SzeWroMXdOouxQnzarQX_U5Jv528_fROoYNHyw@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 3:03 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang
> > Sent: Monday, March 21, 2022 1:54 PM
> >
> > +    /*
> > +     * vtd-spec v3.4 3.14:
> > +     *
> > +     * """
> > +     * Requests-with-PASID with input address in range 0xFEEx_xxxx are
> > +     * translated normally like any other request-with-PASID through
> > +     * DMA-remapping hardware. However, if such a request is processed
> > +     * using pass-through translation, it will be blocked as described
> > +     * in the paragraph below.
>
> While PASID+PT is blocked as described in the below paragraph, the
> paragraph itself applies to all situations:
>
>   1) PT + noPASID
>   2) translation + noPASID
>   3) PT + PASID
>   4) translation + PASID
>
> because...
>
> > +     *
> > +     * Software must not program paging-structure entries to remap any
> > +     * address to the interrupt address range. Untranslated requests
> > +     * and translation requests that result in an address in the
> > +     * interrupt range will be blocked with condition code LGN.4 or
> > +     * SGN.8.
>
> ... if you look at the definition of LGN.4 or SGN.8:
>
> LGN.4:  When legacy mode (RTADDR_REG.TTM=00b) is enabled, hardware
>         detected an output address (i.e. address after remapping) in the
>         interrupt address range (0xFEEx_xxxx). For Translated requests and
>         requests with pass-through translation type (TT=10), the output
>         address is the same as the address in the request
>
> The last sentence in the first paragraph above just highlights the fact that
> when input address of PT is in interrupt range then it is blocked by LGN.4
> or SGN.8 due to output address also in interrupt range.
>
> > +     * """
> > +     *
> > +     * We enable per as memory region (iommu_ir_fault) for catching
> > +     * the tranlsation for interrupt range through PASID + PT.
> > +     */
> > +    if (pt && as->pasid != PCI_NO_PASID) {
> > +        memory_region_set_enabled(&as->iommu_ir_fault, true);
> > +    } else {
> > +        memory_region_set_enabled(&as->iommu_ir_fault, false);
> > +    }
> > +
>
> Given above this should be a bug fix for nopasid first and then apply it
> to pasid path too.

Actually, nopasid path patches were posted here.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg867878.html

Thanks

>
> Thanks
> Kevin
>


