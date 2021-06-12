Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304553A505B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 21:34:20 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls9Oc-0005zG-Rx
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 15:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ls9Nh-0005Kd-UG; Sat, 12 Jun 2021 15:33:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ls9Nd-0006OD-Tt; Sat, 12 Jun 2021 15:33:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D98497462DB;
 Sat, 12 Jun 2021 21:33:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BE5F27457E7; Sat, 12 Jun 2021 21:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BCBDD745708;
 Sat, 12 Jun 2021 21:33:09 +0200 (CEST)
Date: Sat, 12 Jun 2021 21:33:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/3] i2c: Match parameters of i2c_start_transfer and
 i2c_send_recv
In-Reply-To: <20200623063123.20776-1-f4bug@amsat.org>
Message-ID: <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
References: <20200623063123.20776-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-113163332-1623525915=:45517"
Content-ID: <d1c4d9f-a035-559-557a-5961a18d4435@eik.bme.hu>
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-113163332-1623525915=:45517
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <de805c40-39d6-e96e-ca2d-3a92b48b7b85@eik.bme.hu>

Hello,

On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
> This is v2 of Zoltan's patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
>
> - rebased
> - added docstring
> - include hw/misc/auxbus.c fix
>
> Supersedes: <20200621145235.9E241745712@zero.eik.bme.hu>

What happened to this series? I did not find it in patchew, only my 
original patch:

https://patchew.org/QEMU/20200621145235.9E241745712@zero.eik.bme.hu/

I still have this in one of my branches so I think it was not merged at 
the end. Could this be resurrected or should I forget about it and live 
with the inconsistency in parameters instead?

Regards,
BALATON Zoltan

> BALATON Zoltan (2):
>  i2c: Match parameters of i2c_start_transfer and i2c_send_recv
>  i2c: Make i2c_start_transfer() direction argument a boolean
>
> Philippe Mathieu-Daudé (1):
>  hw/misc/auxbus: Fix MOT/classic I2C mode
>
> include/hw/i2c/i2c.h | 22 ++++++++++++++++++++--
> hw/display/sm501.c   |  4 ++--
> hw/i2c/core.c        | 36 ++++++++++++++++++------------------
> hw/i2c/ppc4xx_i2c.c  |  2 +-
> hw/misc/auxbus.c     | 10 +++++-----
> 5 files changed, 46 insertions(+), 28 deletions(-)
>
>
--3866299591-113163332-1623525915=:45517--

