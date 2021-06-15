Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EF3A86EA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:54:15 +0200 (CEST)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCKM-00084I-He
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltCHJ-0003rC-MI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltCHF-0005JI-PF
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldhPxWpdj7o/dgm8ty3KLRF1gl7tteaUFT7wE+FEoOw=;
 b=bnr9CmOuupefmwHFp9n20OTYwsWiWrR7SAC8W9Y9cyqFVopQgGBqI+FXBGpEiRDu7LxYSn
 JcSMtR7VCXWO8c7/LI6QvbPAzOXGarbIWopBXi/EYIKF0O+fa+iTwm2uSsSjAxfzHYKsoQ
 fw4M87Ef7RVt8BI0rF3/xjNpkn+LC/k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-wdR3-7zDMFOSl1bqYPGaBw-1; Tue, 15 Jun 2021 12:51:00 -0400
X-MC-Unique: wdR3-7zDMFOSl1bqYPGaBw-1
Received: by mail-ed1-f70.google.com with SMTP id
 ch5-20020a0564021bc5b029039389929f28so14818077edb.16
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ldhPxWpdj7o/dgm8ty3KLRF1gl7tteaUFT7wE+FEoOw=;
 b=p4zTdZeCdgWuZxhrvPmT6AAWIUoHJZD9QzFaEuyN0AGYi/NIIeihPs2U6uHce4/8xt
 f9cHL0zECX7B3e/ZcqbyOwM1mOi+gi1EI/tmT9cJfAIoTQ2PQxVVn305cUO7rnMYatwW
 vjQBGz2shgO5Nd/yMVThE/kDZc6G+P0JbBIUhQ9xEq0OOUGOpzuuzbZ9y2pw1OlxK8h6
 RYABIVTFNyNNAKGsyiVMruICeAfxRf/C9U9leJj+8i7RGGZDmgdCcY9224s14LvuGyip
 /iE0PjB+sx566QwTyyR6Y98YnTWErKs98XiNKSZUxB+AU5m9qXZGirjluj7oiTL23WK9
 0WIg==
X-Gm-Message-State: AOAM533Lcrz3ntLRvgqQYmu5+QuT1JTPn0/Lu3O3sGpvfa2qaLxmjnkc
 7Q8aqSi8plQlRPIIrdH1Zqa4GHAf041AE8MOlmnx/wPWIqV2sh7rlfNpqpcOSNR6qTQG3SYVIQi
 nuhby4uZEg01uzvk=
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr545749ejk.30.1623775858830; 
 Tue, 15 Jun 2021 09:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSPbygabGOJKOxrCHsH77+azFrfyZQiL/MAqXSkOyIutKuo1hZKSQsyfFQ4+hfHq2xCO/qGQ==
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr545708ejk.30.1623775858551; 
 Tue, 15 Jun 2021 09:50:58 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 jo13sm10191167ejb.91.2021.06.15.09.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:50:58 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-8-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f3a13026-8542-ef8f-c95d-c01698ce86d7@redhat.com>
Date: Tue, 15 Jun 2021 18:50:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-8-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Joelle van Dyne <j@getutm.app>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
> From: Joelle van Dyne <j@getutm.app>
>
> iOS hosts do not have these defined so we fallback to the
> default behaviour.
>
> Co-authored-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> Message-Id: <20210315180341.31638-4-j@getutm.app>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 5821e1afed..4e2f7cf508 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2322,8 +2322,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
>   again:
>   #endif
>       if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
> +        size = 0;
>   #ifdef DIOCGMEDIASIZE
> -        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
> +        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {

Pre-existing, but I feel compelled to express my unease about this cast.

> +            size = 0;
> +        }
>   #elif defined(DIOCGPART)
>           {
>                   struct partinfo pi;
> @@ -2332,9 +2335,7 @@ again:
>                   else
>                           size = 0;
>           }
> -        if (size == 0)
> -#endif
> -#if defined(__APPLE__) && defined(__MACH__)
> +#elif defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)

As far a I can tell, before this patch, if the DIOCGMEDIASIZE ioctl 
failed, we fell back to this DKIOCGETBLOCKCOUNT/SIZE block (if compiled 
in). Now this is an #elif and so will not be used if DIOCGMEDIASIZE was 
defined. Is that intentional?

This may be fine, and apart from that, this patch looks good to me, but 
this change in behavior wasn’t mentioned in the commit message, hence me 
asking.

>           {
>               uint64_t sectors = 0;
>               uint32_t sector_size = 0;
> @@ -2342,19 +2343,15 @@ again:
>               if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
>                  && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
>                   size = sectors * sector_size;
> -            } else {
> -                size = lseek(fd, 0LL, SEEK_END);
> -                if (size < 0) {
> -                    return -errno;
> -                }
>               }
>           }
> -#else
> -        size = lseek(fd, 0LL, SEEK_END);
> +#endif
> +        if (size == 0) {
> +            size = lseek(fd, 0LL, SEEK_END);
> +        }
>           if (size < 0) {
>               return -errno;
>           }
> -#endif
>   #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>           switch(s->type) {
>           case FTYPE_CD:


