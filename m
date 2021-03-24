Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D133484F2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:56:11 +0100 (CET)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCQ5-0001F6-K9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lPCOS-0000dC-QJ; Wed, 24 Mar 2021 18:54:28 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lPCOQ-000161-5m; Wed, 24 Mar 2021 18:54:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 39F8D7462BD;
 Wed, 24 Mar 2021 23:54:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C417174581E; Wed, 24 Mar 2021 23:54:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C13A87456E3;
 Wed, 24 Mar 2021 23:54:20 +0100 (CET)
Date: Wed, 24 Mar 2021 23:54:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
In-Reply-To: <20210324175438.680310-1-f4bug@amsat.org>
Message-ID: <b646aa93-2fd2-40c6-fb28-1bb2b4cbb3f5@eik.bme.hu>
References: <20210324175438.680310-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1351052353-1616626460=:4275"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1351052353-1616626460=:4275
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 24 Mar 2021, Philippe Mathieu-Daudé wrote:
> The motivation behind this series is to remove the
> isa_get_irq(NULL) call to simplify the ISA generic model.

Could you please wait with this until after my pegasos2 series is merged? 
Otherwise I'll have to rewrite that again for which I don't have much time 
and don't want to miss 6.1 too now that it's almost reviewed and accepted. 
This series is a cleanup that could be more fully done after the other 
machine using vt82c686.c is also there.

Regards,
BALATON Zoltan
--3866299591-1351052353-1616626460=:4275--

