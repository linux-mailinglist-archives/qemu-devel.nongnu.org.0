Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D4492076
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:44:39 +0100 (CET)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9jAU-0004fW-2y
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9itx-0007mG-Hi; Tue, 18 Jan 2022 02:27:34 -0500
Received: from [2a00:1450:4864:20::32b] (port=54948
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9itw-00048E-3s; Tue, 18 Jan 2022 02:27:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so25540557wmg.4;
 Mon, 17 Jan 2022 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d74k9kYwoWMSqApFDCfao3RK7yeHeLhpUIUocQOy9KQ=;
 b=NOIxIOuYb/E1KeHRQKGAswqJtFQkVY1HTlGi+WiodJU0p6dCgMQEXiV5FlIuihdMW4
 5dvZBlueVJuUAQsZAlnU3aQj+QXmndc9wmSNgrC5vB5esrljpK3KXJigzv5ME2RkacpG
 s/O19e8bEy592PV/3iCzTWbSGeV28O2Ud4qx0RsbqYZ4Ed4xjGh7H42oqMOmaMq9fPla
 Kky1XLlpZkLQlB086T05hCMTILyaww/DHelnUsZR7+mUYZbkIaicgm6Ix0Vps33U9gX5
 FxAkenwzprHQPpcqq0z//HAgCDN8J93Ohf1vZs615/LuSkwznJljduy/VooeLSE4f95h
 ou/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d74k9kYwoWMSqApFDCfao3RK7yeHeLhpUIUocQOy9KQ=;
 b=3u+FappZ3iWozhncUuCGEU2StdI6TYLyUL1GXPszXSsvDl4t1cQkhfeO5uj9uL9sZz
 ZI4o6okfmEcXkGCsiy1+M9V4l0uA3T02fOL2NFRnvaw8kQYu9LyYuNv78S09G7InLXbG
 4x2ESTSHfyJHyUW6Xpko7gSQ9dbb+9lhZmB1lt0YAYO/rfyVZE6/Ow2s+FFnei6BAQ1R
 zsNs7EwExJbaLcnJJeXBn6K4+4O3NnMT59V/6youj1gtyejKs41CTKHDMI8eLUFjCx87
 aglXa17dY8bHv4OKHI1ydgkypNMOHJwWci/sVLqUvDfkiUV6rhbfEBjCAsRTmjERSUZj
 sT/g==
X-Gm-Message-State: AOAM5332WVyYQdbVuGC2+glb5AckhJ9UkpmwwgIt8PO1SpoN8CreW+Zr
 J9TYhfXMDY6LTkFubaQ2B2y/NqNCfpU=
X-Google-Smtp-Source: ABdhPJyev9Gw14MDYBhXtpTf0CIJ7y76HWeOH5dTUgpuZjHZSOOqsumYttjcppCwrWlnPMbpnbG7MQ==
X-Received: by 2002:adf:f312:: with SMTP id i18mr22279969wro.589.1642490841220; 
 Mon, 17 Jan 2022 23:27:21 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r7sm586977wma.39.2022.01.17.23.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 23:27:20 -0800 (PST)
Message-ID: <9acf1bf2-2775-1b0c-892d-9bfd1dd11837@amsat.org>
Date: Tue, 18 Jan 2022 08:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/10] hw/dma: Use dma_addr_t type definition when
 relevant
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand
 <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-block@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/11/22 19:42, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (10):
>   stubs: Restrict fw_cfg to system emulation
>   hw/nvram: Restrict fw_cfg QOM interface to sysemu and tools
>   hw/pci: Restrict pci-bus stub to sysemu
>   hw/pci: Document pci_dma_map()
>   hw/dma: Remove CONFIG_USER_ONLY check
>   hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument
>   hw/scsi: Rename SCSIRequest::resid as 'residual'
>   hw/dma: Fix format string issues using dma_addr_t
>   hw/dma: Move ScatterGatherEntry / QEMUSGList declarations around
>   hw/dma: Use dma_addr_t type definition when relevant

Queued via memory-api.

