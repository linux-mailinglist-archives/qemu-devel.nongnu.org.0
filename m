Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE4436FBC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:06:07 +0200 (CEST)
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdjwb-0007iu-KH
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mdjvS-0006iy-3M; Thu, 21 Oct 2021 22:04:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53976 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mdjvO-0006Rn-BJ; Thu, 21 Oct 2021 22:04:53 -0400
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxNeUyHHJh0nEeAA--.53800S3; 
 Fri, 22 Oct 2021 10:04:35 +0800 (CST)
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
To: Bob Proulx <bob@proulx.com>, WANG Xuerui <i.qemu@xen0n.name>
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
 <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
 <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
 <da597248-8e06-2f14-b39e-67c457aa5a71@linaro.org>
 <49d356da-30dd-6460-73fa-8a9e165a9091@loongson.cn>
 <143c6683-a84e-c3b3-ab67-33db648c6c0f@xen0n.name>
 <20211021174735980949462@bob.proulx.com>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <5fda83e5-1f1d-c2da-d8ab-9d1e1ef1af7e@loongson.cn>
Date: Fri, 22 Oct 2021 10:04:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20211021174735980949462@bob.proulx.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxNeUyHHJh0nEeAA--.53800S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW3WryUWF15JrWrtr1fWFg_yoW8AF1xpF
 W5tF13tFZ5tr9Ykr929wnxtFyrArWDtrnxJF42qrW8u39Ivas2qrWvqF4UKa42qw12yFWj
 qa45WF9xZa4qkaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPS14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67
 AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS
 5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2
 xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI
 0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7V
 UjtfHUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 peterx@redhat.com, karl@freefriends.org, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, qemu-devel-owner@nongnu.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,Bob 

 Thank you for your advice,  I'll try.

Thanks 
Xiaojuan, Yang

在 2021年10月22日 08:12, Bob Proulx 写道:
> WANG Xuerui wrote:
>> Song Gao wrote:
>>> Account yangxiaojuan@loongson.cn It seems that she has been
>>> blacklisted. Xiaojuan sent 31 e-mails, which were not displayed
>>> since the 21st one, people who don't have a CC can't read all the
>>> emails,  and xiaojuan reply can't be in qemu-level@nongnu.org.
> 
> I see 18 mails of a patchset accepted and delivered on 10/19 just two
> days ago from yangxiaojuan@loongson.cn.  Therefore it does not seem
> like there is a problem on the mailing list side of things.
> 
>>> Richard and Karl,  How can we solve this problem?
>> ...
>> As for the supposed "ban" on Xiaojuan's account, we cannot diagnose this
>> without mailing list owners' help; maybe it was just some kind of automatic
>> temporary ban, or even connectivity problem on Loongson's side.
> 
> The list owners were CC'd on the previous message and this one.  That
> includes a team of people which includes both Karl and myself and
> others.  It appears I have read and responded to this message first.
> 
> The rejection message that was included said:
> 
>     2021-10-20 09:33:59 (in an unknown timezone)
>     Can not connect to recipient's server because of unstable network or firewall filter.
>     rcpt handle timeout,last handle info: Can not connect to nongnu.org:2001:470:142:3::10:25
> 
> I suggest opening a help ticket on this issue by sending a new message
> to sysadmin@gnu.org where the FSF admins can look into the problem.
> They are the only ones that can look at the incoming mail logs.
> Perhaps they can tell if there was anything logged.  It would be good
> to know the exact time that the connection problem occurred.
> 
> Bob
> 


