Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6715A0EDD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:19:34 +0200 (CEST)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRAtY-0006A9-OI
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRAqT-0004AF-2H; Thu, 25 Aug 2022 07:16:21 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:52938 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRAqQ-0002Ow-79; Thu, 25 Aug 2022 07:16:20 -0400
Received: from [127.0.0.1] (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowACXnqb1WQdj+KoFAA--.596S2;
 Thu, 25 Aug 2022 19:16:06 +0800 (CST)
Message-ID: <7e5708c6-ffad-d867-a232-85ce55ee60b4@ict.ac.cn>
Date: Thu, 25 Aug 2022 19:16:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
 <20220825074746.2047420-2-fanjinhao21s@ict.ac.cn> <YwdB//iV62uWeqJK@apples>
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YwdB//iV62uWeqJK@apples>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACXnqb1WQdj+KoFAA--.596S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1UZF4kGw1DCw4DZr1fWFg_yoWfWFXEgr
 Z5u3y7tw4UXF48Ka4IywsrAFZIgay0yF92yw1vqanxA347ZF9avr45uryjvwn7Ga1kuwnx
 Ga42qanIyrnrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAI
 w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
 CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-Originating-IP: [221.220.143.85]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/2022 5:33 PM, Klaus Jensen wrote:
> I'm still a bit perplexed by this issue, so I just tried moving
> nvme_init_irq_notifier() to the end of nvme_init_cq() and removing this
> first_io_cqe thing. I did not observe any particular issues?
> 
> What bad behavior did you encounter, it seems to work fine to me

The kernel boots up and got stuck, waiting for interrupts. Then the 
request times out and got retried three times. Finally the driver seems 
to decide that the drive is down and continues to boot.

I added some prints during debugging and found that the MSI-X message 
which got registered in KVM via kvm_irqchip_add_msi_route() is not the 
same as the one actually used in msix_notify().

Are you sure you are using KVM's irqfd?

Here is a previous discussion with Keith [1].

[1] 
https://lore.kernel.org/qemu-devel/YvKJk2dYiwomexFv@kbusch-mbp.dhcp.thefacebook.com/#t


