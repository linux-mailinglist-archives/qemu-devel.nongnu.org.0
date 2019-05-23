Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03127B57
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 13:06:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTlY2-0005FK-Dr
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 07:06:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTlWT-0004ZJ-AP
	for qemu-devel@nongnu.org; Thu, 23 May 2019 07:04:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTlWS-0002L5-7y
	for qemu-devel@nongnu.org; Thu, 23 May 2019 07:04:33 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39163)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hTlWR-0002JQ-VX
	for qemu-devel@nongnu.org; Thu, 23 May 2019 07:04:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id w8so5787447wrl.6
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 04:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OwN+pwQUriCQg8TUCykP3vzy3AyHFTI8ShPIUrbCp3s=;
	b=tvwBiukCV395TEebLdcoiNlI8Ze9jCceKH5FCHIKjFHJIXiwJzIG+5hMvZFUI3GsdK
	OLMuzWDD41t/BkE8uvDER6yeGA9Rrl3o6U5+GLESuwDFrmbYb2mD8PXg9eV4+zHoCEKl
	hPf5X15y3xZWhRkm6ojaFWjBqWyp0VVh8z0SdQ4DFosYnr3ERW6z3tu+H+5jeT692T0g
	MQ5+P/oA4aCnbVuxuPs+S/rMtuASMZR56wi6Aw6fKb6wRgRCBALDK5NVutDK/W8RvEYx
	+gErbEDEyaYcCfRDOEiaIz1onqc4GkbbKZE4KOfeN+iEgfJqmeRYsVcTg2VIHaXxC/DX
	NhQA==
X-Gm-Message-State: APjAAAUHTwROeVhjFoZEHW3oQ33wpgm67Rw3AalaXYMMSsPl+DpvxeuG
	EyQxHSCcnpEFdo412VPe4G6iWA==
X-Google-Smtp-Source: APXvYqwFJEdcLaMajC5/Ckj5dAtdtmA4IAYW8SyTx6tojYM71VUL+bOfCh5vZB7DIO+ncEOsBfLjkw==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr57355907wrm.38.1558609470944; 
	Thu, 23 May 2019 04:04:30 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	d17sm23309752wrw.18.2019.05.23.04.04.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 04:04:30 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190523024229.1158-1-richard.henderson@linaro.org>
	<20190523024229.1158-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <576eff59-1691-cd13-b3a6-ce1cd378980f@redhat.com>
Date: Thu, 23 May 2019 13:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523024229.1158-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 1/3] capstone: Adjust include of capstone.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/19 4:42 AM, Richard Henderson wrote:
> Since v4.0, capstone.h has moved to <capstone/capstone.h>.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/disas/capstone.h | 4 ++++
>  configure                | 6 ++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/include/disas/capstone.h b/include/disas/capstone.h
> index e29068dd97..90631d84a9 100644
> --- a/include/disas/capstone.h
> +++ b/include/disas/capstone.h
> @@ -3,7 +3,11 @@
>  
>  #ifdef CONFIG_CAPSTONE
>  
> +#ifdef CONFIG_CAPSTONE_CAPSTONE_H
> +#include <capstone/capstone.h>
> +#else
>  #include <capstone.h>
> +#endif
>  
>  #else
>  
> diff --git a/configure b/configure
> index d2fc346302..eec7f061c3 100755
> --- a/configure
> +++ b/configure
> @@ -5021,6 +5021,9 @@ case "$capstone" in
>    system)
>      QEMU_CFLAGS="$QEMU_CFLAGS $($pkg_config --cflags capstone)"
>      LIBS="$($pkg_config --libs capstone) $LIBS"
> +    if check_include capstone/capstone.h; then
> +      capstone_capstone_h=yes
> +    fi
>      ;;
>  
>    no)
> @@ -7197,6 +7200,9 @@ if test "$ivshmem" = "yes" ; then
>  fi
>  if test "$capstone" != "no" ; then
>    echo "CONFIG_CAPSTONE=y" >> $config_host_mak
> +  if test "$capstone_capstone_h" != "no" ; then
> +    echo "CONFIG_CAPSTONE_CAPSTONE_H=y" >> $config_host_mak
> +  fi
>  fi
>  if test "$debug_mutex" = "yes" ; then
>    echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

