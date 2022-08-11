Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FF59086A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 23:57:30 +0200 (CEST)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMGBF-0006Tk-Bu
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 17:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMG9x-00050I-Ec; Thu, 11 Aug 2022 17:56:10 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:26876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMG9u-0007io-U6; Thu, 11 Aug 2022 17:56:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8723D747871;
 Thu, 11 Aug 2022 23:55:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5107E746307; Thu, 11 Aug 2022 23:55:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4F9E4745702;
 Thu, 11 Aug 2022 23:55:58 +0200 (CEST)
Date: Thu, 11 Aug 2022 23:55:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 08/24] ppc/ppc4xx: Introduce a DCR device model
In-Reply-To: <a974a679-b80e-fa87-30fd-2c4e40fdeec8@kaod.org>
Message-ID: <50f1fe76-b0b-1c3a-d8cb-5555339f4c7@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-9-clg@kaod.org>
 <8dcf2a12-f799-673f-d5bf-1cecba42447a@eik.bme.hu>
 <77bc11f5-129a-a3a8-6c24-09c83da2fabd@kaod.org>
 <alpine.LMD.2.03.2208101524000.10818@eik.bme.hu>
 <7cccd86d-5bf2-e45c-b592-80ba10c06a41@kaod.org>
 <96386d50-8f2-4f63-c425-a1dc5247dcb7@eik.bme.hu>
 <fabc82c0-9443-73cb-9437-320fd1dc766e@kaod.org>
 <b25a16ed-3c9b-d983-a489-3e3c184cab5@eik.bme.hu>
 <a974a679-b80e-fa87-30fd-2c4e40fdeec8@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-875603270-1660254958=:27498"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-875603270-1660254958=:27498
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 11 Aug 2022, Cédric Le Goater wrote:
>> Don't drop Ppc4xxDcrDeviceState, that simplifies it a lot. If you don't 
>> want to make mote changes, let me take your series and make a version with 
>> my proposed changes.
>
> Patch 1-7 are already merged. You can grab the rest here  :
>
>  https://github.com/legoater/qemu/tree/ppc-ref405ep
>
> I have done the minor fixes already.

OK, thanks. I'll send an updated version in the weekend.

Regards,
BALATON Zoltan
--3866299591-875603270-1660254958=:27498--

