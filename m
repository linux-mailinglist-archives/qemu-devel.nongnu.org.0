Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D549B2F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:33:07 +0100 (CET)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCK4Q-00063z-Kc
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCK0L-00024w-QX
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:28:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCK0J-0001ua-9R
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643110130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Q/7Xgjit8KVaacouDJHy8xVZhWz/gzb4TD4M/xZnew=;
 b=DbeCJRD4zrwRrudNpOVdwKXPwAvhV3Jz5wRFezc2E+8d895Av/O6TBy1jPBgO/142ha0w2
 dVgQbNqCJvIlUrHqDJ3NqFKXJnqUig9Qx8W5JePXz+cCTKuEzzMYthHtt5fWQrdODB2rtd
 /LO8MWGlRmMz/qMo0Lbj6a/BXr2RSsM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-uEDjPf9aPmmqaNCALH6E8g-1; Tue, 25 Jan 2022 06:28:43 -0500
X-MC-Unique: uEDjPf9aPmmqaNCALH6E8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so1315706wml.1
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Q/7Xgjit8KVaacouDJHy8xVZhWz/gzb4TD4M/xZnew=;
 b=k8n2gY+k0meDKC3zfqEzxYyuxyxgb+AwEowbYdsA36h/r1FjrLLeN8dkLMnYU4QKsY
 kTRyuhRVwvEnrJsBK9cP86KzNVQkW3W+82K0Hn02jFBGQ2UvmPhxw3JLFs9wIWjBOuSW
 mYip5MYTL6or+L+E0igp57Co2fhFa+KFzC5Bagk64v5s2pfHeIWNvroiRkwLHJvh6uOV
 scYpoMDHXlqcqLGhFMyyoIqYVAaOTto8nYBTRsH1FP0WfvFenJKdFDbTEikN+Ae3r/dO
 aji/EDWfG4FsIoAehtd5V7iBABhXndcAu94VyDcLFOKuG+8cqWg/eA+LnazxtgELebaQ
 3Nnw==
X-Gm-Message-State: AOAM53257acZLEtPPrHfmNOlyQJha9k2ogrIzhy43rGqQkVFzVGL67MT
 3DI3gBaeTrWNP/GlPqRlvWUWhU1d4qOcO9eutJlD/QQglAMB3dgZ3BNC1Vz/mV70y4367ySvvqi
 2VmFxsf1WeLncuwk=
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr2509075wms.136.1643110122514; 
 Tue, 25 Jan 2022 03:28:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwas3aSy9X9w0mpT1BL6vmOwhr30CNhvVB4B8NFqg6KFYBziXRsXEhurWkdTqRKlBDh4c+2PA==
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr2509061wms.136.1643110122253; 
 Tue, 25 Jan 2022 03:28:42 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m5sm110485wms.4.2022.01.25.03.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 03:28:41 -0800 (PST)
Message-ID: <b54be5b8-29e9-ca08-553a-a0635f0ebb83@redhat.com>
Date: Tue, 25 Jan 2022 12:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/3] block/export/fuse: Extract
 fuse_fallocate_zero_range()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220124220357.74017-1-f4bug@amsat.org>
 <20220124220357.74017-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124220357.74017-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/export/fuse.c | 48 +++++++++++++++++++++++++++++----------------
>   1 file changed, 31 insertions(+), 17 deletions(-)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 31cb0503adc..3a158342c75 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -603,6 +603,35 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
>       }
>   }
>   
> +static bool fuse_fallocate_punch_hole(fuse_req_t req, fuse_ino_t inode,
> +                                      int mode, int64_t blk_len,
> +                                      off_t offset, off_t *length)
> +{
> +    FuseExport *exp = fuse_req_userdata(req);
> +
> +    if (mode & FALLOC_FL_KEEP_SIZE) {
> +        *length = MIN(*length, blk_len - offset);
> +    }
> +
> +    if (mode & FALLOC_FL_PUNCH_HOLE) {
> +        int ret;
> +
> +        if (!(mode & FALLOC_FL_KEEP_SIZE)) {
> +            fuse_reply_err(req, EINVAL);
> +            return false;
> +        }
> +
> +        do {
> +            int size = MIN(*length, BDRV_REQUEST_MAX_BYTES);
> +
> +            ret = blk_pdiscard(exp->common.blk, offset, size);
> +            offset += size;
> +            *length -= size;
> +        } while (ret == 0 && *length > 0);
> +    }
> +    return true;
> +}
> +
>   static bool fuse_fallocate_zero_range(fuse_req_t req, fuse_ino_t inode,
>                                         int mode, int64_t blk_len,
>                                         off_t offset, off_t *length)
> @@ -657,23 +686,8 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
>           return;
>       }
>   
> -    if (mode & FALLOC_FL_KEEP_SIZE) {
> -        length = MIN(length, blk_len - offset);
> -    }
> -
> -    if (mode & FALLOC_FL_PUNCH_HOLE) {
> -        if (!(mode & FALLOC_FL_KEEP_SIZE)) {
> -            fuse_reply_err(req, EINVAL);
> -            return;
> -        }
> -
> -        do {
> -            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
> -
> -            ret = blk_pdiscard(exp->common.blk, offset, size);
> -            offset += size;
> -            length -= size;
> -        } while (ret == 0 && length > 0);
> +    if (!fuse_fallocate_punch_hole(req, inode, mode, blk_len, offset, &length)) {
> +        return;

Same issue as with the previous patch? If the do-while loop has been 
executed, the else branches below should not be called...

  Thomas

>       } else if (!fuse_fallocate_zero_range(req, inode, blk_len, mode, offset, &length)) {
>           return;
>       } else if (!mode) {


