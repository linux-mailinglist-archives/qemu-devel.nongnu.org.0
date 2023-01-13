Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04362668F3F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:31:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEWi-0001Yk-R4; Fri, 13 Jan 2023 02:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEWd-0001Tu-VL
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:30:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEWZ-0004gp-V6
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:30:55 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso11648655wms.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qIo+IRTJDYax9VTRds3RrOFaDFpdKDUtkoXE53/GGPc=;
 b=Fe4w2/ZGZcXF7/IcE1tXoxvNO1WCVuVPb5Wurm13RCSR8/wWUhy8YDupXIcOQzG4Cd
 NCeI1zKcMIqWH0v8GECTdZ084hTTVviEH/cMBRaslRZ39vpf/Ic2e6+oBlGRauNNWI5N
 cp6awgAM+EeQttLpFRSmQ60N2YNFPoh2JgrQjsQadm5sz86QbzEoDmxfj3fjwVfHFoX5
 jZp04W26BVdBsRYY8XKKtGhut1N8hWFTpT0QVtlC2FkUBc1ulRSuizRruquhKiaL2TeG
 idR2k3ZOT11Y9UG3cDqs0qI0IxQOTHIDGEQPqmRY6j7v02kqqrNJAI0Ir/1zkhnJF5/S
 0RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qIo+IRTJDYax9VTRds3RrOFaDFpdKDUtkoXE53/GGPc=;
 b=TOjFhC+sueqoFFRKJW40Nah7vrdClROSIM8pWkaYaMVlb1KngNWi5PR2i1YNCO6Q0Z
 fpg+rtzqe9ct8IDe124LU5MJ4iX1DWtAn56B3AbsPT4vLLkonsikqf/1YtS2rY5P02iK
 IP4zurX1pC3F1vY8Z5UTmkgK9DT4FrV4chqK+araTmotXOJq9ZdVurcK52fs1JTL16TC
 Twj49qCBg5Dq03LTuYvHTuSG9Jt0zPqsd2ran2Nq53yY07dViGSu7JYq3Kgk6zPUOfL6
 1JjtDgyFNAYNFYd8Cn1tdEvpb2I4dYHGuGgypGHGZnQWiCNzNKo2T746XlGomi+TPAfV
 aTAA==
X-Gm-Message-State: AFqh2kpyn94JRjfRNL1T85Y/OesN9YuQoRWzQnCfrVln4iUDzVPxzWxn
 po4CE52R7KoIv/Jn1uvq6FMVNg==
X-Google-Smtp-Source: AMrXdXtIlcwNoSUrDgppx4jQMvhxWqppypZNeB2f2eXXxyfkUhDoTLuPZ1criJuAP7UqgVX8CrsmLg==
X-Received: by 2002:a05:600c:3493:b0:3d2:370b:97f4 with SMTP id
 a19-20020a05600c349300b003d2370b97f4mr62144001wmq.16.1673595048464; 
 Thu, 12 Jan 2023 23:30:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y6-20020a1c4b06000000b003da119d7251sm4796577wma.21.2023.01.12.23.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:30:48 -0800 (PST)
Message-ID: <d13c9ba1-84df-dbac-adc5-8ea8b4df2dbe@linaro.org>
Date: Fri, 13 Jan 2023 08:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] qcow2: Fix theoretical corruption in store_bitmap()
 error path
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, aesteve@redhat.com, nsoffer@redhat.com,
 qemu-devel@nongnu.org
References: <20230112191454.169353-1-kwolf@redhat.com>
 <20230112191454.169353-2-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112191454.169353-2-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/1/23 20:14, Kevin Wolf wrote:
> In order to write the bitmap table to the image file, it is converted to
> big endian. If the write fails, it is passed to clear_bitmap_table() to
> free all of the clusters it had allocated before. However, if we don't
> convert it back to native endianness first, we'll free things at a wrong
> offset.
> 
> In practical terms, the offsets will be so high that we won't actually
> free any allocated clusters, but just run into an error, but in theory
> this can cause image corruption.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/qcow2-bitmap.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index bcad567c0c..3dff99ba06 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c
> @@ -115,7 +115,7 @@ static int update_header_sync(BlockDriverState *bs)
>       return bdrv_flush(bs->file->bs);
>   }
>   

Maybe add a comment here remembering to bswap back to native endianness?

> -static inline void bitmap_table_to_be(uint64_t *bitmap_table, size_t size)
> +static inline void bitmap_table_bswap_be(uint64_t *bitmap_table, size_t size)
>   {

This function uses cpu_to_be64(), semantically we convert back calling
be64_to_cpu(), but technically both functions end up being the same.

Alternatively:

      for (i = 0; i < size; ++i) {
-        bitmap_table[i] = cpu_to_be64(bitmap_table[i]);
+        bswap64s(&bitmap_table[i]);
      }

> @@ -1401,9 +1401,10 @@ static int store_bitmap(BlockDriverState *bs, Qcow2Bitmap *bm, Error **errp)
>           goto fail;
>       }
>   
> -    bitmap_table_to_be(tb, tb_size);
> +    bitmap_table_bswap_be(tb, tb_size);
>       ret = bdrv_pwrite(bs->file, tb_offset, tb_size * sizeof(tb[0]), tb, 0);
>       if (ret < 0) {
> +        bitmap_table_bswap_be(tb, tb_size);
>           error_setg_errno(errp, -ret, "Failed to write bitmap '%s' to file",
>                            bm_name);
>           goto fail;

Pre-existing, but consider using g_autofree for 'tb'.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


