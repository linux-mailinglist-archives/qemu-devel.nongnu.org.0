Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04E47B0CB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:01:45 +0100 (CET)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzL6d-00044R-90
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKLN-0008GA-8V
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:12:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKKp-00025k-QG
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaWzexhAFDu6T1kOHafm1WLVMDTrSOS6E6olJEiHoIU=;
 b=USzAr0evg+ETiVqgNsuHUQdKz/F7ySzV1DR1GE1fwR+/nCLu1WAjfORVvlbIBE5Cq0N9+0
 GMOUlXifsdCXT7I1/L9ZD1ixBXZcMxX1Ua7VNpIq/BkC0jJ1WFp+aw5JtveJ4oI5pINv5w
 Mmdz0N2Jy04QwzaS+h+v1dBoEjlBjKQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-hokh7WS5OGCu9hpqgZt0WA-1; Mon, 20 Dec 2021 04:52:22 -0500
X-MC-Unique: hokh7WS5OGCu9hpqgZt0WA-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay41-20020a05600c1e2900b00345a568e6b2so259156wmb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 01:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iaWzexhAFDu6T1kOHafm1WLVMDTrSOS6E6olJEiHoIU=;
 b=yebkEJpR+Op61xWvZqrC2cVgz4Z/e0MSKGLL+8X20BmWfpL0hljf08gscSoH0/m81l
 VkiY5pBGwTkwtXGBCaAwWVy/AXYXLJ63vP1ACcCZRKP4pGCXobv7P3UQzMvQzS5BA4kN
 g91OmODvnQvXuSDn69WQkHbKriK+PZuylK34PZykOuc8qvUpysXvbL2aS3IsHZVc/OdW
 HY6DacFM5/t2QNFMc95DM6X2TI6tqIXBsnqwh9RcGCnrBK0zLj4k3Zl7G2hFJI9rGA7f
 TyjgKM+RwGJN09HOFOGmMKmiIz5O/i6EJthQoXsioU8IueLwhyiOzqWrXOpF3diwFID6
 3ixA==
X-Gm-Message-State: AOAM533Pfq0h5WjuE53TH5hHS4N/5utBgilmCy5GonSV9NAAqtYwLnkd
 MRR/vYTHR/DP5cfyCBLs7DHvJ7qBQwHH2WcL+4rIYmBXqejRo4ELZ/SR3QToNhEg+LIQxN+KR0W
 advMYuKwJl2zgtuo=
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr19970589wmq.164.1639993941758; 
 Mon, 20 Dec 2021 01:52:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo4p/s5z8MIDuW2JYeszdtI68ddMX4YPfZDP+lZqmII+Tj2pz1ViOkYv97xKs/8R2nNeqNTw==
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr19970489wmq.164.1639993940260; 
 Mon, 20 Dec 2021 01:52:20 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id f6sm10396566wri.115.2021.12.20.01.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 01:52:19 -0800 (PST)
Message-ID: <3f1cede5-53fc-38aa-e2aa-661713f4c7db@redhat.com>
Date: Mon, 20 Dec 2021 10:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 07/10] configure: unify x86_64 and x32
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-8-pbonzini@redhat.com>
 <92c807dc-8608-5afe-d4c4-04876beea4d7@redhat.com>
 <7711e8ef-a890-3732-9a7c-cb9326325319@redhat.com>
 <286a0cdd-898c-354d-82c9-3925039aea18@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <286a0cdd-898c-354d-82c9-3925039aea18@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 22:48, Richard Henderson wrote:
> On 12/16/21 7:30 AM, Paolo Bonzini wrote:
>> On 12/16/21 10:10, Philippe Mathieu-Daudé wrote:
>>> On 12/16/21 09:51, Paolo Bonzini wrote:
>>>> The only difference between the two, as far as either configure or
>>>> Meson are concerned, is in the multilib flags passed to the compiler.
>>>>
>>>> For QEMU, this fixes the handling of TYPE_OLDDEVT in
>>>> include/exec/user/thunk.h and enables testing of dirty ring buffer,
>>>> because both are using HOST_X86_64.
>>>>
>>>> For tests/tcg, this means that on a hypothetical x32 host the
>>>> cross compiler will not be used to build the tests.
>>>
>>> Why not add the cross compiler definitions to tests/tcg?
>>>
>>> +: ${cross_cc_x32="$cross_cc_x86_64"}
>>> +: ${cross_cc_cflags_x32="-mx32"}
>>
>> tests/tcg does not support building x32 tests right now, does it?
> 
> We don't have docker support for x32, if that's what you mean.  But if
> you have x32 libraries installed on your host, I would think it would work.
> 
> 
>> What I meant is that, if you're on an x32 host, tests/tcg will now
>> build i386 and
>> x86-64 tests with the native compiler.
> And of course, those multilibs must be installed as well.

Debian still builds it:
https://buildd.debian.org/status/logs.php?pkg=qemu&ver=1%3A6.1%2Bdfsg-8%2Bb2&arch=x32

+=====================================================================+
| qemu 1:6.1+dfsg-8+b2 (x32)          Wed, 15 Dec 2021 00:23:53 +0000 |
+=====================================================================+

Package: qemu
Version: 1:6.1+dfsg-8+b2
Source Version: 1:6.1+dfsg-8
Distribution: sid
Machine Architecture: amd64
Host Architecture: x32
Build Architecture: x32
Build Type: any

qemu-user_6.1+dfsg-8+b2_x32.deb
 Package: qemu-user
 Source: qemu (1:6.1+dfsg-8)
 Version: 1:6.1+dfsg-8+b2
 Architecture: x32
 Maintainer: Debian QEMU Team <pkg-qemu-devel@lists.alioth.debian.org>
 Installed-Size: 91013

qemu-user-static_6.1+dfsg-8+b2_x32.deb
 Package: qemu-user-static
 Source: qemu (1:6.1+dfsg-8)
 Version: 1:6.1+dfsg-8+b2
 Architecture: x32
 Maintainer: Debian QEMU Team <pkg-qemu-devel@lists.alioth.debian.org>
 Installed-Size: 268968

qemu-system-ppc_6.1+dfsg-8+b2_x32.deb
 Package: qemu-system-ppc
 Source: qemu (1:6.1+dfsg-8)
 Version: 1:6.1+dfsg-8+b2
 Architecture: x32
 Maintainer: Debian QEMU Team <pkg-qemu-devel@lists.alioth.debian.org>
 Installed-Size: 25187

...


