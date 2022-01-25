Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA449B2BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:14:11 +0100 (CET)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJm6-0005Lz-DZ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:14:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCJiO-0001wj-4T
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCJiL-0006FR-F5
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643109015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NX5hTxcGI+xuoaF3EQoULRUF5kHszM7syzmFGu32zSU=;
 b=CoTWUaeQj64KyKe7UiTfbqD22bn/8pbbm73Neoh2Aybs6yCzx3jn78nfHSuhqnUwwCxv7M
 4gA6YaUQBk++4sv7gfk5LothI8G+vZ6uroTNN02Dlw/+Qao4NYwFuEx+NBdGTuEHW7UVNj
 HkVP/wHoqM/flt7J0HUiRN0fjYG/Ih0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-EYmSpQYNPJSPLbqTC0fwPA-1; Tue, 25 Jan 2022 06:10:14 -0500
X-MC-Unique: EYmSpQYNPJSPLbqTC0fwPA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a1ca503000000b0035056b042deso1309415wme.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 03:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NX5hTxcGI+xuoaF3EQoULRUF5kHszM7syzmFGu32zSU=;
 b=db/Vq9Ijlt4jv9UNtcLnOtGdo+j6VFaWwELSQQ9xmBNRO6wq6TjDfSCHIlgGXsZvDe
 XIQvQ/rpom8wkg28a1+7ikp4gQEO6GyiYfz0OyEPcWYwRauIPR5lBPAdCUFo36tGYgMG
 VJeSZcpMIlR7RNQuo1zh9nskBtxPhukM93lPXVlLGgRV2gXspJBGKWoB1m8Fu6md+LwU
 HA+bpLFZoTY1JUFUPqcOdOHzQRrYBzwotG4TOlHQBkgusAtrosaYsBj0t/WYz2A64pEE
 KlS8YALsFxNPyxLvPM5UFM0Riqm7i6iGjuqViCRz/zBVgil3Lmjkzj0WkDRdNfPJFt6C
 g8fA==
X-Gm-Message-State: AOAM533hsvch/n47WI+nZY0FKHB+qic+F87lFNzk5NOjW+rEAfOQ/8iT
 jCWop3vdfRhp/9kqozZHHldvUJQXLbS1gPKvebgx0Dj09npgFu0BipFlqpEG2VmyDl43/TmfUHv
 fAFz943H5GDGSM/g=
X-Received: by 2002:a05:600c:3ba9:: with SMTP id
 n41mr2399977wms.178.1643109012963; 
 Tue, 25 Jan 2022 03:10:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqXGLTzcASRV1CrZ2oaztFAzQ+ycgohPMTIl7aTwQCDE8SqFwiIFpGFE5HCjaHU78BoTnr0Q==
X-Received: by 2002:a05:600c:3ba9:: with SMTP id
 n41mr2399959wms.178.1643109012729; 
 Tue, 25 Jan 2022 03:10:12 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id s17sm16709293wrm.62.2022.01.25.03.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 03:10:12 -0800 (PST)
Message-ID: <97b1db48-32a3-46a4-4972-9c91ec518ba6@redhat.com>
Date: Tue, 25 Jan 2022 12:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] block/export/fuse: Extract
 fuse_fallocate_punch_hole()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220124220357.74017-1-f4bug@amsat.org>
 <20220124220357.74017-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124220357.74017-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, qemu-block@nongnu.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 23.03, Philippe Mathieu-Daudé via wrote:
> Extract fuse_fallocate_punch_hole() to avoid #ifdef'ry
> mixed within if/else statement.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/export/fuse.c | 59 +++++++++++++++++++++++++++------------------
>   1 file changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 6710d8aed86..31cb0503adc 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -603,6 +603,38 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
>       }
>   }
>   
> +static bool fuse_fallocate_zero_range(fuse_req_t req, fuse_ino_t inode,
> +                                      int mode, int64_t blk_len,
> +                                      off_t offset, off_t *length)
> +{
> +#ifdef CONFIG_FALLOCATE_ZERO_RANGE
> +    FuseExport *exp = fuse_req_userdata(req);
> +
> +    if (mode & FALLOC_FL_ZERO_RANGE) {
> +        int ret;
> +
> +       if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + *length > blk_len) {
> +            /* No need for zeroes, we are going to write them ourselves */
> +            ret = fuse_do_truncate(exp, offset + *length, false,
> +                                   PREALLOC_MODE_OFF);
> +            if (ret < 0) {
> +                fuse_reply_err(req, -ret);
> +                return false;
> +            }
> +        }
> +
> +        do {
> +            int size = MIN(*length, BDRV_REQUEST_MAX_BYTES);
> +
> +            ret = blk_pwrite_zeroes(exp->common.blk, offset, size, 0);
> +            offset += size;
> +            *length -= size;
> +        } while (ret == 0 && *length > 0);
> +    }
> +#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
> +    return true;
> +}
> +
>   /**
>    * Let clients perform various fallocate() operations.
>    */
> @@ -642,30 +674,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>               offset += size;
>               length -= size;
>           } while (ret == 0 && length > 0);
> -    }
> -#ifdef CONFIG_FALLOCATE_ZERO_RANGE
> -    else if (mode & FALLOC_FL_ZERO_RANGE) {
> -        if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
> -            /* No need for zeroes, we are going to write them ourselves */
> -            ret = fuse_do_truncate(exp, offset + length, false,
> -                                   PREALLOC_MODE_OFF);
> -            if (ret < 0) {
> -                fuse_reply_err(req, -ret);
> -                return;
> -            }
> -        }
> -
> -        do {
> -            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
> -
> -            ret = blk_pwrite_zeroes(exp->common.blk,
> -                                    offset, size, 0);
> -            offset += size;
> -            length -= size;
> -        } while (ret == 0 && length > 0);

I might not have enough coffee today yet, but I think your patch is wrong: 
If the code executed this do-while loop/if-statement-branch, the other 
else-statements below were never called. Now with your patch, if the 
do-while loop in fuse_fallocate_zero_range() is called, the function will 
return with "true" at the end, causing the other else-statements below to be 
called, so that ret finally gets set to -EOPNOTSUPP. Or did I miss something?

  Thomas


> -    }
> -#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
> -    else if (!mode) {
> +    } else if (!fuse_fallocate_zero_range(req, inode, blk_len, mode, offset, &length)) {
> +        return;
> +    } else if (!mode) {
>           /* We can only fallocate at the EOF with a truncate */
>           if (offset < blk_len) {
>               fuse_reply_err(req, EOPNOTSUPP);


