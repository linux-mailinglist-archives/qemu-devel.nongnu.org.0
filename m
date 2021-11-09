Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3944A7CF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:47:07 +0100 (CET)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLqU-0001yW-Uq
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkLmH-0006MT-6B
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:42:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkLmE-00047g-EH
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636443761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJ44hP57vzuBQScp9P7Npeo/mLbV6/6RmwjENUjUofQ=;
 b=d/PQDRXBNE1q2yZ8fX5DsknK9lsppWC/E60sxP0CB6EcSMYqxLHRZXsdv0nF7mD1ag191m
 LnVeBNN/YgmFeC487IqLkUg1C/9OJiVrEfJXAO90UsihEyYQzy0tRFhKKn8/wxNoATYc+o
 AJEggtyPBpHoerBRcWMr3/twr+SUau4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-dk8EYpuZMsSSzMH24ZHMNQ-1; Tue, 09 Nov 2021 02:42:40 -0500
X-MC-Unique: dk8EYpuZMsSSzMH24ZHMNQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 u20-20020a056512129400b0040373ffc60bso2381835lfs.15
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wJ44hP57vzuBQScp9P7Npeo/mLbV6/6RmwjENUjUofQ=;
 b=s9Ivm6RcBkvnjnB+yYY/dNSkm+7XuIp8ALl0f/oZ6scgUoZR+QQBXoRAZn+Sq3a8Us
 xeo30fQZfYnYYUhaBLRwKx6NiwYjpoDQQz1AR6pmoYQm5KSmTHHl+MS4VeZ0eZg4fSWq
 CKIwb48fljxw2K8lI5ZJlRiLujBAi8z+9J/YileutaU4ukXKQo8L4quICgbZPy96cXuE
 NuvdCMIiTZR41o8nV5KNHRo+CcghyoGwVDfC0hmK5jphMKgG939LTNMfnUi/HhOmylxK
 a8LBGeEz8L20hQHz41nhGTfgeDO7VIdG8gu+vuEaE5TgwVkCXdNH3xVfomHxP2lddD9a
 c7kQ==
X-Gm-Message-State: AOAM530lFl+rV+0/39OWCWjjVTczVHDhVSwvWZXFiB/4vabSB1F/kcQ3
 tTyRkXAVu2chI0mPTJbW3mpwuYXzYr4Loxq9Ud9dw16aJ8HFJRG2E97Si7ZnmnKojSYpxsqW19v
 Pwa7Vhsw/cN4UaLaB8MCR824kwEXRYvA=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr5564662ljm.369.1636443758646; 
 Mon, 08 Nov 2021 23:42:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcEUlpfiebR0PYoVy3sbq/U4Qvly3JpaaXFRVXp/htsvbGsBt1wfO6QDiVXtQdHLjzGPOVDTgMKgJxxZzFMQI=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr5564632ljm.369.1636443758384; 
 Mon, 08 Nov 2021 23:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
 <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
 <MWHPR11MB0031EBF5ACACF7455EA9F4779B8E9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsLF6VUDNgnUngrE4LePkM8pFe3fYrPd2W6O8RUpcprNQ@mail.gmail.com>
 <MWHPR11MB00315078A1A7329E96FAA8F79B919@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsu-1ENupe8xMyKNNpbNjt1aGr5Unr_-4xDwx7OiA0ttQ@mail.gmail.com>
 <MWHPR11MB0031DA3889B2E94DDF5948229B929@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEuf=WybP0sZMHMxRBdm6H2ZOo-keoSAqbgJ2dTwdVLjCg@mail.gmail.com>
 <MWHPR11MB003128C0DAB600B97C6723EB9B929@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB003128C0DAB600B97C6723EB9B929@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Nov 2021 15:42:27 +0800
