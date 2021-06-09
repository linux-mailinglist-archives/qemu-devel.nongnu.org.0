Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B03A1AA0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:13:50 +0200 (CEST)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0px-0002VW-UW
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lr0lZ-0005pU-4V
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:09:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35680
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lr0lV-0003Qb-Q4
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:09:16 -0400
Received: from host109-155-147-70.range109-155.btcentralplus.com
 ([109.155.147.70] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lr0lF-0007LO-D0; Wed, 09 Jun 2021 17:09:01 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210609141010.1066750-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c3480821-7b5e-99dd-349f-41064beaf021@ilande.co.uk>
Date: Wed, 9 Jun 2021 17:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609141010.1066750-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.70
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 0/2] cputlb: implement load_helper_unaligned() for
 unaligned loads
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-360@incoming.gitlab.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 15:10, Philippe Mathieu-Daudé wrote:

(Added gitlab issue email)

> Reposting Mark's patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg814227.html
> but split in 2 patches for easier review.
> 
> Mark Cave-Ayland (1):
>    cputlb: implement load_helper_unaligned() for unaligned loads
> 
> Philippe Mathieu-Daudé (1):
>    accel/tcg/cputlb: Extract load_helper_unaligned() from load_helper()
> 
>   accel/tcg/cputlb.c | 106 ++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 85 insertions(+), 21 deletions(-)

Thanks Phil. I'm replying to this to keep track of a few thoughts that came up in our 
discussion on IRC:

- Should these unaligned accesses be handled by the memory API?

- There is an overlap with Andrew Jeffrey's unaligned access patchset for the memory 
API at 
http://patchwork.ozlabs.org/project/qemu-devel/patch/20170630030058.28943-1-andrew@aj.id.au/. 
This would certainly benefit devices which currently handle unaligned accesses 
themselves.

- Currently there aren't any qtests to cover the unaligned access cputlb path

- How would using the memory API implementation interact with MemoryRegionOps 
.valid.unaligned and .impl.unaligned?

- The current cputlb store_helper_unaligned() and also load_helper_unaligned() 
proposed by this patchset always use byte accesses, i.e they do not honour the target 
MemoryRegion min_access_size. Switching to the memory API could therefore cause some 
existing cases to break, although -d guest_errors should now log these.

- Phil thinks that using the memory API could break ISA bus accesses


ATB,

Mark.

