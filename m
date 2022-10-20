Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D1606393
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:52:22 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWuB-0001AR-6T
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:52:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWk1-0006n3-E8
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olU8o-0005jc-Oh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:55:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olU8m-0001ND-Nb
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666266911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFhaFIbEwdyQNllIP4IlE8Ec6t8RLDYo8kBlNnh2rF8=;
 b=OCN9GNNFtL1N4G861ep9AuOXGh2acMiz5DuCU738L70Nn3uCcjLYD0PKykXvGMnxTe+I3f
 JCma7TSkopegO+AjmWZHL0/oxeyvGbgd9n4trj3VBdIb1EwYo0PwDVrJCN2rkb3+4ycY9W
 COHnGrqztqwFHH5ZMhlQRsg8PS7XELw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-Jij1c5ClMT-2bWOZtusCXg-1; Thu, 20 Oct 2022 07:55:10 -0400
X-MC-Unique: Jij1c5ClMT-2bWOZtusCXg-1
Received: by mail-qt1-f197.google.com with SMTP id
 e24-20020ac84918000000b0039878b3c676so14663348qtq.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CFhaFIbEwdyQNllIP4IlE8Ec6t8RLDYo8kBlNnh2rF8=;
 b=7C1MftEZSHy8CjjTiIS0pO+iD2UaimOg8C11uYshx4MRGE0K+0m865MWjPZhbTeABr
 6MSZ86fZszJwzDZH7uGvTcUVtFVrxon23tqRbUQuG3Av9hQ5+HTinOneOgPdXoTreTt9
 /o6W2rLRO+zM1ymvs7ZZH00kD2KFT9lO5UZmK1URs6lqe6kG7OloFvDQvHzn6XwXSt0u
 JBMekMcnmDfYevu5yPIYMgNI2Tm+ZN/4R0ctVHiFpVtOe46SfWuM5FcnAmddvkNiHza5
 kjexfpi00iNXrA8S2I9KkaSPyGz+rD4Cann2i9jeZAv9YWQ7vns3+K+UW0fT+xNsNsNM
 davA==
X-Gm-Message-State: ACrzQf1+Y1f9PX+xOvhCctSeLh073+3ryWH/gIFGuG2lbxLteRrb9mEg
 +RyBO5QAJLDxuNVE2fsPNQDcYYlGdarqPY4LrJF5AaAwRueZ6iqYbfpWTVS9/Ck5RxdVSLqnXan
 hyS+x2Z1UW2ekRfM=
X-Received: by 2002:ae9:e907:0:b0:6e9:5397:15fb with SMTP id
 x7-20020ae9e907000000b006e9539715fbmr8877805qkf.466.1666266910211; 
 Thu, 20 Oct 2022 04:55:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XdzxwIVVu/tNiWqERrZ3DtfZ5UyBcie3g91xrL+Yl9iukA0iO/yFkfSMCchjJ41I08HFgjw==
X-Received: by 2002:ae9:e907:0:b0:6e9:5397:15fb with SMTP id
 x7-20020ae9e907000000b006e9539715fbmr8877785qkf.466.1666266910006; 
 Thu, 20 Oct 2022 04:55:10 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 c22-20020ac85a96000000b003992448029esm6116821qtc.19.2022.10.20.04.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:55:09 -0700 (PDT)
Message-ID: <ccef84df-7c06-29d4-b234-a55441ff6161@redhat.com>
Date: Thu, 20 Oct 2022 13:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 07/26] tests/docker: Add flex/bison to
 `debian-hexagon-cross`
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
 <20221020115209.1761864-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020115209.1761864-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> debian-hexagon-cross contains two images, one to build the toolchain
> used for building the Hexagon tests themselves, and one image to build
> QEMU and run the tests.
> 
> This commit adds flex/bison to the final image that builds QEMU so that
> it can also build idef-parser.
> 
> Note: This container is not built by the CI and needs to be rebuilt and
> updated manually.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Message-Id: <20221014223642.147845-1-anjo@rev.ng>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> index 8d219bb81d..c4238e893f 100644
> --- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -43,7 +43,7 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
>   # Install QEMU build deps for use in CI
>   RUN apt update && \
>       DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
> +    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
>       DEBIAN_FRONTEND=noninteractive eatmydata \
>       apt build-dep -yy --arch-only qemu
>   COPY --from=0 /usr/local /usr/local

Reviewed-by: Thomas Huth <thuth@redhat.com>


