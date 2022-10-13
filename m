Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D85FD737
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:42:29 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiujT-0007VX-Vb
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oiuLJ-0006qu-5c
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oiuLF-0003n3-U9
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665652644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vMk9jAx0qHOm+qgBqfkvbRk2HkmywhOalr6VDIaviE=;
 b=bNNfe++HqPorY2997xLMx9huebtCoCg4z6Fw2ISVfNLNo293Cq4pZVFWVTB9UpDvbW6tiv
 cY44rp3v6ufHZvMPUb1Xyp+z08TyoBps7NVbbUcNFAzO/N3Grdg2DOEyuzN69hM5wBT/j6
 zUeoaGWMyWqRFGgWPgHX+oNu4ONu8Yg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-4RJjnRbrMg6TYKvtrmfFDA-1; Thu, 13 Oct 2022 05:17:23 -0400
X-MC-Unique: 4RJjnRbrMg6TYKvtrmfFDA-1
Received: by mail-ed1-f70.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso1083318edd.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 02:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7vMk9jAx0qHOm+qgBqfkvbRk2HkmywhOalr6VDIaviE=;
 b=iz/ew1jlhDbdJNe+CrwvQIXEGx7Oiq5rQLhSRBh889UoQ4LjPOjPv31GjsRNfjeV1u
 x5fxY4Qld+95QgMVxH/E4abrQL+MEBaGD0C8YQLf6q5EWJYyb7B2mQIsGCbHOMG70vgP
 saZI7myX95ZPV11+Fqm+2JXNbDP4xyf3aZM5/ncF3DFVyfZk+rBkmKt11dM46IQaPAXg
 42hZ/HEVZ3jVlQ5kWgzyp0bHx2E9pTbVzLhFN3ryPKkM3o/39UEjbRJqkHIuOZSNvcc0
 VsEZSQuhsKM0GCgjaWyvJpxrJfCwJwQhi0mQQUoIsxfex5JiYKrAiWFFNuAVfl7DMkME
 momg==
X-Gm-Message-State: ACrzQf3nza2bAybxK8kMkabhOdXXaHlxrh2glFFld6njq0ooXIUW+NDG
 oZQmVlF4wbLcwIUMEsjF/GF+XIAbvFdrUWKUxIkIkKrPnTWjPVWkL7bLV30mvWe74RY8nxdga25
 gcutlLST9Bmk/hJmN1CyT6YreKoQPZuI4ls+xHJwfXRfX7CnFKqQsIAxwGN5nFab0Zys=
X-Received: by 2002:a17:907:b05:b0:78d:9bc9:b96f with SMTP id
 h5-20020a1709070b0500b0078d9bc9b96fmr19153918ejl.468.1665652641693; 
 Thu, 13 Oct 2022 02:17:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kIoNMnEmC5Lq/xbSHtyid/rRgV5YM9mp4jWuzWxjPvbkNjDtQlSArsm1Nh/dzEkkD0G21Qg==
X-Received: by 2002:a17:907:b05:b0:78d:9bc9:b96f with SMTP id
 h5-20020a1709070b0500b0078d9bc9b96fmr19153905ejl.468.1665652641238; 
 Thu, 13 Oct 2022 02:17:21 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a170906074e00b007828150a2f1sm2683752ejb.36.2022.10.13.02.17.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 02:17:20 -0700 (PDT)
Message-ID: <cdd75cdf-d8a3-a254-8f12-57436e60d257@redhat.com>
Date: Thu, 13 Oct 2022 11:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] configure: Avoid using strings binary
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
Content-Language: en-US
In-Reply-To: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 10/13/22 10:37, Michal Privoznik wrote:
> When determining the endiandness of the target architecture we're
> building for a small program is compiled, which in an obfuscated
> way declares two strings. Then, we look which string is in
> correct order (using strings binary) and deduct the endiandness.
> But using the strings binary is problematic, because it's part of
> toolchain (strings is just a symlink to
> x86_64-pc-linux-gnu-strings or llvm-strings). And when
> (cross-)compiling, it requires users to set the symlink to the
> correct toolchain.
> 
> Fortunately, we have a better alternative anyways. Since we
> require either clang or gcc we can rely on macros they declare.
> 
> Bug: https://bugs.gentoo.org/876933
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  configure | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/configure b/configure
> index 45ee6f4eb3..91e04635cb 100755
> --- a/configure
> +++ b/configure
> @@ -1426,27 +1426,30 @@ fi
>  # ---
>  # big/little endian test
>  cat > $TMPC << EOF
> -#include <stdio.h>
> -short big_endian[] = { 0x4269, 0x4765, 0x4e64, 0x4961, 0x4e00, 0, };
> -short little_endian[] = { 0x694c, 0x7454, 0x654c, 0x6e45, 0x6944, 0x6e41, 0, };
> -int main(int argc, char *argv[])
> -{
> -    return printf("%s %s\n", (char *)big_endian, (char *)little_endian);
> -}
> +#if defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN || \

Actually, this needs to be __BYTE_ORDER__ (missing those two underscores
at the end).

> +    defined(__BIG_ENDIAN__)
> +# error BIG
> +#endif
> +int main(void) { return 0; }
>  EOF
>  
>  if compile_prog ; then
> -    if strings -a $TMPE | grep -q BiGeNdIaN ; then
> -        bigendian="yes"
> -    elif strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
> -        bigendian="no"
> -    else
> -        echo big/little test failed
> -        exit 1
> -    fi
> +  bigendian="yes"

And this needs to be no. Will post v2 shortly.

Michal


