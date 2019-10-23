Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C728EE109D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 05:35:01 +0200 (CEST)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN7QK-0002oi-TB
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 23:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iN7O8-0000Ui-4P
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 23:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iN7O7-00009l-3A
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 23:32:44 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:3974)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1iN7O4-00007R-94; Tue, 22 Oct 2019 23:32:40 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee55dafc9c73a3-286fa;
 Wed, 23 Oct 2019 11:32:23 +0800 (CST)
X-RM-TRANSID: 2ee55dafc9c73a3-286fa
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.144.122] (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95dafc9c7a55-72ce9;
 Wed, 23 Oct 2019 11:32:23 +0800 (CST)
X-RM-TRANSID: 2ee95dafc9c7a55-72ce9
Subject: Re: [Qemu-devel] [PATCH] pci_bridge: fix a typo in comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20181108122102.9915-1-maozhongyi@cmss.chinamobile.com>
 <1898dc23-c512-88bd-cb73-5a2cffccd176@redhat.com>
From: maozy <maozhongyi@cmss.chinamobile.com>
Message-ID: <7f3e7954-3574-9f44-7710-4a488c1d0fe2@cmss.chinamobile.com>
Date: Wed, 23 Oct 2019 11:32:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1898dc23-c512-88bd-cb73-5a2cffccd176@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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
Cc: "qemu-trivial@nongnu.org >> QEMU Trivial" <qemu-trivial@nongnu.org>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping...

On 11/8/18 9:12 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@
> 
> On 8/11/18 13:21, Mao Zhongyi wrote:
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> ---
>>   hw/pci/pci_bridge.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
>> index ee9dff2d3a..da8daa3ff2 100644
>> --- a/hw/pci/pci_bridge.c
>> +++ b/hw/pci/pci_bridge.c
>> @@ -310,7 +310,7 @@ void pci_bridge_reset(DeviceState *qdev)
>>       /*
>>        * the default values for base/limit registers aren't specified
>> -     * in the PCI-to-PCI-bridge spec. So we don't thouch them here.
>> +     * in the PCI-to-PCI-bridge spec. So we don't touch them here.
>>        * Each implementation can override it.
>>        * typical implementation does
>>        * zero base/limit registers or
>>
> 



