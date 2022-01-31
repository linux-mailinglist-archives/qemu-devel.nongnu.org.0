Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499054A5146
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:17:41 +0100 (CET)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEe3Q-0007UL-Cc
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEd8J-0006OZ-Pp
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 15:18:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEd8G-0006JR-1y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 15:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643660305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66geUqQvxE1p+HTOxY6gnuJ+pWLHTaXxEkRMOGtICns=;
 b=d6g7ahoZ2AOsFRNpuWn1xV8k7ZYWh6si2W0ioOsxRsJjWmAaZlzLe4utBxknUCIncWN2Or
 MnXN5leQQYwVborHDl42a88OEpFn+kbg2Xmikw5yyIWx2h/Vnw4UQN3caVYkFcSfPLax1Z
 DebeeFjd4r3ziSPl/0MTLc5zgVNIKr0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-J1rCfMLLNqy6Uh7uqfzi2g-1; Mon, 31 Jan 2022 15:18:18 -0500
X-MC-Unique: J1rCfMLLNqy6Uh7uqfzi2g-1
Received: by mail-lf1-f70.google.com with SMTP id
 t24-20020a199118000000b0043874ba4b56so4883147lfd.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 12:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=66geUqQvxE1p+HTOxY6gnuJ+pWLHTaXxEkRMOGtICns=;
 b=XsOGa2p/ESD2Y8Du4BZXP9R7o+gh/2m9MAkJdqfd27Ujgbn/mgi9RkCbDivb33TEyg
 XS9bSKJmnjLLpDWNHfgKONJi9hbeSCSPQc2466UxxGMIzkXSAG1nOmGSqzTjPPRM6/24
 CQ0qn99tMi1Z6hUjT8XyvCqhERJ+O/1bEGzKXXUy9BQkDmCyZOfiptVPXp3v9yucttlL
 sqEv1Z3IMyJS+eoQUuhZa9unaRcrEn1FTPGdLR5Ow/IqGdRYd+KGgf6MAADUkUMXXCty
 MENVOSFZdBwh15XB9Jzv2EKmNqKsqL5D27FA3cr8KEEXycSu8lzx3IoQZICom33kNfpi
 O7hA==
X-Gm-Message-State: AOAM532o69YXDFXx5p+Rnfyzoy99q6AATg/HO5kSCoGfODJeunDo7ncT
 nHdINcFCY3SgZPc30Fpy3xhfnmq59hfYrmpTIKM5jyPWYzDQT0BGl3Ny2GqL6v6d4cOrwD6C3yi
 swoxKR/XAVXaA7fVlzmCC6WjSNDIkwms=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr8507330ljr.162.1643660296803; 
 Mon, 31 Jan 2022 12:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpnPKFPSu9zvZOOmU+ILTzCjnE43wqVaIna+klwq1Og0F4535l8fY5eG2qi7mPAoSXmgg8dwKwFazG/OxKFnY=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr8507312ljr.162.1643660296494; 
 Mon, 31 Jan 2022 12:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
 <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
 <Yfgkdij1x2gSTdXt@redhat.com>
In-Reply-To: <Yfgkdij1x2gSTdXt@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 31 Jan 2022 17:18:04 -0300
Message-ID: <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 3:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jan 31, 2022 at 02:56:38PM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel,
> >
> > On Mon, Jan 31, 2022 at 6:08 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > CC'ing  Babu Moger who aded the Milan CPU model.
> > >
> > > On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote:
> > > > While trying to bring a VM with EPYC-Milan cpu on a host with
> > > > EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> > > >
> > > > qemu-system-x86_64: warning: host doesn't support requested feature=
: CPUID.07H:EBX.erms [bit 9]
> > > > qemu-system-x86_64: warning: host doesn't support requested feature=
: CPUID.07H:EDX.fsrm [bit 4]
> > > >
> > > > Even with this warning, the host goes up.
> > > >
> > > > Then, grep'ing cpuid output on both guest and host, outputs:
> > > >
> > > > extended feature flags (7):
> > > >       enhanced REP MOVSB/STOSB                 =3D false
> > > >       fast short REP MOV                       =3D false
> > > >       (simple synth)  =3D AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7n=
m
> > > >    brand =3D "AMD EPYC 7313 16-Core Processor               "
> > > >
> > > > This means that for the same -cpu model (EPYC-Milan), the vcpu may =
or may
> > > > not have the above feature bits set, which is usually not a good id=
ea for
> > > > live migration:
> > > > Migrating from a host with these features to a host without them ca=
n
> > > > be troublesome for the guest.
> > > >
> > > > Remove the "optional" features (erms, fsrm) from Epyc-Milan, in ord=
er to
> > > > avoid possible after-migration guest issues.
> > >
> > > Babu,  can you give some insight into availability of erms / fsrm
> > > features across the EPYC 3rd gen CPU line. Is this example missing
> > > erms/fsrm an exception, or common place ?
> > >
> > > >
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > ---
> > > >
> > > > Does this make sense? Or maybe I am missing something here.
> > > >
> > > > Having a kvm guest running with a feature bit, while the host
> > > > does not support it seems to cause a possible break the guest.
> > >
> > > The guest won't see the feature bit - that warning message from QEMU
> > > is telling you that it did't honour the request to expose
> > > erms / fsrm - it has dropped them from the CPUO exposed to the guest.
> >
> > Exactly.
> > What I meant here is:
> > 1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
> > thus have those bits enabled)
> > 2 - Guest is migrated to a host such as the above, which does not
> > support those features (bits disabled), but does support EPYC-Milan
> > cpus (without those features).
> > 3 - The migration should be allowed, given the same cpu types. Then
> > either we have:
> > 3a : The guest vcpu stays with the flag enabled (case I tried to
> > explain above), possibly crashing if the new feature is used, or
> > 3b: The guest vcpu disables the flag due to incompatibility,  which
> > may make the guest confuse due to cpu change, and even end up trying
> > to use the new feature on the guest, even if it's disabled.
>
> Neither should happen with a correctly written mgmt app in charge.
>
> When launching a QEMU process for an incoming migration, it is expected
> that the mgmt app has first queried QEMU on the source to get the precise
> CPU model + flags that were added/removed on the source. The QEMU on
> the target is then launched with this exact set of flags, and the
> 'check' flag is also set for -cpu. That will cause QEMU on the target
> to refuse to start unless it can give the guest the 100% identical
> CPUID to what has been requested on the CLI, and thus matching the
> source.
>
> Libvirt will ensure all this is done correctly. If not using libvirt
> then you've got a bunch of work to do to achieve this. It certainly
> isn't sufficient to merely use the same plain '-cpu' arg that the
> soruce was original booted with, unless you have 100% identical
> hardware, microcode, and software on both hosts, or the target host
> offers a superset of features.

Oh, that is very interesting! Thanks for sharing!

Well, then at least one unexpected scenario should happen:
- VM with EPYC-Milan cpu, created in source host
- Source host with EPYC-Milan cpu. Support for 'extra features'
enabled ( erms / fsrm in this ex.)
- Target host with EPYC-Milan cpu. No support for 'extra features'.
Since the VM will be created with support for 'extra features', trying
to migrate from source host to target host should fail, right?

Which is, IMHO, odd. I imagine questions like:
- "How does a host with EPYC-Milan cpu does not offer support to
receive a live migration of some VMs with EPYC-Milan cpu?", or even
- "If I can create a VM with EPYC-Milan cpu on that host, why can't I
receive (via migration) some VMs with EPYC-Milan CPU ?"

But I am new to live migration, so maybe I am getting something wrong
regarding the cpu-model idea.

Best regards,
Leo



>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


