Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C46387421
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:33:49 +0200 (CEST)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livAi-0001ux-6s
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1liv9u-00011Z-7U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:32:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60740 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1liv9j-0000Zg-7p
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:32:58 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxucmle6NgH8sYAA--.37952S3; 
 Tue, 18 May 2021 16:32:38 +0800 (CST)
Subject: Re: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
 <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
 <90aba8a2-acdc-73b7-a83d-7bca630e9176@loongson.cn>
 <20210518070344.eucma2btkgq3dcgp@sirius.home.kraxel.org>
 <e50f51d3-3779-985e-4c56-39ea0446aa13@loongson.cn>
 <20210518073703.i5gzjdmsem4aqsva@sirius.home.kraxel.org>
From: maobibo <maobibo@loongson.cn>
Message-ID: <cbe99a91-2df3-919b-c4cd-13e228110f1e@loongson.cn>
Date: Tue, 18 May 2021 16:32:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210518073703.i5gzjdmsem4aqsva@sirius.home.kraxel.org>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxucmle6NgH8sYAA--.37952S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4fKrW5AryfKrWrXr4fXwb_yoWDJwb_Zr
 n0yr12k3W7Zr97Kw4UZw4IkFySqanrC348XayUWrWxWryUZwsrtas5uF13XanrXFyUJr45
 u3sYyrsIyw1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbx8YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
 80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
 zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
 8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xS
 Y4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoG
 dUUUUU=
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



在 2021年05月18日 15:37, Gerd Hoffmann 写道:
>   Hi,
> 
>>> Is the host page size fixed on mips?
>>
>> No, it is not fixed on mips, and it can be selected by linux kernel config.
> 
> Hmm.  So the rom size can differ depending on host kernel config.
> Which is bad.  It'll break live migration between hosts with
> different page sizes (or wouldn't that work anyway for other reasons?).
yes, there will be live migration problem between hosts with different page sizes, if page size of guest OS is different with host system, there will be live migration issue also. 
> 
> What page sizes are supported on mips?  4k and 16k I assume?
> So maybe just use 16k unconditionally on mips?
Different mips vendors have different kernel config, there is no general kernel config for all vendors now.

However it is fixed for one vendor. On my Loongson mips box, 16K page size is used. However other vendors have their own binary software code and kernel config.

regards
bibo, mao
> 
> take care,
>   Gerd
> 


