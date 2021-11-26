Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77245E784
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 06:44:40 +0100 (CET)
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqU2I-0008Kc-IJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 00:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mqU0w-0007bj-VZ
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 00:43:15 -0500
Received: from [2607:f8b0:4864:20::1033] (port=53795
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mqU0l-0005Oi-BX
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 00:43:14 -0500
Received: by mail-pj1-x1033.google.com with SMTP id iq11so6492735pjb.3
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 21:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lFuqun1WDlFMmimEYKlVL47JetRq7eMGgB6DquNFwag=;
 b=IInZ04Q1sK7NlhCcxQVB/ys3cwfgkZ2G3DHAgexCky5NxFtsygoNaLTBa7o06s1Cyg
 c2MgIFdZjLFiIbvF2yaSYehMCJvEab8ca1VpbFKiBy2HiC5oXg8EOvlFPMfIaQpgE1go
 hp4R6AlY6uM3BfPQ+YZ6vj6TGL2XftJwDEY/42Cp8uaaIUScGCdHtpE/VoEhTbXoymAk
 ORp0Gyhp0gh1cqcxhcmkgj2h2CepVLPVXggJjKw319LWO5lyWfIRXl88q6+nsZiXMiDg
 80Qlsf38niziBejDouSgwB0L9e41yO101Z9T2hnQjKG40V9Ur5mHdKmLKSKhrY6Yvtp+
 Vulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lFuqun1WDlFMmimEYKlVL47JetRq7eMGgB6DquNFwag=;
 b=hm30XdyQZOCJNCxF7nz01DoFOGFreeEK5iBvFc0GLIVqPTV915R6znRAOht9hLxFxa
 pINVXJP3ztkUtwoqlY/mZFt5OCFl8ogZoypEAUpCvUIsEqRidsPrQ3HSfMVvG7Px5B4F
 g4jKx2N6S7X1bZtO2lj6d4svkcppHAz0yhw4T6iTp88F+/lEEVlZoS0yZUadRnCUlAnq
 t1jmOEbWmqTEtOAH1EM8z4pDLKPK7ekTGV2N0Uw1BsLDdp1BPYQQIXQZqIVtBLZEEqoB
 dmIRFHaxEZFfmlH3Tmido/dTK2T73+Fsjsk2xkscKgall1s7DqwUxC5zIiyibgyJKqU9
 YpMQ==
X-Gm-Message-State: AOAM533aNV2TV+JrxZB1w31PEtmKwfu7lfcoqcxXlQjSqZ6F67XFZD5V
 1t5jCWupYesXHZYXSLtH6+gQEA==
X-Google-Smtp-Source: ABdhPJzTBZxh1nREFpUk0XSAI0nw6IUjmMZBobmzTtVySPmJqBhTxysQdVXxALrRFzMglT59seaBIA==
X-Received: by 2002:a17:902:9684:b0:143:cc70:6472 with SMTP id
 n4-20020a170902968400b00143cc706472mr35747712plp.70.1637905381541; 
 Thu, 25 Nov 2021 21:43:01 -0800 (PST)
Received: from anisinha-lenovo ([49.207.198.191])
 by smtp.googlemail.com with ESMTPSA id q10sm9813710pjd.0.2021.11.25.21.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 21:43:00 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 26 Nov 2021 11:12:55 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH-for-6.2] docs: add a word of caution on x-native-hotplug
 property for pcie-root-ports
In-Reply-To: <20211125154927-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2111261104070.223522@anisinha-lenovo>
References: <20211125120629.187014-1-ani@anisinha.ca>
 <20211125154927-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 25 Nov 2021, Michael S. Tsirkin wrote:

> On Thu, Nov 25, 2021 at 05:36:29PM +0530, Ani Sinha wrote:
> > x-native-hotplug property, when used in order to disable HPC bit on the PCIE
> > root ports, can lead to unexpected results from the guest operating system.
> > Users are strongly advised not to touch this property in order to manipulte the
> > HPC bit. Add a word of caution in the pcie.txt doc file to document this.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>
> Do we want to generally document this for all "x-" options?

Yes igor suggested it but I sent this one for two reasons:
(a) I could not find a place to document this for properties without
adding a new file. This sounded too bigger a hammer at the present. If you
can suggest an existing place for documenting this for the property names,
I will go and add this info there as well.

(b) I think we need to document this experimental property here regardless
because this doc deals with hotplug and pcie ports and we had too much of
a mess with this acpi/pci native switch.

When things stabilize a bit, Igor suggested elsewhere that we start a
separate doc just for hotplug and various options we have and at
that point we can move this info in this new doc.

https://www.mail-archive.com/libvir-list@redhat.com/msg221746.html


>
> > ---
> >  docs/pcie.txt | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/pcie.txt b/docs/pcie.txt
> > index 89e3502075..e1f99f725f 100644
> > --- a/docs/pcie.txt
> > +++ b/docs/pcie.txt
> > @@ -262,11 +262,26 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
> >          Port, which may come handy for hot-plugging another device.
> >
> >
> > -5.3 Hot-plug example:
> > +5.2 Hot-plug example:
> >  Using HMP: (add -monitor stdio to QEMU command line)
> >    device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
> >
> >
> > +5.3 A word of caution using hotplug on PCI Express Root Ports:
> > +Starting Qemu version 6.2, PCI Express Root ports have a property
> > +"x-native-hotplug" ("native-hotplug" for Qemu version 6.1), that can be used to
> > +enable or disable hotplug on that port. For example:
> > +
> > +-device pcie-root-port,x-native-hotplug=off,... etc.
> > +
> > +The "x-" prefix indicates that this property is highly experimental and can
> > +lead to unexpected results from the guest operating system if users try to use
> > +it to alter the native hotplug on the port. It also means that the property
> > +name and its behavior is liable to change in the future and is not expected to
> > +be stable across Qemu versions. Therefore, end users are advised not to change
> > +the value of this option from its default set value or use it in the Qemu
> > +command line.
> > +
> >  6. Device assignment
> >  ====================
> >  Host devices are mostly PCI Express and should be plugged only into
> > --
> > 2.25.1
>
>

