Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140825FAD4F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 09:19:54 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi9YO-0001V7-AT
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 03:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oi9C9-00051c-Tn
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 02:56:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39776 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oi9C5-0005Wx-CI
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 02:56:53 -0400
Received: from [192.168.124.2] (unknown [183.160.207.220])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axy2qrE0VjJMIqAA--.19352S3; 
 Tue, 11 Oct 2022 14:56:43 +0800 (CST)
Message-ID: <34b95105-711e-7dab-d5cb-fad315e8c26b@loongson.cn>
Date: Tue, 11 Oct 2022 14:56:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RISU PATCH 1/5] risu: Use alternate stack
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-2-gaosong@loongson.cn>
 <82e86c6f-4304-119a-49e6-d0b16bd9a7e0@linaro.org>
 <CAFEAcA_T7T=9gt3Xm37zMpY5AZDRz9sKMjagQOXX9AX-CgqFNw@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
In-Reply-To: <CAFEAcA_T7T=9gt3Xm37zMpY5AZDRz9sKMjagQOXX9AX-CgqFNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axy2qrE0VjJMIqAA--.19352S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWrWw1ktFW7KryUurykZrb_yoW3KrXEgF
 WIyF9rAr1DtF1vkFyjqrs5Ja4IkF40q3W5JF95tr17Xw4fXayfJr48CrZ7ZF12qF4rtrsx
 KasYvryfCry2qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUba8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK
 6r47MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUjHUDJUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/10/10 22:43, Peter Maydell 写道:
> On Mon, 10 Oct 2022 at 15:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 9/17/22 00:43, Song Gao wrote:
>>> We can use alternate stack, so that we can use sp register as intput/ouput register.
>>> I had tested aarch64/LoongArch architecture.
>>>
>>> Signed-off-by: Song Gao<gaosong@loongson.cn>
>>> ---
>>>    risu.c | 16 +++++++++++++++-
>>>    1 file changed, 15 insertions(+), 1 deletion(-)
>> Good idea.
> Depending on the architecture there might still need to be
> restrictions on use of the stack pointer, eg aarch64's
> alignment requirements, but this at least means you can
> in theory write some risu rules that use SP.
I really want use alternate stack, this way can reduce risu rules.
what about use this only on LoongArch architecture ?

Thanks.
Song Gao


