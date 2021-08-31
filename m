Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDD3FCB3C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:11:51 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6MX-0006EV-SX
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mL6H5-0005qE-1Z
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mL6H2-0005jn-47
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630425966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcE6moq2g1EjoWb9L4Ge15wbTXO1TcVXoicHNqgKZeU=;
 b=YRtL+hOU4t1H6xIh/Ky/Mr9S36J0hX2p8x4Wj5YSZcyIObCSbHBvl4hkkIfmfokGadSP6p
 uz/tVFX0x/PyuVMRCN95PuVMt4ybEVZaADvhDe2wgJ7FkK4NdTooMxrl3U5xoolkf90f2L
 ZiVn14eIbGhMxTwHSPYLfX8NeyzcSYA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-5j5INX4zPXOa3_3GARBXBg-1; Tue, 31 Aug 2021 12:06:05 -0400
X-MC-Unique: 5j5INX4zPXOa3_3GARBXBg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j145-20020a1c2397000000b002ea321114f7so1652985wmj.7
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 09:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qcE6moq2g1EjoWb9L4Ge15wbTXO1TcVXoicHNqgKZeU=;
 b=T2ZVfcmbA+D1SSn48Axc9x7S8SLS8gHuL/2p8whW5Xk9uIPWpswpggkimvnx7LDeTH
 iQUqNr7d7yulKEuWlSweEMypLo1v2JIEX2qaSXThYuaRUu8MZVX6LaZyqtW3d4CkW2wF
 uM71Lz8dSu6A7oqh6+/Yum31xnBrZn7O9cN+qb8yGHz2+QTuPy4nizkqu/iiqILU/6ny
 05B6Y+f0yAFQ8v7eWVJ6drUF10FtICFr8QkXm44+pel4vNeJwKh7KD7z6SW4roAvaCmh
 WF4pjqlsvG3iaNkqlMfGsXPSV53adyIvYmNazUTQY5dqaiYFwlmmSuugXqQE/u6TANU9
 ztXA==
X-Gm-Message-State: AOAM533HgJRL+wnLgmyc53Eh5RgQgt4nfHznAO+f8vEpbWSyBpkBKucg
 ncelbhO4o0WU9xAnQbFg8ktCQZM/JH2IlI3MoWNV8AcCHyvs6wWlyr/yZ3wPAE0vQrs8CBkW4T4
 0PTdjpQm1PgrAEYfQz2xtDqzw7E6hZPM3kTVPmqmcH9yFDSAi7wiDBWUQnkQ2j+1p
X-Received: by 2002:adf:cc92:: with SMTP id p18mr33378149wrj.98.1630425964170; 
 Tue, 31 Aug 2021 09:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVokr3w6QB6r8xOVS/oEeP5477cFELaFWv5W02/DVJ35OyoGLwf4OarmUkst9PboBIyU085w==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr33378111wrj.98.1630425963885; 
 Tue, 31 Aug 2021 09:06:03 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l21sm2791721wmh.31.2021.08.31.09.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:06:03 -0700 (PDT)
Subject: Re: [PATCH] block/vvfat: Fix ro shared folder
To: Guillaume Roche <groche@genymobile.com>
References: <20210831141727.347597-1-groche@genymobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ed17db68-127c-94b3-a2f7-1f9a18c67d64@redhat.com>
Date: Tue, 31 Aug 2021 18:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831141727.347597-1-groche@genymobile.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Guillaume,

On 8/31/21 4:17 PM, Guillaume Roche wrote:
> QEMU exits in error when passing a vfat shared folder in read-only mode.
> 
> To fix this issue, this patch removes any potential write permission
> from cumulative_perms, when a read-only block device is in use.
> 
> Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=918950
> 
> Signed-off-by: Guillaume Roche <groche@genymobile.com>
> ---
> This is an attempt to fix this behavior, but it feels a bit hacky to me
> since this patch checks for the vvfat format in a generic function.

What about implementing bdrv_vvfat::bdrv_check_perm()?

> However, I'd be glad to have some advice to make it better. Anyway, I
> ran the block tests to ensure this does not introduce any regression.
> 
> To add some context: I know that this can be worked around by setting 
> the shared folder in rw mode. But our use-case requires using both
> shared and VM snapshots, and QEMU prevents using snapshot with a rw 
> shared folder.
> 
>  block.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/block.c b/block.c
> index e97ce0b1c8..3f59e3843f 100644
> --- a/block.c
> +++ b/block.c
> @@ -2383,6 +2383,12 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
>          cumulative_shared_perms &= c->shared_perm;
>      }
>  
> +    /* Discard write permission if vvfat block device is read-only */
> +    const char *format = bdrv_get_format_name(bs);
> +    if (format != NULL && strncmp(format, "vvfat", 5) == 0 && bdrv_is_read_only(bs)) {
> +        cumulative_perms &= ~BLK_PERM_WRITE;
> +    }
> +
>      *perm = cumulative_perms;
>      *shared_perm = cumulative_shared_perms;
>  }
> 


