Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6F3E4302
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:40:03 +0200 (CEST)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1lK-0007V7-DT
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1jR-0005TU-1i
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1jP-0002s0-7g
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628501882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5E7/lH1FO7U3mbfQ8ns1Pfwz1+A5s7L9C64CPdlT54Y=;
 b=NPqlhSjn8yhPk+HRhSxhpjwiiFz/h99vFfHqefL7XWDbLiYzdpqO0sXJSj2aOEQz0e4Nvp
 dNnUMivb5/fUcBi+z/Gej/Yieo7SbACcCUSsa+/tS1hWxzAsZgeMqHIFgcqhpwWeEG/bcw
 9B2ckaH8emy3K5s8tjbn7dj1gPUWszI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-TGxI7f4xNAuHYiu8PM1AKA-1; Mon, 09 Aug 2021 05:38:00 -0400
X-MC-Unique: TGxI7f4xNAuHYiu8PM1AKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so5184002wrl.0
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5E7/lH1FO7U3mbfQ8ns1Pfwz1+A5s7L9C64CPdlT54Y=;
 b=DRd42wdVL9js53mN9nRHZBwTeoUIPqiSoO2p9aApLfQ0eyBl/I+ETK8Y/H4kcyNQ9t
 SFQjMaVlb/R+8scxhKPp7Vf4pz6TZq83iaumcQrY8d4kj2W1Gu4uJwOKtxdcdvxpybdz
 fLw1874S9k0B8Vs0RuJX4II+yESoeBxHoXH6zLJmSqEw+BPjpvOV3fEgWtMxyzNInFvY
 VLGw8gbs1Nhy2i/sRiWoM6u7HnylE1a1kKtwT3H5/MzIA6jr+5pXhuk2psFw6Mc4RiYt
 JhkvArCUDej8pizdsZmeXehSf9gKWyHR2raBF5A0ftJww06GFhXK/E5xFoyrugDFGoBx
 O8nQ==
X-Gm-Message-State: AOAM530evkPwSJC0FxGW4FzKv+RmJvctOIib8VomC7etdoPF8h0V1EmE
 kmzWu+xVp8W/wLcGPosR+B9FIr5GVo7arDg87PJZnckdD7d/UcBdWdXcE8EdFWpx+gGilUGkVZN
 POJNLL/cmKSE9C44=
X-Received: by 2002:a5d:63cf:: with SMTP id c15mr23922265wrw.230.1628501878932; 
 Mon, 09 Aug 2021 02:37:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnFlpbiIwmaAPBy1mLCGicla5taBgQx2YhVDgAIhvURCK8wNh4luVk5Ue3Ya/Z5T7di6WLJQ==
X-Received: by 2002:a5d:63cf:: with SMTP id c15mr23922243wrw.230.1628501878677; 
 Mon, 09 Aug 2021 02:37:58 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h8sm20372589wmb.35.2021.08.09.02.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:37:58 -0700 (PDT)
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20210809085021.783125-1-fontaine.fabrice@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <824c4488-a34f-3a8d-f05d-252befe496c0@redhat.com>
Date: Mon, 9 Aug 2021 11:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809085021.783125-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Denis V. Lunev" <den@openvz.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 10:50 AM, Fabrice Fontaine wrote:
> Fix the following build failure on musl raised since version 6.0.0 and
> https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
> because musl does not define FALLOC_FL_ZERO_RANGE:
> 
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
>       |                       ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  block/export/fuse.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index ada9e263eb..07e31129a6 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -635,6 +635,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>              offset += size;
>              length -= size;
>          } while (ret == 0 && length > 0);
> +#ifdef FALLOC_FL_ZERO_RANGE

Please use CONFIG_FALLOCATE_ZERO_RANGE.

>      } else if (mode & FALLOC_FL_ZERO_RANGE) {
>          if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
>              /* No need for zeroes, we are going to write them ourselves */
> @@ -654,6 +655,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>              offset += size;
>              length -= size;
>          } while (ret == 0 && length > 0);
> +#endif
>      } else if (!mode) {
>          /* We can only fallocate at the EOF with a truncate */
>          if (offset < blk_len) {
> 

Maybe safer #ifdef'ry as:

-- >8 --
diff --git a/block/export/fuse.c b/block/export/fuse.c
index ada9e263ebb..fc7b07d2b57 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -635,7 +635,9 @@ static void fuse_fallocate(fuse_req_t req,
fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    } else if (mode & FALLOC_FL_ZERO_RANGE) {
+    }
+#ifdef CONFIG_FALLOCATE_ZERO_RANGE
+    else if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
             /* No need for zeroes, we are going to write them ourselves */
             ret = fuse_do_truncate(exp, offset + length, false,
@@ -654,7 +656,9 @@ static void fuse_fallocate(fuse_req_t req,
fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    } else if (!mode) {
+    }
+#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
+    else if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
         if (offset < blk_len) {
             fuse_reply_err(req, EOPNOTSUPP);
---


