Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A325465DBA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 06:23:45 +0100 (CET)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mseZM-0004TH-5z
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 00:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mseXM-0003Fu-9l
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 00:21:40 -0500
Received: from [2a00:1450:4864:20::535] (port=38679
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mseXJ-00082K-Os
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 00:21:39 -0500
Received: by mail-ed1-x535.google.com with SMTP id x6so110794645edr.5
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 21:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUZRMkcCLbiB//xU+qmdd0XzyahaEWhLbfcdoCizjtI=;
 b=J8+VVfjBzp+nv/lpASwT6JNtQgMUKi1uK2KB1eTh0eWgTVhHbQabapV4z6Gf85uNok
 zcLwXwliDXXhWIRMYLIst12V1oOqB9/j2tXI4SDje+yHzEBajUj6iGi2iHmxWzs3Mbt3
 FSRS5N4dAwYxmTpYUK1qS3iP05sbmXew/Q1ogBVGTiWYZSfVljqte8+/pUCLR4otAXr7
 i6pRWq9vy7tM3icLeVlJ72wpxumlgXYvM+p00Z7YQf4mANq3FHVek/nDrRIkLiPNjT5k
 CDvdQ2X8wMfbudh/RoDYA/ZXZLptrQhQz1uFH4D0IwVK7ciRaURd7Tg/qYUZCMrQWM8h
 56PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUZRMkcCLbiB//xU+qmdd0XzyahaEWhLbfcdoCizjtI=;
 b=TtpNMtHQ3fkyfzvtPdHGoTx/I05Is62MapDEqvoJ3l4gdlfeB++Wpmxuo+pxVlLpui
 xxZdA7JBtFnB8e1NvwxcEfsuAdIlwEQ6nI8ESEe9RnL3eyGRqnWWLqwmOmGEfewO3dlh
 jdEaCXAcQgQ0ZRaLS8L86GGeIjnQ+JxhPa2SbWyoKEUE7qVqc68DC4KkXMB02dqJva12
 3i4KD9y8PwxXy2ZO1l+U4yK/ydgCBYEyFBU4kSm+jsFAer0/r+62BQokfK0S/oqC+LRp
 1vkGWCK+VGpoCur76hrWWGyUCvLKOyFN2sa6PqBCpTuaJ1uXLZSdHOJdNE+43ZjfTaLo
 LTVQ==
X-Gm-Message-State: AOAM531+/QZfAnoWd8TWox/s50iD6Ah6sjs421UHeaHMP4ranh/ApDrp
 rPjGnz1cZk3vqWxuNDL1Aia+JQ3gEucJMQRSBOGzsQ==
X-Google-Smtp-Source: ABdhPJxCLo/fCXbYGAWBeQ6xE192YZG4I3+QedrzvCwllmCMNFoBdJHZQ71SU/QG7qRPh5x/MTLiZ10StrYQdBAyTMk=
X-Received: by 2002:a17:907:a42c:: with SMTP id
 sg44mr12538548ejc.335.1638422495828; 
 Wed, 01 Dec 2021 21:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20211125120629.187014-1-ani@anisinha.ca>
 <20211125154927-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2111261104070.223522@anisinha-lenovo>
 <20211126203826.3aac3461@redhat.com>
In-Reply-To: <20211126203826.3aac3461@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 2 Dec 2021 10:51:24 +0530
Message-ID: <CAARzgwy1wXeYVzt93=GFaw-uzsiR+pYvtLJO+Td7fW=JgSpWmg@mail.gmail.com>
Subject: Re: [PATCH-for-6.2] docs: add a word of caution on x-native-hotplug
 property for pcie-root-ports
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x535.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 27, 2021 at 1:08 AM Igor Mammedov <imammedo@redhat.com> wrote:
>
> It's hardly 6.2 material

We introduced the x-hotplug etc property with 6.2. I wanted to make
sure that people understand that the x- prefix indicates that this is
experimental stuff. We had enough mess with this already.

>
> On Fri, 26 Nov 2021 11:12:55 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Thu, 25 Nov 2021, Michael S. Tsirkin wrote:
> >
> > > On Thu, Nov 25, 2021 at 05:36:29PM +0530, Ani Sinha wrote:
> > > > x-native-hotplug property, when used in order to disable HPC bit on the PCIE
> > > > root ports, can lead to unexpected results from the guest operating system.
> > > > Users are strongly advised not to touch this property in order to manipulte the
> > > > HPC bit. Add a word of caution in the pcie.txt doc file to document this.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > >
> > > Do we want to generally document this for all "x-" options?
> >
> > Yes igor suggested it but I sent this one for two reasons:
> > (a) I could not find a place to document this for properties without
> > adding a new file. This sounded too bigger a hammer at the present. If you
> > can suggest an existing place for documenting this for the property names,
> > I will go and add this info there as well.
> >
> > (b) I think we need to document this experimental property here regardless
> > because this doc deals with hotplug and pcie ports and we had too much of
> > a mess with this acpi/pci native switch.
> >
> > When things stabilize a bit, Igor suggested elsewhere that we start a
> > separate doc just for hotplug and various options we have and at
> > that point we can move this info in this new doc.
> >
> > https://www.mail-archive.com/libvir-list@redhat.com/msg221746.html
>
> I'd rather put a blanket statement somewhere, like:
>
> "x-" prefixed properties are experimental, unstable, internal and
> are subject to change/go away without prior notice.
> Such properties are not meant for use by users unless explicitly
> documented otherwise.

I will leave this to someone else to pick it up for the doc side if
they are interested.

>
> > >
> > > > ---
> > > >  docs/pcie.txt | 17 ++++++++++++++++-
> > > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/docs/pcie.txt b/docs/pcie.txt
> > > > index 89e3502075..e1f99f725f 100644
> > > > --- a/docs/pcie.txt
> > > > +++ b/docs/pcie.txt
> > > > @@ -262,11 +262,26 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
> > > >          Port, which may come handy for hot-plugging another device.
> > > >
> > > >
> > > > -5.3 Hot-plug example:
> > > > +5.2 Hot-plug example:
> > > >  Using HMP: (add -monitor stdio to QEMU command line)
> > > >    device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
> > > >
> > > >
> > > > +5.3 A word of caution using hotplug on PCI Express Root Ports:
> > > > +Starting Qemu version 6.2, PCI Express Root ports have a property
> > > > +"x-native-hotplug" ("native-hotplug" for Qemu version 6.1), that can be used to
> > > > +enable or disable hotplug on that port. For example:
> > > > +
> > > > +-device pcie-root-port,x-native-hotplug=off,... etc.
> > > > +
> > > > +The "x-" prefix indicates that this property is highly experimental and can
> > > > +lead to unexpected results from the guest operating system if users try to use
> > > > +it to alter the native hotplug on the port. It also means that the property
> > > > +name and its behavior is liable to change in the future and is not expected to
> > > > +be stable across Qemu versions. Therefore, end users are advised not to change
> > > > +the value of this option from its default set value or use it in the Qemu
> > > > +command line.
> > > > +
> > > >  6. Device assignment
> > > >  ====================
> > > >  Host devices are mostly PCI Express and should be plugged only into
> > > > --
> > > > 2.25.1
> > >
> > >
> >
>

