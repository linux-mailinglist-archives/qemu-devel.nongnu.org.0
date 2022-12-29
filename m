Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD572658BD7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 11:42:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqLs-0007y6-Ln; Thu, 29 Dec 2022 05:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAqLq-0007xy-U8
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAqLp-0008T4-4H
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672310488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8S6D+fFVbeePWKNHGtC4eQrZkPhM22xN/RpLzPCYJQ=;
 b=POPx+ulDCWUlQLPZTCyiuKKKHg4J74JsMqG6VmlIsGAbOwB7DUPXrVhv8Yra9bCR2nLLGQ
 6LNiRbkQPlrlH2tNc49a84uMTzP3QQY69EKkrUEMcbSJ8V/n5wmqzfkkn0cWi0cnXb3n+x
 tNNNsfTWnH3nAKbTLf2Id+ZgU8Hjb5E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-nM1QNjBQNlCnD4Um6raDcw-1; Thu, 29 Dec 2022 05:41:26 -0500
X-MC-Unique: nM1QNjBQNlCnD4Um6raDcw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so2226987wmq.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 02:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B8S6D+fFVbeePWKNHGtC4eQrZkPhM22xN/RpLzPCYJQ=;
 b=KIO8FykH+nVdZ8MceuKHWPI0Mo/W/fQJ1hliJhfbolhfmKTpzQ07r8pDMiCIK6wcHD
 3aMUdWveoL5NxnSMKAD5IlrQ16WCm67+0aWqPGK0ngiyfP+s4eMPCqlzTI4FkMMrBTCU
 FEnG8+/fCV8e6G4AtgH5SonCeG9cCrPiObo9zIQJMbdDW3D9K3YBgjUKgqpwd1xRo65R
 AS8ybik4KQxW/lXecvagSzCf8MA6DX8jmTsQKR4vt/MNScxxIQcG0gd5Xrxf+yHn1oV8
 bLNACIlXUDQQP4Vj9YqWVVy0453pJCsYn1SPxZ0qytsg3CJOcPOu0NeQZMRh6croYTqN
 qIGA==
X-Gm-Message-State: AFqh2kojrul2htNtybA1bF7bwTwEsWBlu4KjvMEx4DGRHkf47WxYhMjH
 5yrDq5kGO/IU+vyudDuPyxjnBrABNtsYcUSLDkJunrxpGHacbYnWky37jE2h4N0wR1M674PiTBR
 v3qmqwz7OeIwekPI=
X-Received: by 2002:a5d:6d0f:0:b0:28b:456c:1b6d with SMTP id
 e15-20020a5d6d0f000000b0028b456c1b6dmr2082600wrq.55.1672310485478; 
 Thu, 29 Dec 2022 02:41:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCtEKw+sDcBBmaSguf9VwrUrVN67brDyn49QInSqDA8VIVvL57hQaFO/dOIQDST3Ss0VKMUQ==
X-Received: by 2002:a5d:6d0f:0:b0:28b:456c:1b6d with SMTP id
 e15-20020a5d6d0f000000b0028b456c1b6dmr2082583wrq.55.1672310485282; 
 Thu, 29 Dec 2022 02:41:25 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b0027973315213sm12962708wrj.89.2022.12.29.02.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 02:41:24 -0800 (PST)
Message-ID: <fb4c2dc9-544e-9f8c-59e8-69c6c9a20178@redhat.com>
Date: Thu, 29 Dec 2022 11:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 17/21] target/hexagon: prepare input for the idef-parser
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Alessandro Di Federico <ale@rev.ng>,
 Anton Johansson <anjo@rev.ng>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <20221216204845.19290-18-tsimpson@quicinc.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221216204845.19290-18-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/2022 21.48, Taylor Simpson wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> Introduce infrastructure necessary to produce a file suitable for being
> parsed by the idef-parser. A build option is also added to fully disable
> the output of idef-parser, which is useful for debugging.
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> Message-Id: <20220923173831.227551-8-anjo@rev.ng>
> ---
>   meson_options.txt                       |   3 +
>   target/hexagon/gen_idef_parser_funcs.py | 130 ++++++++++++++++++++++
>   target/hexagon/idef-parser/macros.inc   | 140 ++++++++++++++++++++++++
>   target/hexagon/idef-parser/prepare      |  24 ++++
>   target/hexagon/meson.build              |  20 ++++
>   5 files changed, 317 insertions(+)
>   create mode 100644 target/hexagon/gen_idef_parser_funcs.py
>   create mode 100644 target/hexagon/idef-parser/macros.inc
>   create mode 100755 target/hexagon/idef-parser/prepare
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index 4b749ca549..559a571b6b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -321,3 +321,6 @@ option('profiler', type: 'boolean', value: false,
>          description: 'profiler support')
>   option('slirp_smbd', type : 'feature', value : 'auto',
>          description: 'use smbd (at path --smbd=*) in slirp networking')
> +
> +option('hexagon_idef_parser', type : 'boolean', value : true,
> +       description: 'use idef-parser to automatically generate TCG code for the Hexagon frontend')


I'm now seeing changes to scripts/meson-buildoptions.sh after rebuilding 
QEMU ... looks like you likely forgot to update that file with the automatic 
update after changing meson_options.txt ?

  Thomas


