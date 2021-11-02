Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9821442D95
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:12:12 +0100 (CET)
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhseC-0004Tu-0q
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1mhroF-0005xE-AG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1mhroB-0004tt-QD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635851906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXCD/y+EIIpD27UrY6lZoLmfoZFyT8+831AZbU0+UZI=;
 b=RkMurpklxHNlDMYRRay3ZH7q8I+0Bj3G6tiKukB7J1so4K6kOW35OnsoaPTOVkm4NMl1dm
 oze1fABmSYlX2rFS9Gg/mUBjUL7Zs+pcApCZzqStrJGXuGof/29nnU0AKWXgIxrWHNda+a
 9eNJMKBp7t+5L/m62H8zKwvWRFHvO0k=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-zHMvhxfAMqumSveiz8pmEA-1; Tue, 02 Nov 2021 07:17:18 -0400
X-MC-Unique: zHMvhxfAMqumSveiz8pmEA-1
Received: by mail-ot1-f71.google.com with SMTP id
 f5-20020a056830056500b00553e1fde941so9110228otc.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XXCD/y+EIIpD27UrY6lZoLmfoZFyT8+831AZbU0+UZI=;
 b=UoeI44SuIF938Hg/gjCYcLD7piFZOsqK5FE6EDWk28xyH2p+jMJZnwc5K6APFcgzBw
 cr6tRGIyYzDzakec1MpQWGWEW07xClSSAp6g9MAmpd6jlsvqwyMvFtLWPOp3K+aymMUf
 owd88JdkQ1Pyu43qVvGj8IhNVkwLB5bLcB8iTFPjCkZp5zBXgi6yfJYmxhC7u6/RYkKI
 ftqakN1Ytj2ETdGLWwoQNC4js7amHeIqdYrV4/PRaOIWZIOubuRjXmDuc911EaqxKyj5
 PVo7Cr5M73HCxRxlfzk2cwZqQ/0eWpiel4M2eWYvptpc11u6MEo0i5x/5GLqBDX1XKbb
 TubA==
X-Gm-Message-State: AOAM5333lcQaixdiBIbRkFNwRoDuhtiOb1yCqhegtgUeDVJkcJPh/KL5
 R7sciItAQgytRoorOw0K7VRHB3UFv9lyrNR4d9GKLIWt5pyoSC84v3nDgm7uaGh1+CVnKOxZqNT
 UKUN8Ww3w10EJRI1rU97eWE0ZcJuP44g=
X-Received: by 2002:a05:6808:1827:: with SMTP id
 bh39mr4471576oib.142.1635851838235; 
 Tue, 02 Nov 2021 04:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFTdbcjIKNzMUMViWnusXpyfZ4iD5Jq/omP/wQrIjWJS6KfUBAgrpQmxrQjrnodp/Cg761vzAhjiGQ5WHFbYs=
X-Received: by 2002:a05:6808:1827:: with SMTP id
 bh39mr4471555oib.142.1635851838008; 
 Tue, 02 Nov 2021 04:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com> <20210927053932-mutt-send-email-mst@kernel.org>
 <YYEDqJGe8qdKHgfh@redhat.com>
In-Reply-To: <YYEDqJGe8qdKHgfh@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Tue, 2 Nov 2021 12:17:06 +0100
Message-ID: <CAMDeoFXTLuESR1X04TDGfuX18soGJtxFXFCfEK4oWNFye8oBUQ@mail.gmail.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Marcel Apfelbaum <marcel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 10:26 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Sep 27, 2021 at 05:49:15AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
> > > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > >
> > > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > > > As opposed to native PCIe hotplug, guests like Fedora 34
> > > > will not assign IO range to pcie-root-ports not supporting
> > > > native hotplug, resulting into a regression.
> > > >
> > > > Reproduce by:
> > > >     qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
> > > >     device_add e1000,bus=3Dp1
> > > > In the Guest OS the respective pcie-root-port will have the IO rang=
e
> > > > disabled.
> > > >
> > > > Fix it by setting the "reserve-io" hint capability of the
> > > > pcie-root-ports so the firmware will allocate the IO range instead.
> > > >
> > > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > >
> > > This change, when combined with the switch to ACPI based hotplug by
> > > default, is responsible for a significant regression in QEMU 6.1.0
> > >
> > > It is no longer possible to have more than 15 pcie-root-port devices
> > > added to a q35 VM in 6.1.0.  Before this I've had as many as 80+ devi=
ces
> > > present before I stopped trying to add more.
> > >
> > >   https://gitlab.com/qemu-project/qemu/-/issues/641
> > >
> > > This regression is significant, because it has broken the out of the
> > > box default configuration that OpenStack uses for booting all VMs.
> > > They add 16 pcie-root-ports by defalt to allow empty slots for device
> > > hotplug under q35 [1].
> >
> >
> > Indeed, oops. Thanks for the report!
>
> We're at soft freeze now and this is still broken in git master.
> I don't recall seeing a fix for this problem on list and no one has
> commented on the bug report.
>
> Is anyone actively working on a fix for this release ?

Yes, I'm working on a fix, going to send it soon.

Best regards, Julia Suvorova.

> If not, I'm going to post a patch to revert to PCI native
> hotplug, because this was a significant regression in 6.1 that
> breaks openstack out of the box and we can't leave it broken
> again for 6.2.
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
>


