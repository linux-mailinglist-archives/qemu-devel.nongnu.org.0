Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99062EA16D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 01:23:09 +0100 (CET)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwa7w-0002YD-8l
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 19:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwa6l-00028x-BZ
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 19:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwa6i-0002tL-HM
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 19:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609806110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19vIFkYVWUpiGNzWNg3xGZh4UNstlKrOZQn8hSkilko=;
 b=bJ6Vcs5i841ZI6PiepY3SfZPfC2sV7FVOsP/TQEjcNQvtJBb17cmYNYdI+xaZPq5EbeEKi
 Ypd+PcV/6wrLizOUw+leoUpgZXYqN1N8uwa09TWR6JrsdqUN0PwZfQ2KtB9S2NJWMlmkHu
 Iq7NslfTJmBGCyAiXASLU+GyQgbO9wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-9lvE-Xu4O76dZuEijnx2_g-1; Mon, 04 Jan 2021 19:21:46 -0500
X-MC-Unique: 9lvE-Xu4O76dZuEijnx2_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14270800C78;
 Tue,  5 Jan 2021 00:21:45 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC1EC62461;
 Tue,  5 Jan 2021 00:21:38 +0000 (UTC)
Date: Tue, 5 Jan 2021 01:21:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 5/8] acpi/gpex: Append pxb devs in ascending order
Message-ID: <20210105012136.01c82f9b@redhat.com>
In-Reply-To: <20201230160814-mutt-send-email-mst@kernel.org>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-6-cenjiahui@huawei.com>
 <20201229144735.42faddad@redhat.com>
 <20201230160814-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Dec 2020 16:17:14 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Dec 29, 2020 at 02:47:35PM +0100, Igor Mammedov wrote:
> > On Wed, 23 Dec 2020 17:08:33 +0800
> > Jiahui Cen <cenjiahui@huawei.com> wrote:
> >   
> > > The overlap check of IO resource window would fail when Linux kernel
> > > registers an IO resource [b, c) earlier than another resource [a, b).
> > > Though this incorrect check could be fixed by [1], it would be better to
> > > append pxb devs into DSDT table in ascending order.
> > > 
> > > [1]: https://lore.kernel.org/lkml/20201218062335.5320-1-cenjiahui@huawei.com/  
> > 
> > considering there is acceptable fix for kernel I'd rather avoid
> > workarounds on QEMU side. So I suggest dropping this patch.  
> 
> Well there's something to be said for a defined order of things.
> And patch is from Dec 2020 will take ages for guests to be fixed,
> and changing pci core on stable kernels is risky and needs
> a ton of testing, not done eaily ...
> Which guests are affected by the bug?
it's workaround for a trivial bug for niche configuration
for a new QEMU feature that never worked for arm/virt machine
Downstream that think  that it is important enough to support
can backport and test patch thus helping stable trees to merge
it sooner.


> There are also some issues with the patch see below.
> 
> > it also should reduce noise in [8/8] masking other changes.
> >   
> > > Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> > > ---
> > >  hw/pci-host/gpex-acpi.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > > index 4bf1e94309..95a7a0f12b 100644
> > > --- a/hw/pci-host/gpex-acpi.c
> > > +++ b/hw/pci-host/gpex-acpi.c
> > > @@ -141,7 +141,7 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
> > >  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> > >  {
> > >      int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
> > > -    Aml *method, *crs, *dev, *rbuf;
> > > +    Aml *method, *crs, *dev, *rbuf, *pxb_devs[nr_pcie_buses];  
> 
> dynamically sized array on stack poses security issues
> 
> > >      PCIBus *bus = cfg->bus;
> > >      CrsRangeSet crs_range_set;
> > >      CrsRangeEntry *entry;
> > > @@ -149,6 +149,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> > >  
> > >      /* start to construct the tables for pxb */
> > >      crs_range_set_init(&crs_range_set);
> > > +    memset(pxb_devs, 0, sizeof(pxb_devs));
> > >      if (bus) {
> > >          QLIST_FOREACH(bus, &bus->child, sibling) {
> > >              uint8_t bus_num = pci_bus_num(bus);
> > > @@ -190,7 +191,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> > >  
> > >              acpi_dsdt_add_pci_osc(dev);
> > >  
> > > -            aml_append(scope, dev);
> > > +            pxb_devs[bus_num] = dev;  
> 
> If bus numbers intersect this will overwrite old one.
> I'd rather not worry about it, just have an array
> of structs with bus numbers and sort it.
> 
> 
> > >          }
> > >      }
> > >  
> > > @@ -278,5 +279,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> > >      aml_append(dev, dev_res0);
> > >      aml_append(scope, dev);
> > >  
> > > +    for (i = 0; i < ARRAY_SIZE(pxb_devs); i++) {
> > > +        if (pxb_devs[i]) {
> > > +            aml_append(scope, pxb_devs[i]);
> > > +        }
> > > +    }  
> 
> 
> so this sorts them by bus number not by io address.
> Probably happens to help since bios numbers them in the same order ...
> Is there a way to address this more robustly in case
> bios changes? E.g. I see the bug is only in PIO so sort by that address maybe?
> 
> Also pls add a code comment explaining why we are doing all this
> with link to patch, which guests are affected etc.
> 
> > > +
> > >      crs_range_set_free(&crs_range_set);
> > >  }  
> 
> 


