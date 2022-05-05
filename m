Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773251CBEF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 00:11:58 +0200 (CEST)
Received: from localhost ([::1]:49440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmjhT-0008WT-7i
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 18:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmjgR-0007iY-1x; Thu, 05 May 2022 18:10:51 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmjgP-00025D-7C; Thu, 05 May 2022 18:10:50 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e5e433d66dso5581389fac.5; 
 Thu, 05 May 2022 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VNeVzZaGTN0kfiQq4fqEZ3QdxjtfBeGiwBCTeNU3xjU=;
 b=V7rmM0x0IMqFxzKhifJCH0sr2vjW1ThXF8Iq0ryDRvfUVUasQXegW6PDqfCbxj8Zpq
 GoIH+QLYKc0n7/ltyBftyqmfNSb2FnB0onIsokTmmLQoMyUMDdNybGTYMGo7gzX2mqA1
 qsLO0oLunrGt6yHpyAcLzpBpV1Et8TYnBMAY15rbDzLv/7ej6fGtn+91yd5QVtJr6CRe
 l7vfsfR3XFh9vvROAfWJ9rrMMLoP6mck5cYdEJF2+PzS0zZpLzk0g8rkxbmbEgjnMEN5
 yVLnrdLxrSScxlGiCCQ1CC/WLMO0D7PrFfKLB59x4Wrp5rbUmwF/18QfH//P7C0zr1pN
 sfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VNeVzZaGTN0kfiQq4fqEZ3QdxjtfBeGiwBCTeNU3xjU=;
 b=iZW9AOaKDTFKyDF+PNDURDCPhX0W9eBaAAE41nPtxSa5LvA/DQwSVZ5xV3KcsuRFLR
 +QfYn5y+U3cTbDegSts0fCmX7hw1Ks1cjHIVHuW4Xpxx/0SD5S7k52u7XKfOKSmuLVzC
 z6TRDJheJHKekgGYkmmcw5gMRhSX/516PQUPL/4LbVRKRCaEXLLvmTcUWAQLmDh9sTmN
 XqRZqR17TIZbgsacVQ1NdOMMT54FDEUG7trYZXHXt8qUVM5dN3EWnLdSTVdDmailnQyl
 Fvu9h6h/pYQ/n8nk9s5X4OcIg4nuWidR2pu6BdqmhaTtPD8zkS14XfwgINRrEg+54Dqh
 YFKg==
X-Gm-Message-State: AOAM531hVgMWtCjMANP3n/e9I/6Q/Tl09dPfB/hTrKH34fKRqOxfgq+L
 I1nSts8iwBGICvIDg5osT5RLIfWeo1Q=
X-Google-Smtp-Source: ABdhPJz5fb1QzWZfvs3sp0SdVWVY+nZpFRKPLRUUcJQwhGDbHmUJaMNz9WWpK/b5Ugwm0oHgnkjwsQ==
X-Received: by 2002:a05:6870:338d:b0:ed:aed0:1aa6 with SMTP id
 w13-20020a056870338d00b000edaed01aa6mr170480oae.18.1651788647364; 
 Thu, 05 May 2022 15:10:47 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 g93-20020a9d2de6000000b0060603221240sm1046062otb.16.2022.05.05.15.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 15:10:46 -0700 (PDT)
Message-ID: <40654c7a-7ddf-f737-7886-ecab48e8c2cc@gmail.com>
Date: Thu, 5 May 2022 19:10:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] pseries: allow setting stdout-path even on machines with
 a VGA
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220505092656.728925-1-pbonzini@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220505092656.728925-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


