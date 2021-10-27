Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E243C33D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:49:15 +0200 (CEST)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfckM-0001Nd-35
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfch4-00088x-75
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfch1-0006EM-G9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635317145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQ7k7xLWRU2qw+dDSx+AzwXb/ldVOhG7hgM48dW9agg=;
 b=PEwYxkjImd6JeQYvm+WGzjvytW/Zl8aJglb4DqWbeuoUAweAV/izvtZ5zMYurVGvCIQI2p
 ItG0nAL11q5Hw+IdwY38ocq5xiqyv9G5HUOgpCQu0eljPfPk/stcs4pknnDhqOF+wMtGdi
 BW6J7ASPZEor+fPC1QxoS21TWTk6l40=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-fl5XmMuSOGGpjQXCLuBmFQ-1; Wed, 27 Oct 2021 02:45:41 -0400
X-MC-Unique: fl5XmMuSOGGpjQXCLuBmFQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 k15-20020a0565123d8f00b003ffb31e2ea9so934272lfv.17
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iQ7k7xLWRU2qw+dDSx+AzwXb/ldVOhG7hgM48dW9agg=;
 b=Qr4T+KW4nEf47oYs/Ke+EyPrcJAvd2IQD6HdpEt6FVV9BRH2GDzl6DAQeNey+n5glD
 n+iIkMlvpR7apayR69h+VPOVg02Z79XAd2c4DpI0/QX9/G8pFOqsMuSryIFrHAo8iOj4
 /XFWFbHAC1munzxPoGMj6QRN8PUAuYA2FVLBUD2Rb10EL69TRmTPvzY7FJBXBBfoWWNt
 7wEK1O4Xfn+Wd25xlEiylI5rW+c7/E8M/ACAjK5SEWzkdfh6+0drVCTgxXcjZ/mCUc14
 5j5VTp8NZARkfyuyksNLGGTtnBrDXnXB/9h2fxE0z3BJddhGliPvhm1oRnXeWWTfIYj/
 +/tg==
X-Gm-Message-State: AOAM530zDw4aGy/y7ScWNXSdzK5i8ObDDN7/pG6yhyVeQS9Dh5uovAB2
 YGZWHaDyYzhnaK3CA9WE0xbnyf0/9NHJG/pitKQIr3HPG3OaVYw1i2hVbsPUWu62X+UulXFBMpd
 bkjsY94EkzpHbK2wK+9igHo9WgM+CGhc=
X-Received: by 2002:a05:6512:282:: with SMTP id
 j2mr14572431lfp.580.1635317139889; 
 Tue, 26 Oct 2021 23:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk6DEmJcKVyqs8VGhZb1XY378CtikSIFMSIms6r8GhuFXypyT+k0aY4g5mBFs6CwFj3mnt2mrnvAFpEMMrFTw=
X-Received: by 2002:a05:6512:282:: with SMTP id
 j2mr14572410lfp.580.1635317139625; 
 Tue, 26 Oct 2021 23:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211026181730.3102184-1-chen.zhang@intel.com>
 <20211026181730.3102184-2-chen.zhang@intel.com>
 <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
 <MWHPR11MB0031AA6B818E9BBE4B1D78589B859@MWHPR11MB0031.namprd11.prod.outlook.com>
 <fbdf6a0d-739f-9949-abf1-35b7ed1a29da@redhat.com>
 <MWHPR11MB003173BB1E208D240823E8D39B859@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB003173BB1E208D240823E8D39B859@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Oct 2021 14:45:28 +0800
Message-ID: <CACGkMEvQ638LTT-YsLmGNONDCiBJFJ9JOVrDTeH_ktLp6D7gbg@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 2:40 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 27, 2021 2:24 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: qemu-dev <qemu-devel@nongnu.org>; Markus Armbruster
> > <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Subject: Re: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mir=
ror
> > and filter-redirector
> >
> >
> > =E5=9C=A8 2021/10/27 =E4=B8=8B=E5=8D=882:19, Zhang, Chen =E5=86=99=E9=
=81=93:
> > >>
> > mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dchardevid,queue=3Dall|rx|tx[,=
vnet_h
> > >> dr _support][,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|befor=
e]``
> > >>> +    ``-object
> > >>> + filter-mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dchardevid,queue=
=3Dall|rx|
> > >>> + tx [,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]``
> > >> I wonder if we break management layer. If yes, maybe it's better to
> > >> keep the vnet_hdr_support here.
> > > Yes and no,   With this series of patches, filters have ability to au=
tomatically
> > > Configure the appropriate vnet_hdr_support flag according to the curr=
ent
> > environment.
> > > And can report error when can't fixing the vnet_hdr(The user cannot f=
ix it
> > from the previous way ).
> > > So I think no need for the user to configure this option, some releva=
nt
> > background knowledge required.
> > >
> > > For the management layer, keep the vnet_hdr_support may be
> > meaningless except for compatibility.
> > > In this situation, Do you think we still need to keep the vnet_hdr_su=
pport
> > for management layer?
> >
> >
> > So it depends on whether management layer like libvirt has already
> > supported this. If yes, we may get errors using new qemu with old libvi=
rt?
>
> As far as I know, Current management layer like upstream libvirt is no CO=
LO official support yet.
> And some real CSPs use libvirt passthrough qmp command to Qemu for manage=
 COLO VM.

So the question still, it looks to me it requires the modification of
the layers on top of libvirt? If the answer is yes, we'd better keep
that compatibility.

> It is no harm to users to reduce some unnecessary parameters. But if you =
think compatibility is
> more important, I will restore this parameter in next version.

Thanks

>
> Thanks
> Chen
>
>
>
>
> >
> > Thanks
> >
> > > Enable/disable it do the same things for filters.
> > >
> > > Thanks
> > > Chen
> > >
>


