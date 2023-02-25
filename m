Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410036A29FA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 14:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVuT3-0005Jb-GF; Sat, 25 Feb 2023 08:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1pVuT0-0005Iv-TU
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 08:19:58 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1pVuSz-0005z4-0n
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 08:19:58 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 4CF74A00E6; Sat, 25 Feb 2023 14:12:05 +0100 (CET)
Date: Sat, 25 Feb 2023 14:12:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <D6825370-F3B7-4FF0-9C91-3A7B1755D989@gmail.com>
Message-ID: <alpine.LMD.2.03.2302251409090.2738@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
 <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
 <83759E2D-1871-4D26-906A-F9112990BDFF@gmail.com>
 <b8d457d1-40b1-adb5-a2ac-98070f62ac1e@eik.bme.hu>
 <D6825370-F3B7-4FF0-9C91-3A7B1755D989@gmail.com>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023, Bernhard Beschow wrote:
> I can only take the three VT82xx patches as I proposed since I don't 
> know the Pegasos2 board as well as you do and I don't want to iterate on 
> any review comments for the other patches. I'll send my series soonish.

Does soonish means still today? Sorry for being impatient but I'd like to 
finalise this by Monday so to be able to rebase my changes and make it 
avaialbe for testing as soon as possible, still in the weekend as people 
won't have time on weekdays, then we should need the final version of your 
alternative patches about now.

Regards,
BALATON Zoltan

