Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D44FDF51
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:17:34 +0200 (CEST)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFSf-0007wu-Sb
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neFOV-0004lk-Oq
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neFOR-0001LM-6f
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649765589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wirn5zzjyIvvN3s7CdHa+uGh/Gz76j4F968yOTCY2Fk=;
 b=VNgA5yp5C9JgLGn8CpS2UuNQ4IDoBEEalLzx0MfMs7/FKCES/NwnNHremVMZ7moDdSKzMJ
 YavGi9YVjkzitHVuqeaCn1e5Fv/WiB6pm8iNf/maVjXuBCyzw6MBlAjUWFX09C+pFRwTqQ
 D3TqSab2thhJ+UfC67lJlMAJdDX6T4Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-4Ln06FPjNH2K_hGyHfentQ-1; Tue, 12 Apr 2022 08:13:08 -0400
X-MC-Unique: 4Ln06FPjNH2K_hGyHfentQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 105-20020adf82f2000000b002079aba50b9so2018020wrc.18
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wirn5zzjyIvvN3s7CdHa+uGh/Gz76j4F968yOTCY2Fk=;
 b=obUhRYFCWoHaKILR/3aA6l80b8BbHVBadHFfRhoG/3Kva0vcs5/qe80rxoDB1kH2HK
 F2KFY0imJ22ptrwAMn71FsxsHQAOlEJ6qlQVqPOjcjLOHnpQe7esH8RKFE4fTKdqIvcl
 xFd5dsR9UciTKszxC50UUhkNd3cHJCYud2GGdufXAN++rfypfIOfyWDTvHxw89Xh2yLY
 /zEtnYAAumaVbQNGOmHNVktHnZpBSU97zXqM8sDEvS0RqL+92uOLA44VM5VOHz0MoQCv
 of2SiXcZadBeodS2E4u0uhv3FyH5p+2vH+P58MAS4JJ1aCXNxnWbxILPH/xnm0yiFptz
 R9Zg==
X-Gm-Message-State: AOAM531/Jb8suzRYGtdGXLni9vL118YC5W1LZAp8hyQAT2bXzm8vs7uH
 GvLikpP4h1WCPfm63YU7m7ehh3xsMajtndwyjCRpK4j6NmUQsMAqOcwvP0zoOzcu0HlCk5DdQ10
 xbO3K2GfaSIXBcK4=
X-Received: by 2002:a05:6000:186f:b0:205:857d:dee8 with SMTP id
 d15-20020a056000186f00b00205857ddee8mr28855292wri.532.1649765587006; 
 Tue, 12 Apr 2022 05:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4BYPPLxvl8eCZjmRN7suoU4jyDVzWJQ6PiSOFg72SHM715ABIPokxHsYPGXfVuUQhXd3D5A==
X-Received: by 2002:a05:6000:186f:b0:205:857d:dee8 with SMTP id
 d15-20020a056000186f00b00205857ddee8mr28855276wri.532.1649765586777; 
 Tue, 12 Apr 2022 05:13:06 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm34619400wrb.8.2022.04.12.05.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:13:06 -0700 (PDT)
Message-ID: <f3adc652-6a89-a063-313a-4d87c11fc474@redhat.com>
Date: Tue, 12 Apr 2022 14:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Warn user if the vga flag is passed but no vga device is
 created
To: Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
References: <20220408104519.32931-1-gautamnagrawal@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220408104519.32931-1-gautamnagrawal@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi,

thanks for your patch, looks pretty good already, but there is a small 
issue: Try for example:

  ./qemu-system-s390x -vga none

... and it will print the warning "qemu-system-s390x: warning: No vga device 
is created", though the user only asked for no VGA device. This seems to 
happen if a machine does not have any VGA device by default, but still 
requests "-vga none" on the command line.

Some more comments below...

On 08/04/2022 12.45, Gautam Agrawal wrote:
> This patch is in regards to this issue:https://gitlab.com/qemu-project/qemu/-/issues/581#.

Better write this right in front of your Signed-off-by line:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581

