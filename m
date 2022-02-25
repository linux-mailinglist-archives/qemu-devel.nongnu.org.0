Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751F14C4FA9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:28:52 +0100 (CET)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhCt-0007Pa-I6
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhAv-0005jR-A9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:26:49 -0500
Received: from [2607:f8b0:4864:20::62b] (port=40716
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhAt-0002uM-7A
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:26:49 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b22so5731070pls.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=JZH3c/loA9CyC1y//6640CnuUuS9Vawi+KENJThLQEk=;
 b=n8AHoki/1HcfyIxZdjzv5I3LXUxCENaoh+wnqjPu0lu38VVE4l1RRYk3estW1q9SQu
 xwbArD41hJCIRSE+xmRRkSYdjQJdxIDqcmB9nlrH59u0jCenVke1njqDbKpFdzzV0uVa
 7ziUwjHYebROJ/BHBPecnxBPpA+e3mPQ+mx3GFk86BKTLYUVfAKbKdz1lPrG5ZT5CAA+
 vnpYYISfD8ESL7QsLe/wxhMeWPhSw8K36rA5RB+SfUJfDLTnjsNg4kkfeqDAZX+LG6Qb
 pWy+NSaLazBrrq75xVOHbvYXOztoHO/WKuuY4Pp1RIfVeVDTYa9bncoA09+jfj9yn9ok
 2Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZH3c/loA9CyC1y//6640CnuUuS9Vawi+KENJThLQEk=;
 b=U8xFv0kSVe6mqwvj5YuYYsW/M4urqaV+G3EmLcH33UOKNNZo+Y7e5CTYzvKcOPfQu+
 SXFf6kbdU2PrW8kfTunAUn/v+BOPQga+m7oyYncmdHNY4Gfk1bUOMogP/2QioURoXzJz
 G7hJ+AsopooxEM8MNhV89m6zPUERdugU0tLvor9GEtFaiglha4OVixFPN9sHfbDE9Xtz
 dJRNwTH7DdJ72C8W3moFjB7osh+WN6tUEgGX9BQWhAa96S6U5r9PN/hyFDej5PEM444S
 0uuq97eI55atgPFw1bWgprivskbWGA74EWXvGm4AstMrF5lld/1SMXtmcNpAsL+Qsyuw
 ehiA==
X-Gm-Message-State: AOAM532sE/nbQYZB6IU7vYc3X+bh2A2nEfHBEQMrV7rL3er68JRH4ZuP
 lFz3J/MJJAg0YZ/r4ERoXTFrfA==
X-Google-Smtp-Source: ABdhPJyuOFQ7OwmOhrLW7btG7G44+BcIQQm0pCF3lmAJGGficT89l+IAZmDaDvG0giF9LEc5RmtUOw==
X-Received: by 2002:a17:903:1246:b0:14f:e51e:baa7 with SMTP id
 u6-20020a170903124600b0014fe51ebaa7mr9060531plh.159.1645820805434; 
 Fri, 25 Feb 2022 12:26:45 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 b22-20020a17090a10d600b001b8e6841ca5sm10035789pje.51.2022.02.25.12.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:26:44 -0800 (PST)
Message-ID: <da1243f6-6917-40ba-f79e-71632c6cd11e@linaro.org>
Date: Fri, 25 Feb 2022 10:26:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/18] tests/tcg/ppc64: clean-up handling of
 byte-reverse
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/25/22 07:20, Alex Bennée wrote:
> Rather than having an else leg for the missing compiler case we can
> simply just not add the test - the same way as is done for ppc64le.
> Also while we are at it fix up the compiler invocation.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/ppc64/Makefile.target | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

