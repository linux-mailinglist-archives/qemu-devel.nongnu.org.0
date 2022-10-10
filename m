Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D905F9C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:43:59 +0200 (CEST)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpKH-0001v2-H3
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ohosp-0000Kz-BJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:15:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48132 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ohosd-0001hK-9L
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:15:35 -0400
Received: from [192.168.124.2] (unknown [36.5.191.229])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPGum4kNjoPkpAA--.25104S3; 
 Mon, 10 Oct 2022 17:15:19 +0800 (CST)
Message-ID: <5f12610d-984d-c2d5-19c5-5b6d0f816f03@loongson.cn>
Date: Mon, 10 Oct 2022 17:15:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 0/3] Fix some loongarch tcg bugs
From: gaosong <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, yangxiaojuan@loongson.cn, maobibo@Loongson.cn,
 huqi@loongson.cn
References: <20220930024510.800005-1-gaosong@loongson.cn>
In-Reply-To: <20220930024510.800005-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGum4kNjoPkpAA--.25104S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr17ur1DCw4UXF1Uuw1xKrg_yoW3Grb_WF
 yxA3s5ur4DWay3Ja9IkryYq34DCF47tFn8ZFZ0qrWxGF9xJFs8Krs0qanxZF1jqF4xWrn8
 uFZFqFyfCr42qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
 JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_
 GFWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfU5TmhUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.934,
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


在 2022/9/30 10:45, Song Gao 写道:
> Hi,
>
> This series fix some bugs find from RISU test.
>
> V3:
>    -drop patch set some instruction result high 32bit 1.
>    -follow some change from Richard's suggestion.
>
> v2:
>    -remove patch5 div if x/0 set dividend to 0.
>
>
> Song Gao (3):
>    target/loongarch: bstrins.w src register need EXT_NONE
>    target/loongarch: Fix fnm{sub/add}_{s/d} set wrong flags
>    softfloat: logB(0) should raise divideByZero exception
>
>   fpu/softfloat-parts.c.inc                     |  1 +
>   target/loongarch/insn_trans/trans_bit.c.inc   | 36 +++++++++++--------
>   .../loongarch/insn_trans/trans_farith.c.inc   | 12 +++----
>   3 files changed, 29 insertions(+), 20 deletions(-)
Applied to loongarch-next.

Thanks.
Song Gao


