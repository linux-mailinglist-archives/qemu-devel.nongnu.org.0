Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C315AAC83
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 12:34:03 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU3zu-0005VY-LK
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 06:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oU3vL-00028X-1M; Fri, 02 Sep 2022 06:29:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oU3vE-0006fC-2E; Fri, 02 Sep 2022 06:29:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F3A8746FDE;
 Fri,  2 Sep 2022 12:29:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E3EC8746E07; Fri,  2 Sep 2022 12:29:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E2141746396;
 Fri,  2 Sep 2022 12:29:07 +0200 (CEST)
Date: Fri, 2 Sep 2022 12:29:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 00/20] ppc4xx_sdram QOMify and clean ups
In-Reply-To: <55c860d4-f294-f032-91b7-299223e03d35@kaod.org>
Message-ID: <27e26113-17ed-d293-58eb-4b4318711f62@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <1816eb34-a93a-c8cc-9abc-c38f5a4e38ce@eik.bme.hu>
 <fa58b3d3-3773-0c2a-f7a5-b2ee2e61ed22@kaod.org>
 <55c860d4-f294-f032-91b7-299223e03d35@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1358694610-1662114547=:84326"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1358694610-1662114547=:84326
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 2 Sep 2022, Cédric Le Goater wrote:
> On 9/2/22 10:35, Cédric Le Goater wrote:
>> On 9/1/22 23:02, BALATON Zoltan wrote:
>>> On Fri, 19 Aug 2022, BALATON Zoltan wrote:
>>>> Hello,
>>>> 
>>>> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2
>>> 
>>> Now that the queue is flushed it should apply on master so
>> 
>> 
>> I will take a look (most likely next week) and It should reach 7.2.
>> No worries on that.

No worries just pinged so it's not forgotten and I don't have to rebase it 
too much.

> First comment, you should use :
>
>  https://github.com/legoater/qemu-ppc-boot
>
> and check that this command still runs :
>
>  ./ppc-boot.sh -q --prefix=/path/to/qemu/  bamboo ref405ep

The bamboo and sam460ex still work, the ref450ep seems to have a problem, 
I'll try to find what. On master I get:

qemu-system-ppc: warning: hub port hub0port0 has no peer
qemu-system-ppc: warning: hub 0 with no nics
qemu-system-ppc: warning: netdev hub0port0 has no peer
qemu-system-ppc: warning: requested NIC (#net062, model rtl8139) was not 
created (not supported by this machine?)
Memory <- <0x0 0x8000000> (128MB)
CPU clock-frequency <- 0x1fca055 (33MHz)
CPU timebase-frequency <- 0x1fca055 (33MHz)
/plb: clock-frequency <- 0 (0MHz)
/plb/opb: clock-frequency <- 0 (0MHz)
/plb/ebc: clock-frequency <- 0 (0MHz)
/plb/opb/serial@ef600300: clock-frequency <- 7441e (0MHz)
/plb/opb/serial@ef600400: clock-frequency <- 7441e (0MHz)
ethernet0: local-mac-address <- 00:00:00:00:00:00
ethernet1: local-mac-address <- 00:00:07:f2:81:55
Fixing devtree for 4M Flash

while after patches it's

qemu-system-ppc: warning: hub 0 with no nics
qemu-system-ppc: warning: netdev hub0port0 has no peer
qemu-system-ppc: warning: requested NIC (#net053, model rtl8139) was not 
created (not supported by this machine?)
Memory <- <0x0 0x0> (0MB)
CPU clock-frequency <- 0x0 (0MHz)
CPU timebase-frequency <- 0x0 (0MHz)
/plb: clock-frequency <- 0 (0MHz)
/plb/opb: clock-frequency <- 0 (0MHz)
/plb/ebc: clock-frequency <- 0 (0MHz)
/plb/opb/serial@ef600300: clock-frequency <- 0 (0MHz)
/plb/opb/serial@ef600400: clock-frequency <- 0 (0MHz)
ethernet0: local-mac-address <- 00:00:00:00:00:00
ethernet1: local-mac-address <- 00:00:00:00:00:00
Trimming devtree for single serial/eth board
Fixing devtree for 4M Flash

Looks like the device tree is not the same. Any hints where this comes 
from?

Regards,
BALATON Zoltan
--3866299591-1358694610-1662114547=:84326--

