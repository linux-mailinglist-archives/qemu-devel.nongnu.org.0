Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3133DB8B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:55:11 +0100 (CET)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDuQ-00024p-IF
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMDRp-0000Xp-GR; Tue, 16 Mar 2021 13:25:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMDRl-0002yi-KI; Tue, 16 Mar 2021 13:25:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9BA95746396;
 Tue, 16 Mar 2021 18:25:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7ED527462BD; Tue, 16 Mar 2021 18:25:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7D06D7456B4;
 Tue, 16 Mar 2021 18:25:28 +0100 (CET)
Date: Tue, 16 Mar 2021 18:25:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
In-Reply-To: <d12dfe05-5412-320a-5b80-b5f478d78034@ilande.co.uk>
Message-ID: <79ac3f4d-8ba4-1326-976f-8e2fa52230c8@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
 <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
 <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
 <4ce33c11-af3c-4a18-fccb-9c9bdb2b26c2@vivier.eu>
 <ea5f6f28-3be1-6a80-7b8a-c3563baec061@eik.bme.hu>
 <d5bdc780-4809-2666-35cb-a2096ed967e0@vivier.eu>
 <e16d3b59-3d3a-2299-1689-72304a18da90@eik.bme.hu>
 <d12dfe05-5412-320a-5b80-b5f478d78034@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021, Mark Cave-Ayland wrote:
> On 16/03/2021 13:06, BALATON Zoltan wrote:
>>> The PATCH 1 doesn't seem to be needed to have a working Pegasos 2 machine, 
>>> does it?
>> 
>> It is needed (as well as all other patches in the series). Patch 1 is 
>> needed for getting serial output which is the only way to communicate with 
>> the Pegasos2 firmware so it's really hard to boot anything without it.
>
> Just having a quick look at patch 1: presumably the issue here is that the 
> Pegasos 2 firmware moves the serial ports to a different address on startup. 
> If you know what that address is, then why not simply change the serial port 
> base address(es) on the SuperIO device from the default?

I had that as first version but other guests may expect the serial at the 
default address or set it up differently and we can emulate the device 
more fully this way that works with all guests which is also more like the 
device works. So putting it at a default address would be a step back. I 
can attempt that if this approach cannot be used but so far nobody said 
so.

Regards,
BALATON Zoltan

