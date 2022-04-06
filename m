Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C84F52D5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 05:34:52 +0200 (CEST)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbwRY-0001WX-1G
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 23:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbwPd-00008J-Kd
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbwPa-0006yO-47
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649215969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J374b9dbBIo7ysVat9f+pvqbcZ0PIRZZIGGd+9Wtk0M=;
 b=b6eNoyRpmogCqQ29mZvtJj4wwUoIKuLnOS45nlNWzgLu/LuY72U5iVj4JI8JNUp4/US0xk
 mMhbUNkIC9wwubNaXYGDCMNvdBdjQTyh/t2XYhet5Lmvc6BxWR43BdKa6pNMPk5o/Q4YFZ
 +NQB9vUglxQ9g6xmXC79xDapJeWXqNo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-CXXauOQNMPe6Od_29jkJdw-1; Tue, 05 Apr 2022 23:32:08 -0400
X-MC-Unique: CXXauOQNMPe6Od_29jkJdw-1
Received: by mail-lf1-f71.google.com with SMTP id
 n2-20020a0565120ac200b0044a2c76f7e1so386510lfu.5
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 20:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J374b9dbBIo7ysVat9f+pvqbcZ0PIRZZIGGd+9Wtk0M=;
 b=JBj5bnpjuB2oXBZhZ5iPcjEcNLR47m4+DCgaQcJSjBZe6EvjlNhcxfPdWIbcks4whp
 JXPkfGAAD6utDnAPl+z+7bSqjThEYgt/OJImRYmx0+P8Sr8bQFPPRspAICpTx7U5RpYm
 RWpAqPfYVoDhFQTgzMPFsV11rRaXa7PN1ldir2PU+5Bw6YDgLgjIFiEOQo3cZR6lgLdl
 vVmcvIflXBWZ7Doom+mEuhnMHSw/9kK0pkavcPkoDQQK0xZ0yse3r0oY7NIy/HXCQoHG
 MybNWCNAWMvVhIhWx2FfguXQh21Jlnn8s7kaL8gxlvyvELIryDeaNie9h1z6QAqR6yjh
 hsmA==
X-Gm-Message-State: AOAM53017OLHoiIKx8XDorjk8zKRK47/hP3z20kwF/+Tf/55gW2o3S1i
 mu5MLYg0LdFQkca4213j0m6FBB0Yboonxp+RLwcNTduxySGltupiA97vdiF1c7FIZfqeZYS5JYr
 wHhGp8StEn8LwvxqXSoa5d5dpCnUjnL0=
X-Received: by 2002:a2e:b53a:0:b0:24b:12f7:237b with SMTP id
 z26-20020a2eb53a000000b0024b12f7237bmr4004354ljm.177.1649215927041; 
 Tue, 05 Apr 2022 20:32:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2GsRxqTqcinLtFAktGJ8yOoQE9bc+Nlo+vSxvS+7qKQHkepIjXUZmVaYYK3oQ/tYLbvGhlE4X5dhMrlq0BBo=
X-Received: by 2002:a2e:b53a:0:b0:24b:12f7:237b with SMTP id
 z26-20020a2eb53a000000b0024b12f7237bmr4004341ljm.177.1649215926778; Tue, 05
 Apr 2022 20:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
 <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsFd=tzta103cOyhyRvhHWKvLrTwttGwAh+GPBrxNYTiw@mail.gmail.com>
 <BL1PR11MB5271E349257909AB5754E7A78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5271E349257909AB5754E7A78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Apr 2022 11:31:55 +0800
Message-ID: <CACGkMEvRKOb9dbuXtuDy8jMm+nU+9=jHE3EvXRu-1h2Zg6hiSQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Apr 2, 2022 at 3:27 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, March 30, 2022 4:32 PM
> >
> > >
> > > >
> > > > > If there is certain fault
> > > > > triggered by a request with PASID, we do want to report this
> > information
> > > > > upward.
> > > >
> > > > I tend to do it increasingly on top of this series (anyhow at least
> > > > RID2PASID is introduced before this series)
> > >
> > > Yes, RID2PASID should have been recorded too but it's not done correc=
tly.
> > >
> > > If you do it in separate series, it implies that you will introduce a=
nother
> > > "x-pasid-fault' to guard the new logic related to PASID fault recordi=
ng?
> >
> > Something like this, as said previously, if it's a real problem, it
> > exists since the introduction of rid2pasid, not specific to this
> > patch.
> >
> > But I can add the fault recording if you insist.
>
> I prefer to including the fault recording given it's simple and makes thi=
s
> change more complete in concept. =F0=9F=98=8A

That's fine.

Thanks

>
> > > > >
> > > > > Earlier when Yi proposed Qemu changes for guest SVA [1] he aimed =
for
> > a
> > > > > coarse-grained knob design:
> > > > > --
> > > > >   Intel VT-d 3.0 introduces scalable mode, and it has a bunch of
> > capabilities
> > > > >   related to scalable mode translation, thus there are multiple
> > combinations.
> > > > >   While this vIOMMU implementation wants simplify it for user by
> > providing
> > > > >   typical combinations. User could config it by "x-scalable-mode"=
 option.
> > > > The
> > > > >   usage is as below:
> > > > >     "-device intel-iommu,x-scalable-mode=3D["legacy"|"modern"]"
> > > > >
> > > > >     - "legacy": gives support for SL page table
> > > > >     - "modern": gives support for FL page table, pasid, virtual c=
ommand
> > > > >     -  if not configured, means no scalable mode support, if not =
proper
> > > > >        configured, will throw error
> > > > > --
> > > > >
> > > > > Which way do you prefer to?
> > > > >
> > > > > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-
> > 02/msg02805.html
> > > >
> > > > My understanding is that, if we want to deploy Qemu in a production
> > > > environment, we can't use the "x-" prefix. We need a full
> > > > implementation of each cap.
> > > >
> > > > E.g
> > > > -device intel-iommu,first-level=3Don,scalable-mode=3Don etc.
> > > >
> > >
> > > You meant each cap will get a separate control option?
> > >
> > > But that way requires the management stack or admin to have deep
> > > knowledge about how combinations of different capabilities work, e.g.
> > > if just turning on scalable mode w/o first-level cannot support vSVA
> > > on assigned devices. Is this a common practice when defining Qemu
> > > parameters?
> >
> > We can have a safe and good default value for each cap. E.g
> >
> > In qemu 8.0 we think scalable is mature, we can make scalable to be
> > enabled by default
> > in qemu 8.1 we think first-level is mature, we can make first level to
> > be enabled by default.
> >
>
> OK, that is a workable way.
>
> Thanks
> Kevin


