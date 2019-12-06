Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F61115367
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:44:35 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idEqP-0004bs-SX
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1idEO9-0001C0-EF
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1idEO7-0001EG-LB
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:15:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37708
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1idEO7-0001C0-EA
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575641718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ez6aKTrCztIhj+k6BO+Q+SbcPIi5BLLMxobDaC/9HCg=;
 b=Xy1ETK+IQFwmjZ21YD8oVrZk5P6OZrfjBBgeVDLJkV/Clx+02PL8hWwDFF4CbqVyC/NyaI
 cIaCpWb2jrEalSRUqkmxBNrK1me3wiQgZGl0X8PLL/aL5dibtTHzxJX8M+SgRwqBeUJPSN
 uekgfb2DRnPD6VqtWeI5lwxDK0lDKkA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-fSGdPHdOPbqz8myTinna9g-1; Fri, 06 Dec 2019 09:15:17 -0500
Received: by mail-wm1-f72.google.com with SMTP id s12so2150574wmc.6
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aez2pqz/QPpZMITOw7HT4/ywKDjbfgmh+cBAnl2Cy+Q=;
 b=ifzG70AeyXGydYUuYYya5hYji9gq0hsIAFeUFeRvxPqg2QL/UUXue2F/nR4P3HFHOX
 lvz3ENDKaIySVLieopyBn5ySRhNGrZttLkWchuv8OS9U5fv8MbUHnFP1x/iCUv5c+EcX
 eGvnxjEitZO8jgZh1TuJhQtTPRdMgibOf+DWtS2a3FFDWVl75sWSTGvlQdnMrHJVEGjK
 RQ+9ItUV4XzXUlfuY3yr84Xz59M/gTFJ50bjv456Z6LiFzPw/JQG/9Ut1ypBY/q/skLk
 daNJ3gpmWfLGDLV5qHm5bSuaoXBF0IwgZzcQajcYBVXe4VTo5OQJKBpQCcSovjMFpozp
 ZMyA==
X-Gm-Message-State: APjAAAVxhIo28RHCpSDCpdq3pgMEPay+nwozGjZUXTyZsvTvAITIL6Ti
 dFST0q4myHKbUhAisa7hR2FNu0OkY7nFVEc920PKwTJEKTR6ra/gRA/y3MAU7vm0iUvng0EjfCH
 w2IhXmAoi3tsYEOU=
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr11403048wmc.135.1575641715935; 
 Fri, 06 Dec 2019 06:15:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvIUsEdxu0K846Mk45UXUhL4OMf5SYJAOiBYrBCNn1AY7jTO9W9M5gDgrE/cWIXx/FlNUv7A==
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr11403035wmc.135.1575641715762; 
 Fri, 06 Dec 2019 06:15:15 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id e16sm3445854wme.35.2019.12.06.06.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 06:15:15 -0800 (PST)
Subject: Re: [PATCH] mailmap: Add entry about me
To: Yu-Chen Lin <npes87184@gmail.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191206140931.14133-1-npes87184@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bd91caac-86c5-54a6-080d-37909b91a656@redhat.com>
Date: Fri, 6 Dec 2019 15:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191206140931.14133-1-npes87184@gmail.com>
Content-Language: en-US
X-MC-Unique: fSGdPHdOPbqz8myTinna9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 12/6/19 3:09 PM, Yu-Chen Lin wrote:
> I have two mail address, add entries for
> showing author and email correctly.
>=20
> Signed-off-by: Yu-Chen Lin <npes87184@gmail.com>
> ---
>   .mailmap | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..3fbf3902a3 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -151,7 +151,8 @@ Xiaoqiang Zhao <zxq_yx_007@163.com>
>   Xinhua Cao <caoxinhua@huawei.com>
>   Xiong Zhang <xiong.y.zhang@intel.com>
>   Yin Yin <yin.yin@cs2c.com.cn>
> -yuchenlin <npes87184@gmail.com>
> +Yu-Chen Lin <npes87184@gmail.com>
> +Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>

Thanks for updating your entry in .mailmap!

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>   YunQiang Su <syq@debian.org>
>   YunQiang Su <ysu@wavecomp.com>
>   Yuri Pudgorodskiy <yur@virtuozzo.com>
>=20


