Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D66FDACF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:32:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgB9-0003fh-H1; Wed, 10 May 2023 05:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pwgB0-0003dq-Cl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:32:02 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pwgAx-0004Uy-KP
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:32:01 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8DxCeqKZFtkqE8HAA--.12336S3;
 Wed, 10 May 2023 17:31:54 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxQbSIZFtkwuJTAA--.19090S3; 
 Wed, 10 May 2023 17:31:53 +0800 (CST)
Subject: Re: [PATCH HOTFIX] target/loongarch: Terminate vmstate subsections
 list
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn
References: <20230510062405.127260-1-richard.henderson@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <fb2253b9-aa72-f439-fd86-f8c227056342@loongson.cn>
Date: Wed, 10 May 2023 17:31:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230510062405.127260-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8AxQbSIZFtkwuJTAA--.19090S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7GFyrAF1rZF1rJr4fGrW8Crg_yoWDJFgEka
 17AFn7Xr4jqwn2kw4jgr4fJ34UGan7AFyYyryxJwsru34Sv3s8KFyqy3yFya1xKFn3X3ya
 k3yUtws0yrZFyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 x7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.421,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



在 2023/5/10 下午2:24, Richard Henderson 写道:
> This list requires a NULL terminator.
>
> Fixes: 16f5396cec23 ("target/loongarch: Add LSX data type VReg")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> This failure can be seen
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4253259728#L5579
>
>    5/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/qom-test                 ERROR           1.38s   killed by signal 6 SIGABRT
>   44/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/test-hmp                 ERROR           0.95s   killed by signal 6 SIGABRT
> 356/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/machine-none-test        ERROR           0.51s   killed by signal 6 SIGABRT
>
> It does not always fail, depending on the layout of the executable,
> which is why it was not caught right away.  I plan on applying this
> directly to master before processing more pull requests.
>
Thank you.

We are adding this job to our internal CI process.

Thanks.
Song Gao


