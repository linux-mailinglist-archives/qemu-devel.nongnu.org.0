Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B1A5EEEA0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:15:06 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnlB-0004Ol-Ke
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odnVO-00035H-2n
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odnVK-0001WO-V7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664434721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZvR5sIDUhyToajirDeEuqDaD+uF59r/d5Y04IQHQVA=;
 b=bnNtZWReVOdehYkjUpbJ1bE1Lkw7SvGowEKqO5uBoHaysMBR4nMeCEY8n77urf+FydxsE0
 TsLSCoOGa49F86fvNUf0GXyPWev1n2FKqDJ3B+8KDvqVrDk/Au6PYUS+vXxPaW/JS385H4
 1Gz8sseFiOFS8+0ZG4jbNCLUxOs2Z78=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-Cu7k9_7zNZe1AjUOn0mDTw-1; Thu, 29 Sep 2022 02:58:35 -0400
X-MC-Unique: Cu7k9_7zNZe1AjUOn0mDTw-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so132624wmi.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 23:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6ZvR5sIDUhyToajirDeEuqDaD+uF59r/d5Y04IQHQVA=;
 b=YmYwgx2/pjrD5DYxDT/P4aJsJ8ne3AM2SxNrNGx1FG69qRITg5WYa4REjFxOS60LqA
 kbVXIpFReRl1WC/3GGvjRf/yOQCdF1qsG9PuUs5Lbi2aCind8OpRDs67hTorVGcDnwYs
 BeL1trtCFB/U4OyRDasLM1GNAnMDjYD/jcM83UDb7Wv3MIoYx6ZhP2yG4JM9c1fxvZat
 EJDZVy+mH2ZvB66yYACxOjlJNGt5Nb9ksX2Y8Rs1SMa3JkE+EF9ZiNNDQNH9x1nxsZ1g
 oBgWjmnG/sj8Dz3GGHBV+LHDQ/lkgZCxN2iR44eNrb1igRsS4W/ypZE3SVqNfwr69lEh
 B2qA==
X-Gm-Message-State: ACrzQf30DyE4Xc6NEZewR+pdvjdq7S07Uo1MyYpVOpZSSW1uYldkgH4G
 yfDCSSnnv1q2z01Y3VA4FZqYbMJzeQFQukykpSzymGhkaZ5oSKmmEatpNc2AoXxa8gSjcRcYKEr
 MWoOTKkQAzbHyHNg=
X-Received: by 2002:a5d:5406:0:b0:228:db0e:a4d3 with SMTP id
 g6-20020a5d5406000000b00228db0ea4d3mr1014848wrv.8.1664434714058; 
 Wed, 28 Sep 2022 23:58:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BjICLJWH+wn7MPF1nG5GGZNB9ke34/T1PBOXPyjVoma2ZnDg6XDk/7mmHvp5U1jXpzBOmzw==
X-Received: by 2002:a5d:5406:0:b0:228:db0e:a4d3 with SMTP id
 g6-20020a5d5406000000b00228db0ea4d3mr1014833wrv.8.1664434713838; 
 Wed, 28 Sep 2022 23:58:33 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 y3-20020a5d4ac3000000b0022ac672654dsm6093118wrs.58.2022.09.28.23.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 23:58:33 -0700 (PDT)
Message-ID: <6d08869b-3581-a2b9-c4fa-4ae1ca9c14a8@redhat.com>
Date: Thu, 29 Sep 2022 08:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220927213501.4069117-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927213501.4069117-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27/09/2022 23.35, Alex Bennée wrote:
> It seems the depth of path we need to support can vary depending on
> the order of the init constructors getting called. It seems
> --enable-lto shuffles things around just enough to push you over the
> limit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
> ---
>   tests/qtest/libqos/qgraph.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
> index 6e94824d09..5c0046e989 100644
> --- a/tests/qtest/libqos/qgraph.h
> +++ b/tests/qtest/libqos/qgraph.h
> @@ -24,7 +24,7 @@
>   #include "libqos-malloc.h"
>   
>   /* maximum path length */
> -#define QOS_PATH_MAX_ELEMENT_SIZE 50
> +#define QOS_PATH_MAX_ELEMENT_SIZE 64
>   
>   typedef struct QOSGraphObject QOSGraphObject;
>   typedef struct QOSGraphNode QOSGraphNode;

Acked-by: Thomas Huth <thuth@redhat.com>


