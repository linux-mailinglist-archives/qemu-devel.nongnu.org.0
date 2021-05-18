Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9073872EE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:15:47 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litxB-00087a-Up
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1litvk-0007Bd-IU
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:14:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42054 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1litvf-00007O-Dy
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:14:16 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axzcg5aaNgqMMYAA--.32930S3; 
 Tue, 18 May 2021 15:14:01 +0800 (CST)
Subject: Re: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
 <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
 <90aba8a2-acdc-73b7-a83d-7bca630e9176@loongson.cn>
 <20210518070344.eucma2btkgq3dcgp@sirius.home.kraxel.org>
From: maobibo <maobibo@loongson.cn>
Message-ID: <e50f51d3-3779-985e-4c56-39ea0446aa13@loongson.cn>
Date: Tue, 18 May 2021 15:14:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210518070344.eucma2btkgq3dcgp@sirius.home.kraxel.org>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axzcg5aaNgqMMYAA--.32930S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFykZrWUtry7uFyUKw4DArb_yoWxAFcEga
 1DKFsFga18Xws5Ka15Ww4fWay5J34Du34UXry5WwnIvryjvFs7Xr43urnaya9rZ39YkF4f
 C348A3sxCrZIgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
 c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWU
 AwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
 bOoGdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021年05月18日 15:03, Gerd Hoffmann 写道:
> On Tue, May 18, 2021 at 09:06:31AM +0800, maobibo wrote:
>> Sorry I do not state the background clearly.
>>
>> Page size is 16K on my MIPS machine, and it supports running
>> guest OS in kvm mode and qxl vga card can used for VM.
> 
> Ok.  Please add that to the commit message.
> 
> Also there is no need to rewrite the function and drop the
> BUILD_BUG_ON().  Just using "return QEMU_ALIGN_UP(QXL_ROM_SZ, pagesize)"
> should work fine.
ok, I will refresh the patch.

> 
> Is the host page size fixed on mips?

No, it is not fixed on mips, and it can be selected by linux kernel config.

regards
bibo, mao
> 
> take care,
>   Gerd
> 


