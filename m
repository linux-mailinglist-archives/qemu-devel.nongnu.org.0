Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7663795F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 13:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyBj2-0002sL-3F; Thu, 24 Nov 2022 07:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oyBiv-0002pR-RB
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 07:53:02 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oyBit-0003f0-Dm
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 07:53:01 -0500
Received: from loongson.cn (unknown [114.250.136.113])
 by gateway (Coremail) with SMTP id _____8BxE_AjaX9j+ZQAAA--.1605S3;
 Thu, 24 Nov 2022 20:52:51 +0800 (CST)
Received: from [192.168.199.220] (unknown [114.250.136.113])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_eEiaX9jyXAZAA--.106S3; 
 Thu, 24 Nov 2022 20:52:50 +0800 (CST)
Message-ID: <741aaf86-f97f-51d4-9f35-957aab15e2a3@loongson.cn>
Date: Thu, 24 Nov 2022 20:52:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PULL for 7.2-rc2 0/3] loongarch for 7.2-rc2 patches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, stefanha@gmail.com
References: <20221122131027.1250769-1-gaosong@loongson.cn>
 <Y30CUiG+LBbHhjVH@fedora> <71c3e7bb-e6df-bbb0-e27a-900eac31736d@loongson.cn>
 <Y39nNxw5k74DPWx6@redhat.com>
From: "gaosong@loongson.cn" <gaosong@loongson.cn>
In-Reply-To: <Y39nNxw5k74DPWx6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_eEiaX9jyXAZAA--.106S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
 BjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
 xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
 j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
 67AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
 I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2
 jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
 AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
 1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
 6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
 0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
 CTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
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


在 2022/11/24 20:44, Daniel P. Berrangé 写道:
> On Thu, Nov 24, 2022 at 08:30:45PM +0800, gaosong@loongson.cn wrote:
>> 在 2022/11/23 1:09, Stefan Hajnoczi 写道:
>>> Applied, thanks.
>>>
>>> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.
>> Hi,  Where can I register an account?
> Due to spam attacks, it needs to be created for you.
>
> Let me know what user name you want, and I'll create it and mail
> you a password offlist.

Thank you.

User-name:  gaosong

Thanks.
Song Gao


