Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDA11FC7DE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 09:48:54 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlSoX-0001SU-PT
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 03:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlSlb-0006vz-Py
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 03:45:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25841
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlSla-0006Es-3P
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 03:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592379949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hfVm7KH6sO+JCxdg4cby3qWBPDu2eEZEaew9waJRJU8=;
 b=FqhTzYuuA1IFqeuOeSWHNS0riJeAI/s5cWCLPnBX76n/i7Pkjnjiwpqrbn25Zw9a84xT09
 2q4DagQupoKG5tZju7+kD5DZkPSPHIkuhNRz6okQ7qwdmNNt4U5bDhzdaZU52SrozXUuFq
 ZRUnZmFK9EKSpNf3X4rgL7HGY8ThjCs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-xYSSGJ45PK-H_lZhtZiEzg-1; Wed, 17 Jun 2020 03:45:46 -0400
X-MC-Unique: xYSSGJ45PK-H_lZhtZiEzg-1
Received: by mail-wr1-f72.google.com with SMTP id m14so619541wrj.12
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 00:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hfVm7KH6sO+JCxdg4cby3qWBPDu2eEZEaew9waJRJU8=;
 b=ks3eKg/gTjt7yYUzzSJ1NyX944YKHxoGIP5NQVYZZkAn2J0kQPNPQqq2p/SN9ATHBc
 nivV7Fxvr9sH1a0cgiVBt5POL1GE5EDhQo9eOshkesprKSrxJPyeez1qpOl5tMv+PzDX
 onR+df3xZtqdd3CB2XTFhMgKKbct/Fj1nRTRphZ1TxRds4ESuCE4d3AnnCkJbGWQ+jX/
 IRvAgpXvJaGfY/CGkFk37jjDtKItex2efBGpqSDUwxBOEQED+PSdwaM0M60Aoc3XAHe9
 +DAAOnM4SaDCfLcJoFzlI2sriBgfUs4Zx4d2jnIn28p+k42xJ3/YQB/TOCPmnI5U9+um
 Q/2w==
X-Gm-Message-State: AOAM531e2W13dlesUBgAgz7xMSpnD4rKHboYf9T4KMiFj4xchsovgkLO
 yuXY8dvM75xKzWmcF7ejxe8DISpB2qS2odJF6ZYkpKRaBgULrSu0hdV3foBDAlX8QnRC9dlXpAW
 gCJpWnY/TZ+jsGGI=
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr6934199wrx.411.1592379945458; 
 Wed, 17 Jun 2020 00:45:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGvb7p9N6LdXuL0MxX00ApyS3ACES/9tNEaz+Cf/CTsfH+BbyRd70umvYlZZIVxs2RJwInIw==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr6934174wrx.411.1592379945262; 
 Wed, 17 Jun 2020 00:45:45 -0700 (PDT)
Received: from [192.168.1.37] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id b143sm7147421wme.20.2020.06.17.00.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 00:45:44 -0700 (PDT)
Subject: Re: [PATCH 6/6] spapr_pci: add spapr msi read method
To: P J P <ppandit@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200617053934.122642-1-ppandit@redhat.com>
 <20200617053934.122642-7-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a16a0db2-3177-6923-7430-32ce35ad8349@redhat.com>
Date: Wed, 17 Jun 2020 09:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200617053934.122642-7-ppandit@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/20 7:39 AM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> Add spapr msi mmio read method to avoid NULL pointer dereference
> issue.
> 
> Reported-by: Lei Sun <slei.casper@gmail.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/ppc/spapr_pci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 83f1453096..d4193be205 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -52,6 +52,7 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/numa.h"
> +#include "qemu/log.h"
>  
>  /* Copied from the kernel arch/powerpc/platforms/pseries/msi.c */
>  #define RTAS_QUERY_FN           0
> @@ -738,6 +739,12 @@ static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
>      return route;
>  }
>  
> +static uint64_t spapr_msi_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
> +    return 0;
> +}
> +
>  /*
>   * MSI/MSIX memory region implementation.
>   * The handler handles both MSI and MSIX.
> @@ -756,7 +763,7 @@ static void spapr_msi_write(void *opaque, hwaddr addr,
>  
>  static const MemoryRegionOps spapr_msi_ops = {
>      /* There is no .read as the read result is undefined by PCI spec */

We probably want to implement .accepts handler instead.

> -    .read = NULL,
> +    .read = spapr_msi_read,
>      .write = spapr_msi_write,
>      .endianness = DEVICE_LITTLE_ENDIAN
>  };
> 


