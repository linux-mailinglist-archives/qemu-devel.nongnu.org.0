Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F021492998
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:25:04 +0100 (CET)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qM3-00029w-1B
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9oai-00026h-4o
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9oaf-0004lJ-AS
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642512719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNed+ABYr6ScLudaNlEAhRY+r9cCyLQwXJ00MuauOsw=;
 b=SQYwLzbf4J/uIeaq4IsOcEEEG8T5sUwbSozxvwxj0i/DrOwmmLmy85AGp58TBuTGp8MkuW
 iByblAsAKsCgGsy79Czm6cm70VibQyz4cZDCp2yNOvzX4dALT3f1xzDUT/2cOoEbA9oW7M
 K+BZUHLfYVcdKnrpBIBoZtGoJ8lpLRM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-2laHcYJJPO6XjsIw6fVdfw-1; Tue, 18 Jan 2022 08:31:57 -0500
X-MC-Unique: 2laHcYJJPO6XjsIw6fVdfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b0034c02775da7so3231569wms.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aNed+ABYr6ScLudaNlEAhRY+r9cCyLQwXJ00MuauOsw=;
 b=IHwVx1IucFWLfXez7Zl91F1V9Mlj+iB/TU9oQbDYDi799PdteXktMhXnDNZG2oIOp2
 W2EQfUTcwbf7qjBqasu2Eeekg/t2ofhYMei8NH2haU6u3QsCPrJkD7R4uE8juCcdiKAr
 9p5tiU7YcD3IaQTqrRIGHF7lI4lUIPQTaoX6vjrFkKtCoEfE9MuCugqa3ofshul+JiPA
 sfuioFLI+c8pSJJZi0WD6NI1fDEmglYxLKooGTye9CJuEWOYyt6lBb6Oa7zlAatkVWO/
 2N6Dy4LewX+QvJydKpJqk22Q7p8+zGESjeTv270hSCZ+A+qbvVCeX1SoZNX3p3l41+R/
 HtvQ==
X-Gm-Message-State: AOAM531BoMiE3dn2VGChnDzaLT8o1dseJ9TKZNOvkpEDPTY6B7wIe3v4
 EbNdc3mXlbAfLysVc9e4RsA7FPx/iyDDeAhOoOj1Hcxn2jF+5tYqmQX8RMdcsJQ1xAF5CQjX1EO
 zvrwdZ9pDKr0LCEM=
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr8949025wmq.29.1642512716636; 
 Tue, 18 Jan 2022 05:31:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfaCpmBKbgqfdFvfzuC2U9KoG7GCPuTGmHnC41Bv/BmMlt9M2YVL1Ljk0io9obYW7hHt34Xw==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr8949000wmq.29.1642512716444; 
 Tue, 18 Jan 2022 05:31:56 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n4sm5523448wri.29.2022.01.18.05.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:31:55 -0800 (PST)
Message-ID: <b52ba04c-107e-0928-5a08-c07b3bcd6fe6@redhat.com>
Date: Tue, 18 Jan 2022 14:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 07/19] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> Add a convenient function similar with bdrv_block_status() to get
> status of dirty bitmap.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/dirty-bitmap.h |  2 ++
>   include/qemu/hbitmap.h       | 11 +++++++++++
>   block/dirty-bitmap.c         |  6 ++++++
>   util/hbitmap.c               | 36 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 55 insertions(+)

[...]

> diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
> index 5e71b6d6f7..845fda12db 100644
> --- a/include/qemu/hbitmap.h
> +++ b/include/qemu/hbitmap.h
> @@ -340,6 +340,17 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
>                                int64_t max_dirty_count,
>                                int64_t *dirty_start, int64_t *dirty_count);
>   
> +/*
> + * bdrv_dirty_bitmap_status:
> + * @hb: The HBitmap to operate on
> + * @start: the offset to start from
> + * @end: end of requested area
> + * @is_dirty: is bitmap dirty at @offset
> + * @pnum: how many bits has same value starting from @offset
> + */
> +void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,

In addition to the comment not fitting the parameter names, I also don’t 
find it ideal that the parameter names here don’t match the ones in the 
function’s definition.

I don’t have a preference between `start` or `offset` (although most 
other bitmap functions seem to prefer `start`), but I do prefer `count` 
over `bytes`, because...  Well, it’s a bit count, not a byte count, 
right?  (And from the bitmap user’s perspective, those bits might stand 
for any arbitrary unit.)

Apart from that, looks nice to me.  I am wondering a bit why this 
function doesn’t simply return the dirty bit status (like, well, the 
block-status functions do it), but I presume you simply found this 
interface to be better suited for its callers.

> +                    bool *is_dirty, int64_t *pnum);
> +
>   /**
>    * hbitmap_iter_next:
>    * @hbi: HBitmapIter to operate on.


