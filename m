Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF0380988
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:30:36 +0200 (CEST)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWxf-0005CS-7Y
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWuo-0002Pa-RY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWun-0002tl-3u
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620995256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psWWFXoI18vkaSQ0hCj60qLQGpqPuttCHRHQa/YhlKI=;
 b=QzaRPguBoY6sJl+SaHdJjdwO/QOMH4yZFOE3D9E5uHgSIJdiIKutP8QRfiWavntzhU9B+p
 2wq4QQzuLa++NiyyQmQxUv9y0OfjC1/0pLADoJ46MLtBHVLQl6kF9dkLRa9DTtffsCoFXS
 ToVOWBGGim4e7Sui3CPBe6n5B7wJeAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-82J2X5AoPl-Vi-_evd4LCw-1; Fri, 14 May 2021 08:27:32 -0400
X-MC-Unique: 82J2X5AoPl-Vi-_evd4LCw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso12622620wrf.11
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=psWWFXoI18vkaSQ0hCj60qLQGpqPuttCHRHQa/YhlKI=;
 b=i8WvZDgLeeHDw9EIUkDLv/l+9wT73L3Ev3N5lvqYl75fMn7Pal8bg7RBtrAyMZIt8R
 kVB843qSlst8eNWvpCA0Zkyx7RV54wiHmDoJEQaOeLS+KVw8mXgQE9OkkPg/dEBHf0eU
 N/zqywqbvkAxN/YgnLawFnY7WfXSCajRK9FKf92dLAmWbSXVcaWnzbVB8BS0UeLF7LeU
 nu8jM0BxumWXQ0YN0nBm5y56eTp5uQby5xeaJcnv964m6KlIEv+83evkbY9LPdoqsd9d
 /cFvUmoEZMZW//IQZYMJjaaW6pmc8HSXqBtZJ4ReyuSGh7fu+kvJJkTB21UjdrDdMnwf
 nMZw==
X-Gm-Message-State: AOAM531n7lnprIF97dSgakcntaBol7VzpjDAuSWG733Zte9oDGl3vksD
 9pLYQqJhRfGwDLeowXcAl8VX7HYKseUOQJ9MSyFknYdN61RGg4A8mTO56fAnJMWzHR19xR9wPz4
 aS7pzjRfKSHp4Yus=
X-Received: by 2002:a1c:238d:: with SMTP id j135mr9395263wmj.170.1620995251602; 
 Fri, 14 May 2021 05:27:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVGBh4/QprieU6YHD99O9U3MGMdAx5SJF5J+fgr+nZbdzLljMlEYedq159Xtd+imytZTJJOw==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr9395243wmj.170.1620995251403; 
 Fri, 14 May 2021 05:27:31 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id f8sm4814797wmg.43.2021.05.14.05.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:27:31 -0700 (PDT)
Subject: Re: [PATCH v2 06/12] crypto: bump min gnutls to 3.5.18, dropping
 RHEL-7 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-7-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b3a518fe-8e53-f531-62f7-11f292be635d@redhat.com>
Date: Fri, 14 May 2021 14:27:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gnutls version
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 3.6.14
>        Debian Buster: 3.6.7
>   openSUSE Leap 15.2: 3.6.7
>     Ubuntu LTS 18.04: 3.5.18
>     Ubuntu LTS 20.04: 3.6.13
>              FreeBSD: 3.6.15
>            Fedora 33: 3.6.16
>            Fedora 34: 3.7.1
>              OpenBSD: 3.6.15
>       macOS HomeBrew: 3.6.15
> 
> Ubuntu LTS 18.04 has the oldest version and so 3.5.18 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.yml | 15 ---------------
>   configure      |  2 +-
>   2 files changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f44c5b08ef..f386f445d9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -703,21 +703,6 @@ build-coroutine-sigaltstack:
>                       --enable-trace-backends=ftrace
>       MAKE_CHECK_ARGS: check-unit
>   
> -# Most jobs test latest gcrypt or nettle builds
> -#
> -# These jobs test old gcrypt and nettle from RHEL7
> -# which had some API differences.
> -crypto-only-gnutls:
> -  <<: *native_build_job_definition
> -  needs:
> -    job: amd64-centos7-container
> -  variables:
> -    IMAGE: centos7
> -    TARGETS: x86_64-softmmu x86_64-linux-user
> -    CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
> -    MAKE_CHECK_ARGS: check
> -
> -
>   # Check our reduced build configurations
>   build-without-default-devices:
>     <<: *native_build_job_definition
> diff --git a/configure b/configure
> index f077cdb9c3..2fa86ccaa1 100755
> --- a/configure
> +++ b/configure
> @@ -2790,7 +2790,7 @@ fi
>   
>   if test "$gnutls" != "no"; then
>       pass="no"
> -    if $pkg_config --exists "gnutls >= 3.1.18"; then
> +    if $pkg_config --exists "gnutls >= 3.5.18"; then
>           gnutls_cflags=$($pkg_config --cflags gnutls)
>           gnutls_libs=$($pkg_config --libs gnutls)
>           # Packaging for the static libraries is not always correct.
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


