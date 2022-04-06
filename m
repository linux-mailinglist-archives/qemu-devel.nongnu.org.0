Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF894F52D6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 05:37:01 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbwTc-0002de-Al
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 23:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbwQE-0000eW-RH
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbwQD-0007B1-2n
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649216008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o83j8PsxaYJTJlDFENePSNozhAuq7dnAUVTPAThrtD0=;
 b=MBBUNKHCkDw6EHjGDJI33Xt2ol3Asn++pE+2EzbpYSZASvIvAffFw6Dg4jl5ZDO53HsVZ1
 cuSTrgW0DV0mKhKj5PsjwACgn2NFMQg6FgEHkkCEoGhif0lL4M0GFjM+Kb+6S8toe+Dj6X
 CSKgBr5Dz/G8C2Z5b5FMd0/6UAELVAM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-iJQ_RXf1PhCvYh7dw5VZhA-1; Tue, 05 Apr 2022 23:33:25 -0400
X-MC-Unique: iJQ_RXf1PhCvYh7dw5VZhA-1
Received: by mail-lf1-f69.google.com with SMTP id
 g20-20020a056512119400b0044ada577e3dso391485lfr.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 20:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o83j8PsxaYJTJlDFENePSNozhAuq7dnAUVTPAThrtD0=;
 b=3uwGLZultZv/lATsSTPkScTQABQAY1uZARQ7QHyGBvBC+FAb/apyRF93CE39bajtCd
 SHYEizRSm8RS8zJjar7i6JRYU7LRF9AHjnKOYFyJAO2+lyJqRGAxtOMkW8YX/JOLbqfh
 qFXIyy81Gdfb6XWLYADLPN/RTURZGj90qU8s8cJ+GGllerkgNyYy3zb3XTBMmVhsHr2Z
 Uxyg/BmNw8a387ocWhF5kJAEUrkje+AXtrw67P2yeufz+Yona03JSkXhJhm7xovlLXe0
 CFWoTZ6xTZ6jhafh6TAcM3SF2O/ZhwL08w/xAKAayGFJ//ybR1YxRHhjWSclUusqBH2v
 JWCA==
X-Gm-Message-State: AOAM530YtT2r8qF97VSvd2zPP+jKBF3gZKR1isH6oWBkXQVV7ePasseF
 BQV+HaA7hLMQWjnDT8g9Fbeuk22Zi8VH/KezxynmebtBI01z8n5J+1rBKHs5fAw7M311KbgcTLA
 pT+AkkXdVK/oOfdUm+KdbCNzKxoXjIlw=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr4562914lfa.210.1649216003552; 
 Tue, 05 Apr 2022 20:33:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhSLZKQMriT7b8Y28Wx93cokadYs2Nzki49LZfUccHG4UJ9kZ2GDaQJiLOLddRLZtqJtCVwj9JJqkyoTW7yhA=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr4562905lfa.210.1649216003364; Tue, 05
 Apr 2022 20:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
 <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
 <BL1PR11MB5271E2D6268489B5475111E78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5271E2D6268489B5475111E78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Apr 2022 11:33:12 +0800
Message-ID: <CACGkMEtVb8BPzF0T5srvznffW71CdVqyHUpVq9F1XQkcYyQWnA@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
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

On Sat, Apr 2, 2022 at 3:34 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, March 30, 2022 4:37 PM
> > On Wed, Mar 30, 2022 at 4:16 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, March 29, 2022 12:52 PM
> > > > >
> > > > >>>
> > > > >>> Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
> > > > >>> problematic. According to VT-d spec, RID2PASID field is effective only
> > > > >>> when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I
> > didn't
> > > > >>> see ecap.rps is set, neither is it checked in that function. It
> > > > >>> works possibly
> > > > >>> just because Linux currently programs 0 to RID2PASID...
> > > > >>
> > > > >> This seems to be another issue since the introduction of scalable mode.
> > > > >
> > > > > yes. this is not introduced in this series. The current scalable mode
> > > > > vIOMMU support was following 3.0 spec, while RPS is added in 3.1.
> > Needs
> > > > > to be fixed.
> > > >
> > > >
> > > > Interesting, so this is more complicated when dealing with migration
> > > > compatibility. So what I suggest is probably something like:
> > > >
> > > > -device intel-iommu,version=$version
> > > >
> > > > Then we can maintain migration compatibility correctly. For 3.0 we can
> > > > go without RPS and 3.1 and above we need to implement RPS.
> > >
> > > This is sensible. Probably a new version number is created only when
> > > it breaks compatibility with an old version, i.e. not necessarily to follow
> > > every release from VT-d spec. In this case we definitely need one from
> > > 3.0 to 3.1+ given RID2PASID working on a 3.0 implementation will
> > > trigger a reserved fault due to RPS not set on a 3.1 implementation.
> >
> > 3.0 should be fine, but I need to check whether there's another
> > difference for PASID mode.
> >
> > It would be helpful if there's a chapter in the spec to describe the
> > difference of behaviours.
>
> There is a section called 'Revision History' in the start of the VT-d spec.
> It talks about changes in each revision, e.g.:
> --
>   June 2019, 3.1:
>
>   Added support for RID-PASID capability (RPS field in ECAP_REG).

Good to know that, does it mean, except for this revision history, all
the other semantics keep backward compatibility across the version?

> --
>
> >
> > >
> > > >
> > > > Since most of the advanced features has not been implemented, we may
> > > > probably start just from 3.4 (assuming it's the latest version). And all
> > > > of the following effort should be done for 3.4 in order to productize it.
> > > >
> > >
> > > Agree. btw in your understanding is intel-iommu in a production quality
> > > now?
> >
> > Red Hat supports vIOMMU for the guest DPDK path now.
> >
> > For scalable-mode we need to see some use cases then we can evaluate.
> > virtio SVA could be a possible use case, but it requires more work e.g
> > PRS queue.
>
> Yes it's not ready for full evaluation yet.
>
> The current state before your change is exactly feature-on-par with the
> legacy mode, except using scalable format in certain structures. That alone
> is not worthy of a formal evaluation.

Right.

Thanks

>
> >
> > > If not, do we want to apply this version scheme only when it
> > > reaches the production quality or also in the experimental phase?
> >
> > Yes. E.g if we think scalable mode is mature, we can enable 3.0.
> >
>
> Nice to know.
>
> Thanks
> Kevin


