Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1694B5ABF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:56:51 +0100 (CET)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhSs-0004lJ-9l
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nJhQ4-0002Hr-JH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:53:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nJhQ1-00078V-0Q
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644868425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BiIQ7CJK5kkgU/eQ87ZBiL0tpfwZtxqSwVBGBKsaCH8=;
 b=gDzwNBmjooF9/GD7E3TTXow0dbbtBz4gS5BgzljGno6NA2oO6lqOSlqAbz/LHdTe+1UOoC
 b3aXyZoJNnQ9HPL5Ut3HxtY7KOxFXiiMH/U8GGBEWHENMFj6eV5vzU4NdqrzzuexIn1CEB
 gIdQ7e7hXbwCFubsZaHAzeP5Js+XH7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-ge-HU2sFPZa0g9ooYV6NZg-1; Mon, 14 Feb 2022 14:53:44 -0500
X-MC-Unique: ge-HU2sFPZa0g9ooYV6NZg-1
Received: by mail-wm1-f72.google.com with SMTP id
 p24-20020a05600c1d9800b0037be98d03a1so121270wms.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 11:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BiIQ7CJK5kkgU/eQ87ZBiL0tpfwZtxqSwVBGBKsaCH8=;
 b=GP6QciAY9rkRP3N08WJgbKQFhD09/FZPiC8lFdftJ3oC1UaBgPi+4MYjKZ1JumtlIa
 JAfDPL9ltqe1X5Fhv5syiRsJ6NrklbrDQsirPVFTE2YckIYCpuamGUy+DBhDU+hN9i5y
 0QKEH7KUuYUkDoNPNS+p6JeWiPA0fMIyI2cxtCWrhtyXQcNzxR79ZVF6ranehL+6BRhQ
 7BSmmWobG61iR7B8GroGgR81Snac4NJMSMwZleuyds5ltvMrEDgc6vVMk6FyOC0WvQfA
 2ZW05AuubIgA8ofkViTvWujbjvIX5kNWTikv3+hNi3auysbYoHzHE6WKMQNEv1SpBTOt
 PzwA==
X-Gm-Message-State: AOAM532p8856Ki8w26nbR2hag8nSaffhGb2zZQydycIWSnDs0eUcSrxt
 WjwZXz0gyJDNWQpDBOpxxn2Fe8N8F2ZB8EHg1ja56svVVEQcfMq8vHkPItJySs3yV4XIKHM6axi
 I4wOv7+M6dONFhzI=
X-Received: by 2002:a7b:c418:0:b0:353:3698:d483 with SMTP id
 k24-20020a7bc418000000b003533698d483mr229301wmi.89.1644868423542; 
 Mon, 14 Feb 2022 11:53:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdI7tbXJjLSWH1dQl9qb/unHIdKKA1z8mfz5NIxiEuJSU1O+50B1eAqbTOnkPehcXnzPW9IA==
X-Received: by 2002:a7b:c418:0:b0:353:3698:d483 with SMTP id
 k24-20020a7bc418000000b003533698d483mr229282wmi.89.1644868423332; 
 Mon, 14 Feb 2022 11:53:43 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id l9sm12584579wrt.29.2022.02.14.11.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 11:53:42 -0800 (PST)
Message-ID: <27726d17-3836-6cf7-055b-7385cb64aa0b@redhat.com>
Date: Mon, 14 Feb 2022 20:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 10/24] iotest 065: explicit compression type
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
 <20220201144233.617021-11-hreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220201144233.617021-11-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/2022 15.42, Hanna Reitz wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> The test checks different options. It of course fails if set
> IMGOPTS='compression_type=zstd'. So, let's be explicit in what
> compression type we want and independent of IMGOPTS. Test both existing
> compression types.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Message-Id: <20211223160144.1097696-9-vsementsov@virtuozzo.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/065 | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
> index dc7716275f..f7c1b68dad 100755
> --- a/tests/qemu-iotests/065
> +++ b/tests/qemu-iotests/065
> @@ -88,7 +88,7 @@ class TestQMP(TestImageInfoSpecific):
>   
>   class TestQCow2(TestQemuImgInfo):
>       '''Testing a qcow2 version 2 image'''
> -    img_options = 'compat=0.10'
> +    img_options = 'compat=0.10,compression_type=zlib'
>       json_compare = { 'compat': '0.10', 'refcount-bits': 16,
>                        'compression-type': 'zlib' }
>       human_compare = [ 'compat: 0.10', 'compression type: zlib',
> @@ -96,17 +96,17 @@ class TestQCow2(TestQemuImgInfo):
>   
>   class TestQCow3NotLazy(TestQemuImgInfo):
>       '''Testing a qcow2 version 3 image with lazy refcounts disabled'''
> -    img_options = 'compat=1.1,lazy_refcounts=off'
> +    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zstd'
>       json_compare = { 'compat': '1.1', 'lazy-refcounts': False,
>                        'refcount-bits': 16, 'corrupt': False,
> -                     'compression-type': 'zlib', 'extended-l2': False }
> -    human_compare = [ 'compat: 1.1', 'compression type: zlib',
> +                     'compression-type': 'zstd', 'extended-l2': False }
> +    human_compare = [ 'compat: 1.1', 'compression type: zstd',
>                         'lazy refcounts: false', 'refcount bits: 16',
>                         'corrupt: false', 'extended l2: false' ]

iotest 065 is currently failing on my laptop - and I think this patch here 
is the reason (thanks to jsnow for helping me with the debugging): I don't 
have libzstd-devel installed on my system, so my QEMU does not feature the 
zstd compression algorithm. But this tests wants to use it, without checking 
its availability first. Could you please add such a check so that it works 
without zstd, too?

  Thomas


