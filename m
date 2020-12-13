Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820D2D8E82
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:08:42 +0100 (CET)
Received: from localhost ([::1]:48222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koTvN-0006fG-ID
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koTuS-00069O-Ls; Sun, 13 Dec 2020 11:07:44 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koTuQ-0001dv-P7; Sun, 13 Dec 2020 11:07:44 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5fdC-1klhxL434s-007GMr; Sun, 13 Dec 2020 17:07:38 +0100
Subject: Re: [PATCH] hw/pci-host/pam: Replace magic number by
 PAM_REGIONS_COUNT definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201202132038.1276404-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3cd6cc12-a8f4-6e95-5b51-2ae903ec3084@vivier.eu>
Date: Sun, 13 Dec 2020 17:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202132038.1276404-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6b6Xe5xqFDcF7UrLFRVaiFRWNTUMKGt/1JsH2kxu+MUsbYXNMcg
 TbmHh5gtCV36OcTixFmtnM0ETYGoV83hQHknutW1NtH2f5oGC5qKohb3B+X4M6mFmQoA63T
 W+UmVShT3IqRbLjZ1EAIDx5bKuxt4FyYpaQ6dNcisiT0hCDDtEvnG0u6SrS6NN6/5X6ONU9
 YO9LDCpwqMU2FBKhacWdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rOgZZJDrzD4=:uB1GqEU/FN10DNtcaxqNhD
 1CP41juZtJL3/Kbc2KmQJbD/onS4zSsBJEKx4/qSXAhqHUahYrH3Husn++Zc2EOOgkqg2qBU4
 hrAVioDRp12+4lyWp+1Fx66sRKbYG5B/7mu7//0agqaB8SPmcNgYSpeBjD6lPQSr3fTJ0Zevd
 KFCCD4FJ8twShPQJ2gX0q06ZKk5SMfLY5ojHWcn1YHpERkXTJNRmYCzBRcY7JSL42aCzP2EKf
 hXpOqKj8D6FkZ3hpCNALHCFZvpdwh60qiXElHGl4Vx4CRQPwIwoiFCB9bO/UEn2kfG3Ax7KDQ
 xqae8Hf4XZM0DwFru5x62ciX7bkf+BSIjOmNE4kHW5v1UB2Shx9byfsfETiQQaUozVlcOR5SW
 FbNr4/ANGmO7lWmoVCSyAwvusHBzg5FO6pNQ4Ufj8KzV96xS7a4G4WHdMP3Q8m26QkIe7isG1
 dP9m8FwxfA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/12/2020 à 14:20, Philippe Mathieu-Daudé a écrit :
> While this change helps triskaidekaphobic developers, it
> is a good practice to avoid magic values and using constant
> definitions instead.
> 
> Introduce the PAM_REGIONS_COUNT and use it. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/pci-host/i440fx.h | 2 +-
>  include/hw/pci-host/pam.h    | 2 ++
>  include/hw/pci-host/q35.h    | 2 +-
>  hw/pci-host/pam.c            | 2 +-
>  hw/pci-host/q35.c            | 2 +-
>  5 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index 6c16eaf876d..24fd53942ca 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -29,7 +29,7 @@ struct PCII440FXState {
>      MemoryRegion *system_memory;
>      MemoryRegion *pci_address_space;
>      MemoryRegion *ram_memory;
> -    PAMMemoryRegion pam_regions[13];
> +    PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
>      MemoryRegion smram_region;
>      MemoryRegion smram, low_smram;
>  };
> diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
> index fec5cd35d60..c1fd06ba2ae 100644
> --- a/include/hw/pci-host/pam.h
> +++ b/include/hw/pci-host/pam.h
> @@ -80,6 +80,8 @@
>  #define SMRAM_C_BASE_SEG_MASK  ((uint8_t)0x7)
>  #define SMRAM_C_BASE_SEG       ((uint8_t)0x2)  /* hardwired to b010 */
>  
> +#define PAM_REGIONS_COUNT       13
> +
>  typedef struct PAMMemoryRegion {
>      MemoryRegion alias[4];  /* index = PAM value */
>      unsigned current;
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index bbb95817656..ab989698ef8 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -44,7 +44,7 @@ struct MCHPCIState {
>      MemoryRegion *pci_address_space;
>      MemoryRegion *system_memory;
>      MemoryRegion *address_space_io;
> -    PAMMemoryRegion pam_regions[13];
> +    PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
>      MemoryRegion smram_region, open_high_smram;
>      MemoryRegion smram, low_smram, high_smram;
>      MemoryRegion tseg_blackhole, tseg_window;
> diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
> index a4962057833..454dd120db9 100644
> --- a/hw/pci-host/pam.c
> +++ b/hw/pci-host/pam.c
> @@ -62,7 +62,7 @@ void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
>  
>  void pam_update(PAMMemoryRegion *pam, int idx, uint8_t val)
>  {
> -    assert(0 <= idx && idx <= 12);
> +    assert(0 <= idx && idx < PAM_REGIONS_COUNT);
>  
>      memory_region_set_enabled(&pam->alias[pam->current], false);
>      pam->current = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index b67cb9c29f8..2eb729dff58 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -641,7 +641,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
>      init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
>               mch->pci_address_space, &mch->pam_regions[0],
>               PAM_BIOS_BASE, PAM_BIOS_SIZE);
> -    for (i = 0; i < 12; ++i) {
> +    for (i = 0; i < ARRAY_SIZE(mch->pam_regions) - 1; ++i) {
>          init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
>                   mch->pci_address_space, &mch->pam_regions[i+1],
>                   PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


