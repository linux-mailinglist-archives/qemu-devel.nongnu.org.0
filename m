Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29332AC28
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:18:49 +0100 (CET)
Received: from localhost ([::1]:50216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCPo-0000ue-CP
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lHC9z-0000cx-Qp; Tue, 02 Mar 2021 16:02:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lHC9w-0001R7-W7; Tue, 02 Mar 2021 16:02:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BFF937462D3;
 Tue,  2 Mar 2021 22:02:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9C87E74581E; Tue,  2 Mar 2021 22:02:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9B5FE7456B7;
 Tue,  2 Mar 2021 22:02:20 +0100 (CET)
Date: Tue, 2 Mar 2021 22:02:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 5/6] hw/pci-host: Add emulation of Marvell MV64361
 PPC system controller
In-Reply-To: <8b46f28a-f08c-28fd-d323-604ab1e231bb@amsat.org>
Message-ID: <e0124583-3ab1-34cd-e6ca-e105e449fde@eik.bme.hu>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <bdcd7aaf18dfe93267d7a02ac4fa451cb5749dbd.1614282456.git.balaton@eik.bme.hu>
 <8b46f28a-f08c-28fd-d323-604ab1e231bb@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1639703897-1614718940=:41756"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1639703897-1614718940=:41756
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 2 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 2/25/21 8:47 PM, BALATON Zoltan wrote:
>> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
>> chip that is used on the pegasos2 PPC board. This adds emulation of it
>> that models the device enough to boot guests on this board. The
>> mv643xx.h header with register definitions is taken from Linux 4.15.10
>> only fixing end of line white space errors and removing not needed
>> parts, it's otherwise keeps Linux formatting.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/pci-host/Kconfig           |   3 +
>>  hw/pci-host/meson.build       |   2 +
>>  hw/pci-host/mv64361.c         | 966 ++++++++++++++++++++++++++++++++++
>>  hw/pci-host/mv643xx.h         | 919 ++++++++++++++++++++++++++++++++
>
> Maybe name this one mv643xx_regs.h?

This comes originally from Linux where it had this name so to make it 
simpler to find where it comes from I've kept the name for now. If we 
ever change the contents beyond just formatting it could be renamed too.

Regards,
BALATON Zoltan

>>  hw/pci-host/trace-events      |   6 +
>>  include/hw/pci-host/mv64361.h |   8 +
>>  include/hw/pci/pci_ids.h      |   1 +
>>  7 files changed, 1905 insertions(+)
>>  create mode 100644 hw/pci-host/mv64361.c
>>  create mode 100644 hw/pci-host/mv643xx.h
>>  create mode 100644 include/hw/pci-host/mv64361.h
>
>>
>> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
>> index 8b8c763c28..65a983d6fd 100644
>> --- a/hw/pci-host/Kconfig
>> +++ b/hw/pci-host/Kconfig
>> @@ -68,3 +68,6 @@ config PCI_POWERNV
>>
>>  config REMOTE_PCIHOST
>>      bool
>> +
>> +config MV64361
>> +    bool
>
> Missing:
>
>       select PCI
>
>
--3866299591-1639703897-1614718940=:41756--

