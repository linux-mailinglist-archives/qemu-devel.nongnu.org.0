Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21D37FB59
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:18:41 +0200 (CEST)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhE2q-0001Uh-BI
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDyG-0004y4-VT; Thu, 13 May 2021 12:13:58 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDyC-00031B-V2; Thu, 13 May 2021 12:13:56 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTAW9-1m4Zzx1UfH-00UbFA; Thu, 13 May 2021 18:13:22 +0200
Subject: Re: [PATCH] hw/pci-host: Do not build gpex-acpi.c if GPEX is not
 selected
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210425182124.3735214-1-f4bug@amsat.org>
 <29fc7f06-7043-598e-98fb-dae99273e5ea@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c37b6438-0f04-0ab2-3e4e-c386256424af@vivier.eu>
Date: Thu, 13 May 2021 18:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <29fc7f06-7043-598e-98fb-dae99273e5ea@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sVH3/sYr97DVT8AryU/Lgls9mWzY3xS9I3nKwVD5UGl/F/bIhqx
 7uUHVG+HnTI10cYeaIfkl0cj2ii+bDsb4EVxU05T1iBiRSaPBcz4QF8NTjYUnbRXy3d/jOu
 s3FWxicaXajXBb7lwyIMBOt9g3RqUApt/lsDpYtcRhrmHvMwWHdJ86FdIxW0MaUshT5s/Yc
 P3Pd7KH4WW6cGnTKhWq1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vblcubMTc30=:w9ug9H5GpNhdx01n59NIIC
 4xO7/lvLK9H55ILrpt13nat+rL2NmZ5XnJCAyifUqpMpteAAMa+27pzsJxEa0IFw1OX3jqEqB
 xD2Tu4EH3qNTR/bdlIHo8t+omXUPwSVM5/cCX32OjIxzMyYfXET/okkVGuFj1y8my72rHGEG3
 Z/MKRpdVDhZA/o/n9/RGbkbH4+CTFFU30ru/0wMGzHcZJJ6IgFSHi419i/1KcG3Y0Lm4Fd48B
 Th1Drnz7wjIicbg+NGI8zbc6RePj9SaBX9rla4M5SJql7cG5wVobtHRj44Re3+oyr0Xyu0V3g
 k38NYfukOVc0/TfdZTXZZdX/J0I95i//JgNyM0cXjpguxK7FZKdZjhf5m/rVrz9JXQDDNnGg6
 tlPnNJN5m77RaLUOMyemB3Ee7G5XHu+ZK8bdYEu/1jH+2BY0xYO8LhrzegWoHsWLMzlPOSbKt
 iGC0zjJV2icE6F4I5kYmtct79Z69pnTdL5jFPp8dr1ay5YA+K01j6RXhCRFEI/eTq6oRyAs3B
 jKSrStX/D7XyjoN0S7Xmuw=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Xingang Wang <wangxingang5@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Jiahui Cen <cenjiahui@huawei.com>, Yubo Miao <miaoyubo@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/05/2021 à 05:36, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial (patch reviewed).

Applied to my trivial-patches branch.

Thanks,
Laurent

> On 4/25/21 8:21 PM, Philippe Mathieu-Daudé wrote:
>> Since its introduction in commit 5b85eabe68f ("acpi: add
>> acpi_dsdt_add_gpex") we build gpex-acpi.c if ACPI is selected,
>> even if the GPEX_HOST device isn't build. Add the missing
>> Kconfig dependency.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> The gpex*.c files aren't covered by any MAINTAINERS section:
>>
>> $ ./scripts/get_maintainer.pl -f hw/pci-host/gpex.c -f hw/pci-host/gpex-acpi.c
>> get_maintainer.pl: No maintainers found, printing recent contributors.
>> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
>>
>> Markus Armbruster <armbru@redhat.com> (commit_signer:2/2=100%)
>> Paolo Bonzini <pbonzini@redhat.com> (commit_signer:2/2=100%)
>> Alistair Francis <alistair.francis@wdc.com> (commit_signer:1/2=50%)
>> "Philippe Mathieu-Daudé" <philmd@redhat.com> (commit_signer:1/2=50%)
>> "Michael S. Tsirkin" <mst@redhat.com> (commit_signer:14/8=100%)
>> Jiahui Cen <cenjiahui@huawei.com> (commit_signer:6/8=75%)
>> Igor Mammedov <imammedo@redhat.com> (commit_signer:4/8=50%)
>> Gerd Hoffmann <kraxel@redhat.com> (commit_signer:2/8=25%)
>> Yubo Miao <miaoyubo@huawei.com> (commit_signer:2/8=25%)
>> qemu-devel@nongnu.org (open list:All patches CC here)
>> ---
>>  hw/pci-host/meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
>> index 87a896973e7..d52dce77cbd 100644
>> --- a/hw/pci-host/meson.build
>> +++ b/hw/pci-host/meson.build
>> @@ -3,7 +3,7 @@
>>  pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
>>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('designware.c'))
>>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gpex.c'))
>> -pci_ss.add(when: 'CONFIG_ACPI', if_true: files('gpex-acpi.c'))
>> +pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'], if_true: files('gpex-acpi.c'))
>>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_Q35', if_true: files('q35.c'))
>>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pcie.c'))
>>  pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
>>
> 


