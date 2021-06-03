Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42678399EE0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:23:05 +0200 (CEST)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokVD-0000CW-Lr
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lokUE-0007ov-IZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lokU6-0002cv-E9
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622715712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBx+dxShfWKCTRlMGDgqHGBWc+r0JSlX09y+WZHOi8A=;
 b=ZGOuz+/alg9JX8WnGhR+ZTaBHrvtec6tTja2+5cKPONSxwnv5KtGTYbNFpJQQvtjTAJkNR
 1ooN/dItwnV4MZXKjdm3RNBCIIFVWL0V3IoS0ONkh7Zz+qj0kd/oqw5PZIEwJBY42svUtl
 xNrHrJl6Z/RInfSUXTrwo1aZambaJaQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-g_6oUD8rPrO2L1jiftqwPA-1; Thu, 03 Jun 2021 06:21:51 -0400
X-MC-Unique: g_6oUD8rPrO2L1jiftqwPA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y7-20020aa7ce870000b029038fd7cdcf3bso3011478edv.15
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 03:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBx+dxShfWKCTRlMGDgqHGBWc+r0JSlX09y+WZHOi8A=;
 b=ZVcUy+MuWaKHPbyWpHMozX8vYBkWycqUaar3Zq5tiIb1ZRg4niAzu1BA8461jnO/LU
 n1e4BGR+zMd6RlYGsMZUa4of6tkZ417CMwaECbSypBKlBeGhjNDxWuRzWG6n7WNZ6gfV
 O1HoaZ7ROHYqy3fHMCiZ2MmvY4/zfFcM0eiym24YBKcPHiskMbNrd4snwmdCx3kw/OEU
 QrssN8I1ks+lBbh+zi+v3l+NMVQXPKPQrFeMLojymEcnvt3enSNHRNvTHDlMyD/HJ6y6
 +jRgQKdhwLw5o9xmll5CvyNp2jSTsBdYtlptFCYenz1JevUTrzCXlvf7zRhk8z3vTi+B
 LW0g==
X-Gm-Message-State: AOAM530u1qXzK7xuzjYMzdJ6mWw25jhiVv4D0+ad5S37vmPIf3zbXFSa
 Y1FFSW81LEUFk2TgegiABRQsFnv3US9TA7K9RWCXMpXJsu+4EfDnCfIqMDONib+4s+WVNRK3tZS
 pphEwKole1WMCPJ0=
X-Received: by 2002:a17:906:16cb:: with SMTP id
 t11mr12094570ejd.112.1622715709493; 
 Thu, 03 Jun 2021 03:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw70fvEtrNQ2mv6DxfN8XucRojGi7Eypfu4S15XmSWTwtIHrHBoPKzbZ75pBSBvVxYv8AdUQg==
X-Received: by 2002:a17:906:16cb:: with SMTP id
 t11mr12094550ejd.112.1622715709219; 
 Thu, 03 Jun 2021 03:21:49 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 o21sm696984ejg.49.2021.06.03.03.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 03:21:48 -0700 (PDT)
Subject: Re: [PATCH] iotests/check: move general long options to double dash
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <a266b46d-77b7-b71b-4515-22a02dbf0d04@redhat.com>
Date: Thu, 3 Jun 2021 12:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526181659.365531-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/05/2021 20:16, Vladimir Sementsov-Ogievskiy wrote:
> So, the change:
> 
>    -makecheck -> --makecheck
>    -valgrind  -> --valgrind
>    -nocache   -> --nocache
>    -misalign  -> --misalign
> 
> Motivation:
> 
> 1. Several long options are already have double dash:
>    --dry-run, --color, --groups, --exclude-groups, --start-from
> 
> 2. -misalign is used to add --misalign option (two dashes) to qemu-io
> 
> 3. qemu-io and qemu-nbd has --nocache option (two dashes)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/check-block.sh         | 2 +-
>   tests/qemu-iotests/check     | 8 ++++----
>   tests/qemu-iotests/common.rc | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index f86cb863de..90619454d3 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -77,7 +77,7 @@ export PYTHONUTF8=1
>   
>   ret=0
>   for fmt in $format_list ; do
> -    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
> +    ${PYTHON} ./check --makecheck -$fmt $group || ret=1
>   done
>   
>   exit $ret
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 2dd529eb75..3f3962dd75 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -32,11 +32,11 @@ def make_argparser() -> argparse.ArgumentParser:
>   
>       p.add_argument('-n', '--dry-run', action='store_true',
>                      help='show me, do not run tests')
> -    p.add_argument('-makecheck', action='store_true',
> +    p.add_argument('--makecheck', action='store_true',
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> -    p.add_argument('-misalign', action='store_true',
> +    p.add_argument('--misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>                      default='auto', help="use terminal colors. The default "
> @@ -46,7 +46,7 @@ def make_argparser() -> argparse.ArgumentParser:
>       mg = g_env.add_mutually_exclusive_group()
>       # We don't set default for cachemode, as we need to distinguish default
>       # from user input later.
> -    mg.add_argument('-nocache', dest='cachemode', action='store_const',
> +    mg.add_argument('--nocache', dest='cachemode', action='store_const',
>                       const='none', help='set cache mode "none" (O_DIRECT), '
>                       'sets CACHEMODE environment variable')
>       mg.add_argument('-c', dest='cachemode',
> @@ -85,7 +85,7 @@ def make_argparser() -> argparse.ArgumentParser:
>       g_bash.add_argument('-o', dest='imgopts',
>                           help='options to pass to qemu-img create/convert, '
>                           'sets IMGOPTS environment variable')
> -    g_bash.add_argument('-valgrind', action='store_true',
> +    g_bash.add_argument('--valgrind', action='store_true',
>                           help='use valgrind, sets VALGRIND_QEMU environment '
>                           'variable')
>   
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index cbbf6d7c7f..e2f81cd41b 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -124,7 +124,7 @@ fi
>   
>   # Set the variables to the empty string to turn Valgrind off
>   # for specific processes, e.g.
> -# $ VALGRIND_QEMU_IO= ./check -qcow2 -valgrind 015
> +# $ VALGRIND_QEMU_IO= ./check -qcow2 --valgrind 015
>   
>   : ${VALGRIND_QEMU_VM=$VALGRIND_QEMU}
>   : ${VALGRIND_QEMU_IMG=$VALGRIND_QEMU}
> @@ -134,7 +134,7 @@ fi
>   
>   # The Valgrind own parameters may be set with
>   # its environment variable VALGRIND_OPTS, e.g.
> -# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 -valgrind 015
> +# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 --valgrind 015

Ok I see why the short options do not make sense to have double dash, 
but if we want full consistency why fmt is left with one dash? Like 
"-qcow2", should we also change that? (that change might be more complex 
to do)

Thank you,
Emanuele


