Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A834A5AAC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:55:33 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqou-0005Mg-U0
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEqn7-0003cX-Jk
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEqn4-0000bO-VP
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643712805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGFLx6XziTIfyw63vs6lHJ6+rn6tNFaykb5vODVjEVs=;
 b=RGVPwuI7dbMrmWdKtPBXiR07L3bPYcjyeoKrVDPiJqBcyqXXn8axWBmWq/CU3yK67XnbXm
 s1MofyTH2btPiPbGg+nLHS4YkmSWt6Svjiy2N8mta165UWkTITrsYlIvUkK07+8LLdvn1g
 9f3bXESg4m0QaiESA1xMcfr/PVYzDZY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-0S79rYGDNOyBDE2yN1EFhQ-1; Tue, 01 Feb 2022 05:53:21 -0500
X-MC-Unique: 0S79rYGDNOyBDE2yN1EFhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m20-20020a05600c3b1400b003539593ea39so331665wms.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=iGFLx6XziTIfyw63vs6lHJ6+rn6tNFaykb5vODVjEVs=;
 b=xSAvXU4dg5TCaC8bmhETt2fwoCAh6sYWtDbS8eQH9P9V9rX6OQX1mB3Lv1WhRhEPdV
 5BF1SkOno6gcdbOyVzDlJ2Ta4al/U3zdQOTV5Xyse9Qc5ssbTSSmoAnggPnzxYCXTHDM
 jWBMorRwZITG5Be161B0pS0yTe/S8VCgyRwvsUFqBl+/8WPm4y8qAySaR7K5fFd8gTmy
 6BjTacWP/zDl4yX4JZRNGCZ+fdElJSXKG9HYb2lsz7xs0ZgHtcJolq5TRC/nHLyAk00l
 JPC1abI/DSPNQvhecnDNuAl2tU95i4VXMESIAGDj4t/tPh14dxhTXv1e2KCWTaA1Ia5z
 CzMA==
X-Gm-Message-State: AOAM533z4SGvLGs9m8SRAusaQIMI2zxsm1Rgnxy6JuAcrzL+Lis4RZFl
 cVZ1ZsUtqDInoXOxo6ST2E/GIJlOQujYoemzr5ticmf1dhddNTixTqWUMNT0qWlnd/AaEjhTXg4
 eyRCjLpYvmhjx5k/4HJZ03F1Xt+w+Z4pCqSNmG2UPw57qitGGRPTWJIht7FqfXto=
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr20765447wrv.616.1643712800476; 
 Tue, 01 Feb 2022 02:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhD+vNsd99C8fTNBS3ztDndS1uMu7F2eEW0hYnGTMAQjndjxVYYnAXJu1H8+x9acISR919Qw==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr20765430wrv.616.1643712800200; 
 Tue, 01 Feb 2022 02:53:20 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id j15sm2033566wmq.19.2022.02.01.02.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:53:19 -0800 (PST)
Message-ID: <678a02df-572f-6533-1d30-9250d5273079@redhat.com>
Date: Tue, 1 Feb 2022 11:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220201101911.97900-1-thuth@redhat.com>
In-Reply-To: <20220201101911.97900-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Please ignore the "2/2" in the subject, this is meant to be a standalone patch.

  Thomas


On 01/02/2022 11.19, Thomas Huth wrote:
> Support for CentOS 8 has stopped at the end of 2021, so let's
> switch to the Stream variant instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/docker/dockerfiles/centos8.docker | 4 ++--
>   tests/lcitool/refresh                   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index cbb909d02b..cf95cd4b4a 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,10 +1,10 @@
>   # THIS FILE WAS AUTO-GENERATED
>   #
> -#  $ lcitool dockerfile centos-8 qemu
> +#  $ lcitool dockerfile centos-stream-8 qemu
>   #
>   # https://gitlab.com/libvirt/libvirt-ci
>   
> -FROM docker.io/library/centos:8
> +FROM quay.io/centos/centos:stream8
>   
>   RUN dnf update -y && \
>       dnf install 'dnf-command(config-manager)' -y && \
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 033120e223..30196ef3cd 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
>   ]
>   
>   try:
> -   generate_dockerfile("centos8", "centos-8")
> +   generate_dockerfile("centos8", "centos-stream-8")
>      generate_dockerfile("fedora", "fedora-35")
>      generate_dockerfile("ubuntu1804", "ubuntu-1804",
>                          trailer="".join(ubuntu1804_skipssh))


