Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A246A4A58C4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:49:09 +0100 (CET)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoqa-0001Qw-FG
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEoJ7-0007VA-1F
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:14:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEoJ2-0002gA-0f
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643703248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QG9q8+IReKwVsr+cqtpPn1siY/xR7B5u/cpN9lUZ9Ng=;
 b=bN/nZFLkiQFBRfNH+2cb2GTHcrEVH+4WKhMZQ0++3kkmLfdfdyzkL0mE0ijxnxz74a+Ul3
 +h/pmHrwxQDRjg+j3eDkbA5pssJX19P8deQXfh3rklPy9VZT6SAEYJKR8B/eQSk2k8Vcbc
 VXX6YKWYa3l7XSXEEejHgL28lqmOass=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-hKKgYZPSP06kICfFBKZt8w-1; Tue, 01 Feb 2022 03:14:00 -0500
X-MC-Unique: hKKgYZPSP06kICfFBKZt8w-1
Received: by mail-ed1-f71.google.com with SMTP id
 l16-20020aa7c3d0000000b004070ea10e7fso8219390edr.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 00:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7SFCW2ACz986IaG5urO6E44KnuPt7gEkaSO/ssBXlA=;
 b=BIy1UM2+el1f/QOvRKD/v3Xip0Jv5H6QRLlsfO+XqnqU9m2z27gzBmN5FXVe1sisjM
 bvu5fwC5am+fsyJ81qq1UnW1ejiuZqjE+yeY3r2cC5jPflUpXszDUhWVz/e/KerYU20y
 hwTMGW48Mn3cXrXz3hvEUQvE12H9hUzHcQ8mX/KO2QF2SVpxTKelZ/bRQqaQXwrYRZnv
 H1NLk6IO/dqLPdwgQ85OxROusTQXUMFi7WKkhxnTZcJLwVjIggI9D/SAW4nqY3Goc2rO
 n4ZbciYZIUMGOACH8C53PBRAGf0xeq46uvghuYqL/SBH1kumyT7fikCVMHrRSWkGIePJ
 W4ZA==
X-Gm-Message-State: AOAM531A/6Gx0IYs0m01CPrG2iv0x+Vq1Xz6+PIFn3pB7wAO4RX19Nnq
 hGk1NNnfBeMe7HaImoBsg4EnW25/GCuSEBt8q7cVLfgeguDXAvVshPl6Fht+05z1503EduT9fZJ
 mrLUEhidhuei0QDw=
X-Received: by 2002:a17:907:2ce5:: with SMTP id
 hz5mr20453700ejc.480.1643703239310; 
 Tue, 01 Feb 2022 00:13:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBkdhjCGyn+wqyxCkPZljxs1dufDwXyAbIf3Gc3ElOXBhu5wRB0/J2uJXDwWCwNFhcUriR1g==
X-Received: by 2002:a17:907:2ce5:: with SMTP id
 hz5mr20453674ejc.480.1643703239033; 
 Tue, 01 Feb 2022 00:13:59 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v14sm14389432ejy.77.2022.02.01.00.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:13:58 -0800 (PST)
Date: Tue, 1 Feb 2022 09:13:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Message-ID: <20220201091357.0ebbe198@redhat.com>
In-Reply-To: <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
References: <20220129102336.387460-1-leobras@redhat.com>
 <Yfem3s94EwIxqO1a@redhat.com>
 <CAJ6HWG7RvW6ofKRf7RAK2d8Kw0sOTX7UoYKBBJOy9Yw3yJhZaA@mail.gmail.com>
 <Yfgkdij1x2gSTdXt@redhat.com>
 <CAJ6HWG5uHnG50DPaDEZw1hbpnB3ygXzNA6PaPDT5PiKBYv6b9w@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Babu Moger <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 17:18:04 -0300
Leonardo Bras Soares Passos <leobras@redhat.com> wrote:

