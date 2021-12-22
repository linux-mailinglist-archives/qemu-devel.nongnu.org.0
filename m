Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6647D852
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:29:16 +0100 (CET)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n08Ec-00058e-Lv
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n08DY-0004RB-PW
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n08DW-0008Dm-Im
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640204885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3ecrDMgwL4VdYOd/uWB/bffW8vnIfN+mQ84mxeA940=;
 b=JkCoEYTRbJ1AGg9/6cGKbxIFIPR+irQI6XV3QZrh5s6V4bcEdY4wDtRXd7bho7otNV5HPv
 SdDQt91oeu4ENwUWFaBh1HcTshNo43xhC41Ky3Oe2On/th6AZeE87k+iAnOwJ77X5GSMGd
 FGAKo0qPlA9eNKEqwtJk/fi/7975f1Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-byBu8mawM9m4XS3fy9Mz3g-1; Wed, 22 Dec 2021 15:28:04 -0500
X-MC-Unique: byBu8mawM9m4XS3fy9Mz3g-1
Received: by mail-ed1-f71.google.com with SMTP id
 h22-20020a056402281600b003f839627a38so2688311ede.23
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 12:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l3ecrDMgwL4VdYOd/uWB/bffW8vnIfN+mQ84mxeA940=;
 b=n2+a2ckCwOZRQTAVRRRBmgXDzQU1z/VoS6wbvn0v2rXZiPYWXmhSjHNDQQx2OoocVm
 CrCVK5xi/7dtR+wsvTmP9AT0aXVWdwJrivDTMLGgNkF1fAB9xLnxkeCv8YWo/EbsbmlD
 BgofWNBCBUAXSIUam5zkCIYVr9o2rxK+qTCEtnwDr1AIfaNU0Z9GaWegvb8A7QTw9rJ3
 aOxorgtbW8h8WHpfo1o+p7OMkdc2TlluZZ19LfvOSa5fgmxZqMl8oBJAIHIYoawaM9Uq
 dSi3NAJUv0JOtZsh0hRw1ftNJOYvqhLF+V0+cvI7NESLNj8E6ihsw0sVcyfmjsc2VXbV
 pc+g==
X-Gm-Message-State: AOAM531bBpOdvhFxz/SGtXMTDs+jcUEGF6uWQEX4peULGZbdBO/0tZcH
 LQNLMOJctSSxLDDV9nVVTKC2rfiX7JLJS+bpwRGgXrlR0ovbUY8SFN8r4qxKG2Td1wCwmPVDJv3
 9czf26dfud4WhKZazbT04yyU9WujF97A=
X-Received: by 2002:a17:907:2be9:: with SMTP id
 gv41mr3818975ejc.468.1640204883102; 
 Wed, 22 Dec 2021 12:28:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxpz8gcoKXtV5l/Oq/xdtmC23QIr66hTR7VssYFBYXKPGRLue95ClYCTEmlFFmeq2auVXotJ+ksBDXE9/6J90=
X-Received: by 2002:a17:907:2be9:: with SMTP id
 gv41mr3818963ejc.468.1640204882921; 
 Wed, 22 Dec 2021 12:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20211221144852.589983-1-mst@redhat.com>
 <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
 <20211222151922-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211222151922-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 22 Dec 2021 21:27:51 +0100
Message-ID: <CAP+75-VaN5SD22ABqKNTC=dHhN4yaN-22Ucfdp=6aeYa+q+83A@mail.gmail.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Wed, Dec 22, 2021 at 08:19:41PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > +Mauro & Alex
> >
> > On 12/21/21 15:48, Michael S. Tsirkin wrote:
> > > When bus is looked up on a pci write, we didn't
> > > validate that the lookup succeeded.
> > > Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> > > bus pointer.
> > >
> > > Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device=
")
> > > Cc: "Igor Mammedov" <imammedo@redhat.com>
> > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > It seems this problem is important enough to get a CVE assigned.
>
> Guest root can crash guest.
> I don't see why we would assign a CVE.

Well thinking about downstream distributions, if there is a CVE assigned,
it helps them to have it written in the commit. Maybe I am mistaken.

Unrelated but it seems there is a coordination problem with the
qemu-security@ list,
if this isn't a security issue, why was a CVE requested?

> > Mauro, please update us when you get the CVE number.
> > Michael, please amend the CVE number before committing the fix.
> >
> > FWIW Paolo asked every fuzzed bug reproducer to be committed
> > as qtest, see tests/qtest/fuzz*c. Alex has a way to generate
> > reproducer in plain C.
> >
> > Regards,
> >
> > Phil.
>


