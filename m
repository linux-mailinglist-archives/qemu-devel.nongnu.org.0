Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E12D8935
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:22:57 +0100 (CET)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9Xk-0004bT-3A
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9P5-0004R7-Kf
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:13:59 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Ox-0000IB-VA
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:13:58 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MsI0I-1jzsEC3K6U-00tjAM; Sat, 12 Dec 2020 18:07:38 +0100
Subject: Re: [PATCH 0/2] m68k/q800: make the GLUE chip a QOM device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106235109.7066-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <100c1728-3d7f-cf40-6684-00d79b4816af@vivier.eu>
Date: Sat, 12 Dec 2020 18:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201106235109.7066-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SdnKcAP+BEtFPHiwoR1PZtg58V4d6I56TPfyqBfjjQQ3nl2rWlo
 GGTnxgPYJcgrK3bMbBmw4t1yRWA1tBoxLFvW8282m4C44lYFcwBMVv9nAb4fG2H0r73VfDP
 Mp/fR/lLFzl+U6CAZ+CQGOfTbxnQldWAEbXuC7MmCvbrYYWrfZ+cdRW3Wp/s17S4fWgXnzz
 vGE2HyAs2HyLSK1prqS5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aYO1wMeknAY=:jALLovYB3N7RpetY9OlOvg
 6jAt9QDpD3Z+7bNyzf6+tic+VN5mbpg5SOAC7x6u66l/JFV2TFDiEpmcq7UtRTxNBmNJdJWa4
 uQEBKqc9dKINc7GSnrpIdwp4BUpsmQJ7SnkhO+KoKLKvsf09cpp/UbkD2L4vkU60uqrH//DK6
 DXkrW9kab8ZRSnPJp5bjta3qn1xeCtaFljj03vbnDlXkcpP+xPkTIEuHenlwXWGyyVztAaa17
 0dwPdd5OxkGxR+S9LvB/1Ulrl6RTXWXvaBbbJ0EKldec5bp5tSfxXagOHhEPtOvzZkMXDtc/S
 8hbwUjTYMKbkRRLe12weScG0rFi6dKxa3n1C463TshruAERr0SRe4mHuG7LV8gOt6vmZ3EGea
 1SO6kT0B1GYSg/v0YdYz+KdtfzwKSfkiNsSVYQidT6H7UBlKTLcofFN/PXVJw
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Le 07/11/2020 à 00:51, Peter Maydell a écrit :
> This series is 6.0 material really I think.  It's a bit of cleanup
> prompted by a Coverity issue, CID 1421883.  There are another half
> dozen or so similar issues, where Coverity is complaining that we
> allocate an array of qemu_irqs with qemu_allocate_irqs() in a board
> init function -- in this case the 'pic' array in q800_init() -- and
> then we return from the board init function and the memory is leaked,
> in the sense that nobody has a pointer to it any more.
> 
> The leak isn't real, in that board init functions are called only
> once, and the array of qemu_irqs really does need to stay around for
> the life of the simulation, so these are pretty much insignificant
> as Coverity issues go. But this coding style which uses a free-floating
> set of qemu_irqs is not very "modern QEMU", so the issues act as
> a nudge that we should clean the code up by encapsulating the
> interrupt-line behaviour in a QOM device. In the q800 case there
> actually is already a GLUEState struct, it just needs to be turned
> into a QOM device with GPIO input lines. Patch 2 does that.
> 
> Patch 1 fixes a bug I noticed while doing this work -- it's
> not valid to connect two qemu_irq lines directly to the same
> input (here both ESCC irq lines go to pic[3]) because it produces
> weird behaviour like "both lines are asserted but the device
> consuming the interrupt sees the line deassert when one of the
> two inputs goes low, rather than only when they both go low".
> You need to put an explicit OR gate in, assuming that logical-OR
> is the desired behaviour, which it usually is.
> 
> Tested only with 'make check' and 'make check-acceptance',
> but the latter does have a q800 bootup test.
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>   hw/m68k/q800: Don't connect two qemu_irqs directly to the same input
>   hw/m68k/q800.c: Make the GLUE chip an actual QOM device
> 
>  hw/m68k/q800.c  | 92 ++++++++++++++++++++++++++++++++++++++++++-------
>  hw/m68k/Kconfig |  1 +
>  2 files changed, 80 insertions(+), 13 deletions(-)
> 

Applied to my m68k-for-6.0 branch

Thanks,
Laurent

