Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB1D698698
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:52:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOka-0002UT-UZ; Wed, 15 Feb 2023 15:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOkS-0002AE-08
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:51:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOkN-00026y-Tv
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:51:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l2so3857594wry.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dAn2CzD/jXxBpO6tjbX00SmmJhIaRXsXdWMhUPd+onA=;
 b=yTkxoBYfAtSi2tQme12tle4doxJ3WJG0UkYM3fWQpwnMPzLYZdz9tArIbKF9laZ30P
 cx9fBbrvmP9QLuUncIirmgFEnJK236R8IIwJbyVGv6PlqbhtaMqWFCBXJKRoJqwL7s1+
 DyBRqTEv+UX1da6enm6MYTvd1NccoAYW/5O8LjYW/dYYShYJWMuN9g+nBvelW1hqzW56
 DOY7JENwpOLDOYHKG5kRwVsQ9h9zCttXgVUk+/RsSpxE/lUu5k8dC35TGbq0QOuuEGlL
 FYxMCNNQlrEfczv6FH8KUQZlfiD2x/flrn2aB7OucDboICIY6s64q4KnKWJTRvSdQl+q
 RiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dAn2CzD/jXxBpO6tjbX00SmmJhIaRXsXdWMhUPd+onA=;
 b=1el8u4IKBsLM/xjlrklE+3yvxGusjjNy+YxETWWZEduXfDfhLSgScWKURywdsvbykE
 7nDZDHU0pGAy41YryiLzWjj60b9rC9fKWEHViJw2C8Wn+gHDgA4GvM/GAQ9IdIZUTs8g
 vLRwqoo073Wc88ewsQgOkrNLQTlANoESmAo8NmBD/XvZ6bzHtfSj3X6NkkpCD1QSXcoK
 20W8QQ0njmuG/fF3aTBvhA5VJ3mBnUmBPzeWN1BWP84S8oLIg/AeUe1jqhogKDWDLqJC
 b1jG2U7DDEcnKsY+nfvyGv55t/WonOuavE5MqOLzjMuD8rggI2un8jK8iz0qdOlcEC/B
 mFyA==
X-Gm-Message-State: AO0yUKWMbtW2WUh7gqHGHmaKLGwcby6YHma9pLqpenG66gWGX3laNknb
 fGj5DNIv06K/F+66mA8aYwyfs69+bkOKGuW0
X-Google-Smtp-Source: AK7set/w6+rg6NhSidSaZxzi+KlBqS85BlCwhYRcfGAS+irDBqxCnTBz/v5D4O88872L0t+hOmju9w==
X-Received: by 2002:adf:f847:0:b0:2c5:5fe2:bcf3 with SMTP id
 d7-20020adff847000000b002c55fe2bcf3mr2845256wrq.28.1676494275675; 
 Wed, 15 Feb 2023 12:51:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adff544000000b002c54fb024b2sm11207354wrp.61.2023.02.15.12.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:51:15 -0800 (PST)
Message-ID: <b467ec2b-2372-c854-11cc-d8d24e78112c@linaro.org>
Date: Wed, 15 Feb 2023 21:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 01/20] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215112712.23110-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/2/23 12:26, Philippe Mathieu-Daudé wrote:
> From: John Snow <jsnow@redhat.com>
> 
> I have not been able to give these devices the love they need for a
> while now. Update the maintainers file to reflect the truth of the
> matter.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20230206182544.711117-1-jsnow@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


