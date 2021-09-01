Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97E3FDF48
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:02:30 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSh3-0003yH-4p
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLScZ-0000lB-8P; Wed, 01 Sep 2021 11:57:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLScX-0002kA-9s; Wed, 01 Sep 2021 11:57:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso25449wmb.2; 
 Wed, 01 Sep 2021 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u71eHwtIwkd1B8kEl0GMKAMe3JArIXk1x3S+uQk6yhQ=;
 b=qvg1KZiv3xQRAsrJ1xvVq2u38sR4J81msk9P9ysqLFyrvsxFboCr3j6OjgVaRFENOm
 GZbbkyAjHxskg/rmZsjed+bIao6kYPIZvq8PoUxLozfR6kjkVG9QD0GpQPF1yxf14WVE
 DDhNgQY8R0+Hjbo/+lvpOpCaHYWTuafT0T76ncDRrm9pW1yRatO5oJQoosxdw+llWw82
 Je6jRYoDImpqi4LZtqH6T+y2QvXtpmKLDm3/Qk8ZNbeIwrOvRjB51UtREU8R62dUCiJc
 ZfuFsnGHOd6RPk6h/qo5Rp71Zlgm79t+OgNDcQq4WbO7NJ1chaWCcwrqEI4Vwgn+pzAp
 0pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u71eHwtIwkd1B8kEl0GMKAMe3JArIXk1x3S+uQk6yhQ=;
 b=EU7lHayYlDejHN6prDHLHUY7buXIKNCcMPfEK0Aq3sWRpf645fGFHV99Rb11KB+3tu
 wQRrpzDFQDOWjVjqPDi6qTvgCvcLL6BywzPAc+uP8Jxm6484dpwMd1uYdpW4AZdspHvK
 lM8bGNymgcv3NiI15tBp1F4X3lji2TkZbGFdtFpVuRmHXXs8HvOR+xs0r7z6vG6yFg43
 JiRdNTeVvSuB7NFhzDZbdnB7PqywEAHicAaX6CiWuypqE8jNB3QG7Wial7FGOJBKKkLs
 AtyneOji/IoXMtcFsE9xA/eQdAATudoOWovdvC0CxNbIWGOx3KiVHX9OlDWONw63nfhr
 Z6Tw==
X-Gm-Message-State: AOAM531FYBGBId6YQQ8w6p97+NjJacVtbb1Jtsbr7zDIrLvOvwYlXAPz
 tnrNSN9mRX+u67TQ/04fxgY=
X-Google-Smtp-Source: ABdhPJwIcSE+K7V9pghgbmY6usXo+re/RdjddoOK+CqawGc2gSiunkicCvRlR1SQSDp2DHDYMWsXfQ==
X-Received: by 2002:a1c:4cd:: with SMTP id 196mr145962wme.10.1630511866832;
 Wed, 01 Sep 2021 08:57:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f17sm25098734wrt.63.2021.09.01.08.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:57:46 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] hw/arm/aspeed: Allow machine to set UART default
To: pdel@fb.com
References: <20210901153615.2746885-1-pdel@fb.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4ad04972-4cea-7d3a-05b0-187e93297da9@amsat.org>
Date: Wed, 1 Sep 2021 17:57:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901153615.2746885-1-pdel@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 5:36 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> v1: https://lore.kernel.org/qemu-devel/20210831233140.2659116-1-pdel@fb.com/

Hint for patchew:
Supersedes: <20210831233140.2659116-1-pdel@fb.com>

