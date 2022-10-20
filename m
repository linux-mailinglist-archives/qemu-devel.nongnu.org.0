Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A76606276
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:08:35 +0200 (CEST)
Received: from localhost ([::1]:38058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWDp-0004O2-B4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:08:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWBd-00018A-OR
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olU80-0005SF-0y
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olU7r-000156-5t
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666266854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7y+rgkZPA6nIJf4a6yjiWihfq//eeDESSDSHaqdWzFA=;
 b=Livfknmvt2OHSUGmaZck/E2UXVBJ1A5kHtBSp1BXzVWiDUa6IzPJFBtvD69j7Qczg+Z/Nx
 UUeIg9mrNts8zO3pFhQ+yWVKdOOYHYmGF3uhZPZDjqw9wceH/Dkvj1yehUxGFbw7+vA32p
 oYgAMgCdZZAWU8qsbm2e8+DsVyleDb0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-FWeNoyYHNIOSbhQ6LnKKmA-1; Thu, 20 Oct 2022 07:54:13 -0400
X-MC-Unique: FWeNoyYHNIOSbhQ6LnKKmA-1
Received: by mail-qv1-f71.google.com with SMTP id
 71-20020a0c804d000000b004b2fb260447so12587223qva.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7y+rgkZPA6nIJf4a6yjiWihfq//eeDESSDSHaqdWzFA=;
 b=tI97KgFAbqGwYVeRKDnZhdCgvtR6sEF3suoPXs5yhepmZ2EYCnUp5wOOR4m5rrQeV8
 O39rlDJkjB6ciLBa0jYg//UA1FthT8Z7uT40VnuTQcm/k0qPBHggNYAd/2njogD+LXlq
 yozzeDDtbPUdOh9khkmhnt/rZobcNuddT1yMnFzHDVqMR3r8BTHdvrYX8fQmHGryfPg/
 P0YSHlr1ClMNLksO5798XC8xWDgx3xWIGCNlICBuKp6Iz2ex6XKxyz27Nr+P2pi2CgDP
 UnGs/7rJxW79vLlP+qI8N/+mOgumCuC3X51Lrz9twJOKhufjRsM3fCgafR8pea8XUyVJ
 gfCQ==
X-Gm-Message-State: ACrzQf3pppCxC6ZAvE0bSJVBfWnMqG6qaDgQ1inTP3xvHF4m8zQ1E420
 9CC3OkmpbyCJg32bSoGzW551lu+r3txD54e5OzAPigH/ojsjiUD7FlblC6BQbRMiHmNqzWCx4Sn
 tbmLLu0onzFjD23I=
X-Received: by 2002:a05:622a:190d:b0:39c:df75:6880 with SMTP id
 w13-20020a05622a190d00b0039cdf756880mr10321200qtc.32.1666266852593; 
 Thu, 20 Oct 2022 04:54:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7tf2EfHx9s9iHQVyZuyfJK3Uxe3Ab2XPdLwNy8uQC7bBTR66PoqosuJOBZC8Vo/nUKuo+Btg==
X-Received: by 2002:a05:622a:190d:b0:39c:df75:6880 with SMTP id
 w13-20020a05622a190d00b0039cdf756880mr10321183qtc.32.1666266852360; 
 Thu, 20 Oct 2022 04:54:12 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 y9-20020a37f609000000b006ce7cd81359sm6852077qkj.110.2022.10.20.04.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:54:11 -0700 (PDT)
Message-ID: <70a5cb4e-4f60-edb8-9733-b8cee0e81987@redhat.com>
Date: Thu, 20 Oct 2022 13:54:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 03/26] tests/docker: Add flex/bison to `debian-all-test`
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020115209.1761864-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/2022 13.51, Alex Bennée wrote:
> From: Anton Johansson <anjo@rev.ng>
> 
> Adds flex/bison to the debian-all-test-cross container which was missed
> in the previous CI patch. These dependencies are required by the
> idef-parser patchset for target/hexagon.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221011173229.57909-1-anjo@rev.ng>
> ---
>   tests/docker/dockerfiles/debian-all-test-cross.docker | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
> index 2beb077fb4..8dc5e1b5de 100644
> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> @@ -20,8 +20,10 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>   # Add extra build tools and as many cross compilers as we can for testing
>   RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>           apt install -y --no-install-recommends \
> +        bison \
>           ccache \
>           clang  \
> +        flex \
>           git \
>           ninja-build \
>           gcc-aarch64-linux-gnu \

Reviewed-by: Thomas Huth <thuth@redhat.com>


