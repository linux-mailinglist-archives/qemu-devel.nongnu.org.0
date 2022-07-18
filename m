Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE385782BF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:51:43 +0200 (CEST)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQDs-0004Xp-GA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDQAV-0001Eu-Cf
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDQAT-0007PW-2o
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658148488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWsyMS0aQ6/JjWpSafvGME81ymTnNjaPcvwCisdv1yc=;
 b=ZgIKiYx39bRyOz0PXoF/EcnGV6lGp6XCWyHQafTlMLwenViDefR5phWaYXkwYxUk1AYLUS
 knDFbQurhXKIU/FkD30ViDAbKtMaFMmFpX7vlR8rcm3qOL0ZmvQSYYKc0EZ/fjkpKaBiES
 c5re2piD+RMQaYzbTLsOPhILfy99jA0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-AU-MuMTZNFGetEjmoRWYgg-1; Mon, 18 Jul 2022 08:48:06 -0400
X-MC-Unique: AU-MuMTZNFGetEjmoRWYgg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so197617wrg.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jWsyMS0aQ6/JjWpSafvGME81ymTnNjaPcvwCisdv1yc=;
 b=Ije+fIjsrQ17sX1nI/jEW0kd57J3GvUP1qmpH6x0y3dzeXOqH+D5hsqu6Tf1jEHW5b
 N3nuQgggz0EI4XwWh87jMbYLSrbJEgtmXLKZXW2WRTXl/boDCMiW8f35TPJ5el7KZ2Kj
 uHX9sDUre8Tymlbg9wf/bkJ3kv8/IbSITg5Xb0dcTkFm4Jtz567eNNSmJK8Ehsq20QAM
 RndJh/Q0Q+Scz5j/cdX9Y7jPnqC74UJ7QK00v8KjFKEoCuiaufuiszbHIcCZ0ayMbmh1
 j+f1AMpqYn8neoet3MV5jeJJ8s5ADy+yyKSpkgmEb1bDwQHa9xcSXP1ow6K9OwJXorzo
 d61A==
X-Gm-Message-State: AJIora9GpqcO6AFN/IWtu2eKDQuWyUCrFPOZzvXyBut55BwPH4svwGnI
 Z+s5A1BCaMVrZ3wFruPaG8FOIBFnXgSJ74jVzvL0NU9MtUOfzFDHsl3zg0LljaRlg0K9GsgFxqh
 jx8ZTlYIlsbATwqQ=
X-Received: by 2002:a05:600c:1f0a:b0:3a3:15a8:a8e1 with SMTP id
 bd10-20020a05600c1f0a00b003a315a8a8e1mr8670322wmb.167.1658148485457; 
 Mon, 18 Jul 2022 05:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s81lQAdgp8W6N/5rgT4QwiAn+rpgg+27MGHLOUCsae4JgLJC5VT+aKb3D0wItNnQ6vVkJ6BQ==
X-Received: by 2002:a05:600c:1f0a:b0:3a3:15a8:a8e1 with SMTP id
 bd10-20020a05600c1f0a00b003a315a8a8e1mr8670300wmb.167.1658148485217; 
 Mon, 18 Jul 2022 05:48:05 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 n6-20020a1c7206000000b003a31f71c5b8sm1629281wmc.27.2022.07.18.05.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 05:48:04 -0700 (PDT)
Message-ID: <7bebb97b-b22f-6b17-62c7-9082c858ed67@redhat.com>
Date: Mon, 18 Jul 2022 14:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 05/20] meson: Prefix each element of firmware path
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
 <20220714090211.304305-6-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220714090211.304305-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On 14/07/2022 11.01, Paolo Bonzini wrote:
> From: Akihiko Odaki <akihiko.odaki@gmail.com>
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Message-Id: <20220624154042.51512-1-akihiko.odaki@gmail.com>
> [Rewrite shell function without using Bash extensions. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                     | 15 +++++++++++++++
>   meson.build                   | 11 +++++++++--
>   meson_options.txt             |  2 +-
>   scripts/meson-buildoptions.py |  7 +++++--
>   scripts/meson-buildoptions.sh |  4 ++--
>   softmmu/datadir.c             |  8 +++++---
>   6 files changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/configure b/configure
> index e8cc850727..f02635b087 100755
> --- a/configure
> +++ b/configure
> @@ -676,6 +676,21 @@ fi
>   
>   werror=""
>   
> +meson_option_build_array() {
> +  printf '['
> +  (if test "$targetos" == windows; then
> +    IFS=\;
> +  else
> +    IFS=:
> +  fi
> +  for e in $1; do
> +    e=${e/'\'/'\\'}
> +    e=${e/\"/'\"'}
> +    printf '"""%s""",' "$e"
> +  done)
> +  printf ']\n'
> +}

  Hi!

This seems to break the NetBSD VM builds:

$ make vm-build-netbsd J=4 TARGET_LIST=x86_64-softmmu
   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc slirp roms/SLOF
     VM-BUILD netbsd
../src/configure: 687: Syntax error: Bad substitution

Could you please have a look?

  Thanks,
   Thomas


