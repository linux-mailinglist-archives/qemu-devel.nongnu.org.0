Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94A1FAAF1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 10:17:53 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl6n2-0004du-20
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 04:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jl6lz-0004A2-K8
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 04:16:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jl6lw-0003q3-Ur
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 04:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592295402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmEYAUVWEkNU4OPprNhMaJRAUWOwU0De7yGs1aienWU=;
 b=dFWQQrcgjOWuP4vrN3zwVZ8BLdovK4XHPoRxn3sw/bKjOiPMe0lGX6Xez7uhnZL9UkYEkP
 JeKXwLsWWb7XLLa9e3+meeXKuLWUiUx7UkjKQnbFOk8jTnGfeN1eBC0fPVPEIV9zFgzs3b
 /YoSwk2TVBNXXH2rj0x3baoL/0xosj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-0_przg77MUy5zu_h6T44CA-1; Tue, 16 Jun 2020 04:16:40 -0400
X-MC-Unique: 0_przg77MUy5zu_h6T44CA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF22B873074;
 Tue, 16 Jun 2020 08:16:36 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5187D19C79;
 Tue, 16 Jun 2020 08:16:29 +0000 (UTC)
Date: Tue, 16 Jun 2020 10:16:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] hw/acpi: specify 64-bit acpi table
Message-ID: <20200616101627.74dd1542@redhat.com>
In-Reply-To: <20200616003654.1058035-1-Jason@zx2c4.com>
References: <20200616003654.1058035-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jun 2020 18:36:54 -0600
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> SSDTs cannot address 64-bit physical addresses in 32-bit tables, so we
please clarify what accesses waht within tables (i.e. be more concrete).

> increment the revision to '2' so that these larger addresses are
> addressable. This matters because the DSDT revision represents the
> maximum capability of all other SSDTs. This is also what arm does.
it was keept at 1 for compat reasons with WindowsXP.
by now it is long time EOL, so it might be fine to bump version,
but it would be nice to know if this change breaks XP or not?

> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/i386/acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 900f786d08..51420d90a8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2073,7 +2073,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -        "DSDT", dsdt->buf->len, 1, NULL, NULL);
> +        "DSDT", dsdt->buf->len, 2, NULL, NULL);
>      free_aml_allocator();
>  }
>  


