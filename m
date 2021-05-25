Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D784238FC05
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:54:53 +0200 (CEST)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRtt-0006tt-0q
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llRsi-0005Qb-0F
 for qemu-devel@nongnu.org; Tue, 25 May 2021 03:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llRse-0003Lk-My
 for qemu-devel@nongnu.org; Tue, 25 May 2021 03:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621929215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxPstLsb3dt2KoYpSap2npVnKW1k0hOhIrvJhz8JJxQ=;
 b=jJIzV/VBu58aYfLsqE+j60aSdO7jWGjv9n7v7Hb54vrK/jJd9bZXKfrjo3kY/25F55PUun
 XwQnb4sUX4jh5MymTngyryR91dnOFs3pE21Qqy9j/EQW5Qw8DGIOR+wYUtB3SdlJeu4WO4
 4qjhXLus2ANryigg8K/U5M7WlF0jkT0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-Z8Cg4VgBPL6yiGuPmosn1g-1; Tue, 25 May 2021 03:53:33 -0400
X-MC-Unique: Z8Cg4VgBPL6yiGuPmosn1g-1
Received: by mail-wr1-f72.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so14225207wre.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 00:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LxPstLsb3dt2KoYpSap2npVnKW1k0hOhIrvJhz8JJxQ=;
 b=TbxXBrHwXXmOsgaN1lhl68V/38x0DnV1D0wCyr5D2CkS3jj4ZsxQ2qu7tj5ElHMbvR
 qXK8tpS3sYosqnSgTY0TitW8KYTD33M0I0a4q0jwN8pW3hdTLToXlUp5B1mi784ha9L+
 BJWaJ6zPfBL5MGtxpXYJa60R0ryx2HscX+PqBUv5/95UufNTWvoB49Utga5/jAiIv/lI
 x0Yw7IPw7CBm5r7Zq7YbUoIEvX0WBvnyKvz8Wk71XhXz9Smbfy7i65ErkscSjXX+dwEu
 OKxhp4tqEP7gprmTlpC7kqzrivcsNdL/iBDOI0CKWXZfcdH6+l1rmWeQlnSiaqMY5IcY
 Epgw==
X-Gm-Message-State: AOAM5332FUfwULZTZxnD4XINt9AkN8bvB7AQLergA7QlnjKXiY8E2/GH
 LKQ30YUXaxOr5dyTyqJKPtRKeC3V6kCHwidY0kNqe+xnoWFY39yBVz2/YzIBW+DeI9MhiTXeh7P
 XHhNZBrMceJlwOgQ=
X-Received: by 2002:a05:600c:3043:: with SMTP id
 n3mr21411534wmh.98.1621929212674; 
 Tue, 25 May 2021 00:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm302cVM38B8FVGASRCVePhu4yOpDR97Ff1irN+2fXWp9S87nhg41Tw9RrVOttoHZuGOsGsA==
X-Received: by 2002:a05:600c:3043:: with SMTP id
 n3mr21411527wmh.98.1621929212528; 
 Tue, 25 May 2021 00:53:32 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u126sm2180932wmb.9.2021.05.25.00.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:53:31 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest/fuzz: Fix build failure
To: qemu-devel@nongnu.org
References: <20210513162008.3922223-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b564c68b-4d9f-f243-f4f0-75f81ffeada6@redhat.com>
Date: Tue, 25 May 2021 09:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513162008.3922223-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping? (patch reviewed).

On 5/13/21 6:20 PM, Philippe Mathieu-Daudé wrote:
> On Fedora 32, using clang (version 10.0.1-3.fc32) we get:
> 
>   tests/qtest/fuzz/fuzz.c:237:5: error: implicit declaration of function 'qemu_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>       qemu_init(result.we_wordc, result.we_wordv, NULL);
>       ^
> 
> qemu_init() is declared in "sysemu/sysemu.h", include this
> header to fix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/fuzz/fuzz.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 04b70e114bf..5f77c849837 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -16,6 +16,7 @@
>  #include <wordexp.h>
>  
>  #include "qemu/datadir.h"
> +#include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/runstate.h"
>  #include "qemu/main-loop.h"
> 


