Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B74A2D90FF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 23:52:47 +0100 (CET)
Received: from localhost ([::1]:46812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koaEQ-00075R-4I
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 17:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koaCf-0005lL-Gq; Sun, 13 Dec 2020 17:50:57 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:39235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koaCc-0001jV-IV; Sun, 13 Dec 2020 17:50:57 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPGJh-1kU0WE3bOH-00Pd6l; Sun, 13 Dec 2020 23:50:44 +0100
Subject: Re: [PATCH v2] hw/block/nand: Decommission the NAND museum
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200915171639.1355800-1-f4bug@amsat.org>
 <619d329d-f6b3-1e73-e151-a58e366db15d@amsat.org>
 <3647a01c-0932-3446-9bc7-e138ced496dd@amsat.org>
 <f89e9e7d-5ab3-769a-f3d8-22fc05d80af6@amsat.org>
 <8af60250-2c96-28bd-f05c-ee38e390df1a@vivier.eu>
 <CAFEAcA-3enD96MsiD95L+dx=VTf9qMHhoe5g7XcLox+WoG=Tfw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <450456c9-1bb1-0a26-144a-bbac49068050@vivier.eu>
Date: Sun, 13 Dec 2020 23:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3enD96MsiD95L+dx=VTf9qMHhoe5g7XcLox+WoG=Tfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:90skuRDlzdQmcEHF2bglHeNVXdy6nPCY9R70vkt2ciL49yTB37H
 vsyA/78hQRUsJBWjawyRc+N9qxMXxzNgj71dDgt8HL2ut6l5DQ49j3451O3Y0IUfvjlLRkk
 Vij3pZj0PAKZz3PFbnwYnDkvSWW+j7XAPXWcS/NiJR7ap30Hu9pYw2zosdV8tpdj9H8Q2ZE
 PUk6MsPGufGYgRULpDVZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KIFrMgfIUm0=:MeeYB0oviwHraqidt3907A
 9PnEFjILXHM3eaad3bosc+0m4W+DlcCNYk44b1HpmE4bQC3qr6Kz024D68L93eTjVh3pDh+Ji
 oU75Be4ofiKS3VO8JApxsR018MLtxbns1kUHUdrLCtmZfrpMu6gJCasKfLExiyYb6w6SP5xmC
 b5iMjCNhoQMj/o7HoCj+woZ+GcvJyqQZm/KhlervdSpg47I50v3HUB3kn0Pauoq+xss0DGsX3
 OvpWf+nWsGX6+dmHQgUz6Z3PrBquU1R4gSeoTLpMk4vLtafBmOJKkPOR/yjwhq+Nr3yR3VXb6
 kde4aEdN2Nt+suVlMmrexyAyyNEtqiaCnJpbyugsevn4oKShbj7LEv9L4DaBeMb2/c1RjEAMG
 jB97JQ8cVlF8knK/f0c6qJETz+QFe6ZK8xsEpzGemeq2CxH13zne5hBWWHrCg23C0YlaCaD+x
 +0sn7mfJxA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/12/2020 à 20:01, Peter Maydell a écrit :
> On Sun, 13 Dec 2020 at 17:21, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 16/10/2020 à 18:52, Philippe Mathieu-Daudé a écrit :
>>> Cc'ing qemu-trivial@ since this patch is reviewed.
>>>
>>> On 10/15/20 8:12 PM, Philippe Mathieu-Daudé wrote:
>>>> ping^2...
>>>>
>>>> On 10/1/20 7:31 PM, Philippe Mathieu-Daudé wrote:
>>>>> ping qemu-block or qemu-arm?
>>>>>
>>>>> On 9/15/20 7:16 PM, Philippe Mathieu-Daudé wrote:
>>>>>> This is the QEMU equivalent of this Linux commit (but 7 years later):
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7025a43a9da2
>>>>>>
>>>>>>      The MTD subsystem has its own small museum of ancient NANDs
>>>>>>      in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
>>>>>>      The museum contains stone age NANDs with 256 bytes pages, as well
>>>>>>      as iron age NANDs with 512 bytes per page and up to 8MiB page size.
>>>>>>
>>>>>>      It is with great sorrow that I inform you that the museum is being
>>>>>>      decommissioned. The MTD subsystem is out of budget for Kconfig
>>>>>>      options and already has too many of them, and there is a general
>>>>>>      kernel trend to simplify the configuration menu.
>>>>>>
>>>>>>      We remove the stone age exhibits along with closing the museum,
>>>>>>      but some of the iron age ones are transferred to the regular NAND
>>>>>>      depot. Namely, only those which have unique device IDs are
>>>>>>      transferred, and the ones which have conflicting device IDs are
>>>>>>      removed.
>>>>>>
>>>>>> The machine using this device are:
>>>>>> - axis-dev88
>>>>>> - tosa (via tc6393xb_init)
>>>>>> - spitz based (akita, borzoi, terrier)
>>>>>>
>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> ---
>>>>>> Peter, as 4 of the 5 machines are ARM-based, can this go via your tree?
>>>>>> ---
>>>>>>   hw/block/nand.c | 13 ++++++-------
>>>>>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/block/nand.c b/hw/block/nand.c
>>>>>> index 5c8112ed5a4..5f01ba2bc44 100644
>>>>>> --- a/hw/block/nand.c
>>>>>> +++ b/hw/block/nand.c
>>>>>> @@ -138,7 +138,7 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
>>>>>>   # define ADDR_SHIFT        16
>>>>>>   # include "nand.c"
>>>>>> -/* Information based on Linux drivers/mtd/nand/nand_ids.c */
>>>>>> +/* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
>>>>>>   static const struct {
>>>>>>       int size;
>>>>>>       int width;
>>>>>> @@ -154,15 +154,14 @@ static const struct {
>>>>>>       [0xe8] = { 1,    8,    8, 4, 0 },
>>>>>>       [0xec] = { 1,    8,    8, 4, 0 },
>>>>>>       [0xea] = { 2,    8,    8, 4, 0 },
>>>>>> -    [0xd5] = { 4,    8,    9, 4, 0 },
>>>>>>       [0xe3] = { 4,    8,    9, 4, 0 },
>>>>>>       [0xe5] = { 4,    8,    9, 4, 0 },
>>>>>> -    [0xd6] = { 8,    8,    9, 4, 0 },
>>>>>> -    [0x39] = { 8,    8,    9, 4, 0 },
>>>>>> -    [0xe6] = { 8,    8,    9, 4, 0 },
>>>>>> -    [0x49] = { 8,    16,    9, 4, NAND_BUSWIDTH_16 },
>>>>>> -    [0x59] = { 8,    16,    9, 4, NAND_BUSWIDTH_16 },
>>>>>> +    [0x6b] = { 4,        8,        9, 4, 0 },
>>>>>> +    [0xe3] = { 4,        8,        9, 4, 0 },
>>>>>> +    [0xe5] = { 4,        8,        9, 4, 0 },
>>>>>> +    [0xd6] = { 8,        8,        9, 4, 0 },
>>>>>> +    [0xe6] = { 8,        8,        9, 4, 0 },
>>>>>>       [0x33] = { 16,    8,    9, 5, 0 },
>>>>>>       [0x73] = { 16,    8,    9, 5, 0 },
>>>>>>
>>>>>
>>>>
>>>
>>
>> Applied to my trivial-patches branch.
> 
> Er, I made review comments on this one; it needs a respin.

Yes, removed from my queue.

Thanks,
Laurent


