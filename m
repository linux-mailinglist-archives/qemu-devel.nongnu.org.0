Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7949B788
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:26:27 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNiD-00068Z-OE
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nCMIJ-0007l4-Fj
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:55:35 -0500
Received: from [2a00:1450:4864:20::332] (port=53903
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nCMIF-0002Rf-5E
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:55:33 -0500
Received: by mail-wm1-x332.google.com with SMTP id n8so25375756wmk.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6EJNmViF+HBybLCJxBBkQKt7yPxgwq5NZNFhjZnZK3I=;
 b=qKq04QsqZXmb9epEdgKocCid6isDpmZdZHvrngDN3zu12YRVRrxasClgp3c0im4JNz
 NRovbe1Zqpx+9esQJvQ15J3I8dRkdLnkiV5o2oK8KDnqL8ROhI/Af7yE1gtrt37h0Tlv
 DRu935UXPyZyVFtTHKyZR85p1BJ4vUJQgU1LZdJC4sQM8waYePLmmqFuj8IdUa6mSl2Y
 e5xGABibr078we5nQjLbxKzq7R5Qp/sbwHVAYLph2HRjoB5V2C8tZtIscBtSJaigqCDz
 KyIrTmQdDH5t/Rfpl3dHuFd6REAsA0c72hwlnjZZjBTxsq7EcUrwdWmwcnxgcKQ4z2UG
 HJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6EJNmViF+HBybLCJxBBkQKt7yPxgwq5NZNFhjZnZK3I=;
 b=INdhOtQfwBuqvIUD3ak/Ma7abYgDIbxzqyNod2/SrcxkpAook7bzF+fhei6DumEeSp
 VrUAxTQ1EQgSCg1tQrzoV1Oy+KsecdSsCtOvd8B1AZc3X5aM57LFk0qKu9gPKDOuKQ9D
 QSte38qMvULMbCv9jLG/OdtTrh7hydQd7hCv3bTp2iJLbNsZeTloNXZ3tnPFhiqk01pN
 Wpo6ivBaN8tzXEJCkTqReH0YUHqp07FNHFplN3vkfQWM73a2+1ceXz2D5CctOjGrqhvQ
 ms4e8xqZ17kGTWWi8NnznSvOih9Yo4UUIK2DB/h0o9sufc9h3Mr9BwxarQDw8Su4uJoU
 dzRw==
X-Gm-Message-State: AOAM532v4fG1rCQNSlWDPIzLfzZZDXr1gEmyuVwOyieFOhqIj1dzZ5/f
 sLjw+8aJV6emoEzCDTAdgRw=
X-Google-Smtp-Source: ABdhPJwPRU8u3j94OQtF7wTRh9feVaxTmZqsL3D4HbIxOPsEKNx0H0A5j/+TEbClEDLoBMTWKvTDsA==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr3103373wmq.44.1643118922489; 
 Tue, 25 Jan 2022 05:55:22 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id p17sm16319687wrf.112.2022.01.25.05.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 05:55:22 -0800 (PST)
Message-ID: <2da0075f-4a6f-b196-6ae7-73c0df66e437@gmail.com>
Date: Tue, 25 Jan 2022 13:55:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] xen-mapcache: Avoid entry->lock overflow
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220124104450.152481-1-ross.lagerwall@citrix.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220124104450.152481-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: paul@xen.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 10:44, Ross Lagerwall wrote:
> In some cases, a particular mapcache entry may be mapped 256 times
> causing the lock field to wrap to 0. For example, this may happen when
> using emulated NVME and the guest submits a large scatter-gather write.
> At this point, the entry map be remapped causing QEMU to write the wrong
> data or crash (since remap is not atomic).
> 
> Avoid this overflow by increasing the lock field to a uint32_t and also
> detect it and abort rather than continuing regardless.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Changes in v2: Change type to uint32_t since there is a hole there
> anyway. The struct size remains at 48 bytes on x86_64.
> 
>   hw/i386/xen/xen-mapcache.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index bd47c3d672..f2ef977963 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
>       hwaddr paddr_index;
>       uint8_t *vaddr_base;
>       unsigned long *valid_mapping;
> -    uint8_t lock;
> +    uint32_t lock;
>   #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
>       uint8_t flags;
>       hwaddr size;
> @@ -355,6 +355,12 @@ tryagain:
>       if (lock) {
>           MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
>           entry->lock++;
> +        if (entry->lock == 0) {
> +            fprintf(stderr,
> +                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
> +                    entry->paddr_index, entry->vaddr_base);
> +            abort();
> +        }
>           reventry->dma = dma;
>           reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
>           reventry->paddr_index = mapcache->last_entry->paddr_index;


