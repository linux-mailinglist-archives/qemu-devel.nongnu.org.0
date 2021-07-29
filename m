Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E396F3DA3B2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:15:23 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95sg-0008GS-LZ
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m95rK-0007ZP-St
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:13:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m95rI-0001Cq-Gz
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:13:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id mt6so10279745pjb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=l9GAwyKQrvlLtyEKy0KI+tA981SdIFXs3UU0eM3KcTM=;
 b=LWSlHhCNi1I1lNBPrJVW3NH9r/fO5RTFWvg4zmx1TIvDyN3gFSzZWI6QtECrwnrS52
 njE7c2mjqzzaadcfw4tE+T4HdQBK5gePJejmw5l8TypnwzW2JWFel7l68nw5SLgu8Fzu
 5eA4VYTf7ITlGVYFe2VkpMOjCsD5BGUu4lC/jtj1tnmawxvdujzxJmdCbSSDmZekcXdq
 dawPMWCd90bcikjzGbHc+XIxtkVV3dKyCoo2Lk7QksZ96IhaaRSx4Bnc8GipBZDt7Ysu
 +3KfljrZqktwf2Havxfl6f0X9gF6tY9dJMWMbVr7oltKRPFClBYpluyi1nGumPcX+NNd
 4ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=l9GAwyKQrvlLtyEKy0KI+tA981SdIFXs3UU0eM3KcTM=;
 b=M0/4Fo/KirUGCkjvLzmYkosNc6yhk9hYkUrxsadHqpf4zO2PsrHkctDv5ZwblVWBy7
 BQ6A9Gm9rstKLOR0uB4qR5cUGiAj+SVxxC7kX5ECv/+2iexeF7y8/207pW68amO9CzGu
 guLTZrVHlHRhfIQmhSKS0vRi/kKy94g8c9f8s/x4teZbZh33Rtr1eKCQLi08eV0qoOcW
 yjiHLzviNPnkPR5SkwRCDVh7wixakaTN3c0RXXK2eN/ZbAgC0JtAIEEqLxsVBb48wmEB
 fcBzhxznwLgPKPCT6SM3tY8b80QcoKaT6eeakA71/JuZrj8XWc6sYnZVxRuDnm7YlXgm
 N+nA==
X-Gm-Message-State: AOAM533v34nIdbUEfXO22celaU08CEQsD3rL0TbYFEtscqklcqBqYnx1
 9eTcNDq75ZcwVycZ8n/MFxPtrQ==
X-Google-Smtp-Source: ABdhPJxHuWVXPVPGHeyRzYLKpTzlnWC07N/MY/616Eo+iFrSUhxTbGHxgqRdfZyct2XuXft41S9Qgg==
X-Received: by 2002:a17:902:da8d:b029:12c:5241:c24e with SMTP id
 j13-20020a170902da8db029012c5241c24emr4545462plx.35.1627564434960; 
 Thu, 29 Jul 2021 06:13:54 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.235])
 by smtp.googlemail.com with ESMTPSA id n35sm3879432pgb.90.2021.07.29.06.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 06:13:54 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 29 Jul 2021 18:43:48 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/ich9: add comment explaining an argument to
 acpi_pcihp_reset call
In-Reply-To: <20210727044546.246363-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2107291843440.426350@anisinha-lenovo>
References: <20210727044546.246363-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ...

On Tue, 27 Jul 2021, Ani Sinha wrote:

> acpi_pcihp_reset() call from ich9/pm_reset() passes an unconditional truth value
> as the second argument. Added a commnet here to explain the reason why the
> argument is being passed unconditionally.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/ich9.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 778e27b659..b2e3c46075 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -281,6 +281,11 @@ static void pm_reset(void *opaque)
>      pm->smi_en_wmask = ~0;
>
>      if (pm->use_acpi_hotplug_bridge) {
> +        /*
> +         * PCI Express root buses do not support hot-plug, for
> +         * details see docs/pcie.txt. Hence, the second argument
> +         * is unconditionally true.
> +         */
>          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>      }
>
> --
> 2.25.1
>
>

