Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B478064A6BF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 19:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4nLY-0003IN-FN; Mon, 12 Dec 2022 13:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nLW-0003Hl-NS
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:16:10 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nLR-0001ZR-IP
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:16:10 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c17so14084344edj.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 10:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rmcd/T4V4SjMDzX976K/j6+F5P6q6tnRSzQ2Vom5NL8=;
 b=GPFMGHwirWmBQSFec5auQMfenZdo9q+RxTE5zOifAfP1ohEZEWmTsuBN0Qfn8k6dYN
 uFUBPHdyf7vzG8+q/0K6dcZNoaS6P0ReotTmsqhUUU2tB7JqHzpeU3tdXpb+p5ux4SN1
 gjVvjjz1jNJgUsFwKfsgq0OLtgTEZDAj2Vi2kGJHdkxEIMvy10/GaqNXBNj/hup3rKqo
 6xPPT7Tc43lybLLZvqGXuCqF6EFTrhhx4n0Ltg8yqkl5dY/g0NRDoGeQH17wVNi/Zegx
 SISN9iqMT3158jw4VZ8etE1ONnmHlc+4L5aFI5kxNgol+hRroLEEhh0371BQygfKqoNx
 Actg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmcd/T4V4SjMDzX976K/j6+F5P6q6tnRSzQ2Vom5NL8=;
 b=JPrcY83Kg/DMscmqeOyNgsUtYP5UiN4+fPL9MvXA+RFbGZZYdv8WCNGxGpYR5f+vGa
 iyZ/xvXNi6gCQ/Nylo64fs5NcUri5De+JxA6dFv+2f7KPdK6xamnYsfnnDwGI+wlT8hM
 l20TGiKT4yjp3kMtz5vY0HkZOCjoaoYNGK96Bn/zSi4bAGIU+ZYrpixT8yLeW3ADOLhF
 BOZAvW0MbYtB5dZzMrkil8+v1cptjRMJ+pIwIlzpoXQeVIL/lESU9FI1pB68o4qe2Uki
 BM4Ul/pFB2jVJBGgZH65V04ZAleVxXE2TwH8tJK46+NEXFDXsXgwUoD8eGZagsEDUqR6
 wwsw==
X-Gm-Message-State: ANoB5pmZnDgBQlG5QlcJMVo3TmZMt72Kb/gLQHO5EDigLu/5m4ND28i5
 dqVJUdj7Kv+l0jt4eOA13xN68A==
X-Google-Smtp-Source: AA0mqf659nD22V4PEbdeZRvjP3BGEZZuEr09P+d95OEEtJDiLhdJqTPcp9v956JekPVb5+FciwiVwA==
X-Received: by 2002:a05:6402:e09:b0:467:91bc:f523 with SMTP id
 h9-20020a0564020e0900b0046791bcf523mr16416320edh.36.1670868963972; 
 Mon, 12 Dec 2022 10:16:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170906748800b007be2687186fsm3563546ejl.21.2022.12.12.10.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 10:16:03 -0800 (PST)
Message-ID: <56c93019-8892-ef8c-146a-6321c0bff0ec@linaro.org>
Date: Mon, 12 Dec 2022 19:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] MAINTAINERS: Add documentation files to the corresponding
 sections
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20221212174841.201003-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212174841.201003-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/12/22 18:48, Thomas Huth wrote:
> A lot of files in the docs directory do not have a maintainer according to
> our MAINTAINERS file, though they can be clearly associated with one of the
> sections in there. Add the files now so that our scripts/get_maintainer.pl
> script can output the right maintainer for them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


