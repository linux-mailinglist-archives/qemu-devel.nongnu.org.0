Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE54BF413
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:51:58 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMQtn-00059b-TH
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMQoS-0003aF-5e
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:46:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMQoO-0007ET-OM
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645519579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhvu1TrWuxEHMJkr4eXlGUpKpXIjQxCPJlBqxtbQGNk=;
 b=gXIIW6xV6QpN9z7S8ZVKw7KgqZebdh/ttpYr6mLcloz0bLN1yymTIVG1RcNs9Hvc+CG3dT
 tYGyDCKn23qmkrdKTg3LvMtR84ORiIPA7gSTg/x/b4j7tEtHV2z4M8Egvkh7vEc4jC1ICF
 tpSXfh8qiZhm9w8Aj8YVNX3ZTDg3ghU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-ir2_PJv_ObiD_5iyZ5sxWg-1; Tue, 22 Feb 2022 03:46:06 -0500
X-MC-Unique: ir2_PJv_ObiD_5iyZ5sxWg-1
Received: by mail-ej1-f72.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so5454666eje.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 00:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VSWn27mRbxsBNIZ4sBHL0ZjdDyjfra6tPH8ZO2QispQ=;
 b=NNJxzKKcIfwevnSzoBBOY/+F9QWSB7qlFbNXTVfT5lrWt9xgWzZlvmtjVg+N1rGuHX
 s7Q3XRFt1jlU91De/YgxA7zyzdYIcKII2iQrgCndw3AkK2w3MyHvlhLrRImfuQxVQphv
 Ikzp3QejvQNe7DD8NkaqF3JPF1ePVod7urFMRqeMMArBIa5M3uk4z+WRAhHprzsJtMlC
 0VuatpHezQBr2W8ToUFwadciUL/1z+CH7RY3oWuCdjpPEU5XWy0s3QryEOa7jPOEpYqr
 n6UXcC0zhbkF5wyHLw3GTTBSC7wNy81pyI92MLHFe6pbggJiIu5V81dIiRVyweRXAuHD
 0/jw==
X-Gm-Message-State: AOAM531BXGJwH8StcNTg67vsAI7EQpzVGKbLI6V+tpDqFqs2Km8BS+gU
 JPki2m+I9zq4rb8dmLSVTwKbvzpbSVhOL3VAsI3C3Gf8+MYIVMh1yu+C1v2S7k09lfllduDzLLc
 Js0HIM8x1Jg1UD48=
X-Received: by 2002:a05:6402:40c1:b0:412:b240:dfeb with SMTP id
 z1-20020a05640240c100b00412b240dfebmr22713800edb.239.1645519564937; 
 Tue, 22 Feb 2022 00:46:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye7oapSjyMBfJjW9ZWCzvnQOVsQwWj+HvxbjISrrrK8NP7tpvwC7hwH6R3OxBAoO+UBLTPOg==
X-Received: by 2002:a05:6402:40c1:b0:412:b240:dfeb with SMTP id
 z1-20020a05640240c100b00412b240dfebmr22713771edb.239.1645519564641; 
 Tue, 22 Feb 2022 00:46:04 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c6sm5970980ejs.130.2022.02.22.00.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 00:46:04 -0800 (PST)
Date: Tue, 22 Feb 2022 09:46:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220222094602.66d55613@redhat.com>
In-Reply-To: <YhOQfJ8x93+jDSZf@work-vm>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <YgzJE7ufEYm6OFyg@redhat.com> <YhOQfJ8x93+jDSZf@work-vm>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 13:15:40 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Tue, Feb 15, 2022 at 10:53:58AM +0100, Gerd Hoffmann wrote: =20
> > >   Hi,
> > >  =20
> > > > I don't know what behavior should be if firmware tries to program
> > > > PCI64 hole beyond supported phys-bits. =20
> > >=20
> > > Well, you are basically f*cked.
> > >=20
> > > Unfortunately there is no reliable way to figure what phys-bits actua=
lly
> > > is.  Because of that the firmware (both seabios and edk2) tries to pl=
ace
> > > the pci64 hole as low as possible.
> > >=20
> > > The long version:
> > >=20
> > > qemu advertises phys-bits=3D40 to the guest by default.  Probably bec=
ause
> > > this is what the first amd opteron processors had, assuming that it
> > > would be a safe default.  Then intel came, releasing processors with
> > > phys-bits=3D36, even recent (desktop-class) hardware has phys-bits=3D=
39.
> > > Boom.
> > >=20
> > > End result is that edk2 uses a 32G pci64 window by default, which is
> > > placed at the first 32G border beyond normal ram.  So for virtual
> > > machines with up to ~ 30G ram (including reservations for memory
> > > hotplug) the pci64 hole covers 32G -> 64G in guest physical address
> > > space, which is low enough that it works on hardware with phys-bits=
=3D36.
> > >=20
> > > If your VM has more than 32G of memory the pci64 hole will move and
> > > phys-bits=3D36 isn't enough any more, but given that you probably onl=
y do
> > > that on more beefy hosts which can take >=3D 64G of RAM and have a la=
rger
> > > physical address space this heuristic works good enough in practice.
> > >=20
> > > Changing phys-bits behavior has been discussed on and off since years=
.
> > > It's tricky to change for live migration compatibility reasons.
> > >=20
> > > We got the host-phys-bits and host-phys-bits-limit properties, which
> > > solve some of the phys-bits problems.
> > >=20
> > >  * host-phys-bits=3Don makes sure the phys-bits advertised to the gue=
st
> > >    actually works.  It's off by default though for backward
> > >    compatibility reasons (except microvm).  Also because turning it o=
n
> > >    breaks live migration of machines between hosts with different
> > >    phys-bits. =20
> >=20
> > RHEL has shipped with host-phys-bits=3Don in its machine types
> > sinec RHEL-7. If it is good enough for RHEL machine types
> > for 8 years, IMHO, it is a sign that its reasonable to do the
> > same with upstream for new machine types. =20
>=20
> And the upstream code is now pretty much identical except for the
> default;  note that for TCG you do need to keep to 40 I think.

will TCG work with 40bits on host that supports less than that?

Also quick look at host-phys-bits shows that it affects only 'host'
cpu model and is NOP for all other models.
If it's so than we probably need to expand it's scope to other cpu
models to cap them at actually supported range.

>=20
> Dave
> >  =20
> > >  * host-phys-bits-limit can be used to tweak phys-bits to
> > >    be lower than what the host supports.  Which can be used for
> > >    live migration compatibility, i.e. if you have a pool of machines
> > >    where some have 36 and some 39 you can limit phys-bits to 36 so
> > >    live migration from 39 hosts to 36 hosts works. =20
> >=20
> > RHEL machine types have set this to host-phys-bits-limit=3D48
> > since RHEL-8 days, to avoid accidentally enabling 5-level
> > paging in guests without explicit user opt-in.
> >  =20
> > > What is missing:
> > >=20
> > >  * Some way for the firmware to get a phys-bits value it can actually
> > >    use.  One possible way would be to have a paravirtual bit somewher=
e
> > >    telling whenever host-phys-bits is enabled or not. =20
> >=20
> >=20
> > Regards,
> > Daniel
> > --=20
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >=20
> >  =20


