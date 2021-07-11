Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8513C3B7E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:24:03 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Wcz-0000yW-Up
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m2Wc1-00088D-81
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:23:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m2Wbx-0002MR-O4
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625998976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btkmnvatQIsShB8xTSTM/JrcDhVLks8UHce6uZG9guM=;
 b=RY39A+OHKWMPXMJDqaC8zoZDZpmrJd1mVyxJotCUpYpwW6TifR7zOe3S7Ux7ZvN6K29A6O
 yTBY6FQBdG+uFT1wI5YEja6FJFq6OyeygIE6LzfK9MpNxJhqa1Ur+KdSUDXdAAdkNdRbN4
 MiYp35vvndm34+9mWtp2vvqGbDDElUk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-8sNGghZiN-GJrqe1jwq22Q-1; Sun, 11 Jul 2021 06:22:53 -0400
X-MC-Unique: 8sNGghZiN-GJrqe1jwq22Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 t8-20020a05600001c8b029013e2027cf9aso1636995wrx.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btkmnvatQIsShB8xTSTM/JrcDhVLks8UHce6uZG9guM=;
 b=DZQnSnngyjWRoJ3LhvuamAUDJcxgVhWmJwP8RBOq8QGlBB+/yK6s4k+bLk+V5W96f0
 68PrNUaBLrCwwmFvOFXYkCaj7vD3556VuCoygvZl8+JBAjthqe7ZjRjUr63xfPVo4mym
 42DH51rX69E2BUPB4g844/zG6Vc5udVREjXqjyIrZMrg5Y2y5AYUMVoUuTDirfFmbFZr
 eYZZEjvtHxidQ/YephUYx1ulCbqDmjPhmo8YnGdTsJpkr3WgesN67A2w3I7myztRb8fp
 sWEkpjtK1gP4csKvbfZV4KlBCReKA09La631idkBTnpRyDZ5Oq5iFrHGOKAlNMbRIF6t
 JLMA==
X-Gm-Message-State: AOAM532kkvKSO+E+XUDk73l39p1fBsMZoeD3efnx4yl1q+dikJdeQyu+
 eBEaDHVBgw5Bbks5E0XFRdmoNT4CizcGuRtujLP68M2Fp+DJxcGrn+m2We1mLgJF2Q/egkdajVW
 rZIdtcACpIRzgaKk=
X-Received: by 2002:a1c:7402:: with SMTP id p2mr8629806wmc.88.1625998972171;
 Sun, 11 Jul 2021 03:22:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs8ih4+qTT0vBv7o43fzfoPSsQsSXAZLC+xYwMxAERmnH1gE4rnyrgiwd6zsIQ+AOa6LcEJQ==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr8629792wmc.88.1625998971995;
 Sun, 11 Jul 2021 03:22:51 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83a06.dip0.t-ipconnect.de. [217.232.58.6])
 by smtp.gmail.com with ESMTPSA id c12sm12371971wrr.90.2021.07.11.03.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 03:22:51 -0700 (PDT)
Subject: Re: [PATCH v4 1/5] configure,meson: add option to enable LTO
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-2-dbuono@linux.vnet.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4c4542ca-a5cd-5229-6902-f3ea35c6e59f@redhat.com>
Date: Sun, 11 Jul 2021 12:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20201204230615.2392-2-dbuono@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.452,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/12/2020 00.06, Daniele Buono wrote:
> This patch allows to compile QEMU with link-time optimization (LTO).
> Compilation with LTO is handled directly by meson. This patch only
> adds the option in configure and forwards the request to meson
> 
> Tested with all major versions of clang from 6 to 12
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>   configure   | 7 +++++++
>   meson.build | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/configure b/configure
> index 18c26e0389..fee118518b 100755
> --- a/configure
> +++ b/configure
> @@ -242,6 +242,7 @@ host_cc="cc"
>   audio_win_int=""
>   libs_qga=""
>   debug_info="yes"
> +lto="false"
>   stack_protector=""
>   safe_stack=""
>   use_containers="yes"
> @@ -1167,6 +1168,10 @@ for opt do
>     ;;
>     --disable-werror) werror="no"
>     ;;
> +  --enable-lto) lto="true"
> +  ;;
> +  --disable-lto) lto="false"
> +  ;;
>     --enable-stack-protector) stack_protector="yes"
>     ;;
>     --disable-stack-protector) stack_protector="no"
> @@ -1751,6 +1756,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>     module-upgrades try to load modules from alternate paths for upgrades
>     debug-tcg       TCG debugging (default is disabled)
>     debug-info      debugging information
> +  lto             Enable Link-Time Optimization.
>     sparse          sparse checker
>     safe-stack      SafeStack Stack Smash Protection. Depends on
>                     clang/llvm >= 3.7 and requires coroutine backend ucontext.
> @@ -7014,6 +7020,7 @@ NINJA=$ninja $meson setup \
>           -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>           -Dvhost_user_blk_server=$vhost_user_blk_server \
> +        -Db_lto=$lto \
>           $cross_arg \
>           "$PWD" "$source_path"
>   
> diff --git a/meson.build b/meson.build
> index e3386196ba..ebd1c690e0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2044,6 +2044,7 @@ summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
>   summary_info += {'sparse enabled':    sparse.found()}
>   summary_info += {'strip binaries':    get_option('strip')}
>   summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
> +summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
>   summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>   if targetos == 'darwin'
>     summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
> 

I just came across this --enable-lto option ... but looking at the 
implementation here, it seems only to emit a line in the summary_info, 
without adding any compiler flags? Was this patch incomplete? Or do I miss 
something?

  Thomas


