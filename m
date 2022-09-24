Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5642D5E8E6F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 18:22:35 +0200 (CEST)
Received: from localhost ([::1]:56360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc7vF-0002qW-Up
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 12:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oc7tG-00011X-6n; Sat, 24 Sep 2022 12:20:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oc7tE-0001Uh-Pd; Sat, 24 Sep 2022 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/G1V0iZBVnpMB6LFHU52OWfdGRSZVBKfCzaUJY9178A=; b=t3Ps0+N4RS3Mt+NPQW4N26e3dg
 hg9tmnK3My5G/uk6uuXKTzWI6in/+XddPZv52iFdGPvsTbHXHwLjW9zqO5Lx3pZFXUYckETA6t3nM
 2XMsKQLxCnmO2WPFe8nZO0bTytBtLbEAxg3UJt7KNmoQDIyIOAnlU8+giWLn7IagvjwRQk+N04K8w
 VPj8K6uX53hXYBCvQF6083AI2n+UWf1y6hpMO96WL/TLDTWt8Yb3Gho2/aJkitVrFxOcfb6JGu+kI
 cGKw5iiIvVW/N5xdqV8QVZFmLxr47mejwy6Qq2zlYSzytU7+Joz12G9u4bzXG3NkX88AgCNpXcGno
 pW6+SD/17WjL/OwgPARPTu58DnN+RW83EAyxfvkW+tGCFhuaI4F4GBY9lwyMO+u/5lhuVjNoa9ITK
 q9Q9kpsJgUM2AQbKhcHKFRb2NySnC5wKGqlwmpwKnELg+d/8sHsWiJrFILPfMukW5HbxfUR/htnCv
 jIIkz/h9Cnnqxva171SKXiRw4h4M3+iKPsrnKqxv0XxwBHQjUYe9c51GbrIiOAWtL5iyh//8QzCSd
 qWSwDND17NztuCwXVhf8/WQuK35bXCbR3wTbcKFZSUbIkXq/lzP3Jfkozwtf5KxopJzX3wvNTSe2T
 4J1MEq7dTDS9ByifBaenCWIJIhLClUQdgnX9rCEPY=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oc7rW-0002gH-M1; Sat, 24 Sep 2022 17:18:42 +0100
Message-ID: <2fe61f3a-2f08-2ce2-b52e-e9769925d48d@ilande.co.uk>
Date: Sat, 24 Sep 2022 17:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <9c9cf132-bc4f-2e21-8956-a99ec66f4a3@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <9c9cf132-bc4f-2e21-8956-a99ec66f4a3@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/10] Misc ppc/mac machines clean up
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/09/2022 14:09, BALATON Zoltan wrote:

> On Sat, 17 Sep 2022, BALATON Zoltan wrote:
>> This series includes some clean ups to mac_newworld and mac_oldworld
>> to make them a bit simpler and more readable, It also removes the
>> shared mac.h file that turns out was more of a random collection of
>> unrelated things. Getting rid of this mac.h improves the locality of
>> device models and reduces unnecessary interdependency.
> 
> Ping? Patches still needing review: 3, 4, 6, 8, 10
> 
> Regards,
> BALATON Zoltan

I've tagged this series for review, and plan to have a look over it either later 
today or tomorrow.


ATB,

Mark.

