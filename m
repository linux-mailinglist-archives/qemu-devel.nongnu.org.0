Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88AF1CE4AA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 21:40:21 +0200 (CEST)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYEHl-0000EV-1k
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 15:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYEGG-0007FL-UJ
 for qemu-devel@nongnu.org; Mon, 11 May 2020 15:38:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30180
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYEGG-0007kM-4k
 for qemu-devel@nongnu.org; Mon, 11 May 2020 15:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589225927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFFloxKMN1CwFDWkaNRJ+/nqFNoeIZP/CLA8SDCV55o=;
 b=CFZE7fsdc/8Yteop+ra3LhEGnmG9gq9LO1ciMHnCfd65DgIp3s8umhR63DJpxHuBENsLMG
 dbZwCjEOad5xoBcwXkCQJehmi7zv0AXXnLNbe6ItR6+Ki3EYyDiCqgXhaiKW0VjVeUFNeZ
 bo3F68MVGITURCq345OvgBOo69s0m8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-lu5H-0q0MvWNHRIVSJSG8A-1; Mon, 11 May 2020 15:38:44 -0400
X-MC-Unique: lu5H-0q0MvWNHRIVSJSG8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDA2A18FF66D;
 Mon, 11 May 2020 19:38:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE025784AF;
 Mon, 11 May 2020 19:38:27 +0000 (UTC)
Date: Mon, 11 May 2020 21:38:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 14/15] acpi: q35: drop _SB.PCI0.ISA.LPCD opregion.
Message-ID: <20200511213826.49caac06@redhat.com>
In-Reply-To: <20200507131640.14041-15-kraxel@redhat.com>
References: <20200507131640.14041-1-kraxel@redhat.com>
 <20200507131640.14041-15-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  7 May 2020 15:16:39 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Seems to be unused.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index c1e63cce5e8e..1afb47b09ee9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1417,7 +1417,6 @@ static void build_q35_isa_bridge(Aml *table)
>  {
>      Aml *dev;
>      Aml *scope;
> -    Aml *field;
>  
>      scope =  aml_scope("_SB.PCI0");
>      dev = aml_device("ISA");
> @@ -1427,16 +1426,6 @@ static void build_q35_isa_bridge(Aml *table)
>      aml_append(dev, aml_operation_region("PIRQ", AML_PCI_CONFIG,
>                                           aml_int(0x60), 0x0C));
>  
> -    aml_append(dev, aml_operation_region("LPCD", AML_PCI_CONFIG,
> -                                         aml_int(0x80), 0x02));
> -    field = aml_field("LPCD", AML_ANY_ACC, AML_NOLOCK, AML_PRESERVE);
> -    aml_append(field, aml_named_field("COMA", 3));
> -    aml_append(field, aml_reserved_field(1));
> -    aml_append(field, aml_named_field("COMB", 3));
> -    aml_append(field, aml_reserved_field(1));
> -    aml_append(field, aml_named_field("LPTD", 2));
> -    aml_append(dev, field);
> -
>      aml_append(scope, dev);
>      aml_append(table, scope);
>  }


