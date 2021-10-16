Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5014303DC
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:07:33 +0200 (CEST)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbn9g-0004R1-PA
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbn8I-000374-Qs
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:06:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:41453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbn8F-0005rl-VU
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:06:05 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEC8L-1mTqdb2Dzx-00AIOk; Sat, 16 Oct 2021 19:06:02 +0200
Subject: Re: [PATCH 4/8] mac_via: add GPIO for A/UX mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-5-mark.cave-ayland@ilande.co.uk>
 <500bb7ea-6e59-a3d9-2da6-4efc192c894f@vivier.eu>
 <c31a73dd-ef00-76be-85df-38d097696d97@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5087559e-1dd1-3912-2cbf-4a51eaf900a5@vivier.eu>
Date: Sat, 16 Oct 2021 19:06:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c31a73dd-ef00-76be-85df-38d097696d97@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JXf+LS3/2K36Vjoxji2+G5a+bFjuplqQE0F4rK4yt7NRXXGd8+r
 03l9Dt61qnD1YZvRzo3vigG2Br1BC1S6mAKpHnMQTO03c8f0Z6gc7Pcj9d7mriwd8MbRWBb
 DectBEQLH1pne1r2+oZRQRCauYadJlk7IfjPG9P+wQqEcsm/ZSnN6a8sbhFPVzUHOl6zSQP
 8f/122Xs687az8WJOIvrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yTl34FOK1Cc=:AQXHdpZxkMGIXSVGDCGMDu
 PewKMWTw3PHNrrA4VAEzstptcUC4hcuo37KQuSBjFf/qvJSKwmMY7rVGVxxO7JOdGOKVk0far
 14vuK/X+IDDwTDWtVgDCeInA4khpK+VCEcCVXWSqZoOrIbUF1aATYCcC3Tu1i1lHJ9Rhq/SAr
 1XXVyPEuC+2UkqepLJXA/QGzVDShysy5kU5Sbr8+7pfpkwJ2qHyd4RHf3DbemQKM6zoKx4yAJ
 ZN9QshnavISDZduiRNJC8/CnXCZandMOH1/zjkstypERZrpMcvz5SStZRUaVfO8aMBP84F86k
 Gm7ucGi2t7wjfbagDytHWT0pBG2yrH2qKS4LAtYwzbDkraFIXNBB+3pjx+4+XJWoJuOHlhr0w
 D95onosR1qMHFPS30+934iF9jg+3BGlFcITAHgD0wkowWJAks2g1bh54YkVWQ15/O0Gli3Sid
 qqGiUdqVrStLMo5VLFM33/bpN5rX7wxXK1NoRXJZexmBT2SOI4gawmRwRU0/TITTgHpSR3Z8L
 QfM1+RqvL1mDHsq/vVboEWeeacVrlnMaKKnuBpsCOALh/aHjJaQnv16q3dpCmqWOmTvp367TB
 ATZlvut89AsjGb71zk1v+Z6aMt6EDFyloHRaOqhIXg0PzhKPxMmYo/mNiapboZhM/8eJ2CijO
 y26TPPaOFwkNKhhu8mpIpwYpU84iI1+XDJwpfguHnhmZ2QYyBDwF258K8wpGlS5D1OFyevMZc
 kFcLHSgOhrJ8haJCSpkQeDUwhIEC6hmNkhL0lw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/10/2021 à 21:59, Mark Cave-Ayland a écrit :
> On 15/10/2021 08:17, Laurent Vivier wrote:
> 
>> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>>> Add a new auxmode GPIO that is updated when port B bit 6 is changed indicating
>>> whether the hardware is configured for A/UX mode.
>>
>> Stupid question: why do you use GPIO to pass the auxmode information between VIA and GLUE?
>>
>> Can't we use object_property_set_link() to set a pointer to the GLUE object?
> 
> For devices that are independent i.e. not contained within others I prefer to restrict the interface
> to properties that are visible within "info qom-tree" which are MRs and GPIOs. Otherwise GLUE
> requires knowledge of VIA internals which breaks the device abstraction.
> 

OK, makes sense.

Thanks,
Laurent

