Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A337BC06
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:46:44 +0200 (CEST)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnK7-00085H-M9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgnIT-0006oA-HB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:45:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgnIQ-00038F-Bn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620819896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3ElCDoOUuXWz1/xhBHN9MwYDHebQZZpXe30aD6P/Fo=;
 b=aoxPn9dEYA67N6WS8AhhVtLoreuEjAInYMfuazIuJxfBIbEf2oQBPMcJq6/UgWn2nFsOTS
 gDkFiCB79h7G3Zfn0JBx1hAOMTKBIYBY5yJDXxm1x7R065N1l7GBEJm9DgGu7VA9OZePdU
 X91ZnigCoxKI/2oFTQYIIuWznWe4E3E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Mi1UtDCUNLepnN7BxDzaqg-1; Wed, 12 May 2021 07:44:54 -0400
X-MC-Unique: Mi1UtDCUNLepnN7BxDzaqg-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so9939488wrm.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o3ElCDoOUuXWz1/xhBHN9MwYDHebQZZpXe30aD6P/Fo=;
 b=HgwREf8x2Io5kHyYwjaS5hny01XTw91NpwXgX4IUK6XbT395B8ND+BuBmX6BPwMJuM
 ubn5IJzS6Zy96024WGEI7yHc1dmwamkLgekFg/rPpMdRTI5wdO7gX2Q+bStg1FBy2Z50
 7aIW49lgLCwBLhi77DSfQaGkdOqKEXmTmLmNLOzW6kKG5vCydrvUhZd+9yqfEW8NUKdV
 23+LV6QRfAP8qdHO4ncFkZwk293U9Uats2MUQLhYvmunEWh7/i9uxlAU52T/7Pqlp4kp
 c2IZzscc+0qz1SZxCzas4O6JeX3kLCixVwniIXhqfD+Wh44dknL1edmZf74byDyDSpdM
 eBbw==
X-Gm-Message-State: AOAM533jNAF2WRW6C1b9Ze79eVrCysn8LOTS6zzcKcnGrJ4rkOTsIPmx
 bCtCEb/1vky54OowJbrSWwB1THrJEB6CO7RNXAZP4vwQ4dRsiIjIz1fxJ0isPEog3r5cQ+HNzy+
 vwz2AgOWiSUzOwig=
X-Received: by 2002:adf:eb82:: with SMTP id t2mr41243663wrn.337.1620819893407; 
 Wed, 12 May 2021 04:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqA4u+Wr3Eg7JTqFIX0kdATK/E5hesHi6eruMC0OVJwJXvU9/zyKBV11LRREtqEixmDjIfqQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr41243640wrn.337.1620819893244; 
 Wed, 12 May 2021 04:44:53 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v20sm27036761wmj.15.2021.05.12.04.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 04:44:52 -0700 (PDT)
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 / XCode
 10.2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
Date: Wed, 12 May 2021 13:44:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-13-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 3:26 PM, Daniel P. Berrangé wrote:
> Several distros have been dropped since the last time we bumped the
> minimum required CLang version.
> 
> Per repology, currently shipping versions are:
> 
>              RHEL-8: 10.0.1
>      Debian Stretch: 7.0.1
>       Debian Buster: 7.0.1
>  openSUSE Leap 15.2: 9.0.1
>    Ubuntu LTS 18.04: 10.0.0
>    Ubuntu LTS 20.04: 11.0.0
>          FreeBSD 12: 8.0.1
>           Fedora 33: 11.0.0
>           Fedora 34: 11.1.0
> 
> With this list Debian Stretch is the constraint at 7.0.1
> 
> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> which dates from March 2019.

But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
for non-x86 targets until we have figured out who is willing
to share/maintain such non-x86 native runners on Gitlab.

There:

$ clang --version
clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)

If we don't use Travis-CI, then your patch is fine, but we
need a previous patch removing .travis.yml.

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  configure | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/configure b/configure
> index 43d2470bb6..c41a3e5eef 100755
> --- a/configure
> +++ b/configure
> @@ -2050,12 +2050,12 @@ fi
>  cat > $TMPC << EOF
>  #if defined(__clang_major__) && defined(__clang_minor__)
>  # ifdef __apple_build_version__
> -#  if __clang_major__ < 5 || (__clang_major__ == 5 && __clang_minor__ < 1)
> -#   error You need at least XCode Clang v5.1 to compile QEMU
> +#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 2)
> +#   error You need at least XCode Clang v10.2 to compile QEMU
>  #  endif
>  # else
> -#  if __clang_major__ < 3 || (__clang_major__ == 3 && __clang_minor__ < 4)
> -#   error You need at least Clang v3.4 to compile QEMU
> +#  if __clang_major__ < 7 || (__clang_major__ == 7 && __clang_minor__ < 0)
> +#   error You need at least Clang v7.0 to compile QEMU
>  #  endif
>  # endif
>  #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> @@ -2068,7 +2068,7 @@ cat > $TMPC << EOF
>  int main (void) { return 0; }
>  EOF
>  if ! compile_prog "" "" ; then
> -    error_exit "You need at least GCC v6.3 or Clang v3.4 (or XCode Clang v5.1)"
> +    error_exit "You need at least GCC v6.3 or Clang v7.0 (or XCode Clang v10.2)"
>  fi
>  
>  # Accumulate -Wfoo and -Wno-bar separately.
> 


