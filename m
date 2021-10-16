Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFF4303DD
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:12:07 +0200 (CEST)
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbnE6-00083O-DO
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbnBU-0006a0-QZ
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:09:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbnBS-00020S-8Q
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:09:24 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMp08-1mLMEG12sm-00IiZa; Sat, 16 Oct 2021 19:09:20 +0200
Subject: Re: [PATCH 8/8] q800: add NMI handler
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-9-mark.cave-ayland@ilande.co.uk>
 <40098631-e3de-b334-43a7-e0e7ff2751c4@vivier.eu>
 <20e94c6d-99e7-2ecd-412d-20265ab43c97@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e17830c6-2b0c-c42e-423d-a1008da8a82f@vivier.eu>
Date: Sat, 16 Oct 2021 19:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20e94c6d-99e7-2ecd-412d-20265ab43c97@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vrHbPdW9v6PVJADGB1imUihyhhRn/UGDGzheZGH4u6PBZBu6Fvx
 i4nDpS2lvhLWOomO7WnouE/pgy0jlyD/Hg7kSnoUiMMNg+IQpKtetf6tc00sz8JMAWJUs6v
 S0VWoaC040GUIHduvEDiikqc/Ojct+YRnUIMtrqYkv1DMvGPhb86h5a4lB/87nNLxs3wy4X
 +RUI+CYMkLlMJFsxsbCPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YD40kXTKAao=:GZeCUpYUgDQ5JxC3wbciYS
 QHDsiLySSGGCN67iSWpfHJTeGC36GwK4HRpSNOaCW5uFqEKkQ0wGUWkMUJfo0Zkjljm7SXtoF
 iLC3OLpJrcfZaPADAEbGkjIocdN4ywh4oVWt3f/IjZqSvL8ZumAGwH5E+UnaJ3LLnUQKLfWBs
 Afwsanys5UCeaJVkjao+W/WbVp+Xrj+8EefcqC1X3Db0/huA4D06r2jkU1LgMRY6BD5gX5jun
 b1EQysrqMXN7pNFSereA+J/4C08FOK6gm0cWkrujNjVPwNteT+n0KTbjk1C9Ao1zCvgx3Suhr
 UDGxJ1YbtA2vWbZvgrE6fGzcHN5c1OQHolJHqcZj1eO70Jqx6aCIvQdyFmtKRQw1h0JVi829x
 HAHFJMjHSyF9vPLV5VsLFAWDLa3eKhkGrLO4VmHOG60YSII85ihxl5+yqlLi34xo3MFySW41g
 Z1CNhj9PDc7TFk3lwjD2YFNevBaMJ+mdlKbRn8dx+Dgl+yNi31AkllIC1c/jHAYvkVR9CgfBW
 xxWrzLHc5QiuBR8impuxN0IRu8tOeraFwTgNgBV8wdxCc8J1mwhE9DZBV8ZCyMVIWgyruBlia
 Wr0DPbIjpaMkAGB32jCMTDBybl3acxr4Wl/A3p1jJv5/7ccDd9o/6PaJEhSawPQIRKyC7d82Q
 t9OxtT7Fqe5OPZCkdW3PTe4fa0ZIH52oYZ2pWsBUOWjYrtsW0k9J+Qi8eYhtLvwOAcwfPWkxg
 RLpp9k17BCa5g87KYl5awKxXuwYyonkOm6pAdA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 15/10/2021 à 22:12, Mark Cave-Ayland a écrit :
> On 15/10/2021 09:40, Laurent Vivier wrote:
> 
>> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>>> This allows the programmer's switch to be triggered via the monitor for debugging
>>> purposes. Since the CPU level 7 interrupt is level-triggered, use a timer to hold
>>> the NMI active for 100ms before releasing it again.
>>
>> I'm wondering if Qemu provides another way to have a level-triggered interrupt in this case.
>>
>> I' tried to see if keeping the button pressed on a mac kept the IRQ up (as QMP NMI does), but a real
>> mac is too slow and has to many things to display it was not really conclusive...
> 
> When writing the patch I rebased the outstanding MacOS patches onto the branch, installed Macsbug
> into MacOS and used "info nmi" to break into it.
> 
> Testing glue_nmi() with:
> 
>   GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 1);
>   GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 0);
> 
> i.e. a simple pulse didn't launch MacsBug at all. Keeping the NMI high launches MacsBug (which is
> usable) but then as soon as you exit MacsBug with ES, MacsBug breaks immediately again making it
> impossible to return to the Finder. Adding the timer allows launching MacsBug and then
> exiting/re-entering MacsBug again on demand as expected.
> 

I think we have to mimic the finger pressing the button..

By the way, NMI should also dumps the CPU registers under linux.

Reviewied-by: Laurent Vivier <laurent@vivier.eu>

