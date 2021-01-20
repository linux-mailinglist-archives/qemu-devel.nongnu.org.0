Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDE2FD78F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:57:00 +0100 (CET)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hj2-0004Zc-2c
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2HTB-0003fy-Sy
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2HT8-0003EA-5i
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611164433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqj/P2ztofkz0XOF0dCPDawPny5ryxAgSVGR0mg8tyY=;
 b=EJI28aqxYqg0hijb5CUkdSnx2/NUEhyxVWiyV2TLcSU3XPBsLSqLABnx5IsSth+2ZkjUlG
 OHOJ4ol9YqNwck3i/uHnMH2F4TTxr0sjZW74e0v4aMHu0nMjr6p298jwjhTm/RKkKEWDnN
 bSQLVUTP/upruJ/tekLLrnAa2M9ZyuU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-4lhVaqMPNQ6x6__-5vk5hQ-1; Wed, 20 Jan 2021 12:40:28 -0500
X-MC-Unique: 4lhVaqMPNQ6x6__-5vk5hQ-1
Received: by mail-ej1-f72.google.com with SMTP id b18so5758686ejz.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eqj/P2ztofkz0XOF0dCPDawPny5ryxAgSVGR0mg8tyY=;
 b=AtXtDnrmd6dRl38qO14yEz62QjaZi0CRYTdC+IudcCKFEAccU2PJQiQsaEH9l6yLOC
 sM69iFSZIM/fhi9D8S0xrHATh9oit+uWEwMVBG5oUTfWLHMzJUDG+lGZnQfzXEI7tG9c
 XCFFxD1UyLLzXi1kg9SFzbzkUq1NDvBc9PocAHOP2US8eLdG6b45AlkfZAfUcWbTu61T
 xfzNgJddJniIYVZq+wDR8YYlf111pgZjClkK+DdiTY3BgZWjlhDuCpeafzbVhPUFEfj+
 YjSUuG0qXlRbZc2SrxzM8zGi/AMAScGA8UKb9LCGsXjjfu6kfQI3xrg8eM8/Pw8vMlR6
 ORRQ==
X-Gm-Message-State: AOAM531g/7pTMQqU8R0Tl57WYV1a7qThVNIk3G5KIpz58S836FKgl1lr
 +r4Ypi/WLQ8PzrLvPCSq6jIIoKYq7mpgGb3av9Wd53gWkM9Us4aciLPPnuStmGx1GgP2MJHAR4o
 GFTrEeRUAob6qwWBgHD3Q88219yx4rs5r7/dhRmAHUkZFPq1A910W+NPw2dETqtmc
X-Received: by 2002:a17:906:a0d9:: with SMTP id
 bh25mr7118871ejb.34.1611164426292; 
 Wed, 20 Jan 2021 09:40:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjx18dEA9cEpZPQsrnwiRIaSEJy8DqFH//ZOlXodtJUt72rReu08yRr72JoU5mBlLNd+dMxg==
X-Received: by 2002:a17:906:a0d9:: with SMTP id
 bh25mr7118862ejb.34.1611164426056; 
 Wed, 20 Jan 2021 09:40:26 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m22sm1434181edp.81.2021.01.20.09.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 09:40:25 -0800 (PST)
Subject: Re: [PATCH 2/2] meson: split the summary in multiple sections
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120172320.26742-1-pbonzini@redhat.com>
 <20210120172320.26742-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f00f21b-3988-0362-8c2a-f6143be74ea1@redhat.com>
Date: Wed, 20 Jan 2021 18:40:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120172320.26742-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 6:23 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 75ce835d48..3d2ac1a399 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2238,9 +2238,8 @@ endif
>  # Configuration summary #
>  #########################
>  
> -summary_info = {}
> -
>  # Generic information
> +summary_info = {}
>  summary_info += {'Install prefix':    get_option('prefix')}
>  summary_info += {'BIOS directory':    qemu_datadir}
>  summary_info += {'firmware path':     get_option('qemu_firmwarepath')}
> @@ -2263,8 +2262,10 @@ summary_info += {'GIT binary':        config_host['GIT']}
>  summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
>  summary_info += {'Documentation':     build_docs}
>  summary_info += {'Install blobs':     get_option('install_blobs')}
> +summary(summary_info, bool_yn: true)
>  
>  # Compilation information
> +summary_info = {}

I tried that, ...

>  summary_info += {'host CPU':          cpu}
>  summary_info += {'host endianness':   build_machine.endian()}
>  summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
> @@ -2322,8 +2323,10 @@ if targetos == 'windows'
>      summary_info += {'Windows SDK':       config_host['WIN_SDK']}
>    endif
>  endif
> +summary(summary_info, bool_yn: true, section: 'Compilation')

... but not that :)

I am still adding some sections in my branch. Only one is
useful so far: "Crypto".

Thanks for improving the summary!


