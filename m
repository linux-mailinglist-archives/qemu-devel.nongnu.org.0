Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021DE647E51
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 08:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3XWP-00031t-B3; Fri, 09 Dec 2022 02:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XW9-00030B-Ca
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:09:57 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XW5-0001oX-Lr
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:09:54 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so5119858wmh.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 23:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a7TA8qdSmsFpPj7a2UaIFRj2W/oCGRMbDLAsAGpnxbk=;
 b=cInY0edmAowhuxMPum6mc6HUoEaLTLIzQaUSd6oJJedhQY9OI+dkbt/+qxIlXkrAEG
 L7Xk915i0RLLnsMEW8tQViXUWNVGA7C9wXE0qNeM95khnvllCjpm7MeAAEvkvua45lBw
 HX60rA7gse9FcorwPqu9sW/9qKvc+g/DhPylbeXcdUCjt0KF4yn4wiAPqfpO4M2mzxXt
 hdiXDMkhRbDQrqOuWo6tQESPwY27BvGMeEEghSTpgjCxQEHoF40/7EDWjYdQ3X/gcPzl
 xVPZ+JfQCql1l1yhCREHOeWlatn/KScyr95My0fGal5ml2JfHTG6iJJFlAy2dyQOAEix
 MtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a7TA8qdSmsFpPj7a2UaIFRj2W/oCGRMbDLAsAGpnxbk=;
 b=c6TQOuIlT2VGZLN+w3JPZpUgM0tB/P5Plh9XlsBcsywxsnQMbKOawbU+sCvbEP3F+0
 4/mtS7FjZ3BSsRMrxK9cSxBSQFoewS6TaX8mdENn9BNPqIZzMbF2uiAM9kpPg/+mplnS
 QmEFVreg6SkPCLQVH3YvigQ1qohpI79FK0C2VEllf5ZozctHNjIEn+cuh63G7rzpz5X/
 Noh+ObtIXa5yfDF9T2w1a6uLtZJdYz3yv5J2x8xTyA8n7ShXJ+a4ejn5T7PiMEkSxOTX
 /D68C1MQtAphWrYsgfTqgwQY57lDNZCqOP9cgM8u+MD+npaSvbR3TObMm9U2i8Hv5Y6V
 Xd5w==
X-Gm-Message-State: ANoB5plzFef1aiPsbO7avjBLkrdtRx8Q97hJtOh+HgtY7ZcqR62ozWzl
 Vqu17LNebvZoHuqnR3MPoSCD7A==
X-Google-Smtp-Source: AA0mqf6j7Czo/QJnpYZ0IUNUWEwB7pDJMH21w54fbMO6a0+rfQ9SAF5ZXfEXGan+/jEreEWiswkWHw==
X-Received: by 2002:a05:600c:3c9a:b0:3c6:c6c9:d75e with SMTP id
 bg26-20020a05600c3c9a00b003c6c6c9d75emr5027435wmb.0.1670569783642; 
 Thu, 08 Dec 2022 23:09:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003b492753826sm831127wmq.43.2022.12.08.23.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 23:09:43 -0800 (PST)
Message-ID: <20bcb266-23b9-4edd-c97c-211434f8ee2d@linaro.org>
Date: Fri, 9 Dec 2022 08:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/8] accel/tcg: Rename page_flush_tb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209051914.398215-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 9/12/22 06:19, Richard Henderson wrote:
> Rename to tb_remove_all, to remove the PageDesc "page" from the name,
> and to avoid suggesting a "flush" in the icache sense.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tb-maint.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


