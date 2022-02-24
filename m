Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B74C2DFE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:15:07 +0100 (CET)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEte-0002TI-35
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:15:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNEqf-0000DX-6N
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNEqc-0008KN-5M
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645711914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfERO4PGiXKDwH1mOEbhTwULdMiFaPR3Qj+9DsLW7uU=;
 b=Q29a8Y3oWdUtHl/+7P20uE2f+qMXynRuxVxOj3xMZe8u+7yjdxLXJwsKGujmZZqE6G3oT1
 xOBZzQtzuGudVp47Fhp/zriVT6Z6k5cvcKexZyfj9Izl/oTvqOJAtEdRF5VQ6MyEUp+KzE
 tdNpL30/Yln1rJCs/PeAYqIz0pg6toc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-MXYkbO-xNmO3cgHy_DqDvA-1; Thu, 24 Feb 2022 09:11:52 -0500
X-MC-Unique: MXYkbO-xNmO3cgHy_DqDvA-1
Received: by mail-ed1-f70.google.com with SMTP id
 g5-20020a056402090500b0040f28e1da47so792451edz.8
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IfERO4PGiXKDwH1mOEbhTwULdMiFaPR3Qj+9DsLW7uU=;
 b=1CXs7KPRkciWqhM+9PRkNbdcpZMiuhtUiOMcRQ3f14zFol5H4ZclcKh3Q3o5RFo51R
 RA3fp5OTTXKsqF72mfpLJSbjaDVq9vd4/CghyOD+SNB0/6OBNbjYlb3Ezx8KDyyxX3nE
 fq6qH0bQv5iJqc+p0CXY174C1wRxMHvtD1WBpJ1jFe8SkbA8DVW41EAIYVYFoFupPu3B
 bjl0zp5UoYgtxUEWIxL9oKwMonNcwilcr677aO0s+6xExN8U3kVE/FlVbi/YPOdnrtek
 BIs0ijo510lModcybdp7+B1jIiR72r8wLhFdhVk/+z8jycc3MNZuef/T63Y7o/QobXBX
 hdhA==
X-Gm-Message-State: AOAM5319Bgf3o51q1zfjhZYp3Q6+5HagC8UmxThAwlmGXyTZUlSDIc9u
 JapHm6OSvv6ZxVd1f9FoOInYW16SAwfW+37jqpcNuqZ6u2lJU97Gt4VfhaqziOKzZIZBLlIwkxd
 PC25yU/ZrREDlq4A=
X-Received: by 2002:a05:6402:90d:b0:412:d3fe:8460 with SMTP id
 g13-20020a056402090d00b00412d3fe8460mr2442001edz.316.1645711911740; 
 Thu, 24 Feb 2022 06:11:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA7u6A3KuJnvlnZP6Bu4L0LbEQaV1b9XPqQnDYtFjbq82Q7gWutuxVb5uDQedZEvKPb7Otlw==
X-Received: by 2002:a05:6402:90d:b0:412:d3fe:8460 with SMTP id
 g13-20020a056402090d00b00412d3fe8460mr2441980edz.316.1645711911545; 
 Thu, 24 Feb 2022 06:11:51 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a18sm1395939edu.31.2022.02.24.06.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:11:51 -0800 (PST)
Message-ID: <90aa45dd-9fe2-cb66-281a-1e397f8cbeed@redhat.com>
Date: Thu, 24 Feb 2022 15:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] block/curl.c: Check error return from
 curl_easy_setopt()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220222152341.850419-1-peter.maydell@linaro.org>
 <20220222152341.850419-3-peter.maydell@linaro.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220222152341.850419-3-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 16:23, Peter Maydell wrote:
> Coverity points out that we aren't checking the return value
> from curl_easy_setopt() for any of the calls to it we make
> in block/curl.c.
>
> Some of these options are documented as always succeeding (e.g.
> CURLOPT_VERBOSE) but others have documented failure cases (e.g.
> CURLOPT_URL).  For consistency we check every call, even the ones
> that theoretically cannot fail.
>
> Fixes: Coverity CID 1459336, 1459482, 1460331
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>   * set the error string in the failure path for the
>     direct setopt calls in curl_open()
>   * fix the failure path in curl_setup_preadv() by putting
>     the curl_easy_setopt() call in the same if() condition
>     as the existing curl_multi_add_handle()
> ---
>   block/curl.c | 92 +++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 58 insertions(+), 34 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


