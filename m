Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7429364D78F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 09:13:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5jM1-0002kh-R8; Thu, 15 Dec 2022 03:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p5jLz-0002i8-BQ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 03:12:31 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p5jLx-00007c-Ed
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 03:12:31 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8CxZPDo1ppjsMUFAA--.12997S3;
 Thu, 15 Dec 2022 16:12:25 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuTn1ppj0EAAAA--.295S3; 
 Thu, 15 Dec 2022 16:12:23 +0800 (CST)
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com
References: <20221202102550.4107344-1-gaosong@loongson.cn>
 <5bd89f20-46ed-b4dc-8707-794b19eb22e4@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <a455b4fc-3818-fe91-4b9f-d19699459f74@loongson.cn>
Date: Thu, 15 Dec 2022 16:12:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5bd89f20-46ed-b4dc-8707-794b19eb22e4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxPuTn1ppj0EAAAA--.295S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrur1xZr13uFWDtryrZr4DCFg_yoW3Crb_Xa
 4IvanrG3y8J3WkGr1DXw1kJrnrJa1DKF4UAF1UXrs7Ar13Jan8Gw48JrW5XFyDXr4UJryD
 ArWDtr15Jw42gjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 I7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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


在 2022/12/15 下午3:29, Philippe Mathieu-Daudé 写道:
> Hi,
>
> On 2/12/22 11:25, Song Gao wrote:
>> The following changes since commit 
>> c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
>>
>>    Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
>>
>> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e0fd:
>>
>>    hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05 
>> +0800)
>>
>> ----------------------------------------------------------------
>
> Now than the 8.0 cycle started, can you respin this pull request
> (preferably rebased on v7.2.0 or later)?
>
Done.

Thanks.
Song Gao


