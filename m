Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F32732CFFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:49:21 +0100 (CET)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkbf-0007oZ-Od
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHka1-0006tm-ED
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHkZw-0005Gx-7n
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614851250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTUdpLP1CTYaylkBbFxAIKOsIJCrGuqPywyzEOa8kW4=;
 b=Bz2bqPEBLXPD8sKf36UWTwZpU00RpwklpKMjifbcWVrWOmSorhsQEURpDeJQLfe8XTd+Wb
 58aETDB7IxDJNtdkyUOqGCwYJHy47nPzRDr0SE9TMWSXkAmdI8VruWYpSO2kfPE9pMnMOW
 YHXKj5lGhkda6dkH8qa2icSZwQ0KzTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-pBHh81FdOR2l_xgwqeWnYg-1; Thu, 04 Mar 2021 04:47:28 -0500
X-MC-Unique: pBHh81FdOR2l_xgwqeWnYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E0CD80432D;
 Thu,  4 Mar 2021 09:47:27 +0000 (UTC)
Received: from [10.36.113.171] (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 822676C950;
 Thu,  4 Mar 2021 09:47:07 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
 <4bc8c306-48d2-8122-c096-dcac15170791@redhat.com>
 <20210303170916.278cdcc2@MiWiFi-RA69-srv>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <ce0e33c8-b24b-73e7-ca13-862c169c8a8d@redhat.com>
Date: Thu, 4 Mar 2021 10:47:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303170916.278cdcc2@MiWiFi-RA69-srv>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.21 17:09, Igor Mammedov wrote:
> On Wed, 3 Mar 2021 16:03:36 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
> 
>> On 03/02/21 19:43, David Hildenbrand wrote:
>>
>>> We are dealing with different blobs here (tables_blob vs. cmd_blob).
>>
>> OK, thanks -- this was the important bit I was missing. Over time I've
>> lost track of the actual set of fw_cfg blobs that QEMU exposes, for the
>> purposes of the ACPI linker/loader.
>>
>> I've looked up the acpi_add_rom_blob() calls in "hw/i386/acpi-build.c"
>> and "hw/arm/virt-acpi-build.c":
>>
>>    hw       name                                         max_size                              notes
>>    -------  -------------------------------------------  ------------------------------------  ------
>>
>>    virt     ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
>>    virt     ACPI_BUILD_LOADER_FILE ("etc/table-loader")  0                                     n/a
>>    virt     ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     simply modeled on i386 (below)
>>
>>    i386     ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
>>    i386     ACPI_BUILD_LOADER_FILE ("etc/table-loader")  0                                     n/a
>>    i386     ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     d70414a5788c, 358774d780ee8
>>
>>    microvm  ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
>>    microvm  "etc/table-loader"                           0                                     no macro for name???
>>    microvm  ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     simply modeled on i386 (above)
>>
>> (I notice there are some other (optional) fw_cfg blobs too, related TPM,
>> vmgenid, nvdimm etc, using fw_cfg_add_file() rather than
>> acpi_add_rom_blob() -- so those are immutable (never regenerated). I
>> definitely needed this reminder...)
> 
> most of them are just guest RAM reservations (guest/hose exchange buffer)
> and "etc/tpm/config" seems to immutable for specific configuration
> 
> 
>> So, my observations:
>>
>> (1) microvm open-codes "etc/table-loader", rather than using the macro
>> ACPI_BUILD_LOADER_FILE.
>>
>> The proposed patch corrects it, which I welcome per se. However, it
>> should arguably be a separate patch. I found it distracting, in spite of
>> the commit message highlighting it. I don't insist though, I'm
>> admittedly rusty on this code.
>>
>>
>> (2) The proposed patch sets "max_size" to ACPI_BUILD_LOADER_MAX_SIZE for
>> each ACPI_BUILD_LOADER_FILE. Makes sense, upon constructing / reviewing
>> the above table.
>>
>> (I'm no longer sure if tweaking the alignment were the preferable path
>> forward.)
>>
>> Either way, I'd request including the above table in the commit message.
>> (Maybe drop the "notes" column.)
>>
>>
>> (3) The above 9 invocations are *all* of the acpi_add_rom_blob()
>> invocations. I find the interface brittle. It's not helpful to have so
>> many macros for the names and the max sizes. We should have a table with
>> three entries and -- minimally -- two columns, specifying name and
>> max_size -- possibly some more call arguments, if such can be extracted.
>> We should also have an enum type for selecting a row in this table, and
>> then acpi_add_rom_blob() should be called with an enum constant.
>>
>> Of course, talk is cheap. :)
>>
>>
>> (4) When do we plan to introduce a nonzero "max_size" for
>> ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")?
>>
>> Is the current zero value a time bomb?
> 
> it's not likely to go over 4k, but if we enforce max_size!=0 we may set it 4k,
> which it's aligned to anyways.

Interestingly, the size is not aligned.

We end up calling rom_add_blob() with a size like "22". The memory 
region we create has size=22 / max_size=22. (max_size is not effective, 
we rely on the one from the underlying RAMBlock).

The resizeable RAMBlock, however, aligns both up to full pages (e.g., 4k 
/ 4k), so we can later grow it > 22 bytes.


Doesn't really matter in practice I guess, because we always expose full 
pages to the guest, and migrate full pages.

One corner case could be shrinking e.g., from 22 bytes to 14 bytes. I am 
not sure if we would zero-out these 8 bytes somewhere. Not sure if that 
is of any relevance.

Beautiful code.

-- 
Thanks,

David / dhildenb


