Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261C4CBD11
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:46:34 +0100 (CET)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjuj-0004bt-Fp
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjsS-0002q3-En
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjsO-0007Pw-GJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646307847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IL5m4CExEucxhNM0ghT0LdpUbvtgH2HfeDSx8DVOi9k=;
 b=jRO8+zvNSPL/SNwPdWGEF/g6Bqq0Ug+M4W9Ez+FGTSVeCAOMzVZq844JkTbjzoUON29pUp
 ZnJ8JhuqXYV6V/bT0D2bmDR0q+CKfUWB2p0UBQd5TY74rqRgbl6oUowct86sqFJ/6Cl8LO
 I7c1i8wHgOzMvq5SV58nJ63L5nlaa1c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-fpGqGzz7MqGIuKP_xm01LQ-1; Thu, 03 Mar 2022 06:44:06 -0500
X-MC-Unique: fpGqGzz7MqGIuKP_xm01LQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 y5-20020a1709060a8500b006da9258a34cso816605ejf.21
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IL5m4CExEucxhNM0ghT0LdpUbvtgH2HfeDSx8DVOi9k=;
 b=jMe1E4y+M3y+Sf5P7IpxbUpZbg1qmzqi6wBbF1yY/BFi2PoVUoK7bhcISAJrUTWwW/
 zYaTgCTSxEX0oObzROAdcbhBgAmVGVSpHzQCFpfes7jkfnqqXFV+Wg0F6osgLAOb2yEx
 76kCIaJfyya6xNV0Tn1UEwON3xhMfHpCUg3rIQCar7fi3IDJJIv5W/9/7nq1TmZk+DrC
 xLJeptiI4mvwdTW+iyj+CXS2xt4CLj1SE4XIkn7F5BajDiZ08WC+evuOOj2g8Wjhhtyh
 +M8jLNhdkku8bjQhUvlT8fcVkOUH3ey73fP/1jJH9/yye5lHM8kxiuqirFo8UC1/jjyR
 w4yA==
X-Gm-Message-State: AOAM5300RK0Pba1OPcEybCcUjOAZ2aYUwRxKvXOb7Wu2z68zx1A8sj1i
 HLw+E4yEP7yx6wmKwHcy3EM7Hply6K73aJvKgvLu3WxSaQhkBYFGMSUUtFh8Qm0nv93RaM4Sn1D
 HtghdEiU2iC84UPo=
X-Received: by 2002:a17:906:7706:b0:6d6:e521:5471 with SMTP id
 q6-20020a170906770600b006d6e5215471mr9986089ejm.387.1646307845262; 
 Thu, 03 Mar 2022 03:44:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpa8pAvkQRiixuHJU8ZaopTHa/cEIWDP5oUYp0H43XT2SDidGZHXWEMNRGuF4ZG/xoOlJ9MQ==
X-Received: by 2002:a17:906:7706:b0:6d6:e521:5471 with SMTP id
 q6-20020a170906770600b006d6e5215471mr9986053ejm.387.1646307844949; 
 Thu, 03 Mar 2022 03:44:04 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a17090633d300b006ce3d425b22sm615404eja.1.2022.03.03.03.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 03:44:04 -0800 (PST)
Message-ID: <04aa1423-11ab-ecc7-7637-cca6d7b2c1a3@redhat.com>
Date: Thu, 3 Mar 2022 12:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 15/16] iotests/image-fleecing: add test case with bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-16-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220228113927.1852146-16-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
> Note that reads zero areas (not dirty in the bitmap) fails, that's
> correct.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
>   tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
>   2 files changed, 108 insertions(+), 8 deletions(-)
>
> diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
> index 909fc0a7ad..33995612be 100755
> --- a/tests/qemu-iotests/tests/image-fleecing
> +++ b/tests/qemu-iotests/tests/image-fleecing

[...]

> @@ -50,11 +50,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
>                ('0xcd', '0x3ff0000', '64k')] # patterns[3]
>   
>   def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
> -            fleece_img_path, nbd_sock_path, vm):
> +            fleece_img_path, nbd_sock_path, vm,
> +            bitmap=False):
>       log('--- Setting up images ---')
>       log('')
>   
>       assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
> +    if bitmap:
> +        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0

Doing this means this test can only be run with qcow2, but right now it 
claims to support many more formats that break with this patch applied.  
I think the supported_fmts list needs to be restricted.

Also, iotest 297 complains about three lines being too long now.

> +
>       if use_snapshot_access_filter:
>           assert use_cbw
>           assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0