Message-ID: <CACGkMEumfoiAMWQdZM4+B8dBhEeQP4AREuDtparwuJDdZoS=-w@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 9, 2021 at 3:31 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 9, 2021 3:26 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for =
filter-
> > mirror/redirector
> >
> > On Tue, Nov 9, 2021 at 3:20 PM Zhang, Chen <chen.zhang@intel.com> wrote=
:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 9, 2021 2:42 PM
> > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol
> > > > for filter- mirror/redirector
> > > >
> > > > On Mon, Nov 8, 2021 at 10:50 AM Zhang, Chen <chen.zhang@intel.com>
> > > > wrote:
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, November 8, 2021 10:42 AM
> > > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > > > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer
> > > > > > protocol for filter- mirror/redirector
> > > > > >
> > > > > > On Fri, Nov 5, 2021 at 4:43 PM Zhang, Chen
> > > > > > <chen.zhang@intel.com>
> > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Friday, November 5, 2021 4:30 PM
> > > > > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev
> > <qemu-
> > > > > > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer
> > > > > > > > protocol for filter- mirror/redirector
> > > > > > > >
> > > > > > > > On Fri, Nov 5, 2021 at 1:29 PM Zhang, Chen
> > > > > > > > <chen.zhang@intel.com>
> > > > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Friday, November 5, 2021 12:03 PM
> > > > > > > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > > > > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev
> > > > <qemu-
> > > > > > > > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com=
>
> > > > > > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize
> > > > > > > > > > transfer protocol for filter- mirror/redirector
> > > > > > > > > >
> > > > > > > > > > On Fri, Nov 5, 2021 at 11:27 AM Zhang, Chen
> > > > > > > > > > <chen.zhang@intel.com>
> > > > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Friday, November 5, 2021 11:17 AM
> > > > > > > > > > > > To: Zhang, Chen <chen.zhang@intel.com>; Markus
> > > > > > > > > > > > Armbruster <armbru@redhat.com>
> > > > > > > > > > > > Cc: qemu-dev <qemu-devel@nongnu.org>; Li Zhijian
> > > > > > > > > > > > <lizhijian@cn.fujitsu.com>
> > > > > > > > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize
> > > > > > > > > > > > transfer protocol for filter- mirror/redirector
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > =E5=9C=A8 2021/11/4 =E4=B8=8B=E5=8D=881:37, Zhang, =
Chen =E5=86=99=E9=81=93:
> > > > > > > > > > > > >>>>>
> > > > > > > > > > > > >>>>> I wonder if we need to introduce new
> > > > > > > > > > > > >>>>> parameter, e.g force_vnet_hdr here, then we
> > > > > > > > > > > > >>>>> can always send vnet_hdr
> > > > > > > > when
> > > > > > > > > > > > >>>>> it
> > > > > > > > > > is enabled.
> > > > > > > > > > > > >>>>>
> > > > > > > > > > > > >>>>> Otherwise the "vnet_hdr_support" seems
> > meaningless.
> > > > > > > > > > > > >>>> Yes, Current "vnet_hdr_support"  default
> > > > > > > > > > > > >>>> enabled, and vnet_hdr_len
> > > > > > > > > > > > >>> already forced from attached nf->netdev.
> > > > > > > > > > > > >>>> Maybe we can introduce a new parameter
> > > > > > > > "force_no_vnet_hdr"
> > > > > > > > > > here
> > > > > > > > > > > > to
> > > > > > > > > > > > >>> make the vnet_hdr_len always keep 0.
> > > > > > > > > > > > >>>> If you think OK, I will update it in next vers=
ion.
> > > > > > > > > > > > >>> Let me explain, if I was not wrong:
> > > > > > > > > > > > >>>
> > > > > > > > > > > > >>> "vnet_hdr_support" means whether or not to send
> > > > > > > > > > > > >>> vnet header
> > > > > > > > > > length.
> > > > > > > > > > > > >>> If vnet_hdr_support=3Dfalse, we won't send the
> > > > > > > > > > > > >>> vnet
> > > > header.
> > > > > > > > > > > > >>> This looks the same as you "force_no_vent_hdr"
> > above.
> > > > > > > > > > > > >> Yes, It was.  But this series changed it.
> > > > > > > > > > > > >> Current "vnet_hdr_support" can't decide whether
> > > > > > > > > > > > >> send vnet header length, we always send it even =
0.
> > > > > > > > > > > > >> It will avoid sender/receiver transfer protocol =
parse
> > issues:
> > > > > > > > > > > > >> When sender data with the vnet header length, bu=
t
> > > > > > > > > > > > >> receiver can't enable the "vnet_hdr_support".
> > > > > > > > > > > > >> Filters will auto setup vnet_hdr_len as local
> > > > > > > > > > > > >> nf->netdev and found the issue when get differen=
t
> > > > > > > > > > > > >> vnet_hdr_len from other
> > > > > > > > filters.
> > > > > > > > > > > > >>
> > > > > > > > > > > > >>> And my "force_vnet_hdr" seems duplicated with
> > > > > > > > > > > > vnet_hdr_support=3Dtrue.
> > > > > > > > > > > > >>> So it looks to me we can leave the mirror code
> > > > > > > > > > > > >>> as is and just change the compare? (depends on
> > > > > > > > > > > > >>> the mgmt to set a correct
> > > > > > > > > > > > >>> vnet_hdr_support)
> > > > > > > > > > > > >> OK, I will keep the
> > > > > > > > > > > > >> filter-mirror/filter-redirector/filter-rewriter
> > > > > > > > > > > > >> same as this version.
> > > > > > > > > > > > >> For the colo-compare module, It will get primary
> > > > > > > > > > > > >> node's filter data's vnet_hdr_len as the local
> > > > > > > > > > > > >> value, And compare with secondary node's, becaus=
e
> > > > > > > > > > > > >> it is not attached any
> > > > > > nf->netdev.
> > > > > > > > > > > > >> So, it looks compare module's "vnet_hdr_support"
> > > > > > > > > > > > >> been auto configuration from the filter transpor=
t
> > protocol.
> > > > > > > > > > > > >> If the "force_vnet_hdr" means hard code a
> > > > > > > > > > > > >> compare's local vnet_hdr_len rather than come fr=
om
> > input filter's data?
> > > > > > > > > > > > >>
> > > > > > > > > > > > >> Thanks
> > > > > > > > > > > > >> Chen
> > > > > > > > > > > > >>
> > > > > > > > > > > > > Hi Jason/Markus,
> > > > > > > > > > > > >
> > > > > > > > > > > > > Rethink about it, How about keep the original
> > > > > > "vnet_hdr_support"
> > > > > > > > > > > > > function, And add a new optional parameter
> > > > "auto_vnet_hdr"
> > > > > > > > > > > > > for
> > > > > > > > > > > > filters/compare?
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > It's a way but rethink of the whole thing. I wonder
> > > > > > > > > > > > what if we just enable "vnet_hdr_support" by defaul=
t
> > > > > > > > > > > > for filter and
> > > > > > > > > > > > colo-
> > > > > > > > compare?
> > > > > > > > > > >
> > > > > > > > > > > It's works by default for user use -device
> > > > > > > > > > > virtio-net-pci and
> > > > e1000...
> > > > > > > > > > > But it can't resolve this series motivation, how to
> > > > > > > > > > > fix/check user
> > > > > > > > > > configuration issue:
> > > > > > > > > > > For example user enable " vnet_hdr_support "
> > > > > > > > > > > filter-mirror and disable " vnet_hdr_support"
> > > > > > > > > > > filter-redirector And connect both filter modules by
> > > > > > > > > > chardev socket.
> > > > > > > > > > > In this case guest will get wrong network workload an=
d
> > > > > > > > > > > filters didn=E2=80=99t perceive any abnormalities, bu=
t in
> > > > > > > > > > > fact, the whole system is no longer
> > > > > > > > > > working.
> > > > > > > > > > > This series will report error and try to correct it.
> > > > > > > > > >
> > > > > > > > > > The problem is how "auto_vnet_hdr" help in this case.
> > > > > > > > > > It's a new parameter which may lead to more wrong
> > configuration?
> > > > > > > > >
> > > > > > > > > No, the "auto_vnet_hdr" will fix most the wrong
> > > > > > > > > configuration issues as
> > > > > > > > "vnet_hdr_support" correct setting.
> > > > > > > > > When we enable the "auto_vnet_hdr", the original
> > > > > > "vnet_hdr_support"
> > > > > > > > will no effect.
> > > > > > > >
> > > > > > > > So it looks to me it still depends on the management to set
> > > > > > "auto_vnet_hdr"
> > > > > > > > to be true? (or make it enabled by default)
> > > > > > >
> > > > > > > Yes, I plan to make "auto_vnet_hdr" enabled by default in nex=
t
> > version.
> > > > > > >
> > > > > > > >
> > > > > > > > If we can do that, isn't it much more simpler to make
> > > > > > > > vnet_hdr_support by default?
> > > > > > >
> > > > > > > Yes, For compatibility filters and COLO still work with the
> > > > > > > original
> > > > > > "vnet_hdr_support".
> > > > > > > For new users, they can enable the new "auto_vnet_hdr" to
> > > > > > > avoid some
> > > > > > issues.
> > > > > >
> > > > > > Question still, so we have
> > > > > >
> > > > > > 1) enable vnet_hdr_support by default
> > > > > > 2) add auto_vnet_hdr and enable it by default
> > > > > >
> > > > > > Using 1) seems much more simpler and can solve this issue. If w=
e
> > > > > > depends on the default behaviour, it should be almost the same.
> > > > > > If we want to teach the mgmt, both should work. Any other
> > > > > > advantages of
> > > > 2)?
> > > > >
> > > > > Using 1) we can't ensure user configure parts of module by itself=
.
> > > > (vnet_hdr_support =3D off).
> > > > > In this case, filter data already wrong and the filters can't
> > > > > report any
> > > > transfer error here.
> > > >
> > > > So I think the point is we can't ensure the user configure parts of
> > > > module in any case even if auto_vnet_hdr is introduced. E.g user ca=
n
> > > > choose to disable it manually. That's why I think it should not
> > > > differ too much from making vnet_hdr_support enabled by default.
> > >
> > > Yes, you are right. The "auto_vnet_hdr" just can fix part of user con=
figure
> > issue.
> > > And I think this series make the filters better, it make user know
> > > filters have some issues when they have wrong manual
> > configuration(current code not).
> >
> > I think if you stick to the change, I wonder if something like
> > "vnet_hdr_support=3Dauto" would be better? (not sure if it's too late t=
o
> > change)
>
> It's OK for me. I will update the V6.
> By the way, have any update about the queued filter passthrough series?
> Need I do something?

If I'm not wrong, Markus has some concern so I drop it from the queue.

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> > >
> > > Thanks
> > > Chen
> > >
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Using 2) filters will find/report this issue and try to fix it
> > > > > from local
> > > > vnet_hdr_len.
> > > > >
> > > > > Thanks
> > > > > Chen
> > > > >
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > > Chen
> > > > > > >
> > > > > > > >
> > > > > > > > I think I may miss something.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > Chen
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > > > Chen
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > Chen
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >>> Thanks
> > > > > > > > > > > > >>>
> > > > > > > > > > > > >>>> Thanks
> > > > > > > > > > > > >>>> Chen
> > > > > > > > > > > > >>>>
> > > > > > > > > > > > >>>>> Thanks
> > > > > > > > > > > > >>>>>
> > > > > > > > > > > > >>>>>
> > > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > >
> > >
>


