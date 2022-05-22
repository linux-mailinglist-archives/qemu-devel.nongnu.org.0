Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E243953066E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:13:53 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstph-00058o-0G
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstne-0004SA-MY
 for qemu-devel@nongnu.org; Sun, 22 May 2022 18:11:46 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstnd-0003sE-6o
 for qemu-devel@nongnu.org; Sun, 22 May 2022 18:11:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id s14so11521625plk.8
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lga7o0Pe7CNNrgnPdrWE6Kz90wlQTc5KzU/OKooj1wo=;
 b=T01EP2LF9PTEOH7TMjsMe1qXeXM/nKs1wrwQFRQxcRSF9IKJzq0jf1j/cxNocErZz5
 XzLY3soGlPica0uennFkr/X52PX2Zs/xc7ScDjavdNY0kiMZhIp2UdMBHVqsTHo27Van
 cCScDzuBYV4eMfjWwO1KBQuI7ta9064/0yhHmH9Fph/QAd/5EkspP71XLH4Z9e3vPfry
 WQY6za8jbxaTILzfJxqqrC/+92vPZDHFhk0tosrAdOfOTFRIJv41qSLuIC5yM7sYU/Y3
 zWBw9WtQIBKSwhcMQ7qC68cMCX/kHw4SWlzJHQLXgAL+ng47QO3/qgSpoCxoQEAWooyA
 iI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lga7o0Pe7CNNrgnPdrWE6Kz90wlQTc5KzU/OKooj1wo=;
 b=zxxh/mV/jNGLMBglu4VeyfR9H7E/k/wqmYdoqOE1cLd8ZaPQUKIcfeNAaOyjwl905B
 rqS5c6GxpzgTmiHQk0jQbo5eG+xO+GLSkXOq5AUmDQSkrIL2K71e+F1pvHfnVw6DmT9o
 VyXtmoRqtAKWp3mMq227OhqhPGZjOTPR1ECLyczN6kyIjJYik9Tf3G4m7D0ahDgWw36K
 Xh/lHSEhVN9mRL36MpZyoUfw0QaoGEhTDcF2Xk4c1WJGElJaQZ309VVHSSpcNksMacZ2
 QRirauLWC8oh/Y4DD/F0CdeCOKYPb5Q1BIK9G8vIyxRp/+ia7JVzIdjx1xEK+RIIh1ed
 g/eQ==
X-Gm-Message-State: AOAM532jRCJ2/grkSmOY3LEA93L9dDrr5N7XZWGXxIjDBb6ghA9E0HkI
 67KKpbcUQP659Ef7UoT1pw4=
X-Google-Smtp-Source: ABdhPJxfKOv7DZ+rb/OP2g9hdH8/EvoJ5h4JRS34N4BEP8GS9aOH9CFV2Mt5TuDRVeNQyYQFCfWJxg==
X-Received: by 2002:a17:902:8602:b0:162:eaf:3630 with SMTP id
 f2-20020a170902860200b001620eaf3630mr7311237plo.118.1653257503654; 
 Sun, 22 May 2022 15:11:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a170902f11500b0015e8d4eb1c6sm3601390plb.16.2022.05.22.15.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:11:43 -0700 (PDT)
Message-ID: <63dfb837-99e6-922f-f172-9b4796cad16a@amsat.org>
Date: Mon, 23 May 2022 00:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/6] hw/acpi/viot: build array of PCI host bridges before
 generating VIOT ACPI table
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, jean-philippe@linaro.org,
 qemu-devel@nongnu.org
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518110839.8681-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/5/22 13:08, Mark Cave-Ayland wrote:
> Perform the generation of the VIOT ACPI table in 2 separate passes: the first pass
> enumerates all of the PCI host bridges and adds the min_bus and max_bus information
> to an array.
> 
> Once this is done the VIOT table header is generated using the size of the array
> to calculate the node count, which means it is no longer necessary to use a
> sub-array to hold the PCI host bridge range information along with viommu_off.
> 
> Finally the PCI host bridge array is iterated again to add the required entries
> to the final VIOT ACPI table.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
>   1 file changed, 24 insertions(+), 18 deletions(-)

> @@ -44,8 +43,7 @@ static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
>   /* Build PCI range for a given PCI host bridge */
>   static int pci_host_bridges(Object *obj, void *opaque)
>   {
> -    struct viot_pci_ranges *pci_ranges = opaque;
> -    GArray *blob = pci_ranges->blob;
> +    GArray *pci_host_ranges = opaque;
>   
>       if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>           PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> @@ -55,9 +53,11 @@ static int pci_host_bridges(Object *obj, void *opaque)
>   
>               pci_bus_range(bus, &min_bus, &max_bus);
>   
> -            build_pci_host_range(blob, min_bus, max_bus,
> -                                 pci_ranges->output_node);
> -            pci_ranges->count++;
> +            struct viot_pci_host_range pci_host_range = {

Nitpicking, const?

> +                .min_bus = min_bus,
> +                .max_bus = max_bus,
> +            };
> +            g_array_append_val(pci_host_ranges, pci_host_range);
>           }
>       }

