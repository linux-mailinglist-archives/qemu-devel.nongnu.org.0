Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E944A7A3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:35:41 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLfQ-0004zs-9g
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:35:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLam-000111-Up
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLak-0008Mp-PP
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636443048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwPT1QYVjGy3wzj6f3joG9IhoMPLqg0OMa8v2OxOmd4=;
 b=IWD64HNesPVMlvK0zL30vBgPqwyy1KNMxlOb2kSFTZqmS6FnnQZSLts1VoOPxlmKXvqJiV
 Ao3Mvx/OlkFkLHSyc0okLgq9h5VbMsc0Gap3aT9XrHOp8seZmaKZ1WSvqQf504mLeriR2R
 T5uwRXVwI4ot4M/Ay8BGL+3YOGx+/uo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-IauKV08iPZWEcbfoGEYQ5w-1; Tue, 09 Nov 2021 02:30:47 -0500
X-MC-Unique: IauKV08iPZWEcbfoGEYQ5w-1
Received: by mail-pl1-f199.google.com with SMTP id
 k9-20020a170902c40900b001421e921ccaso7698414plk.22
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GwPT1QYVjGy3wzj6f3joG9IhoMPLqg0OMa8v2OxOmd4=;
 b=0YuwaKUXXhA6sRBQOA8FCB9VTu9Kb+AMBRt7EkCBC9ac9ye0AFqYrR8ISW9P5Grg0e
 TakJsGBz4xqrjdFPv+fez14zWLEO1aPavJWJgMoju6NrTJf/3+v6+X0VDg7vzp8KZTMd
 Zj5bKW5LyUnPiVk1C4Hntey0oIPwEQ+TwWaj9EnyXVfoyn3Xx5vz2PvraeUTgedfmbDb
 GR4XQH1gy9/TOF6Bsetx5Rx44JMZ1TIJu3KyciKEzxNF9M6LEeM+4IugRm5FBYMDp8WT
 MqkeQxXk7bzfYPqBAEGkbD3U6eRMwT1pjXlbSEnnEw9Dp7V39y6OYimL+5HLcvYG2tcz
 JsIQ==
X-Gm-Message-State: AOAM531taDYsjfXyGDZm4uHgIXGX+qdJP/Za8G8b9NNhO45yP77QcDwp
 VfJXG11YOidlhcXQvs1UEGnr6TlW+zPAJu5duC+QVAWqs4tV/Ep03AnktdEleE0Z8wGkSd9CLIA
 IGFLicRmuiS7bRFoWiZcghGTz7Fn6aF0=
X-Received: by 2002:a17:90a:9501:: with SMTP id
 t1mr5057738pjo.134.1636443046465; 
 Mon, 08 Nov 2021 23:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtlcRAZHq04IEqzEW7CgbhKxWU24cxLMyKgZRYx+ehi+ZoghfQD6MUl0cEvIYojui1a6vytoU0Inb0EQG1NgA=
X-Received: by 2002:a17:90a:9501:: with SMTP id
 t1mr5057702pjo.134.1636443046163; 
 Mon, 08 Nov 2021 23:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
 <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
In-Reply-To: <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 9 Nov 2021 11:30:35 +0400
Message-ID: <CAMxuvayxZaBzs4RuR9JR5ocMfcXr-phQzcsFbBSPt1CH0PnoRg@mail.gmail.com>
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Nov 9, 2021 at 11:25 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> On Tue, Nov 9, 2021 at 4:37 AM Stefan Berger <stefanb@linux.vnet.ibm.com>=
 wrote:
> >
> > Add missing device identification objects _STR and _UID. They will appe=
ar
> > as files 'description' and 'uid' under Linux sysfs.
> >
> > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Ani Sinha <ani@anisinha.ca>
> > Fixes: #708
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> (on my host, for some reason the UID is 1, does this matter?)

And shouldn't this be done also for TIS device?

>
> > ---
> >  hw/arm/virt-acpi-build.c | 1 +
> >  hw/i386/acpi-build.c     | 4 ++++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 674f902652..09456424aa 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachi=
neState *vms)
> >
> >      Aml *dev =3D aml_device("TPM0");
> >      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")=
));
> >      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >
> >      Aml *crs =3D aml_resource_template();
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index a3ad6abd33..d6d3541407 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
> >                      dev =3D aml_device("TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> >                                                    aml_string("MSFT0101=
")));
> > +                    aml_append(dev,
> > +                               aml_name_decl("_STR",
> > +                                             aml_string("TPM 2.0 Devic=
e")));
> > +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)))=
;
> >                  } else {
> >                      dev =3D aml_device("ISA.TPM");
> >                      aml_append(dev, aml_name_decl("_HID",
> > --
> > 2.31.1
> >


