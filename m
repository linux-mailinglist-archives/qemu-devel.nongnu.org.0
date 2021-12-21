Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892A47C40A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:44:34 +0100 (CET)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziFc-0005eb-CY
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzi8v-0007nz-RN
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:37:37 -0500
Received: from [2607:f8b0:4864:20::52b] (port=42616
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mzi8t-00065F-10
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:37:36 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g2so10230866pgo.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0YMsnCh6ne4vA/tOYTPeYMSkixEtqed8DAD9OmvaUWg=;
 b=ednlhlygnv1Kxng4VgKo2f6Ap6Ou+7+gE/ZQSrNxATbBFdqEiSyJT+EqtFxDnhigHK
 o4nMcrKAHnS6/40Kowa1f4Zxt5TaY7PnJTzZywb4ve+EvcxpA+mpn8butNbkvPR8J8gg
 ard9cIvsOK/DonzKLF0ZPtexV3BLJdiBR0KGiVP0vYruZe8NlFRMJQLzqJkAt75Jg2EP
 In8ji5BxULAv3N8hUVSPmPTOjl/V/7acA98ML1mwDstmbp6SSP1SYXoKBxY9ANrI9/fI
 DczI9lBBmRyDOj75SiLWk0ZejWub9uUZe9Q1afzuoelFmb49TzlbCDZWzHMxspD69llg
 yg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0YMsnCh6ne4vA/tOYTPeYMSkixEtqed8DAD9OmvaUWg=;
 b=XkHr8n8saxXDaz/I0F6GgUG9H5kBq8y+mFAvP95SOGAy7ezVwnPuODydNeG1k2tDdx
 JyDTTxQZaxfu6094keBiYJmdKwFCgO69im9Ay7oe6pUL5zQG4HfzzrtpC5XR9HGU7krN
 SwL35Pw55jAomnHDu1RVH39vNC3NGOX0Jv/iJRpgOgVw4iLw81HfZCBRSPHKQ4+I1QQ8
 GqWYnv/M9/jZa+CwNRmsZ+x3GdbayvBOjvds1FX9/fXcAxFC/uALtTNoXoGLTuZ//s2l
 OBmWea7nSF2pTTzG8Vjf/AcfJgJ/ji5y3i7QNyAe7W7lycyMHApJbhZhc9goYW1j1d2N
 1D/A==
X-Gm-Message-State: AOAM53036nSOJ0/o8YSOLMv5U0cuzS9YpKRirEpP6gtAFQQ0oAHGELPV
 TrZJr+8x1Q6qMh9HmfYJxhh7/A==
X-Google-Smtp-Source: ABdhPJxHl63Uo4y0s/kbby6rR84avRqZDjnYT6HVgAFEY/ooyYWWX79knT+Z7k+WjVUQWDbhMRNA6Q==
X-Received: by 2002:a63:e34c:: with SMTP id o12mr3672864pgj.509.1640104653100; 
 Tue, 21 Dec 2021 08:37:33 -0800 (PST)
Received: from [192.168.1.6] ([203.212.240.176])
 by smtp.googlemail.com with ESMTPSA id 145sm20438455pgd.0.2021.12.21.08.37.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Dec 2021 08:37:32 -0800 (PST)
Date: Tue, 21 Dec 2021 22:07:27 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
In-Reply-To: <20211221144852.589983-1-mst@redhat.com>
Message-ID: <alpine.OSX.2.20.2112212206440.2253@athabasca.local>
References: <20211221144852.589983-1-mst@redhat.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 21 Dec 2021, Michael S. Tsirkin wrote:

> When bus is looked up on a pci write, we didn't
> validate that the lookup succeeded.
> Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> bus pointer.

Good fix. Nice catch.

>
> Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
> Cc: "Igor Mammedov" <imammedo@redhat.com>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/pcihp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 30405b5113..a5e182dd3a 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
>          }
>
>          bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
> +        if (!bus) {
> +            break;
> +        }
>          QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
>              Object *o = OBJECT(kid->child);
>              PCIDevice *dev = PCI_DEVICE(o);
> --
> MST
>
>