On 5/5/22 06:26, Paolo Bonzini wrote:
> -machine graphics=off is the usual way to tell the firmware or the OS that the
> user wants a serial console.  The pseries machine however does not support
> this, and never adds the stdout-path node to the device tree if a VGA device
> is provided.  This is in addition to the other magic behavior of VGA devices,
> which is to add a keyboard and mouse to the default USB bus.
> 
> Split spapr->has_graphics in two variables so that the two behaviors can be
> separated: the USB devices remains the same, but the stdout-path is added
> even with "-device VGA -machine graphics=off".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/ppc/spapr.c         | 12 ++++++++----
>   include/hw/ppc/spapr.h |  2 +-
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 22569305d2..05eacf29b8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1066,7 +1066,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
>               _FDT(fdt_setprop_string(fdt, chosen, "qemu,boot-device", boot_device));
>           }
>   
> -        if (!spapr->has_graphics && stdout_path) {
> +        if (!spapr->want_stdout_path && stdout_path) {

hmmmmm I don't think this is correct. You defined 'spapr->want_stdout_path' in
spapr_machine_init() to be true if (1) there is no VGA or (2) graphics=off. But
then you're writing the DT at this point by checking !spapr->want_stdout_path.

I guess this is doing the opposite of what you intended. In fact, with this patch
as is, with this test case:


$ ./qemu-system-ppc64 -machine pseries --nodefaults \
-chardev pty,id=charserial0 \
-device spapr-vty,chardev=charserial0,id=serial0,reg=0x70000000 \
-machine dumpdtb=fdt.dtb \
-device VGA -machine graphics=off
char device redirected to /dev/pts/6 (label charserial0)
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on
qemu-system-ppc64: info: dtb dumped to fdt.dtb. Exiting.

$ dtc -q -I dtb -O dts fdt.dtb | grep stdout
$


'stdout-path' isn't being written using -machine graphics=off.


Removing the negation seems to do what you want:

-        if (!spapr->want_stdout_path && stdout_path) {
+        if (spapr->want_stdout_path && stdout_path) {



$ ./qemu-system-ppc64 -machine pseries --nodefaults \
-chardev pty,id=charserial0 \
-device spapr-vty,chardev=charserial0,id=serial0,reg=0x70000000 \
-machine dumpdtb=fdt.dtb \
-device VGA -machine graphics=off
char device redirected to /dev/pts/6 (label charserial0)
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on
qemu-system-ppc64: info: dtb dumped to fdt.dtb. Exiting.
$ dtc -q -I dtb -O dts fdt.dtb | grep stdout
		stdout-path = "/vdevice/vty@70000000";
		linux,stdout-path = "/vdevice/vty@70000000";



Thanks,


Daniel


>               /*
>                * "linux,stdout-path" and "stdout" properties are
>                * deprecated by linux kernel. New platforms should only
> @@ -2711,6 +2711,7 @@ static void spapr_machine_init(MachineState *machine)
>       const char *kernel_filename = machine->kernel_filename;
>       const char *initrd_filename = machine->initrd_filename;
>       PCIHostState *phb;
> +    bool has_vga;
>       int i;
>       MemoryRegion *sysmem = get_system_memory();
>       long load_limit, fw_size;
> @@ -2949,9 +2950,12 @@ static void spapr_machine_init(MachineState *machine)
>       }
>   
>       /* Graphics */
> -    if (spapr_vga_init(phb->bus, &error_fatal)) {
> -        spapr->has_graphics = true;
> +    has_vga = spapr_vga_init(phb->bus, &error_fatal);
> +    if (has_vga) {
> +        spapr->want_stdout_path = !machine->enable_graphics;
>           machine->usb |= defaults_enabled() && !machine->usb_disabled;
> +    } else {
> +        spapr->want_stdout_path = true;
>       }
>   
>       if (machine->usb) {
> @@ -2961,7 +2965,7 @@ static void spapr_machine_init(MachineState *machine)
>               pci_create_simple(phb->bus, -1, "nec-usb-xhci");
>           }
>   
> -        if (spapr->has_graphics) {
> +        if (has_vga) {
>               USBBus *usb_bus = usb_bus_find(-1);
>   
>               usb_create_simple(usb_bus, "usb-kbd");
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 14b01c3f59..072dda2c72 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -194,7 +194,7 @@ struct SpaprMachineState {
>       Vof *vof;
>       uint64_t rtc_offset; /* Now used only during incoming migration */
>       struct PPCTimebase tb;
> -    bool has_graphics;
> +    bool want_stdout_path;
>       uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
>   
>       /* Nested HV support (TCG only) */

