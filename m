Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9D38BCFD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 05:32:03 +0200 (CEST)
Received: from localhost ([::1]:59028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljvtK-0000MY-Bs
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 23:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1ljvsR-00087K-DW
 for qemu-devel@nongnu.org; Thu, 20 May 2021 23:31:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42924 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1ljvsO-0003Gc-QN
 for qemu-devel@nongnu.org; Thu, 20 May 2021 23:31:07 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0BtKadgYgkCAA--.799S3;
 Fri, 21 May 2021 11:30:53 +0800 (CST)
Subject: Re: [PATCH v2] hw/display/qxl: Set pci rom address aligned with page
 size
From: maobibo <maobibo@loongson.cn>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1621340448-31617-1-git-send-email-maobibo@loongson.cn>
Message-ID: <f048ea2b-b46c-1f79-bf07-da4a1767e7a6@loongson.cn>
Date: Fri, 21 May 2021 11:30:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1621340448-31617-1-git-send-email-maobibo@loongson.cn>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0BtKadgYgkCAA--.799S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr43ArWrXrWftF48KFWUCFg_yoWDtwb_Ga
 4j9wsxKw1UX3ZYvF4kAw1IgF4rt34kGa18XFy7X3W5tryjyan5AF10gwnxWr4qvrZFk3y5
 ua1kC390yrZxZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkI
 ecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcD
 DGUUUUU
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

ping.

or there is other suggestion so that qxl can be used on system
with 16K pagesize.


regards
bibo, mao

在 2021年05月18日 20:20, Bibo Mao 写道:
> From: maobibo <maobibo@loongson.cn>
> 
> On some MIPS system, page size is 16K, and qxl vga device can
> be used for VM in kvm mode. Qxl pci rom size is set 8K fixed,
> smaller than 16K page size on host system, it fails to be
> added into memslots in kvm mode where memory_size and GPA
> are required to align with page size.
> 
> This patch fixes this issue.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  hw/display/qxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 2ba7563..6e1f8ff 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -321,7 +321,7 @@ static ram_addr_t qxl_rom_size(void)
>  #define QXL_ROM_SZ 8192
>  
>      QEMU_BUILD_BUG_ON(QXL_REQUIRED_SZ > QXL_ROM_SZ);
> -    return QXL_ROM_SZ;
> +    return QEMU_ALIGN_UP(QXL_REQUIRED_SZ, qemu_real_host_page_size);
>  }
>  
>  static void init_qxl_rom(PCIQXLDevice *d)
> 


