Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377E53E42B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:13:05 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAfQ-0003Ly-Ka
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nyAZg-0007vr-AO
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:07:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45992 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nyAZd-0004ah-LS
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:07:08 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxX+bP351i0e0WAA--.6420S3;
 Mon, 06 Jun 2022 19:06:55 +0800 (CST)
Subject: Re: qemu-iotest 267 got a FPE error when TARGET_PAGE_BITS 16K
From: gaosong <gaosong@loongson.cn>
To: quintela@redhat.com, dgilbert@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>, kwolf@redhat.com,
 hreitz@redhat.com, maobibo <maobibo@loongson.cn>, qemu-devel@nongnu.org
References: <60071e6b-35fd-25c7-225d-5bcf71116afb@loongson.cn>
Message-ID: <b0751b0a-98e6-854e-3d8b-eed49bddbf0b@loongson.cn>
Date: Mon, 6 Jun 2022 19:06:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <60071e6b-35fd-25c7-225d-5bcf71116afb@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9CxX+bP351i0e0WAA--.6420S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAr43CrW5Zw4fJFWUuFWruFg_yoWrCry5pr
 97Jr93Gry8Jr95ur1kGw1Iyr9rJr48tay2kr1xWFy0kr4DGwnIqr40gryqgFs8Wr4vyw4U
 Xr17Xr43Zr45JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
 GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4
 x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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

Cc: qemu-devel

On 2022/6/6 下午5:19, gaosong wrote:
> Hi.
>     I run './tests/qemu-iotests/check -qcow2 267 '  got a FPE error on 
> x86 host emulation LoongArch , The log is :
>
> ...
>
> +../migration/ram.c:2205:9: runtime error: division by zero
> +AddressSanitizer:DEADLYSIGNAL
> +=================================================================
> +==1685462==ERROR: AddressSanitizer: FPE on unknown address 
> 0x556e650eed6e (pc 0x556e650eed6e bp 0x7ffcba14ae20 sp 0x7ffcba14adc0 T0)
> +    #0 0x556e650eed6d in ram_save_host_page ../migration/ram.c:2205
> +    #1 0x556e650ef78f in ram_find_and_save_block ../migration/ram.c:2284
> +    #2 0x556e650f53a1 in ram_save_iterate ../migration/ram.c:3010
> +    #3 0x556e64c03aa2 in qemu_savevm_state_iterate 
> ../migration/savevm.c:1296
> +    #4 0x556e64c06ccc in qemu_savevm_state ../migration/savevm.c:1580
> +    #5 0x556e64c0d497 in save_snapshot ../migration/savevm.c:2889
> +    #6 0x556e64c29221 in hmp_savevm ../monitor/hmp-cmds.c:1095
> +    #7 0x556e64c41b31 in handle_hmp_command_exec ../monitor/hmp.c:1103
> +    #8 0x556e64c4234c in handle_hmp_command ../monitor/hmp.c:1155
> +    #9 0x556e64c38292 in monitor_command_cb ../monitor/hmp.c:49
> +    #10 0x556e6596ceca in readline_handle_byte ../util/readline.c:411
> +    #11 0x556e64c44b78 in monitor_read ../monitor/hmp.c:1393
> +    #12 0x556e656aa41e in qemu_chr_be_write_impl ../chardev/char.c:201
> +    #13 0x556e656aa4c5 in qemu_chr_be_write ../chardev/char.c:213
> +    #14 0x556e656b1302 in fd_chr_read ../chardev/char-fd.c:72
> +    #15 0x556e652b635f in qio_channel_fd_source_dispatch 
> ../io/channel-watch.c:84
> +    #16 0x7f2b425c104d in g_main_context_dispatch 
> (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x5204d)
> +    #17 0x556e65949fac in glib_pollfds_poll ../util/main-loop.c:297
> +    #18 0x556e6594a18a in os_host_main_loop_wait ../util/main-loop.c:320
> +    #19 0x556e6594a486 in main_loop_wait ../util/main-loop.c:596
> +    #20 0x556e64b2bb6b in qemu_main_loop ../softmmu/runstate.c:726
> +    #21 0x556e64255a69 in qemu_main ../softmmu/main.c:36
> +    #22 0x556e64255a9e in main ../softmmu/main.c:45
> +    #23 0x7f2b40304082 in __libc_start_main ../csu/libc-start.c:308
> +    #24 0x556e6425597d in _start 
> (/root/code/github/qemu/build/qemu-system-loongarch64+0x236e97d)
> +
> +AddressSanitizer can not provide additional info.
> +SUMMARY: AddressSanitizer: FPE ../migration/ram.c:2205 in 
> ram_save_host_page
> +==1685462==ABORTING
>
> ...
>
> the ram.c
>
> 2199 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> 2200 {
> 2201     int tmppages, pages = 0;
> 2202     size_t pagesize_bits =
> 2203         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> 2204     unsigned long hostpage_boundary =
> 2205         QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
> 2206     unsigned long start_page = pss->page;
> 2207     int res;
> ...
>
> qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;   === >  4096 >> 14
> So  QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);  got a FPE error,
>
> I am not familar with qcow2,   Could you help me?
>
> Steps to reproduce:
>
> 1  get code
>
>     git clone https://github.com/loongson/qemu/tree/tcg-dev
>
> 2  build
>
>     ./configure   --disable-rdma --disable-pvrdma --prefix=/usr \
>             --target-list="loongarch64-softmmu"  \
>             --disable-libiscsi --disable-libnfs --disable-libpmem \
>             --disable-glusterfs --enable-libusb --enable-usb-redir \
>             --disable-opengl --disable-xen --enable-spice 
> --enable-werror \
>             --disable-capstone --disable-kvm --enable-debug 
> --enable-sanitizers
>
>     cd build
>
>     make -j32
>
> 3  test
>
>     ./tests/qemu-iotests/check -qcow2 267
>
>
> Thanks.
> Song Gao