> On Mon, Jan 31, 2022 at 3:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> >
> > On Mon, Jan 31, 2022 at 02:56:38PM -0300, Leonardo Bras Soares Passos w=
rote: =20
> > > Hello Daniel,
> > >
> > > On Mon, Jan 31, 2022 at 6:08 AM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote: =20
> > > >
> > > > CC'ing  Babu Moger who aded the Milan CPU model.
> > > >
> > > > On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote: =20
> > > > > While trying to bring a VM with EPYC-Milan cpu on a host with
> > > > > EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> > > > >
> > > > > qemu-system-x86_64: warning: host doesn't support requested featu=
re: CPUID.07H:EBX.erms [bit 9]
> > > > > qemu-system-x86_64: warning: host doesn't support requested featu=
re: CPUID.07H:EDX.fsrm [bit 4]
> > > > >
> > > > > Even with this warning, the host goes up.
> > > > >
> > > > > Then, grep'ing cpuid output on both guest and host, outputs:
> > > > >
> > > > > extended feature flags (7):
> > > > >       enhanced REP MOVSB/STOSB                 =3D false
> > > > >       fast short REP MOV                       =3D false
> > > > >       (simple synth)  =3D AMD EPYC (3rd Gen) (Milan B1) [Zen 3], =
7nm
> > > > >    brand =3D "AMD EPYC 7313 16-Core Processor               "
> > > > >
> > > > > This means that for the same -cpu model (EPYC-Milan), the vcpu ma=
y or may
> > > > > not have the above feature bits set, which is usually not a good =
idea for
> > > > > live migration:
> > > > > Migrating from a host with these features to a host without them =
can
> > > > > be troublesome for the guest.
> > > > >
> > > > > Remove the "optional" features (erms, fsrm) from Epyc-Milan, in o=
rder to
> > > > > avoid possible after-migration guest issues. =20
> > > >
> > > > Babu,  can you give some insight into availability of erms / fsrm
> > > > features across the EPYC 3rd gen CPU line. Is this example missing
> > > > erms/fsrm an exception, or common place ?
> > > > =20
> > > > >
> > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > ---
> > > > >
> > > > > Does this make sense? Or maybe I am missing something here.
> > > > >
> > > > > Having a kvm guest running with a feature bit, while the host
> > > > > does not support it seems to cause a possible break the guest. =
=20
> > > >
> > > > The guest won't see the feature bit - that warning message from QEM=
U
> > > > is telling you that it did't honour the request to expose
> > > > erms / fsrm - it has dropped them from the CPUO exposed to the gues=
t. =20
> > >
> > > Exactly.
> > > What I meant here is:
> > > 1 - Host with these feature bits start a VM with EPYC-Milan cpu (and
> > > thus have those bits enabled)
> > > 2 - Guest is migrated to a host such as the above, which does not
> > > support those features (bits disabled), but does support EPYC-Milan
> > > cpus (without those features).
> > > 3 - The migration should be allowed, given the same cpu types. Then
> > > either we have:
> > > 3a : The guest vcpu stays with the flag enabled (case I tried to
> > > explain above), possibly crashing if the new feature is used, or
> > > 3b: The guest vcpu disables the flag due to incompatibility,  which
> > > may make the guest confuse due to cpu change, and even end up trying
> > > to use the new feature on the guest, even if it's disabled. =20
> >
> > Neither should happen with a correctly written mgmt app in charge.
> >
> > When launching a QEMU process for an incoming migration, it is expected
> > that the mgmt app has first queried QEMU on the source to get the preci=
se
> > CPU model + flags that were added/removed on the source. The QEMU on
> > the target is then launched with this exact set of flags, and the
> > 'check' flag is also set for -cpu. That will cause QEMU on the target
> > to refuse to start unless it can give the guest the 100% identical
> > CPUID to what has been requested on the CLI, and thus matching the
> > source.
> >
> > Libvirt will ensure all this is done correctly. If not using libvirt
> > then you've got a bunch of work to do to achieve this. It certainly
> > isn't sufficient to merely use the same plain '-cpu' arg that the
> > soruce was original booted with, unless you have 100% identical
> > hardware, microcode, and software on both hosts, or the target host
> > offers a superset of features. =20
>=20
> Oh, that is very interesting! Thanks for sharing!
>=20
> Well, then at least one unexpected scenario should happen:
> - VM with EPYC-Milan cpu, created in source host
> - Source host with EPYC-Milan cpu. Support for 'extra features'
> enabled ( erms / fsrm in this ex.)
> - Target host with EPYC-Milan cpu. No support for 'extra features'.
> Since the VM will be created with support for 'extra features', trying
> to migrate from source host to target host should fail, right?
>=20
> Which is, IMHO, odd. I imagine questions like:
> - "How does a host with EPYC-Milan cpu does not offer support to
> receive a live migration of some VMs with EPYC-Milan cpu?", or even
> - "If I can create a VM with EPYC-Milan cpu on that host, why can't I
> receive (via migration) some VMs with EPYC-Milan CPU ?"

As Daniel already explained, libvirt will check compatibility for user.

If you are trying to run QEMU manually, and wish features
for specific CPU model to be enforced, you shall use
  -cpu EPYC,enforce=3Don
flag when starting VMs, that will make QEMU exit with error
if it can't create cpu model with all its features on a given host.

(the warnings was telling you what's wrong with cpu model on
target host, so you shouldn't expect migration to work if
source host doesn't spew the exact same set of warnings)

> But I am new to live migration, so maybe I am getting something wrong
> regarding the cpu-model idea.
>=20
> Best regards,
> Leo
>=20
>=20
>=20
> >
> >
> > Regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> > =20
>=20
>=20


