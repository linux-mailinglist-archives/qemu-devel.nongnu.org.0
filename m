Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C369956A321
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:07:25 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9RE4-0004RC-TJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9RCQ-0003VR-KX
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9RCN-0000Zh-Vk
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657199139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83al0fSsIkE1ZHUu4nLkIr0Rd+gHfSr00x24X/8GYvg=;
 b=G+uEZH4NA2aeglX3mQdc6ICiN+qCFZO8yQ1kVU2rt0mug6S45df3hWLDUf/6Pfh89HD/52
 Tans5oBduz6dvUOIpEaoo0dwgfZf3xOb0rKpIdh2tJ7xyZmgxs5gHbYEyw8Y72Ow1/3GD7
 JxgXuMGf03qRO2RwbKpA+laecDgR7Mc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-S-AjqD7GOyW8D_ei5YIEPQ-1; Thu, 07 Jul 2022 09:05:37 -0400
X-MC-Unique: S-AjqD7GOyW8D_ei5YIEPQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq41-20020a1709073f2900b00722e5ad076cso4805652ejc.20
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 06:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83al0fSsIkE1ZHUu4nLkIr0Rd+gHfSr00x24X/8GYvg=;
 b=63N3JXaqmIvRALpDzg8eAogIzD4fGK5KjuEgoTKhpPuW8x8iEVdfMi7O3CuILrI8AG
 izR9CtMVGEbr1Y4HDonuGUqoHuQ1eE5++NU8hQVJ0uRsGSB0ndFeeoEXIjqI9BC/bv1r
 zMMc3x+PbQk9VllIQxUT5rk8INAKGb7oos1fnT9pdCLo0fSSHjNMn1gd6smKnRzVS7qN
 sNZWoFAD29on4TK17WK5ZThDF68+PnJprD4sJC0zZ6m5iWSdpbSEhLr+lehPnq6leihG
 21hG1VlE6NZ3YOBwwlLlHnbd5TcxEeFYklNS1Wsbr68MCqsZTEbzypSbKEleJNbzAOga
 Zp8Q==
X-Gm-Message-State: AJIora9dYThWljiTSPtaGGTjEaqui1qWr2ZhlRCSZd0IWwd8/hz+CNhQ
 e0I9h8gQ4enGXiryNywgfNtFRpi1RHZYNI++yVwrG1Z9T1Bice3y/z4xzmhtp7Bz+qKdciNZZAW
 CqIDPgC3zC5J8yd8=
X-Received: by 2002:a17:907:a077:b0:72b:dc1:c88a with SMTP id
 ia23-20020a170907a07700b0072b0dc1c88amr3317278ejc.130.1657199136180; 
 Thu, 07 Jul 2022 06:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voc+0hEENUw26KH2GcA3T9eFbEnUOs43x1uGWAZ/5jzVelS+yCuWd2ju8bsw97tnMzl5YWdw==
X-Received: by 2002:a17:907:a077:b0:72b:dc1:c88a with SMTP id
 ia23-20020a170907a07700b0072b0dc1c88amr3317242ejc.130.1657199135915; 
 Thu, 07 Jul 2022 06:05:35 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906292900b00722e50dab2csm2177692ejd.109.2022.07.07.06.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 06:05:35 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:05:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 07/10] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
Message-ID: <20220707150533.68892c2e@redhat.com>
In-Reply-To: <20220701161014.3850-8-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-8-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri,  1 Jul 2022 17:10:11 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> This in preparation to allow pc_pci_hole64_start() to be called early
> in pc_memory_init(), handle CXL memory region end when its underlying
> memory region isn't yet initialized.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8655cc3b8894..d6dff71012ab 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -857,6 +857,19 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>                  start = fw->mr.addr + memory_region_size(&fw->mr);
>              }
>          }
> +    } else {


> +        hwaddr cxl_size = MiB;
> +
> +        start = pc_get_cxl_range_start(pcms);
> +        if (pcms->cxl_devices_state.fixed_windows) {
> +            GList *it;
> +
> +            start = ROUND_UP(start + cxl_size, 256 * MiB);
> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +                CXLFixedWindow *fw = it->data;
> +                start += fw->size;
> +            }
> +        }

/me wondering if this can replace block above that supposedly does
the same only using initialized cxl memory regions?

>      }
>  
>      return start;


