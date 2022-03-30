Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEDF4EBCF4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:50:37 +0200 (CEST)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZU2G-0008KB-38
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:50:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZTlD-0000av-6O
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZTl3-0006qH-Sl
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648629169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1ZE/05Cp9ibDaWQuoYR3L1KKeyxl+7YwiBSnABW6F0=;
 b=e2QqOwETRN+Twu5ubJRh+ayn3AMJ0TM0tNZ8s2zrZkMwrIDcPQxIxB1ajAdoDj9Zuc3sx6
 kIDCC33R/pg6lX7AiMirxENw57rfG+ue69rrptWuc+IQW+Sa0rkAdwBokxkTdw5v8HO8ym
 xONcMyKlnPVQ0yWRBUw9/MxqE+x4OJc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-HGH-V7pGPW6O2-0o6WBSMQ-1; Wed, 30 Mar 2022 04:32:31 -0400
X-MC-Unique: HGH-V7pGPW6O2-0o6WBSMQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 o25-20020a2e7319000000b0024aa653c564so5617759ljc.23
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1ZE/05Cp9ibDaWQuoYR3L1KKeyxl+7YwiBSnABW6F0=;
 b=x8dmXMftByHugsdJeJw+42wVkYySEhVsaN4FCFKK0YoIRf6yTZGgQIHw6U51d8q/9m
 eMrtbMRwmNe8UWaa3L/OdECM81pHxsvEyIOxuqbWhhbUj9KGbLaYM0yMiMTQ767NB08c
 G4uCfRqyxY8+r0dFxGTjD50ZGxy7ltOmVUhG/AP6n9BXstjHvIseb/yQpGIlGXB+gR4e
 J3FgHJ26YVt++GeHwoJoqpEy6mWK2jQq8gp+Pz+bNMGaWwlBOnDkOKcd1fxDBZQ0/McJ
 dGMXaUowzqLhW9XWIx5cnkydKU1vynZX5cjwQ16TP/3SgX6JvMUelkZreFWztUGqoGj0
 jzcw==
X-Gm-Message-State: AOAM5326ereDcNFuicnAukOCRzsjWNe9VO5yX7cMltpsQH7z+L10oHYz
 aCXtVhx36yCWyMrNQuNPBo5FlAVlfiZCVqA5Il9yoq+Lkj2BkDCf0oNBV328MZqh0Gm8B04i48G
 2MvJdW/8YSMGB/0x/ENV9GCjnGShqAo8=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr5963261lfh.471.1648629149787; 
 Wed, 30 Mar 2022 01:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFiwiwY+5sWJY1CA+0aHjWnAfoOE2jqzgtM0oq2ATxGSQd0eTwtcPhPnEaAsLP0P6ZIqRbAK7zg5tF3nyduyM=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr5963254lfh.471.1648629149523; Wed, 30
 Mar 2022 01:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
 <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 16:32:18 +0800
Message-ID: <CACGkMEsFd=tzta103cOyhyRvhHWKvLrTwttGwAh+GPBrxNYTiw@mail.gmail.com>
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

On Wed, Mar 30, 2022 at 4:00 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, March 29, 2022 12:47 PM
> >
> > On Mon, Mar 28, 2022 at 2:47 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, March 28, 2022 10:31 AM
> > > >
> > > > On Thu, Mar 24, 2022 at 4:54 PM Tian, Kevin <kevin.tian@intel.com>
> > wrote:
> > > > >
> > > > > > From: Jason Wang
> > > > > > Sent: Monday, March 21, 2022 1:54 PM
> > > > > >
> > > > > > This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
> > > > > > existing support for scalable mode, we need to implement the
> > following
> > > > > > missing parts:
> > > > > >
> > > > > > 1) tag VTDAddressSpace with PASID and support IOMMU/DMA
> > > > translation
> > > > > >    with PASID
> > > > > > 2) tag IOTLB with PASID
> > > > >
> > > > > and invalidate desc to flush PASID iotlb, which seems missing in this
> > patch.
> > > >
> > > > It existed in the previous version, but it looks like it will be used
> > > > only for the first level page table which is not supported right now.
> > > > So I deleted the codes.
> > >
> > > You are right. But there is also PASID-based device TLB invalidate descriptor
> > > which is orthogonal to 1st vs. 2nd level thing. If we don't want to break the
> > > spec with this series then there will need a way to prevent the user from
> > > setting both "device-iotlb" and "x-pasid-mode" together.
> >
> > Right, let me do it in the next version.
> >
> >
> > >
> > > >
> > > > >
> > > > > > 3) PASID cache and its flush
> > > > > > 4) Fault recording with PASID
> > > > > >
> > > > > > For simplicity:
> > > > > >
> > > > > > 1) PASID cache is not implemented so we can simply implement the
> > PASID
> > > > > > cache flush as a nop.
> > > > > > 2) Fault recording with PASID is not supported, NFR is not changed.
> > > > > >
> > > > > > All of the above is not mandatory and could be implemented in the
> > > > > > future.
> > > > >
> > > > > PASID cache is optional, but fault recording with PASID is required.
> > > >
> > > > Any pointer in the spec to say something like this? I think sticking
> > > > to the NFR would be sufficient.
> > >
> > > I didn't remember any place in spec saying that fault recording with PASID
> > is
> > > not required when PASID capability is exposed.
> >
> > Ok, but as a spec it needs to clarify what is required for each capability.
>
> It is clarified in 10.4.14 Fault Recording Registers:
>
>   "PV: PASID Value": PASID value used by the faulted request.
>   For requests with PASID, this field reports the PASID value that
>   came with the request. Hardware implementations not supporting
>   PASID (PASID field Clear in Extended Capability register) and not
>   supporting RID_PASID (RPS field Clear in Extended Capability
>   Register) implement this field as RsvdZ.
>
> Above reflects that when PASID capability is enabled the PV field
> should include PASID value for the faulted request.
>
> Similar description can be found in another field "PP: PASID Present"

