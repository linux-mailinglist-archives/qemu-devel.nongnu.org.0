Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7F51D0AF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 07:29:36 +0200 (CEST)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmqX1-0006H9-AK
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 01:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmqVg-0005UA-AX
 for qemu-devel@nongnu.org; Fri, 06 May 2022 01:28:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:44540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmqVd-0000pV-HX
 for qemu-devel@nongnu.org; Fri, 06 May 2022 01:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651814887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3IywD5OkIlGwrWFuQn4XfQ8h+jNa84O444jaBfZ/jo=;
 b=ikX3xVwG05MIF67evLQOIS1sd6qNOtjJkZgAsiHelh0GpoEOUCcAWcM4fFfFSRd8mAZaAd
 g4IVbBOllVxQ4UTmF+YZMek/hE38FtC8p7gyEY/NzxVtHOc0RJEiubMV8wkGiBX/WFaZM5
 0piVyKhVPvkF6IbRMBHYe800X7dlPrY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-fQKjh0uNN_evaU3exXhQjg-1; Fri, 06 May 2022 01:28:06 -0400
X-MC-Unique: fQKjh0uNN_evaU3exXhQjg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso2146195wrd.12
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 22:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B3IywD5OkIlGwrWFuQn4XfQ8h+jNa84O444jaBfZ/jo=;
 b=l6vzg420KcICaBce+DRuUXa5jq5pSi58kBi/UKv9PL1PADln3qwWnb/UcKKQKjQxTl
 9ExL7TgoSyPOmSzhPigzj4fPfNLIZxLiQXTfkJTq/EauttcZwd/4GUW/auHBdqY0/yDt
 O1W9YwWzXmVbGe6kMLrLyYvAPa3yEg6KGQ3+JNsd5Z9d3BMl8nA+e9bZJ+h9MAquZ8TA
 axeWcQi4EQ11snBmFBD9/fE0JtIae+wOZdF8BMPITMIGv5Ch7lklWotLvkp2i6sAcexg
 dmqXE7O0YnmfQXzfmSKmUX8Vdi3PzSIYy1N/HHkRUA85YH6202qYOH4KkQ597XB0HSDD
 Y8lQ==
X-Gm-Message-State: AOAM5334vL0/UAvRRC2mjvliNv5sSkXbTX3fgJhw/lNJb3tVGtigJc6p
 CRvUF8adhf/RW70Sd7ZHnJYsURNnw3xxAt283S+8wMY5gPTWxw4a6+hUIS7zhItMiaoa2Bq4Gba
 4IctiC/RW00TqcS0=
X-Received: by 2002:a05:600c:1e8a:b0:38e:d57d:a3fe with SMTP id
 be10-20020a05600c1e8a00b0038ed57da3femr8231459wmb.59.1651814885098; 
 Thu, 05 May 2022 22:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn6qn2iUWcgpxHT3YkryDmvy8shpZT0Qrf6OxPs/GpwAtCus5SqVDE1SmCdxZRaWzNjZzBkA==
X-Received: by 2002:a05:600c:1e8a:b0:38e:d57d:a3fe with SMTP id
 be10-20020a05600c1e8a00b0038ed57da3femr8231441wmb.59.1651814884875; 
 Thu, 05 May 2022 22:28:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 x12-20020a05600c21cc00b003942a244f42sm8293504wmj.27.2022.05.05.22.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 22:28:04 -0700 (PDT)
Message-ID: <e5cc4ee7-105e-fd18-6453-1e0a358b2a79@redhat.com>
Date: Fri, 6 May 2022 07:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tests/vm: update openbsd to release 7.1
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
References: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 06/05/2022 01.32, Brad Smith wrote:
> tests/vm/openbsd: Update to release 7.1
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   tests/vm/openbsd | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index 337fe7c303..dc34b2718b 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>       name = "openbsd"
>       arch = "x86_64"
>   
> -    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
> -    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
> +    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
> +    csum = "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
>       size = "20G"
>       pkgs = [
>           # tools

Tested-by: Thomas Huth <thuth@redhat.com>


