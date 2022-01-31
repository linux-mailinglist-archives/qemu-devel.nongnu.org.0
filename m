Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF94A4F78
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:31:57 +0100 (CET)
Received: from localhost ([::1]:38218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcP6-0005qw-5N
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:31:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nEbvy-0007ju-6n; Mon, 31 Jan 2022 14:01:56 -0500
Received: from [2001:41c9:1:41f::167] (port=41346
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nEbvj-0008VA-Ps; Mon, 31 Jan 2022 14:01:47 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nEbtu-00042c-JQ; Mon, 31 Jan 2022 18:59:46 +0000
Message-ID: <b2d1b312-4d2b-79f0-b169-515a1eaf6c60@ilande.co.uk>
Date: Mon, 31 Jan 2022 19:00:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220131110811.619053-1-clg@kaod.org>
 <20220131110811.619053-3-clg@kaod.org>
 <b878009a-cf35-1465-9bae-11d50ac84241@ilande.co.uk>
 <560147a3-7583-b62f-a194-6af1066ccbef@kaod.org>
 <6902a813-16cd-86e5-b851-d244d42e0be2@ilande.co.uk>
 <CAFEAcA96kQXXDZye-XgUm4otfdFO_Mgi=t9RmJdpV56-08WLBA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA96kQXXDZye-XgUm4otfdFO_Mgi=t9RmJdpV56-08WLBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PULL 02/41] target/ppc: 603: fix restore of GPRs 0-3 on rfi
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/01/2022 17:04, Peter Maydell wrote:

> On Mon, 31 Jan 2022 at 17:00, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>> Here we see checkpatch.pl has no issues with the output of git diff, but when you run
>> it on the whole file:
>> ... it shows up. How is it possible for checkpatch.pl to miss things when processing
>> diffs instead of whole files?
> 
> Probably because checkpatch is a pretty hairy perl script 

That's a good enough explanation for me ;)

> and sometimes
> it mis-parses stuff, especially when it's working with a diff hunk
> and it has a limited view of the context around the statement.
> It's always been best-effort rather than guaranteed to catch all
> formatting issues.
> 
> For this particular error, it doesn't seem to me worth making Cédric
> reroll the pullreq to fix it unless there's some other issue with
> it; we can fix it with a followup patch.

Right. I should clarify that I wasn't asking to NAK the PR (there's plenty of good 
stuff in there), more aiming to document the particular case in the hope someone 
familiar with Perl could figure out what was happening.


ATB,

Mark.

