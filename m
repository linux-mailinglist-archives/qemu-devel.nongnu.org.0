Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351634075BC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:18:46 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOz9p-0000Ix-Ak
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOz8M-00084Q-L5
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:17:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34504
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOz8K-00042G-Fe
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:17:14 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOz8A-0009Eh-On; Sat, 11 Sep 2021 10:17:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Howard Spoelstra <hsp.cat7@gmail.com>, Helge Konetzka <hk@zapateado.de>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
 <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
Message-ID: <620ac40f-f170-2411-5ce1-e3835c65ae30@ilande.co.uk>
Date: Sat, 11 Sep 2021 10:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.349,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/09/2021 10:03, Mark Cave-Ayland wrote:

> So the question is: what has changed? I find it hard to believe that MSYS2/MingW64 is 
> configured out-of-the-box to break a standard "./configure && make" build incantation.

Also it is worth pointing out that neither the copying/renaming of binaries or 
passing --cross-prefix into configure are required for our MSYS2-based native Windows 
CI builds: https://gitlab.com/qemu-project/qemu/-/blob/master/.cirrus.yml.


ATB,

Mark.

