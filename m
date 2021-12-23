Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5547E3E2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:59:44 +0100 (CET)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Nh9-0003Qb-FD
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0NS9-0004tL-Vt
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0NS7-0005Nu-WC
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640263451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ygy3rDpeQMM0w8uggI3hh8xWS/nKBF5tuMLdnfRcmQ=;
 b=ET6vr/eZuR6paAUKVa3n+gCskeMdyLnynHiafVXqY//u/Wu8KEe4VQHW+E0GO7c9aPGzR/
 UGIY4bx1GL3RMJ760EuBfn0VK+r1nscB3ugw3UfWnlrhuPvjVds5ve3lzhjyJbDXLZU0vu
 N7DJfT7Oy6xrM3VYFB6aI9Hf1vUWPqI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-XGx8lRH6OBGRM-CWsxPmdA-1; Thu, 23 Dec 2021 07:44:10 -0500
X-MC-Unique: XGx8lRH6OBGRM-CWsxPmdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so691936wmq.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 04:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ygy3rDpeQMM0w8uggI3hh8xWS/nKBF5tuMLdnfRcmQ=;
 b=Vr7GeLvTwq0l2zcMYT34EdvO3O91+vxWnBIpOK2JYs0PHpVfEN0DpMUYLKuZCtHjJ7
 5puLGsp77AgUqiz6UnlvF97rijuXSiXNnlGbyvkFec8zmV16hOACMRTj0eG82qrC1Ipm
 KfIincOK1/Ku980LxUW/RqeMNTceRseS3HIxfIdnbg+/hKnG279BP5a9itovEPUztphD
 DwqwehcgdllgeLh+0rDGGqdMnpf5GkGRnhyE/M6ba9iBVTS1NZmLoDq6HCCBiiGbCtcs
 jSzG/7GHBnNHVpKqz8iuUUypg4Q/MoJ3m10+N/UOVXSbS2d7J02P+az7kkrv1YdUIj3k
 dw3Q==
X-Gm-Message-State: AOAM5328Uv6QFBmQAJZkFcz2Z9yLmzAHKg70257o7HTPx/6EEc4vuOyw
 yN0xFN3kkRJk5jaQ5ZjPvIgILG80PrCHW0k1Z2Xq57a6SPvzB3fuGJhtQtbF13LEhoLz68+BKiG
 L6gr5lSOW8vw9pjw=
X-Received: by 2002:a05:600c:4408:: with SMTP id
 u8mr1724770wmn.177.1640263449156; 
 Thu, 23 Dec 2021 04:44:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9ME3PQoRnMaFcg6T8WaBICbAzVbrG2fqFZZL3B7yFkODTTPVrylXphuV5x5dviByqZk83Aw==
X-Received: by 2002:a05:600c:4408:: with SMTP id
 u8mr1724758wmn.177.1640263448964; 
 Thu, 23 Dec 2021 04:44:08 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id i1sm7733944wml.26.2021.12.23.04.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 04:44:08 -0800 (PST)
Message-ID: <d7f70d12-7fe3-ed2f-9959-79a86cf1d4e6@redhat.com>
Date: Thu, 23 Dec 2021 13:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 19/19] iotests: specify some unsupported_imgopts for
 python iotests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
 <20211203130737.2924594-20-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211203130737.2924594-20-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.21 14:07, Vladimir Sementsov-Ogievskiy wrote:
> We support IMGOPTS for python iotests now. Still a lot of tests are
> unprepared to common IMGOPTS that are used with bash iotests. So we
> should define corresponding unsupported_imgopts.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/044                                 | 3 ++-
>   tests/qemu-iotests/065                                 | 3 ++-
>   tests/qemu-iotests/163                                 | 3 ++-
>   tests/qemu-iotests/165                                 | 3 ++-
>   tests/qemu-iotests/196                                 | 3 ++-
>   tests/qemu-iotests/242                                 | 3 ++-
>   tests/qemu-iotests/246                                 | 3 ++-
>   tests/qemu-iotests/254                                 | 3 ++-
>   tests/qemu-iotests/260                                 | 4 ++--
>   tests/qemu-iotests/274                                 | 3 ++-
>   tests/qemu-iotests/281                                 | 3 ++-
>   tests/qemu-iotests/303                                 | 3 ++-
>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 ++-
>   tests/qemu-iotests/tests/migrate-bitmaps-test          | 3 ++-
>   tests/qemu-iotests/tests/migrate-during-backup         | 3 ++-
>   tests/qemu-iotests/tests/remove-bitmap-from-backing    | 3 ++-
>   16 files changed, 32 insertions(+), 17 deletions(-)

Few of these tests look like they could be made to support refcount_bits 
if we filtered qemu-img info output accordingly, but I don’t mind just 
marking the option as unsupported, so I’m good with your approach.

> diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
> index 714329eb16..a5ee9a7ded 100755
> --- a/tests/qemu-iotests/044
> +++ b/tests/qemu-iotests/044
> @@ -118,4 +118,5 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
>   if __name__ == '__main__':
>       iotests.activate_logging()
>       iotests.main(supported_fmts=['qcow2'],
> -                 supported_protocols=['file'])
> +                 supported_protocols=['file'],
> +                 unsupported_imgopts=['refcount_bits'])
> diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
> index 4b3c5c6c8c..f7c1b68dad 100755
> --- a/tests/qemu-iotests/065
> +++ b/tests/qemu-iotests/065
> @@ -139,4 +139,5 @@ TestQMP = None
>   
>   if __name__ == '__main__':
>       iotests.main(supported_fmts=['qcow2'],
> -                 supported_protocols=['file'])
> +                 supported_protocols=['file'],
> +                 unsupported_imgopts=['refcount_bits'])
> diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
> index dedce8ef43..0b00df519c 100755
> --- a/tests/qemu-iotests/163
> +++ b/tests/qemu-iotests/163
> @@ -169,4 +169,5 @@ ShrinkBaseClass = None
>   
>   if __name__ == '__main__':
>       iotests.main(supported_fmts=['raw', 'qcow2'],
> -                 supported_protocols=['file'])
> +                 supported_protocols=['file'],
> +                 unsupported_imgopts=['compat=0.10'])

Works for my case (I use -o compat=0.10), but compat=v2 is also allowed.

For cases that don’t support anything but refcount_bits=16, you already 
disallow specifying any refcount_bits value, even refcount_bits=16 
(which would work fine in most cases, I believe). Perhaps we should then 
also just disallow any compat option instead of compat=0.10 specifically?

[...]

> diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
> index 34103229ee..12cc4dde2e 100755
> --- a/tests/qemu-iotests/tests/migrate-during-backup
> +++ b/tests/qemu-iotests/tests/migrate-during-backup
> @@ -94,4 +94,5 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
>   
>   if __name__ == '__main__':
>       iotests.main(supported_fmts=['qcow2'],
> -                 supported_protocols=['file'])
> +                 supported_protocols=['file'],
> +                 unsupported_imgopts=['compat=0.10'])

It seems to me like this test can handle compat=0.10 just fine, though.

Hanna


