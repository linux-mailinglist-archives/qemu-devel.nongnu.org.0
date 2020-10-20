Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E928BAA3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:19:30 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRyfh-0005J1-Ma
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRydz-0003ui-ID; Mon, 12 Oct 2020 10:17:43 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRydx-0004t1-Ox; Mon, 12 Oct 2020 10:17:43 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyK5K-1kFy4l2oo8-00ykc4; Mon, 12 Oct 2020 16:17:39 +0200
Subject: Re: [PATCH] hw/acpi/piix4: Rename piix4_pm_add_propeties() to
 piix4_pm_add_properties()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160165476743.57452.2128307974125615413.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <391be9a0-2b6f-b0dc-b7ee-0da6f58b2e40@vivier.eu>
Date: Mon, 12 Oct 2020 16:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <160165476743.57452.2128307974125615413.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9xfQFi1vQbR6fNOVKdWd81zRYA5pMhSb2ZnWnww2+KMojVhSayB
 fbn/ARjNgt5eXNqPJAEMPLmN6xU0xqO4EmxRqpjb8uqNQ5cK+Os2wLt9eI++MOc/7ZwZxyo
 e9PLvpHyPdd1gxNEmm6zbk67I74KICahwUQoCzsFbEtHCskOif5Yi18XZTst+nTvdKxnzVi
 wIgNuo6EQx8rf37JhOa3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DRCWCpx24Tc=:JDo3jU+vAXLbW1dZThQRND
 If1tEAn5E5PT0ccsNqApgiyMFA1VPyWl4PkJ+yRGL6VhyvaXaEbWm9NGgZPqRvrZbgqmHcyeA
 d7b9P77M79amPjvjS4XULpV3x3K2QAGmkQAVyh3p0BjzxMzumjW85iMNRlvNFe+jd+z5KTmRe
 ngt0h8O3BWicFttdxAe1QCpWCwUM5qdOgi0R848yoUqzGcrBZtQ7TlTvH9TGA9rpumsudDsfR
 Tr2qtcJV7r9TpLjmuHz3fDtUtd9MufrscjWkxAvMDovThaXgU5YPB7hb/uObmPLe13oredQTd
 FPhw5koP0rN9FKd9EzsEQMmAVz/Scf2/7FpCB+cWOfrBt9wQV5f/E5n8q20HucrhYVrKlmygc
 E01T881LFpUiYg54wHLtQQM9fpRP376ijyIcohcge41AmaAiAwHVxQ2AmbcV71PW9fmIdPxV4
 8bhg6JrjPOKJANfLpIDKDfCNnQqFq37yDQBLwlmRyUq4LhS/zcSafQuEZmA+LiBe+R1fTLliQ
 8D5rvpqBIoaQGGzoaSibUM5h6TuHA95vaL8pXel87DS6PbkCXIWmHk/HN4Z4Hy4wITTqzbuad
 H63H33kzYHXXNFfdUGMwKMWezmdhLJcmjzUwQiTZV0ciZH1o6M4c+c8VYMOH7KHcBVqI2GUbt
 /mfOZou4a4z5yuR5aYTGfvCJnNPcMSljIi8fxvspfMp1y/grQVYkO5W8DWuYnphzayufn4bFs
 mi9Ps/3kSExrbhcmlphxNwwtiLNeVoVyoAHjnQWUOGb+LJw7/ktr3Ni5kZ7gl0sJAixDNqVzm
 Qhl6uxBpimKn4NFJvxXUDLf3k7+U4qXYotmeptmLR+P81THaSVqRiY6tcvO63YAogV4NiTx
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:16:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/10/2020 à 18:06, Greg Kurz a écrit :
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/acpi/piix4.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 894d357f8c35..67a1ea41914f 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -437,7 +437,7 @@ static void piix4_pm_machine_ready(Notifier *n, void *opaque)
>          (memory_region_present(io_as, 0x2f8) ? 0x90 : 0);
>  }
>  
> -static void piix4_pm_add_propeties(PIIX4PMState *s)
> +static void piix4_pm_add_properties(PIIX4PMState *s)
>  {
>      static const uint8_t acpi_enable_cmd = ACPI_ENABLE;
>      static const uint8_t acpi_disable_cmd = ACPI_DISABLE;
> @@ -509,7 +509,7 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>                                     pci_get_bus(dev), s);
>      qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
>  
> -    piix4_pm_add_propeties(s);
> +    piix4_pm_add_properties(s);
>  }
>  
>  I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
> 
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


