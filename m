Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96A3323B9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:15:30 +0100 (CET)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaKn-0002lA-Ns
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJaFX-0006Kr-Nd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJaFU-0003CC-RM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615288200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9KI/p5eeRU4qS1Pye7SeraTnRaP27kWSc4+kWFyX6Y=;
 b=XAMo0fOEoM2tcH3u/cP12xBIgVLQcQ3vy8qBm2EMcMiqlUK734i09PHXiUwviYlqpHM0pk
 RJG7iB6d9jUbG493waxxpnBRfsMqf0x29+kLQ2MCHQenSymf8gPbFckppqKhgIuYS/BAhm
 Uhse5frgNlbYvHsg7VPvbY0J9ved49g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-w1jb50HEPcGHtneiQPYA0g-1; Tue, 09 Mar 2021 06:09:58 -0500
X-MC-Unique: w1jb50HEPcGHtneiQPYA0g-1
Received: by mail-wm1-f69.google.com with SMTP id z26so985333wml.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g9KI/p5eeRU4qS1Pye7SeraTnRaP27kWSc4+kWFyX6Y=;
 b=oPUnNOB7Y3xSKArovgzxomDcsGGwMJbwAOqEnl8NTWuC4iS8Y2LWASGdpGvoX89WQs
 A+06wC2pQ63mso6LsT+bnaV1rlRz8yAOX1KfA2vVeBXQurEGFLWsU4xaXj60ma+JoktL
 Uj5RZGCQpWsBdWYKUt18IyFi/kkg/XWqkLjhkBTU1cpG1AaHlghQpyPBuXzkAsI4YtON
 161XuRu1+UwoztJa8R8GrrJAw7mFLa6tg8sEb3NfV1fxRakU1FL5L+5wWDQijm7i3kwI
 qDU7hMfHi3ucN67ABLlqslU8q5/J1nC1aVk7/0FHbhb7/LPzUS+Edn87afLrzKYBjpAX
 ZImQ==
X-Gm-Message-State: AOAM531INxJqnx4vxgtJz1BLHVQ9wjMzTm9pK2RP2xdZ3L1Z7vJWQiVZ
 h8HtVHDfuWD4OMwMEeQCDq/yS1JvVacn/vUzmdiV8t7RGqS/FmrWd+GabmDOJtWjHaNPoIqE1ZJ
 3HbcEkh67lxFPfDY=
X-Received: by 2002:adf:d23c:: with SMTP id k28mr1933326wrh.4.1615288197418;
 Tue, 09 Mar 2021 03:09:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjs0vUUNjMZdxP6kyv8s5kjcb00t5hTn9EnIGfio9vJHbiCjj3EwQnvOKnK061RteFQ/Rn8A==
X-Received: by 2002:adf:d23c:: with SMTP id k28mr1933300wrh.4.1615288197240;
 Tue, 09 Mar 2021 03:09:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y10sm22925505wrl.19.2021.03.09.03.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 03:09:56 -0800 (PST)
Subject: Re: [RFC PATCH 1/4] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <34865f4c-dc32-4298-6ec9-c8690d738435@redhat.com>
Date: Tue, 9 Mar 2021 12:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309102157.365356-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 11:21 AM, David Edmondson wrote:
> If a new bitmap entry is allocated, requiring the entire block to be
> written, avoiding leaking the buffer allocated for the block should
> the write fail.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  block/vdi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/vdi.c b/block/vdi.c
> index 5627e7d764..2a6dc26124 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -690,6 +690,7 @@ nonallocating_write:
>  
>      logout("finished data write\n");
>      if (ret < 0) {
> +        g_free(block);
>          return ret;
>      }

Alternative using g_autofree:

-- >8 --
diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764a..1cd8ae2ba99 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -612,7 +612,7 @@ vdi_co_pwritev(BlockDriverState *bs, uint64_t
offset, uint64_t bytes,
     uint64_t data_offset;
     uint32_t bmap_first = VDI_UNALLOCATED;
     uint32_t bmap_last = VDI_UNALLOCATED;
-    uint8_t *block = NULL;
+    g_autofree uint8_t *block = NULL;
     uint64_t bytes_done = 0;
     int ret = 0;

@@ -705,9 +705,6 @@ nonallocating_write:
         *header = s->header;
         vdi_header_to_le(header);
         ret = bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
-        g_free(block);
-        block = NULL;
-
         if (ret < 0) {
             return ret;
         }
---


