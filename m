Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5749B943
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:52:10 +0100 (CET)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCP3A-0004Ny-Mr
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCOHe-0006eF-He; Tue, 25 Jan 2022 11:03:02 -0500
Received: from [2a00:1450:4864:20::431] (port=38784
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCOHb-0007ko-MN; Tue, 25 Jan 2022 11:03:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id c23so5097382wrb.5;
 Tue, 25 Jan 2022 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4YgqO+kvYRcLueN+/DEHgspfl+rYbkiDQzE4vYkYE84=;
 b=itisBH4FwAYi7Nj6rfCH/hGtCm+x2RgkLy1s7tlAvdvTA1qsyNVA7OQuKlFmwNvrtL
 QSDxS778eATNf4A4zu3NMk3HQUSdC1jux4qkTJTCMhsVZCU3h1GBi4LpJEdORkbUgqcr
 g74jnkGO4ccngEba4cDGCopJCpq2OSVnVV2uvUu/NMGp5pRVwKhb2pab7HNYshBpVw6X
 BQ+jHPJdQO7Q2OZ0xawWn9mtkZEx7tYmtYVi/h01wAgNTUodpmClpbFZkdu6bCxGd8sd
 xKxYReDdfdeYKRuA6qXW97OgMZ7VOrfz7l1Fk5hHnKncZbPfeZXyMViY61TRyFXpmODa
 nBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4YgqO+kvYRcLueN+/DEHgspfl+rYbkiDQzE4vYkYE84=;
 b=exT7vc9qalqS2Prl/zxyl6mEMNC6mT7N6CkTSC4xlDEX/Dfu96vnIG88cR++KVPXyj
 Po5BHjR8yA0dHOxs1IDa7/GYlK+w+rfa3i4YC14kKmUz/OoQVxXr5OAT+gfruFlb3NQ0
 hMsq5mnWRLGjDmk8IGQaRKeaHJdaT7OSHW/nNcBCgG71WlHXSzAzFw0vqo5N1yvRMkAU
 ZPFhgo0PIlZzDIfj5LETGy6r/2DtA4vs0AOZisufV+D+xk1hnxNcLkElNG8+wB0XD+Le
 Mw1oIjJfafvGhA6mbCOt5bZHM67zYSHR/j1jxXPA7IArvGqAOUBa6MJJUoqbRkz2pOSz
 iOwg==
X-Gm-Message-State: AOAM532NVMzjBgPpnV1MahKv8eec4giMDenbhBbxmRzvW3loOR+tMOUg
 9LAjs1O4oygJV56oMjgfbRA=
X-Google-Smtp-Source: ABdhPJy/WgEW5dToMSvVj0nxAGDYjlVNrfCFaUgtwdt+hJ38sq5m7/Lf6CfMmwv1Euk8cXQ87U6ibw==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr18511405wrm.713.1643126576955; 
 Tue, 25 Jan 2022 08:02:56 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u7sm720696wml.7.2022.01.25.08.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 08:02:56 -0800 (PST)
Message-ID: <47a755a6-d2fa-5991-79af-5b29fa3b0f7b@amsat.org>
Date: Tue, 25 Jan 2022 17:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] block/export/fuse: Extract
 fuse_fallocate_punch_hole()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220124220357.74017-1-f4bug@amsat.org>
 <20220124220357.74017-2-f4bug@amsat.org>
 <97b1db48-32a3-46a4-4972-9c91ec518ba6@redhat.com>
In-Reply-To: <97b1db48-32a3-46a4-4972-9c91ec518ba6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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



On 1/25/22 12:10, Thomas Huth wrote:
> On 24/01/2022 23.03, Philippe Mathieu-Daudé via wrote:
>> Extract fuse_fallocate_punch_hole() to avoid #ifdef'ry
>> mixed within if/else statement.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   block/export/fuse.c | 59 +++++++++++++++++++++++++++------------------
>>   1 file changed, 35 insertions(+), 24 deletions(-)
>>
>> diff --git a/block/export/fuse.c b/block/export/fuse.c
>> index 6710d8aed86..31cb0503adc 100644
>> --- a/block/export/fuse.c
>> +++ b/block/export/fuse.c
>> @@ -603,6 +603,38 @@ static void fuse_write(fuse_req_t req, fuse_ino_t
>> inode, const char *buf,
>>       }
>>   }
>>   +static bool fuse_fallocate_zero_range(fuse_req_t req, fuse_ino_t
>> inode,
>> +                                      int mode, int64_t blk_len,
>> +                                      off_t offset, off_t *length)
>> +{
>> +#ifdef CONFIG_FALLOCATE_ZERO_RANGE
>> +    FuseExport *exp = fuse_req_userdata(req);
>> +
>> +    if (mode & FALLOC_FL_ZERO_RANGE) {
>> +        int ret;
>> +
>> +       if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + *length >
>> blk_len) {
>> +            /* No need for zeroes, we are going to write them
>> ourselves */
>> +            ret = fuse_do_truncate(exp, offset + *length, false,
>> +                                   PREALLOC_MODE_OFF);
>> +            if (ret < 0) {
>> +                fuse_reply_err(req, -ret);
>> +                return false;
>> +            }
>> +        }
>> +
>> +        do {
>> +            int size = MIN(*length, BDRV_REQUEST_MAX_BYTES);
>> +
>> +            ret = blk_pwrite_zeroes(exp->common.blk, offset, size, 0);
>> +            offset += size;
>> +            *length -= size;
>> +        } while (ret == 0 && *length > 0);
>> +    }
>> +#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
>> +    return true;
>> +}
>> +
>>   /**
>>    * Let clients perform various fallocate() operations.
>>    */
>> @@ -642,30 +674,9 @@ static void fuse_fallocate(fuse_req_t req,
>> fuse_ino_t inode, int mode,
>>               offset += size;
>>               length -= size;
>>           } while (ret == 0 && length > 0);
>> -    }
>> -#ifdef CONFIG_FALLOCATE_ZERO_RANGE
>> -    else if (mode & FALLOC_FL_ZERO_RANGE) {
>> -        if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length >
>> blk_len) {
>> -            /* No need for zeroes, we are going to write them
>> ourselves */
>> -            ret = fuse_do_truncate(exp, offset + length, false,
>> -                                   PREALLOC_MODE_OFF);
>> -            if (ret < 0) {
>> -                fuse_reply_err(req, -ret);
>> -                return;
>> -            }
>> -        }
>> -
>> -        do {
>> -            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
>> -
>> -            ret = blk_pwrite_zeroes(exp->common.blk,
>> -                                    offset, size, 0);
>> -            offset += size;
>> -            length -= size;
>> -        } while (ret == 0 && length > 0);
> 
> I might not have enough coffee today yet, but I think your patch is
> wrong: If the code executed this do-while loop/if-statement-branch, the
> other else-statements below were never called. Now with your patch, if
> the do-while loop in fuse_fallocate_zero_range() is called, the function
> will return with "true" at the end, causing the other else-statements
> below to be called, so that ret finally gets set to -EOPNOTSUPP. Or did
> I miss something?

You are right, this patch is crap, sorry.

