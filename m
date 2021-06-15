Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA553A7878
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:50:42 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3qL-0007px-9X
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3jT-00085c-JT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:43:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3jR-0003ac-RP
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp4OB0ApSyhkmfuqGMMufzxkTwbEB8IslRcyke6yFr8=;
 b=dNiSTR7J7hgMde18uVso/Kis2HgUd0SEeVK+JL4BR50BQGo6k7UAxmae13Kopfs3Rt4T3r
 c3HbUQbqlP4ipOK52qxMcZy6SOUu0Ar6oxORQaE4mq0PxK9AOyO4m2RBnuH99HP+Nx0obd
 jbbBapOY5dGvhxC8icw5b1F1Y+eufLE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-xJc6YvQRNjG-8XqE-jmoNQ-1; Tue, 15 Jun 2021 03:43:32 -0400
X-MC-Unique: xJc6YvQRNjG-8XqE-jmoNQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 y12-20020adffa4c0000b0290119c11bd29eso5571854wrr.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lp4OB0ApSyhkmfuqGMMufzxkTwbEB8IslRcyke6yFr8=;
 b=p3Of62mlZF+hccIXu0Xrf+DgnKGcSn50DqcM7VUMcF7qh4AWzhMuNrvoKz13BuEBoN
 I7yp1jwwCeRCyEmh/KjFrV0gl7iQvLEpWfyYC03ZjK4ZAO8xVpMoZX64Z3UIdAJLJu6C
 5sR3vcmNE1Foqu5zEPBGH8iB9RGrFxIwpo5hdaW9wNKnqRqv9IGIdlXM8fVSGPBNN9pn
 5URq4k1EGmsLmAMH5EEiiJsrRhmYqTezuELGun3sbdr3Oa1fvPsVCBDy3uWGh2qNMqti
 p7CPsNcZwN3mHn2WypiPoJLInrj4W+s71cJfNFvPq5GSrQvhmIP58GCQ1JFNAn5RcJrQ
 DzAw==
X-Gm-Message-State: AOAM532J+1+fGSXTOcvd04ZDKE3lNRC9dds70/dagK9o54IBKTECok1P
 pM66bjKsu7ilfXaLDXyJ93dNG6X/7Y70KdLY2CQ85SiXJeQu85ezgM0Aq2eKq+VOiO1JBknxXJZ
 8cWQyor6V6MtFACk=
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr23294261wrt.281.1623743011055; 
 Tue, 15 Jun 2021 00:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAXaV9XgTdr4/NRuq388Zb5+cXsO5RMQ0AJUlHC3MGWCTPmtdVIwo54bepuG46iyXk3vYs8g==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr23294241wrt.281.1623743010828; 
 Tue, 15 Jun 2021 00:43:30 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id k11sm1462138wmj.1.2021.06.15.00.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:43:30 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] configure: Use -std=gnu11
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a12d75e7-c8d8-8c9e-6949-38cf89c3f23a@redhat.com>
Date: Tue, 15 Jun 2021 09:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 01.31, Richard Henderson wrote:
> Now that the minimum gcc version is 7.5, we can use C11.
> This will allow lots of cleanups to the code, currently
> hidden behind macros in include/qemu/compiler.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure   | 4 ++--
>   meson.build | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 8dcb9965b2..0489864667 100755
> --- a/configure
> +++ b/configure
> @@ -159,7 +159,7 @@ update_cxxflags() {
>       # options which some versions of GCC's C++ compiler complain about
>       # because they only make sense for C programs.
>       QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
> -    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu99/-std=gnu++11/)
> +    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
>       for arg in $QEMU_CFLAGS; do
>           case $arg in
>               -Wstrict-prototypes|-Wmissing-prototypes|-Wnested-externs|\
> @@ -538,7 +538,7 @@ QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
>   QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
>   
>   # Flags that are needed during configure but later taken care of by Meson
> -CONFIGURE_CFLAGS="-std=gnu99 -Wall"
> +CONFIGURE_CFLAGS="-std=gnu11 -Wall"
>   CONFIGURE_LDFLAGS=
>   
>   
> diff --git a/meson.build b/meson.build
> index a2311eda6e..d8a92666fb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,5 +1,5 @@
>   project('qemu', ['c'], meson_version: '>=0.55.0',
> -        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto'] +
> +        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto'] +
>                            (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
>           version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())

Reviewed-by: Thomas Huth <thuth@redhat.com>


