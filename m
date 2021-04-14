Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EDA35F947
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:54:36 +0200 (CEST)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWimh-00049A-N6
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWijd-0003Cw-Tx
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWijb-0003bU-27
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28YINbAqDyAqhPTutZnK+QHxXzqPiDvhsD4ZuagO5nU=;
 b=N/mycoB96cUxQiygjZMMHLsIdc190yskbqbXb0uTM2M6j2GWt0xLAKELP0ZhjDz2Alrlp4
 Madfwa3N3bb3IV5EcX3anVWx4dGpsUjZS8YGlbiTpcSrZycpS+092G3UueQ6KIAHGpAv6V
 q+oWHHYV8Yi/7YMlZ9BNb12bQEingBE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-XEBZ0tDCMsiEgKq2k06IFQ-1; Wed, 14 Apr 2021 12:51:19 -0400
X-MC-Unique: XEBZ0tDCMsiEgKq2k06IFQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 f9-20020a50fe090000b02903839889635cso1713687edt.14
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 09:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28YINbAqDyAqhPTutZnK+QHxXzqPiDvhsD4ZuagO5nU=;
 b=cUM1VY+6idh4c+Ji+aoLAsiKD5/97cF7lotfMKgrYBCFPlAVKDTbc/NWX6K7ANS0Mn
 2Z011k2tr71S70SrcJLIoCIZ4NjYVdNXasMU7BDM4+52kULXkxgGCwjxfoQGnwpohZC0
 J23GibZZlHAl3VJBK3tY7FMnsL6j7taDiauUif4n2RD8ikqsl15unSPduvv0VCkySUMu
 bhblm7t9Wp7uyuQ0sCxglanGNjl+LvW92rTZZYE8FZHwG5CduWUUtnAGgPRZFh8xxomb
 LAVSK+RfrObzxRY73AWZEkA4vfWprNUszo64j5P9S5jGym3rGHjo/UJgWRAidh5wmXRk
 +OPg==
X-Gm-Message-State: AOAM533yle6Zv+qnn6Xy/T6/OpF2GN+5jTEXhLXj6Q5L+LrXHulrKtNl
 dfbNqfm4mkpb22//Slnq3PWsRfwaYme6eNwSamRqci/lMyo6N7YOlbNXo+7ECQRLmhI5mKz+A1L
 Q9z6qLn9nXD0yZdq2DdOdSHgWI3x6E+TIX8EwfbfBbLLNgK6fOJGXuEkzw87LRmWh
X-Received: by 2002:a17:907:6192:: with SMTP id
 mt18mr3948333ejc.530.1618419077939; 
 Wed, 14 Apr 2021 09:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrp//AUZcuZau8m5zB30Ok3U8gXr7C2Djmc4Mtfi/W/z/HmXYWEFdPjXItQCHphcfTGXpKdw==
X-Received: by 2002:a17:907:6192:: with SMTP id
 mt18mr3948321ejc.530.1618419077701; 
 Wed, 14 Apr 2021 09:51:17 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s12sm129706edx.18.2021.04.14.09.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 09:51:17 -0700 (PDT)
Subject: Re: [PULL v2 1/3] osdep: include glib-compat.h before other QEMU
 headers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <20210413160850.240064-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db82854d-24f8-47e4-2046-d0e8671a85f2@redhat.com>
Date: Wed, 14 Apr 2021 18:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160850.240064-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:08 PM, Paolo Bonzini wrote:
> glib-compat.h is sort of like a system header, and it needs to include
> system headers (glib.h) that may dislike being included under
> 'extern "C"'.  Move it right after all system headers and before
> all other QEMU headers.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/osdep.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index ba15be9c56..b67b0a1e8c 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -111,6 +111,8 @@ extern int daemon(int, int);
>  #define WEXITSTATUS(x) (x)
>  #endif
>  

Maybe worth a comment "must be after system headers and before other
QEMU headers" so we don't move it again by mistake.

> +#include "glib-compat.h"
> +
>  #ifdef _WIN32
>  #include "sysemu/os-win32.h"
>  #endif
> @@ -123,7 +125,6 @@ extern int daemon(int, int);
>  #include <AvailabilityMacros.h>
>  #endif
>  
> -#include "glib-compat.h"
>  #include "qemu/typedefs.h"
>  
>  /*
> 


