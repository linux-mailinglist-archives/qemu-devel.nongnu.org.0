Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF9A1C1202
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 14:20:56 +0200 (CEST)
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUUf1-0004nt-Lr
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 08:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jUUe7-0004Co-Ob
 for qemu-devel@nongnu.org; Fri, 01 May 2020 08:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jUUe6-0004EC-Pk
 for qemu-devel@nongnu.org; Fri, 01 May 2020 08:19:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39320
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jUUe6-00045U-9j
 for qemu-devel@nongnu.org; Fri, 01 May 2020 08:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588335597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEKomhp/XMKSQO01Zcrw70UCfGWc3Fu5s2mCJwGdknk=;
 b=ZbcaqVcDd02SaeMmmC65bjLeDeBLHMlRfGej0K14PjUBsfJJiVSDeItVqkXOuqHn0JuM9q
 S0z++Tbjw3nkmrqw+CQnu6aBJ8BRMOfqNw563HnMr4bxVl+m3yjX/PJC0qGnt+FMs/V903
 RtHU02vtm6L2/ONVYYli709DdlvWPX4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-qP-kXjMuMUu6_k_S6i8eaw-1; Fri, 01 May 2020 08:19:53 -0400
X-MC-Unique: qP-kXjMuMUu6_k_S6i8eaw-1
Received: by mail-wr1-f71.google.com with SMTP id j16so5582443wrw.20
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 05:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sm0v5q6YWwXSseABwXI5+tFEn/MfQqvhxKHSvooa+Uk=;
 b=O8AcVK3D6Vak9LVJe5t7fTQzBJ2/HQ9naP2BXBCc++b/t2sciVbHDrvz7OuP3VUmRX
 gjl0im5j6hC7paf2W4yPTvAJGnUphoWgVDCYtr4aWUEXNBwPBlkuCa2xNy/5Y0lz8CBt
 mnNewgEVd5jR/pDheIUuXXuzZHcG6GxvjXFofUvtSHxIwQHDEXNhEYUw+V8H2AvOp5/P
 cDMTS8M1zY8x7UDY2BEpnasB8eX9nz6bPXgRwJ/6omDXTV5u71sJolqoQzNmxOrM/Kmx
 h72Us1ON3nRVnWrhFzqgwkcknk8LghVzWg8e369R7D1ki8Bt7MEfXyHVkvtvRiFRkU6k
 7LQQ==
X-Gm-Message-State: AGi0PuYsF7kNOPcyRp4QLflrQalKMDJqUpEaD9m2RFFFisAC8CMJIJAK
 fOI89yPYNEgP0Yc3RpJM4cznNAj3JC0aUJXVuHp0rwdKfMDheDTtNEy9/GukwltcsbirayESxQY
 C6WfnV9AI7/7brUA=
X-Received: by 2002:a7b:c941:: with SMTP id i1mr3503783wml.132.1588335591781; 
 Fri, 01 May 2020 05:19:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypKxIQAsRU/fJp/p6rYJd0xRIhJmdLGPswAPWuK2KBSt3PK90Sgew29XgbJaFf6yw0i//YnvHA==
X-Received: by 2002:a7b:c941:: with SMTP id i1mr3503771wml.132.1588335591523; 
 Fri, 01 May 2020 05:19:51 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id z1sm3799902wmf.15.2020.05.01.05.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 05:19:51 -0700 (PDT)
Subject: Re: [PATCH v1 2/4] .travis.yml: drop MacOSX
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200501111505.4225-1-alex.bennee@linaro.org>
 <20200501111505.4225-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0156dfd7-c0dd-be98-f8f2-9b6fcf59f6e7@redhat.com>
Date: Fri, 1 May 2020 14:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200501111505.4225-3-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 07:23:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/20 1:15 PM, Alex Benn=C3=A9e wrote:
> This keeps breaking on Travis so lets just fall back to the Cirrus CI
> builds which seem to be better maintained. Fix up the comments while
> we are doing this as we never had a windows build.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   .travis.yml | 28 +---------------------------
>   1 file changed, 1 insertion(+), 27 deletions(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index a4c3c6c805..49267b73b3 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -9,9 +9,8 @@ compiler:
>   cache:
>     # There is one cache per branch and compiler version.
>     # characteristics of each job are used to identify the cache:
> -  # - OS name (currently, linux, osx, or windows)
> +  # - OS name (currently only linux)
>     # - OS distribution (for Linux, xenial, trusty, or precise)
> -  # - macOS image name (e.g., xcode7.2)
>     # - Names and values of visible environment variables set in .travis.=
yml or Settings panel
>     timeout: 1200
>     ccache: true
> @@ -271,31 +270,6 @@ jobs:
>           - TEST_CMD=3D""
>  =20
>  =20
> -    # MacOSX builds - cirrus.yml also tests some MacOS builds including =
latest Xcode
> -
> -    - name: "OSX Xcode 10.3"
> -      env:
> -        - BASE_CONFIG=3D"--disable-docs --enable-tools"
> -        - CONFIG=3D"--target-list=3Di386-softmmu,ppc-softmmu,ppc64-softm=
mu,m68k-softmmu,x86_64-softmmu"
> -      os: osx
> -      osx_image: xcode10.3
> -      compiler: clang
> -      addons:
> -        homebrew:
> -          packages:
> -            - ccache
> -            - glib
> -            - pixman
> -            - gnu-sed
> -            - python
> -          update: true
> -      before_script:
> -        - brew link --overwrite python
> -        - export PATH=3D"/usr/local/opt/ccache/libexec:$PATH"
> -        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
> -        - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.=
log && exit 1; }
> -
> -
>       # Python builds
>       - name: "GCC Python 3.5 (x86_64-softmmu)"
>         env:
>=20

Already reviewed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg697749.html

Again:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


