Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB21590A48
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 04:28:43 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMKPi-00033G-LT
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 22:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oMKNV-00018M-VW
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 22:26:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42994 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oMKNR-0003D2-4e
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 22:26:25 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxsM5BuvVigLoOAA--.38783S3; 
 Fri, 12 Aug 2022 10:26:10 +0800 (CST)
Subject: Re: problem with qemu-system-loongarch64
To: Waldemar Brodkorb <wbx@openadk.org>, qemu-devel@nongnu.org
References: <YvUDHecm0tYqb3bI@waldemar-brodkorb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <fce3be91-fa93-931e-fba4-e0513b005e1e@loongson.cn>
Date: Fri, 12 Aug 2022 10:26:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YvUDHecm0tYqb3bI@waldemar-brodkorb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxsM5BuvVigLoOAA--.38783S3
X-Coremail-Antispam: 1UD129KBjvdXoWrCryrGryfAw4fZrWUtF1DJrb_yoWxXFgEgF
 Z3Jr1UWw4UZwsrKw10q3yfuFZxXa17WF9Ygr1UJrWUX3Z8Z395Jw4fu3Wru3W5Xr1kAr43
 XrWvyF4kZFy29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbV8YjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
 s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
 kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
 Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
 0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
 DU0xZFpf9x07URWlkUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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

CC: Huacai Chen <chenhuacai@kernel.org>

On 2022/8/11 下午9:24, Waldemar Brodkorb wrote:
> Hi Qemu developers,
>
> I am trying to bootup a loongarch64 Linux kernel in Qemu 7.1.0-rc2.
> The problem is I get no output when using following command:
> qemu-system-loongarch64 -M virt -nographic -kernel vmlinux
>
> You can find my vmlinux initramfs here:
> https://debug.openadk.org/vmlinux
>
> It is cross-compiled with binutils 2.39, gcc 12.1, glibc 2.36 and
> Linux 5.19. I use the provided defconfig loongson3_defconfig for the
> kernel build.
>
> Any hint what I can do to get a bootable Linux image?
>
> best regards
>   Waldemar


