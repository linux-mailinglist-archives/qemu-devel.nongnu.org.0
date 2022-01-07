Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A6487F51
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 00:21:34 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5yY8-0008Gc-S3
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 18:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5yWi-0007Mw-Os; Fri, 07 Jan 2022 18:20:05 -0500
Received: from [2001:41c9:1:41f::167] (port=39534
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5yWf-0005ZS-11; Fri, 07 Jan 2022 18:20:03 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n5yWC-0005kZ-Pe; Fri, 07 Jan 2022 23:19:33 +0000
Message-ID: <865b8ef7-a188-e4bd-a95d-43a88fb2782a@ilande.co.uk>
Date: Fri, 7 Jan 2022 23:19:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
 <87ilwfqesw.fsf@linux.ibm.com>
 <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
 <874k7vq8ug.fsf@linux.ibm.com>
 <0dbc9805-e08b-2190-8c1b-2a9e4081c02e@kaod.org>
 <877dbb3cqc.fsf@linux.ibm.com>
 <a8be8541-22a7-80aa-0f01-fe2865e6de21@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <a8be8541-22a7-80aa-0f01-fe2865e6de21@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: openbios@openbios.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2022 13:51, Cédric Le Goater wrote:

>>> Hello,
>>>
>>> a quick status on how QEMU has evolved regarding this topic.
>>>
>>> We have merged :
>>>
>>>     a09410ed1fb8 ("target/ppc: Remove the software TLB model of 7450 CPUs")
>>>
>>> and switched MMU model to POWERPC_MMU_32B in :
>>>
>>>     1da666cd8e79 ("target/ppc: Disable software TLB for the 7450 family")
>>>
>>> With the two patches of this series, we can boot the latest linux on all
>>> 7450 CPUs. With an extra small fix on the CPU table, 7448 boots.
>>
>> A small correction, we only need OpenBIOS to include patch 2: "ppc: Add
>> PVRs for the MPC7450 family".
> 
> Yep we don't need the vectors anymore. But I think I remember Mark
> saying it would be nice to keep the implementation.
> 
> I have an extra patch for 7448 tough.

Could you send the updated OpenBIOS series as a v2 (even if it's part of an existing 
series) just to make sure there is no ambiguity here? If the vectors aren't now being 
used with your latest QEMU changes then I'm less keen to merge them, simply because 
there is no easy way to confirm if they are working correctly without having access 
to real hardware.


ATB,

Mark.

