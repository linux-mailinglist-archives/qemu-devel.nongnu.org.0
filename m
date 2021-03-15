Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C533B1CC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:56:22 +0100 (CET)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlpd-0005Cp-H2
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLlnj-0004dd-9f
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLlnh-0002HX-Nw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615809261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWGYH8nfIerffoG4f2iFEpUs8wlGWlS4x1yGycxGMas=;
 b=Qh90ff7rb8Mc6kz4MghIj/dPNtTiNQwqgTNU+/+Fu/TiQSOiKRvfkN+4/91MTy3YSH6Apa
 spqG+zRww3//PsXcsKh/ahFdDaZjPRNKOpcVMQasaTa5OJvNW5iMvxWJROlgOI0tX8RYr2
 4RFSQS5tDxwcMiGDQ4o6kh9t8m2W6A8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-HBT-_vxDORaNw6IR5cipOg-1; Mon, 15 Mar 2021 07:54:15 -0400
X-MC-Unique: HBT-_vxDORaNw6IR5cipOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F72D100C663;
 Mon, 15 Mar 2021 11:54:14 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93725620DE;
 Mon, 15 Mar 2021 11:54:05 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:54:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 4/4] acpi: Set proper maximum size for
 "etc/acpi/rsdp" blob
Message-ID: <20210315125403.68ef8925@redhat.com>
In-Reply-To: <20210304105554.121674-5-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
 <20210304105554.121674-5-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  4 Mar 2021 11:55:54 +0100
David Hildenbrand <david@redhat.com> wrote:

> Let's also set a maximum size for "etc/acpi/rsdp", so the maximum
> size doesn't get implicitly set based on the initial table size. In my
> experiments, the table size was in the range of 22 bytes, so a single
> page (== what we used until now) seems to be good enough.
> 
> Now that we have defined maximum sizes for all currently used table types,
> let's assert that we catch usage with new tables that need a proper maximum
> size definition.
> 
> Also assert that our initial size does not exceed the maximum size; while
> qemu_ram_alloc_internal() properly asserts that the initial RAMBlock size
> is <= its maximum size, the result might differ when the host page size
> is bigger than 4k.
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/acpi/utils.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
> index f2d69a6d92..0c486ea29f 100644
> --- a/hw/acpi/utils.c
> +++ b/hw/acpi/utils.c
> @@ -29,14 +29,19 @@
>  MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>                                  GArray *blob, const char *name)
>  {
> -    uint64_t max_size = 0;
> +    uint64_t max_size;
[...]
> +    } else {
> +        g_assert_not_reached();
>      }
> +    g_assert(acpi_data_len(blob) <= max_size);

though it's correct,
but theoretically compiler might get unhappy about uninitialized max_size here

though if it compiles fine with our current CI it should be good enough

>  
>      return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
>                          name, update, opaque, NULL, true);


