Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C03A7847
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:48:29 +0200 (CEST)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3oC-0005LV-Od
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3il-0006as-2q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3ig-0002yQ-5J
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623742963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8L7FliM0fejNgo45lQzOCyiq+ObfoEuecCvZxxVBGgo=;
 b=eMw0rNsb4PQuRVJRkz2QeM8X3xXch58b4d3iQmOL4sNQ2Nn9GODko+ekKTMorvINCHl2bR
 tPWozaYYgxaV89y6xzetjBssO1NWT2mIFCPiAM7+9drvdmvNTin/HASejIofV8UV9T/ad9
 OHVTPTuLsrCsftohv85L/HirIFvkrCs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-nkuvCHmMPwiqJer2XpqEnQ-1; Tue, 15 Jun 2021 03:42:40 -0400
X-MC-Unique: nkuvCHmMPwiqJer2XpqEnQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so8262898wrs.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8L7FliM0fejNgo45lQzOCyiq+ObfoEuecCvZxxVBGgo=;
 b=fGwj0B3CDM6F6IjmNgaaojDnVi3lqbDwehDDHdN9cuT+oYwTnenyQofoKezUmdk8kx
 jJAksGYjn8vde+JxWyPlokmPBX9WzC6er07t1J529JnQs+Zr+VLUHT7bFaSJ7ZMNnARk
 TGmMC+n22Ghiyr0LGJfgRCJtAqYL612BLohO6nfAuEIvQqC97losFePyggY10OQ+cWuB
 nBY44gC1gCu+1OGHuZTgJAWGBWUqkKC8Bgcl6/Sq/tyg+Vv5QkLzCtNaTIQdgencVzr8
 qrY++8yjmON1sI4FUvbRwADcI5ZCk9LL0L0QkSJe4OYmn+Do5oSqK0xdW+l03WzvVNW9
 HnzA==
X-Gm-Message-State: AOAM533rQRGYeS/e/nzD63Dq0TI+/G1fAuiaRUWN1xpVWg/V+j4aG5LJ
 otVI8Mb5ovXHiVboLDIJnvHunEdL1YxZIq8gcAWly0zCdTfsZNSv4qP6fZLTqMcXH14DB6UWaK0
 WBiYYE81CPhXL62E=
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr3576944wmq.38.1623742959575; 
 Tue, 15 Jun 2021 00:42:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxCh/JtTB0CMlWuY8p+hKbz8g/XZVdYbdfpfsNq3dc6PTaK7rPC/4PhyYx3pzc7ySxYOb2Lg==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr3576927wmq.38.1623742959350; 
 Tue, 15 Jun 2021 00:42:39 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id c12sm20830413wrr.90.2021.06.15.00.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:42:38 -0700 (PDT)
Subject: Re: [PATCH 1/8] configure: Use -std=gnu11
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210611233347.653129-1-richard.henderson@linaro.org>
 <20210611233347.653129-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c98336cf-45ef-836a-cef3-57eabed1bee7@redhat.com>
Date: Tue, 15 Jun 2021 09:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210611233347.653129-2-richard.henderson@linaro.org>
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
Cc: pbonzini@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 ehabkost@redhat.com, Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/06/2021 01.33, Richard Henderson wrote:
> From: Richard Henderson <richard.henderson@liaro.org>
> 
> Now that the minimum gcc version is 7.5, we can use C11.
> This will allow lots of cleanups to the code, currently
> hidden behind macros in include/qemu/compiler.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
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
> index d2a9ce91f5..c070cb6aa7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,5 +1,5 @@
>   project('qemu', ['c'], meson_version: '>=0.55.0',
> -        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto'] +
> +        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto'] +
>                            (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
>           version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())

Reviewed-by: Thomas Huth <thuth@redhat.com>


