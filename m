Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7D3F0C71
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:09:48 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRsh-0007z3-G2
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mGRXW-0002lJ-5a
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mGRXU-0001ms-JJ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629316071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IN+A2YV8lnyT2Ng0aWhK6RxOteRmp7fFa45zy1dSMwY=;
 b=TgtrxvigxQyLnukBgmW4uY6D7j24zU0bQukbtVhi7fn/rxFtJu1MPpxHj3VXMmNrPUsvOC
 m5Ct7ocZG/pUWu4fNpqPX/ygnm/bmtOuiwgw9qXZ7kw2EgqFiicGv/uHMafKO1wEU/Oztf
 GxT9R1IroxFG68REWnq/ssiEMYhEEOw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-b8rCcp06NUG8G11fVyUqkw-1; Wed, 18 Aug 2021 15:47:47 -0400
X-MC-Unique: b8rCcp06NUG8G11fVyUqkw-1
Received: by mail-pj1-f70.google.com with SMTP id
 k17-20020a17090aaa11b02901788cbc8832so4068640pjq.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IN+A2YV8lnyT2Ng0aWhK6RxOteRmp7fFa45zy1dSMwY=;
 b=DaMyTJEdsy9ieixDCs9l6qns3L4taALcHLk7kRYTaBFm5Y8KtnidEIAk8aiwj08N1R
 w+d8Pn6C7IjCP5sEkoM7eDmtQ9mlnIfetS1ssRfHdKTyBE6H62AA+KuyyyIDPFw+djgF
 vz9Kzc88pAg9nKA/hv1ATcjW8MQrI/Um4mAqVxL+kN7DtVI+iC8m8hQKJE7T0yR9DQDR
 3sh35I306K9I5wCUNiAQyepD6jp2sG7VRfnWBMUjLMciYh6nlL+c3gEhThCPkLPcbo/d
 3vUg/7bv+P9OyGYTk59kKQdwYQETEu3+0SMCmd1yViEd1d2GCAfAYzQxCOizqpUBIlYb
 2X/A==
X-Gm-Message-State: AOAM532SMd5QzXvgphH9ym4NyvTSrLjvmBnsXPQEt7ZR8+pcH45P5l8d
 J4go+WEDMaPPE7EEdwnteQuXZZrjD097TkRCxRf+vJUOK0kSB5cWK+8Mx4zkbaq5Rpk/OkV13QF
 A0vf2+/fAKD+ZLFAfelwpFElK+I1Wv9I=
X-Received: by 2002:a63:5fcc:: with SMTP id
 t195mr10312454pgb.146.1629316066716; 
 Wed, 18 Aug 2021 12:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl+CDRGCzeP3QPc2WXRxCANh3B9ZbRQw18tAno0sI1fPvBOwgnViETvtptFNPXKNvRIoYrOlbk1cVAMGbK/wY=
X-Received: by 2002:a63:5fcc:: with SMTP id
 t195mr10312439pgb.146.1629316066491; 
 Wed, 18 Aug 2021 12:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
 <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
 <20210818103147.GB31834@ashkalra_ubuntu_server>
In-Reply-To: <20210818103147.GB31834@ashkalra_ubuntu_server>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Aug 2021 21:47:32 +0200
Message-ID: <CABgObfa7vnkx_pNUHo+rXDvCCRwYgQKOj6t_pn8eqb+FXbu=BQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Ashish Kalra <ashish.kalra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005ed3c705c9dab5c0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Habkost,
 Eduardo" <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>, "S. Tsirkin,
 Michael" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, David Gilbert <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005ed3c705c9dab5c0
Content-Type: text/plain; charset="UTF-8"

Il mer 18 ago 2021, 12:31 Ashish Kalra <ashish.kalra@amd.com> ha scritto:

