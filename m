Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC2324F21
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:27:42 +0100 (CET)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEo1-0002a9-Lw
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFEeA-0007ks-8b
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFEe8-0007P0-61
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614251847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cyd7SDEfbDZ6cRTAKNry9kObVF9u++5C80GLnWCK4O8=;
 b=fHJUozNahXnhmMi82C29UR2ShTfOmsLFnLQ3PzOA/1TPwR+Hs3Zg4oweH4XNmye/JQrqXq
 7G16TaIC+SwV4BMYjWohzaRzz3ZIUydpmC5qMa3/OEBWLOakwJh9JsDugj3SIJlkFjT5HK
 R7Lb0fNgkpYpwIwU6Zm5WEq7EDhJZCw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-98_iCad4PmmjSn6a-AJqug-1; Thu, 25 Feb 2021 06:17:25 -0500
X-MC-Unique: 98_iCad4PmmjSn6a-AJqug-1
Received: by mail-wm1-f71.google.com with SMTP id f13so78316wml.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 03:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cyd7SDEfbDZ6cRTAKNry9kObVF9u++5C80GLnWCK4O8=;
 b=NIVNttlWjBvALofPds1tbwR5c/2/XY41OLkH/gP63ZRWOvTRu9iUgZ4TFbpt4I9yeF
 bmB8/ifH8N1xt++d0GuzoR/wU0Qu1bL+lowUBBWaKbuH0ZtOtVOs02tSxJI/1dPrnduA
 o5KCxSJRF/GlGTIjM/5+8s1DqWy8uIqEIK6tk9eBadO3SyijZvy3a090kFpFI5yPEEsr
 UX0KxikYAkyNxOXuWzJmOg3w4cnUm5GbMtKW98LYnZRssUkCtIwnPScdZMSD9J8y5HDi
 4b2wR2KR2UbYiCuk5T6AQ1KrwqDyJnmNMgBKxVh8PTJCWxTjrObntyx3dM19m/FIcpTX
 +YlQ==
X-Gm-Message-State: AOAM5319vU/TYwhkMRnABYZnXpyCKN4kpIzK4Hk7ur2fzSiyZ91vjx8m
 sruo0o1mdAqny9g4hpmpvrK/FEi7bsQARF+C8q8aw9A93+jXvRRpgfofQq45n4UosLrzs8/Xy7R
 VHGP5wRDw2JvKVOmBYbkQneFXgVZNinvabUoZSVcEfNG918RhJ2Pl6AUxeRVT2u0u
X-Received: by 2002:a05:6000:1208:: with SMTP id
 e8mr3007583wrx.131.1614251844273; 
 Thu, 25 Feb 2021 03:17:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh+Q8qV2JzTOuXqVnQvKGXKdUHervWHsMOK3S3z3ltqzqHTtGBpUeEcPft1N0jIugz+FyRlQ==
X-Received: by 2002:a05:6000:1208:: with SMTP id
 e8mr3007570wrx.131.1614251844106; 
 Thu, 25 Feb 2021 03:17:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o10sm7688642wrx.5.2021.02.25.03.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 03:17:23 -0800 (PST)
Subject: Re: [PATCH] chardev: do not use short form boolean options in
 non-QemuOpts character device descriptions
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210225111157.619188-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c47f4807-4325-97b8-423e-ead1a2c1701f@redhat.com>
Date: Thu, 25 Feb 2021 12:17:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225111157.619188-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 12:11 PM, Paolo Bonzini wrote:
> Options such as "-gdb" or "-serial" accept a part-QemuOpts part-parsed-by-hand
> character device description.  Do not use short form boolean options in the
> QemuOpts part.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  chardev/char-socket.c         | 10 +++++-----
>  qapi/char.json                |  4 ++--
>  tests/guest-debug/run-test.py |  8 ++++----
>  3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


