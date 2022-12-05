Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63446427A6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 12:39:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p29nK-0007uO-RA; Mon, 05 Dec 2022 06:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p29nI-0007st-7X
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:37:56 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p29n9-0006wW-WE
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:37:55 -0500
Received: from loongson.cn (unknown [123.123.223.32])
 by gateway (Coremail) with SMTP id _____8DxuuoE2I1j6UUDAA--.7863S3;
 Mon, 05 Dec 2022 19:37:40 +0800 (CST)
Received: from [192.168.199.220] (unknown [123.123.223.32])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxLeAD2I1jRfAlAA--.27888S3; 
 Mon, 05 Dec 2022 19:37:39 +0800 (CST)
Message-ID: <e09f6366-1e29-2d13-c2f8-b9da3c2570e7@loongson.cn>
Date: Mon, 5 Dec 2022 19:37:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>, maobibo@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20221202102550.4107344-1-gaosong@loongson.cn>
 <6fe3e752-a39d-38f9-e573-437547d19179@linaro.org>
 <72f22429-d51c-b2b8-49c6-59ba7df17ea7@loongson.cn>
 <CAFEAcA8Tep6GrSwoTSUi8Jjs2ntAqU_15nfe4DD=fZB2P-mp0g@mail.gmail.com>
From: "gaosong@loongson.cn" <gaosong@loongson.cn>
In-Reply-To: <CAFEAcA8Tep6GrSwoTSUi8Jjs2ntAqU_15nfe4DD=fZB2P-mp0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxLeAD2I1jRfAlAA--.27888S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WrW7Zr17GrW3GryxZr1DKFg_yoW8AFyUpa
 yfC3WIkr18Jr4UGrnFyw1DWr4Yyr1xtrWrXa4Fyw18WF1qvr1kJrs5GF1093srZ347Cr40
 qF18t3sxXFn8Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.258,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/12/5 18:48, Peter Maydell 写道:
> On Mon, 5 Dec 2022 at 09:20, gaosong@loongson.cn <gaosong@loongson.cn> wrote:
>>
>> 在 2022/12/5 15:24, Philippe Mathieu-Daudé 写道:
>>> On 2/12/22 11:25, Song Gao wrote:
>>>> The following changes since commit
>>>> c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
>>>>
>>>>     Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
>>>>
>>>> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e0fd:
>>>>
>>>>     hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05
>>>> +0800)
>>>>
>>>> ----------------------------------------------------------------
>>>> pull for 7.2-rc4
>>>>
>>>> We need this patch.
>>> FTR this is not a security/regression fix, but a mere feature.
>>>
>>> Certainly not justified for a rc4 IMO.
>>>
>> We hope LoongArch 7.2 version support pflash,
>> otherwise the subsequent BIOS support pflash may qemu 7.2 does not support.
> Regardless of how much it might be nice to have a new feature
> supported, new features cannot go in after softfreeze, only
> fixes for bugs. At rc4, changes should really be release
> critical bugs and regression fixes only. Further, any pull
> request  that should be going in for rc4 should have a clear
> statement of what the changes do and why they are release
> critical. "We need this patch" is much too vague.
>
> QEMU's release schedule is regular, so there will always be
> another release in 4 months time. There is generally no need
> to be in a huge hurry to get a feature in.
>
> I would favour reverting this change.
Got it .
I had send a patch to revert this.

Thanks.
Song Gao


