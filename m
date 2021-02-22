Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D8321DBF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:10:49 +0100 (CET)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEjQ-0003vq-Hf
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lEEaI-0004wL-Q4; Mon, 22 Feb 2021 12:01:24 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:25713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lEEaE-0002DR-D8; Mon, 22 Feb 2021 12:01:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7C38B74581E;
 Mon, 22 Feb 2021 18:01:14 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4A6C97456B8; Mon, 22 Feb 2021 18:01:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 48DF57456B7;
 Mon, 22 Feb 2021 18:01:14 +0100 (CET)
Date: Mon, 22 Feb 2021 18:01:14 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 5/6] hw/pci-host: Add emulation of Marvell MV64361
 PPC system controller
In-Reply-To: <6881b4dd-d8dc-4b40-cd1b-5f3755add6d1@amsat.org>
Message-ID: <fa4f7bbb-3267-14a0-d20-c2a8836b79f4@eik.bme.hu>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <a18959c44349a5c5845e388a0e43a8bd04472b45.1614007326.git.balaton@eik.bme.hu>
 <6881b4dd-d8dc-4b40-cd1b-5f3755add6d1@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1482719127-1614013274=:9059"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1482719127-1614013274=:9059
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 22 Feb 2021, Philippe Mathieu-Daudé wrote:
> On 2/22/21 4:22 PM, BALATON Zoltan wrote:
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
>>  hw/pci-host/trace-events      |   6 +
>>  include/hw/pci-host/mv64361.h |   8 +
>>  include/hw/pci/pci_ids.h      |   1 +
>>  7 files changed, 1905 insertions(+)
>>  create mode 100644 hw/pci-host/mv64361.c
>>  create mode 100644 hw/pci-host/mv643xx.h
>>  create mode 100644 include/hw/pci-host/mv64361.h
>
> Is this the datasheet for this controller?
> ftp://ftp.freecalypso.org/PowerPC/support_ics/mv64360/datasheets/DS_64360_1_2.pdf.zip
>
> It seems to have common parts with the GT64120.

Yes, as noted on https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2 
the GT64120 seems to be an older (and MIPS specific) version of this chip 
that Marvell bought and likely made this PPC version based on that. (The 
whole pegasos2 seems to be like a MIPS board with a PPC CPU even down to 
the firmware which looks quite like PMON just has SmartFirmware instead of 
the commands of PMON. So whoever designed it, might have taken inspiration 
from some MIPS hardware.) However the emulation of GT64xxx in QEMU seemed 
to be not complete and different enough so I haven't looked at that when 
implementing this so I don't know how much commonality is there and if 
that would worth reusing. (If you think there could be some reuse then 
that should be done separate of this series, afterwards it's merged.)

Regards,
BALATON Zoltan
--3866299591-1482719127-1614013274=:9059--