... then the ticket will be automatically be closed once your patch gets merged.

> A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> has been used to track the creation of vga interface. If the vga flag is passed in the command
> line "default_vga"(declared in softmmu/vl.c) variable is set to 0. To warn user, the condition
> checks if vga_interface_created is false and default_vga is equal to 0.
> 
> The warning "No vga device is created" is logged if vga flag is passed
> but no vga device is created. This patch has been tested for
> x86_64, i386, sparc, sparc64 and arm boards.
> 
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> ---
>   hw/isa/isa-bus.c        | 1 +
>   hw/pci/pci.c            | 1 +
>   hw/sparc/sun4m.c        | 2 ++
>   hw/sparc64/sun4u.c      | 1 +
>   include/sysemu/sysemu.h | 1 +
>   softmmu/globals.c       | 1 +
>   softmmu/vl.c            | 3 +++
>   7 files changed, 10 insertions(+)

vga_interface_type is also used in hw/mips/fuloong2e.c and 
hw/xenpv/xen_machine_pv.c ... do they need a change, too?

> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 0ad1c5fd65..cd5ad3687d 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -166,6 +166,7 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
>   
>   ISADevice *isa_vga_init(ISABus *bus)
>   {
> +    vga_interface_created = true;
>       switch (vga_interface_type) {
>       case VGA_CIRRUS:
>           return isa_create_simple(bus, "isa-cirrus-vga");
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index dae9119bfe..fab9c80f8d 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2038,6 +2038,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>   
>   PCIDevice *pci_vga_init(PCIBus *bus)
>   {
> +    vga_interface_created = true;
>       switch (vga_interface_type) {
>       case VGA_CIRRUS:
>           return pci_create_simple(bus, -1, "cirrus-vga");
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 7f3a7c0027..f45e29acc8 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -921,6 +921,7 @@ static void sun4m_hw_init(MachineState *machine)
>               /* sbus irq 5 */
>               cg3_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
>                        graphic_width, graphic_height, graphic_depth);
> +            vga_interface_created = true;
>           } else {
>               /* If no display specified, default to TCX */
>               if (graphic_depth != 8 && graphic_depth != 24) {
> @@ -936,6 +937,7 @@ static void sun4m_hw_init(MachineState *machine)
>   
>               tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
>                        graphic_width, graphic_height, graphic_depth);
> +            vga_interface_created = true;
>           }
>       }
>   
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index cda7df36e3..75334dba71 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -633,6 +633,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>       switch (vga_interface_type) {
>       case VGA_STD:
>           pci_create_simple(pci_busA, PCI_DEVFN(2, 0), "VGA");
> +        vga_interface_created = true;
>           break;
>       case VGA_NONE:
>           break;
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index b9421e03ff..a558b895e4 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -32,6 +32,7 @@ typedef enum {
>   } VGAInterfaceType;
>   
>   extern int vga_interface_type;
> +extern bool vga_interface_created;
>   
>   extern int graphic_width;
>   extern int graphic_height;
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index 3ebd718e35..1a5f8d42ad 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -40,6 +40,7 @@ int nb_nics;
>   NICInfo nd_table[MAX_NICS];
>   int autostart = 1;
>   int vga_interface_type = VGA_NONE;
> +bool vga_interface_created = false;

This will trigger a warning from the scripts/checkpatch.pl script:

ERROR: do not initialise globals to 0 or NULL
#238: FILE: softmmu/globals.c:43:
+bool vga_interface_created = false;

>   Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>   int win2k_install_hack;
>   int singlestep;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 6f646531a0..cb79fa1f42 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2734,6 +2734,9 @@ static void qemu_machine_creation_done(void)
>       if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>           exit(1);
>       }
> +    if (!vga_interface_created && !default_vga) {
> +        warn_report("No vga device is created");

I'm not a native speaker, and maybe it's just a matter of taste, but I'd 
rather say it in past tense: "No VGA device has been created"

> +    }
>   }

  Regards,
   Thomas


