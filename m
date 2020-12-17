Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE42DD66F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:41:37 +0100 (CET)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxHU-0006Jv-El
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kpx0l-0000ts-Rk
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kpx0j-0007PB-4x
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608225855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfkLIDoiyEPG1OfS6NYa25EaI9OfsNAUZg5aivxsa8A=;
 b=h7BulxEXgO3LnILrFYXQI90U5RPIip5N3yLhyN/0xPYJmkwS8EwmYVNYkYoPcE99/7mHZS
 2wupg9bhSmq1xQd7VHEqx/9dM9tgpmChpkbsOAYGBovBHSt9sRft9Ocpf2QDDjoxgcSipb
 T526iec44cP/MIjktF0Kj2JCGfbgZvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-Ebm6-CB-NHyPDujskEDh7A-1; Thu, 17 Dec 2020 12:24:12 -0500
X-MC-Unique: Ebm6-CB-NHyPDujskEDh7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC52801817;
 Thu, 17 Dec 2020 17:24:10 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-17.ams2.redhat.com
 [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288FB60BE5;
 Thu, 17 Dec 2020 17:24:00 +0000 (UTC)
Subject: Re: [PATCH] acpi/gpex: Inform os to keep firmware resource map
To: Jiahui Cen <cenjiahui@huawei.com>, qemu-devel@nongnu.org
References: <20201217132926.4812-1-cenjiahui@huawei.com>
 <44529260-f89a-67b5-d6ab-3652376badcc@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6eb6b9f9-d1b5-b4da-d3e0-fe7c9aa6ab87@redhat.com>
Date: Thu, 17 Dec 2020 18:23:59 +0100
MIME-Version: 1.0
In-Reply-To: <44529260-f89a-67b5-d6ab-3652376badcc@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Ard Biesheuvel \(ARM address\)" <ard.biesheuvel@arm.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 14:52, Jiahui Cen wrote:
> +Laszlo
> 
> On 2020/12/17 21:29, Jiahui Cen wrote:
>> There may be some differences in pci resource assignment between guest os
>> and firmware.
>>
>> Eg. A Bridge with Bus [d2]
>>     -+-[0000:d2]---01.0-[d3]----01.0
>>
>>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>>                                           BAR4 (mem, 64-bit, pref) [size=64M]
>>
>>     In EDK2, the Resource Map would be:
>>         PciBus: Resource Map for Bridge [D2|01|00]
>>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
>>
>>     While in Linux, kernel will use 0x2FFFFFF as the alignment to calculate
>>     the PMem64 size, which would be 0x6000000.
>>
>> The diffences could result in resource assignment failure.
>>
>> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
>> that firmware has done at boot time could handle the differences.
>>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>  hw/pci-host/gpex-acpi.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 071aa11b5c..2b490f3379 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -112,10 +112,19 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
>> -    uint8_t byte_list[1] = {1};
>> +    uint8_t byte_list[1] = {0x21};
>>      buf = aml_buffer(1, byte_list);
>>      aml_append(ifctx1, aml_return(buf));
>>      aml_append(ifctx, ifctx1);
>> +
>> +    /* PCI Firmware Specification 3.2
>> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
>> +     * The UUID in _DSM in this context is
>> +     * {E5C937D0-3553-4D7A-9117-EA4D19C3434D}
>> +     */
>> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
>> +    aml_append(ifctx1, aml_return(aml_int(0)));
>> +    aml_append(ifctx, ifctx1);
>>      aml_append(method, ifctx);
>>  
>>      byte_list[0] = 0;
>>
> 

Seems to make sense to me (I didn't realize we already had the _DSM
method with this GUID!), but now I'm not sure what to expect of the
guest kernel, in light of what Ard said. So if it works now, is that by
accident, or is it an intentional, fresh commit in the kernel? Like
a78cf9657ba5 ("PCI/ACPI: Evaluate PCI Boot Configuration _DSM", 2019-06-21)?

Benjamin: can you please tell us something about this Linux commit? What
was the motivation for it?

Hmm.... this commit seems to be a part of the following series:

a78cf9657ba5 PCI/ACPI: Evaluate PCI Boot Configuration _DSM
7ac0d094fbe9 PCI: Don't auto-realloc if we're preserving firmware config
3e8ba9686600 arm64: PCI: Allow resource reallocation if necessary
85dc04136e86 arm64: PCI: Preserve firmware configuration when desired

OK, after reading through the commit messages in those commits (esp.
7ac0d094fbe9), I think the Linux change was made exactly for the purpose
that we want it for -- stick with the firmware assignments.

Ard, does that seem right, or am I misunderstanding the kernel series?

Thanks
Laszlo