Ok.

>
> >
> > > If there is certain fault
> > > triggered by a request with PASID, we do want to report this information
> > > upward.
> >
> > I tend to do it increasingly on top of this series (anyhow at least
> > RID2PASID is introduced before this series)
>
> Yes, RID2PASID should have been recorded too but it's not done correctly.
>
> If you do it in separate series, it implies that you will introduce another
> "x-pasid-fault' to guard the new logic related to PASID fault recording?

Something like this, as said previously, if it's a real problem, it
exists since the introduction of rid2pasid, not specific to this
patch.

But I can add the fault recording if you insist.

>
> >
> > >
> > > btw can you elaborate why NFR matters to PASID? It is just about the
> > > number of fault recording register...
> >
> > I might be wrong, but I thought without increasing NFR we may lack
> > sufficient room for reporting PASID.
>
> I think they are orthogonal things.

Ok.

>
> >
> > >
> > > >
> > > > > I'm fine with adding it incrementally but want to clarify the concept first.
> > > >
> > > > Yes, that's the plan.
> > > >
> > >
> > > I have one open which requires your input.
> > >
> > > While incrementally enabling things does be a common practice, one worry
> > > is whether we want to create too many control knobs in the staging process
> > > to cause confusion to the end user.
> >
> > It should be fine as long as we use the "x-" prefix which will be
> > finally removed.
>
> Good to learn.
>
> >
> > >
> > > Earlier when Yi proposed Qemu changes for guest SVA [1] he aimed for a
> > > coarse-grained knob design:
> > > --
> > >   Intel VT-d 3.0 introduces scalable mode, and it has a bunch of capabilities
> > >   related to scalable mode translation, thus there are multiple combinations.
> > >   While this vIOMMU implementation wants simplify it for user by providing
> > >   typical combinations. User could config it by "x-scalable-mode" option.
> > The
> > >   usage is as below:
> > >     "-device intel-iommu,x-scalable-mode=["legacy"|"modern"]"
> > >
> > >     - "legacy": gives support for SL page table
> > >     - "modern": gives support for FL page table, pasid, virtual command
> > >     -  if not configured, means no scalable mode support, if not proper
> > >        configured, will throw error
> > > --
> > >
> > > Which way do you prefer to?
> > >
> > > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg02805.html
> >
> > My understanding is that, if we want to deploy Qemu in a production
> > environment, we can't use the "x-" prefix. We need a full
> > implementation of each cap.
> >
> > E.g
> > -device intel-iommu,first-level=on,scalable-mode=on etc.
> >
>
> You meant each cap will get a separate control option?
>
> But that way requires the management stack or admin to have deep
> knowledge about how combinations of different capabilities work, e.g.
> if just turning on scalable mode w/o first-level cannot support vSVA
> on assigned devices. Is this a common practice when defining Qemu
> parameters?

We can have a safe and good default value for each cap. E.g

In qemu 8.0 we think scalable is mature, we can make scalable to be
enabled by default
in qemu 8.1 we think first-level is mature, we can make first level to
be enabled by default.

Thanks

>
> Thanks
> Kevin


