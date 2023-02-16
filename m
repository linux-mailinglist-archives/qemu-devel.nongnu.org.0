Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E99698E23
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZ67-0004mw-0Q; Thu, 16 Feb 2023 02:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZ61-0004lj-9z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:54:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZ5z-0000vp-9u
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:54:25 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r28so492844wra.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TqfNLuefWncvRnp8nhAvIE0cvcJMkMskp9YcdBmEcGk=;
 b=daRcY2+q1jXxQT9WG+JXvqSqj6IBJkO1qO+dgKyZ82DwhNOa7089/GnBtswCKKvG/x
 ybBfgltz5jYfI1RCM9BMa/n5ep/ylgkVGQMo+vn9+XBQSqNfv4WE7cvZfhpJmju5kEq2
 /Ri59NIW7ppX4NzRzZh8vv3Ji1sjrsk1BdYCPpUUx3ZNoXngMObdWvXtR/GrUy4eCeo4
 qEPHktlDePVaRizKVSsLMbcN/RBoT/2btqyKkAtWPOj7/5Sr+bB/sSxMHiMWIEvAEEpY
 Ro0ZV0jJj7q75qXy3SPubU2AhRlNInZFC+QSupVoWQVbXA9Sonjfqm7h4orO4JKXTCGa
 VFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TqfNLuefWncvRnp8nhAvIE0cvcJMkMskp9YcdBmEcGk=;
 b=N2Ozqdi8AdukOUf2N41/ga843BJduJwZ6i7n8/pAxILDjnMfNEWBRMc+mmI/iB68/T
 NcKXFrv1H+RiQIvNzYyiARXCr/es6DIlfvRZRAuf45BWhTWtXVDtD74WbVxiL5V0C52u
 hyCip/lyXOjZgCLNseB/a1XbOySbI6E5YMSwzggv+eNPh4/1xfqw91R8lGhzAmS+vZNU
 yNFmHpjUG0Gz0oZt/qa9AMZduIkH+o+9PgmDHOajCDea8EM7+XhmOLN/Oq95YMmcM9/f
 LnwG/JNklVj0Tf4WgiuI9URFfmGLbWBnfDplT7IopUOOz2X3ODfM6Q0tIyt61EUCevwZ
 MEwQ==
X-Gm-Message-State: AO0yUKXdwsmEZW0jiL7nZkhXjbtTc+KIkOntteyF5oUc+Nvo9Gx1yXEG
 bgqovIfStjupxa9NQS2/39Cw92QB65rjM90B
X-Google-Smtp-Source: AK7set/XT6WL8thlXf4nCCcId2MiCOWWK774k5Zd6w3D7Oy2O7SgsJPd/GDMHQbpNPvJHihuabiysg==
X-Received: by 2002:a5d:4b0a:0:b0:2c5:4c6f:27c6 with SMTP id
 v10-20020a5d4b0a000000b002c54c6f27c6mr3734860wrq.5.1676534059842; 
 Wed, 15 Feb 2023 23:54:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003dc521f336esm856116wmn.14.2023.02.15.23.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:54:19 -0800 (PST)
Message-ID: <00bc9ef7-4f05-f834-61b0-5aea77577ead@linaro.org>
Date: Thu, 16 Feb 2023 08:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 04/15] linux-user/sparc: Use TT_TRAP for flush windows
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
 <20230216054516.1267305-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216054516.1267305-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/2/23 06:45, Richard Henderson wrote:
> The v9 and pre-v9 code can be unified with this macro.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/cpu_loop.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


