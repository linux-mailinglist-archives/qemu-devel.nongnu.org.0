Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442BF6CBEA6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:10:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph899-0001Fd-98; Tue, 28 Mar 2023 08:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ph897-0001FI-0Z
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ph895-0001TB-5X
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680005385;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3TSP1wrv0F2ec3dYsZNwx4EVEwulu53Ft2zW377IzKk=;
 b=NUwcLrO6PIRXrmacAFWiYg2K2hdurC6kiPI2OEo9t9xCTiIuTJ3oWa8HTiAVta1ZLHLrXz
 2W2FNZ7fZEyTpPJ+LOcEnCGnmi+XMmZ93J3eYnQzRuD4W2Cnu0uqEj8v3wixwDxzld0MCM
 czrfrHuWh5CCjGtPKlIODP+I+aIzlFo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-MN85gQ_jMM-TYKU79oS5Hw-1; Tue, 28 Mar 2023 08:09:42 -0400
X-MC-Unique: MN85gQ_jMM-TYKU79oS5Hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D89601C06EC9;
 Tue, 28 Mar 2023 12:09:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B472202701F;
 Tue, 28 Mar 2023 12:09:40 +0000 (UTC)
Date: Tue, 28 Mar 2023 13:09:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/6] bios-tables-test: use 128M numa nodes on aarch64
Message-ID: <ZCLZAWYrPOIxCXup@redhat.com>
References: <20230316095432.1514080-1-kraxel@redhat.com>
 <20230316095432.1514080-3-kraxel@redhat.com>
 <20230328140338.7afa05e3@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328140338.7afa05e3@imammedo.users.ipa.redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 28, 2023 at 02:03:38PM +0200, Igor Mammedov wrote:
> On Thu, 16 Mar 2023 10:54:28 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > Recent edk2 versions don't boot with very small numa nodes.
> > Bump the size from 64M to 128M.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c         |   6 +++---
> 
> >  tests/data/acpi/virt/SRAT.acpihmatvirt | Bin 240 -> 240 bytes
> >  tests/data/acpi/virt/SSDT.memhp        | Bin 1817 -> 1817 bytes
> binary blob updates should be in a separate patch

Won't that break git bisect if it lands on the commit with the
bios-tables-test.c change and is thus missing the corresponding
blob change ?

> 
> with this fixed:
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>  
> 
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 76d510091177..873358943784 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1679,9 +1679,9 @@ static void test_acpi_virt_tcg_acpi_hmat(void)
> >      test_acpi_one(" -machine hmat=on"
> >                    " -cpu cortex-a57"
> >                    " -smp 4,sockets=2"
> > -                  " -m 256M"
> > -                  " -object memory-backend-ram,size=64M,id=ram0"
> > -                  " -object memory-backend-ram,size=64M,id=ram1"
> > +                  " -m 384M"
> > +                  " -object memory-backend-ram,size=128M,id=ram0"
> > +                  " -object memory-backend-ram,size=128M,id=ram1"
> >                    " -object memory-backend-ram,size=128M,id=ram2"
> >                    " -numa node,nodeid=0,memdev=ram0"
> >                    " -numa node,nodeid=1,memdev=ram1"
> > diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
> > index 691ef56e34bc84509270db316d908f5979c209bb..6fe55dd7d07fef0f8fe16a209e96a89dd48ca240 100644
> > GIT binary patch
> > delta 67
> > zcmeys_<@ltILI;N0|NsC^R$Uvjf@-<d*mlxmepX?U;>JPK>(EIfYJ<%Fb0qY0P4I6
> > AJ^%m!
> > 
> > delta 59
> > zcmeys_<@ltILI;N0|NsC^Qwtljf^Z4d*l^dfLst@flv$#j4%d}X4GJsxL6ecZ+{66
> > 
> > diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> > index 2fcfc5fda955dc4ba78a5f4116eed99ec7202fbd..ef93c44464f1fe38f7e5babd5d67f345cc6363a6 100644
> > GIT binary patch
> > delta 22
> > dcmbQqH<OPmIM^jblAVEpap^`bUUsI7&Hz1t1wsG-
> > 
> > delta 22
> > dcmbQqH<OPmIM^jblAVEpv2i08FFVs$X8=5?1wsG-
> > 
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


