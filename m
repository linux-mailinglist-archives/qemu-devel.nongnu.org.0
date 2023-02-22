Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5C69F218
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:47:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUliE-0003YY-2F; Wed, 22 Feb 2023 04:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlhy-0003VF-Rd
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:46:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlhs-00039n-CM
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:46:42 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg37-20020a05600c3ca500b003e21e018039so6525844wmb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7EwL3nzxhbctKAVyGXChwEVG4p7ltHn8u0EXdYYsclU=;
 b=W7Au8cRvabFbUJNbJ5YobDcO1z5csUOFyg0Bl0y6h1OWJf0aFa9yMXPqEkgJzkD6tz
 LImVubqA8uHCtUQwhkvvP30CK1ivkG5HFGUINFnBlqIatSZ37brx5tGrmiow84vm/jeS
 MNXzOikhqicAZTv4MN7jIHLNqUpOR4dk4YqFQ6MRkoFNfK4PJUPNemhAsDeuPFfewzQX
 J4aHO8Lax/LZdYKmo1mIYZzZ5aCYfl9L/EnIYRctLkzBqL5mg1OCwDXT4+AmF7LU0epg
 ua5/Aim3+DKFJmu9h744asiE3+WhPgmVrvhi5uRN0X5KA0Inq4oAGcgV/36N3Ep15H2M
 mZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7EwL3nzxhbctKAVyGXChwEVG4p7ltHn8u0EXdYYsclU=;
 b=io+A1CQE7hduYS2sTgoq/IdpJBb4vMhwZ5hPANAvuj1SMb0XHJgpmC084Esjh+Za3Z
 QQTkawt3XJgfFEOp3ffKukFTHl+cXq+nLiPbt+snLlfLdsU6kYneQcJS2zefOxe6n4Yh
 HHKRTk+TTwRD58op3keYaOp5qZIu7ImdaIwmmK84kEYlwwWK6235B4sCGCBq++4LuzmN
 9O9/jep/KktmeImo2+olHCyPp7TxlL3pmTIsxsUUJuYN7NpZ0FdfStNGD6nRAR7fQFpx
 FYoNL9SWVorc+Jf+G9f3A8C+hIdt28wXV2B5V5V5PO9yQZjo9qYh5w+0oDcp/sqReJRh
 U7YA==
X-Gm-Message-State: AO0yUKWelMNl4vV9Bkt5Du9qetLY8USWxDlkC5vK8DrARifD5N4zX9Pp
 2zZ19jwvwdURrB21pUFHMylfBw==
X-Google-Smtp-Source: AK7set+ZtPFTshOtSL95E/wWV7KA6IHwPcp8eSVUoPCeW3Y/1dXK1+kONgRZjzbHOQhDDxTsW+/8Bw==
X-Received: by 2002:a05:600c:4495:b0:3dc:5a7c:f8ad with SMTP id
 e21-20020a05600c449500b003dc5a7cf8admr592744wmo.21.1677059193300; 
 Wed, 22 Feb 2023 01:46:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b003db0ad636d1sm1309693wms.28.2023.02.22.01.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:46:32 -0800 (PST)
Message-ID: <f4f7a1fb-4812-e3c0-186d-7abd4d6813c6@linaro.org>
Date: Wed, 22 Feb 2023 10:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 19/25] target/arm: Move s1_is_el0 into S1Translate
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 22/2/23 03:33, Richard Henderson wrote:
> Instead of passing this to get_phys_addr_lpae, stash it
> in the S1Translate structure.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