> Hello Paolo,
>
> On Mon, Aug 16, 2021 at 05:38:55PM +0200, Paolo Bonzini wrote:
> > On 16/08/21 17:13, Ashish Kalra wrote:
> > > > > I think that once the mirror VM starts booting and running the UEFI
> > > > > code, it might be only during the PEI or DXE phase where it will
> > > > > start actually running the MH code, so mirror VM probably still
> need
> > > > > to handles KVM_EXIT_IO when SEC phase does I/O, I can see PIC
> > > > > accesses and Debug Agent initialization stuff in SEC startup code.
> > > > That may be a design of the migration helper code that you were
> working
> > > > with, but it's not necessary.
> > > >
> > > Actually my comments are about a more generic MH code.
> >
> > I don't think that would be a good idea; designing QEMU's migration
> helper
> > interface to be as constrained as possible is a good thing.  The
> migration
> > helper is extremely security sensitive code, so it should not expose
> itself
> > to the attack surface of the whole of QEMU.
> >
> >
> One question i have here, is that where exactly will the MH code exist
> in QEMU ?
>
> I assume it will be only x86 platform specific code, we probably will
> never support it on other platforms ?
>
> So it will probably exist in hw/i386, something similar to "microvm"
> support and using the same TYPE_X86_MACHINE ?
>
> Also if we are not going to use the existing KVM support code and
> adding some duplicate KVM interface code, do we need to interface with
> this added KVM code via the QEMU accelerator framework, or simply invoke
> this KVM code statically ?
>

I would expect to be mostly separate. Once we get a second architecture we
may move part of it into TYPE_ACCEL_KVM, but that can come later and
probably it would still not reuse much code from the full-blown KVM code
that supports interrupts, MMIO and all that.

Paolo


> Thanks,
> Ashish
>
>

--0000000000005ed3c705c9dab5c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 18 ago 2021, 12:31 Ashish Kalra &lt;<a href=3D"=
mailto:ashish.kalra@amd.com">ashish.kalra@amd.com</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hello Paolo,<br>
<br>
On Mon, Aug 16, 2021 at 05:38:55PM +0200, Paolo Bonzini wrote:<br>
&gt; On 16/08/21 17:13, Ashish Kalra wrote:<br>
&gt; &gt; &gt; &gt; I think that once the mirror VM starts booting and runn=
ing the UEFI<br>
&gt; &gt; &gt; &gt; code, it might be only during the PEI or DXE phase wher=
e it will<br>
&gt; &gt; &gt; &gt; start actually running the MH code, so mirror VM probab=
ly still need<br>
&gt; &gt; &gt; &gt; to handles KVM_EXIT_IO when SEC phase does I/O, I can s=
ee PIC<br>
&gt; &gt; &gt; &gt; accesses and Debug Agent initialization stuff in SEC st=
artup code.<br>
&gt; &gt; &gt; That may be a design of the migration helper code that you w=
ere working<br>
&gt; &gt; &gt; with, but it&#39;s not necessary.<br>
&gt; &gt; &gt; <br>
&gt; &gt; Actually my comments are about a more generic MH code.<br>
&gt; <br>
&gt; I don&#39;t think that would be a good idea; designing QEMU&#39;s migr=
ation helper<br>
&gt; interface to be as constrained as possible is a good thing.=C2=A0 The =
migration<br>
&gt; helper is extremely security sensitive code, so it should not expose i=
tself<br>
&gt; to the attack surface of the whole of QEMU.<br>
&gt; <br>
&gt; <br>
One question i have here, is that where exactly will the MH code exist<br>
in QEMU ?<br>
<br>
I assume it will be only x86 platform specific code, we probably will<br>
never support it on other platforms ?<br>
<br>
So it will probably exist in hw/i386, something similar to &quot;microvm&qu=
ot;<br>
support and using the same TYPE_X86_MACHINE ?<br>
<br>
Also if we are not going to use the existing KVM support code and<br>
adding some duplicate KVM interface code, do we need to interface with<br>
this added KVM code via the QEMU accelerator framework, or simply invoke<br=
>
this KVM code statically ?<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I would expect to be mostly separate. Once we get=
 a second architecture we may move part of it into TYPE_ACCEL_KVM, but that=
 can come later and probably it would still not reuse much code from the fu=
ll-blown KVM code that supports interrupts, MMIO and all that.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
Thanks,<br>
Ashish<br>
<br>
</blockquote></div></div></div>

--0000000000005ed3c705c9dab5c0--


