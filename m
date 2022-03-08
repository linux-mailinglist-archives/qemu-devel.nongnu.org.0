Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF14D2326
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 22:18:49 +0100 (CET)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRhEG-0004Td-2T
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 16:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRhCL-00039Q-LK; Tue, 08 Mar 2022 16:16:50 -0500
Received: from [2607:f8b0:4864:20::12a] (port=40642
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRhCJ-0005wD-V0; Tue, 08 Mar 2022 16:16:49 -0500
Received: by mail-il1-x12a.google.com with SMTP id i1so107134ila.7;
 Tue, 08 Mar 2022 13:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YwKpku3BVx+BrgAqGnfP+BDFhVYHBi8pIul22C+zMZM=;
 b=UNccynrhK9DcEAbgZExCRA3zx29ztNaQv+A/p7fDBi4eQKSVSbBBYAxscazSrBgb/6
 7/loHmeQAqLmcm5RfHJvbixZfqU1yVFHQFah9OpoUcZYRfzVJNCR+TWs1hyYrIHKOLcx
 NWpbeBni4s3sEfNwdKkgUz5HApfWEJ397BPPJ3lENtI8GLder+CHlqCDoMgIV+j4pXzg
 NF76YSqugr2pEvGZcWAd4Ot7UJ4KtKaKVJJccF3Xl3U5FymSBI2SO3ALDHMri+nK4v5C
 qOiz9fAIT+66uo+lsRwgIAyHKi6wXtU37Io9tzsHfSF4qlQRiNI2lf5b42sk9bKmkoAp
 FPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YwKpku3BVx+BrgAqGnfP+BDFhVYHBi8pIul22C+zMZM=;
 b=O01RHhtOYA/lcuLe8d4gnKUsTK++5I/lNH0e5pcfR5PfjYSZAewlfwG+8QQl0wDkFu
 0Sr3aESFIC67/bbu3gntsIgJ07HhyYdBqyIcIeQY7TAfP/1CsfUrcqqZJDc4PmHCzGIn
 vMXUB6v6VrmjEA/tbR/wvI/YVZU31qAXoF8ap3wtw7LSPA/TUjtyHShSjug0vD0yv84T
 49wPrLEf8fnwPCZLkbBYLg/VVei9EQfYfI+pqiKH0FI/LjFUlVVEPVxoJp7T/dgiHJ3F
 pJl+C7PIMkdbGZPNad8TK+dW/7VOYMVZA+8GDrCm+saHzund4JXCgj+yjD257X34mDZm
 SR7Q==
X-Gm-Message-State: AOAM533e/GLCC+CCoKBq8K0gSl+ycMMUUO50tsEL1lKC1ZBqTeO9iQbW
 47VlofNs+matjjfCDHBbt9nsmdKM/sdODR/yPIk=
X-Google-Smtp-Source: ABdhPJwJ9CaEFrvfP33hg1bepql46IxvGDwUq3+z5MJhUv5QkoZWsxdQe1j9Z6qu2zxHPJB3b56X757OrdZBcQ1ffPY=
X-Received: by 2002:a92:d80c:0:b0:2c2:c40c:7bd4 with SMTP id
 y12-20020a92d80c000000b002c2c40c7bd4mr17183247ilm.310.1646774206466; Tue, 08
 Mar 2022 13:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20220308150207.2546272-1-peter.maydell@linaro.org>
In-Reply-To: <20220308150207.2546272-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Mar 2022 07:16:20 +1000
Message-ID: <CAKmqyKMs72r7Ccii87Qp90GmDz09LerbS3DLSoTnKzX0tDQJqg@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 9, 2022 at 1:07 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
> own class struct, but forgot to update the TypeInfo::class_size
> accordingly.  This meant that not enough memory was allocated for the
> class struct, and the initialization of xcdc->read in the class init
> function wrote off the end of the memory. Add the missing line.
>
> Found by running 'check-qtest-aarch64' with a clang
> address-sanitizer build, which complains:
>
> ==2542634==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61000000ab00 at pc 0x559a20aebc29 bp 0x7fff97df74d0 sp 0x7fff97df74c8
> WRITE of size 8 at 0x61000000ab00 thread T0
>     #0 0x559a20aebc28 in xlnx_csu_dma_class_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../hw/dma/xlnx_csu_dma.c:722:16
>     #1 0x559a21bf297c in type_initialize /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:365:9
>     #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
>     #3 0x7f09bcb641b7 in g_hash_table_foreach (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x401b7)
>     #4 0x559a21bf3c27 in object_class_foreach /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1092:5
>     #5 0x559a21bf3c27 in object_class_get_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1149:5
>     #6 0x559a2081a2fd in select_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:1661:24
>     #7 0x559a2081a2fd in qemu_create_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:2146:35
>     #8 0x559a2081a2fd in qemu_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:3706:5
>     #9 0x559a20720ed5 in main /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/main.c:49:5
>     #10 0x7f09baec00b2 in __libc_start_main /build/glibc-sMfBJT/glibc-2.31/csu/../csu/libc-start.c:308:16
>     #11 0x559a2067673d in _start (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xf4b73d)
>
> 0x61000000ab00 is located 0 bytes to the right of 192-byte region [0x61000000aa40,0x61000000ab00)
> allocated by thread T0 here:
>     #0 0x559a206eeff2 in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xfc3ff2)
>     #1 0x7f09bcb7bef0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
>     #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
>
> Fixes: 00f05c02f9e7342f ("hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xlnx_csu_dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 84f782fcdc0..60ada3286b4 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -744,6 +744,7 @@ static const TypeInfo xlnx_csu_dma_info = {
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(XlnxCSUDMA),
>      .class_init    = xlnx_csu_dma_class_init,
> +    .class_size    = sizeof(XlnxCSUDMAClass),
>      .instance_init = xlnx_csu_dma_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_STREAM_SINK },
> --
> 2.25.1
>
>

