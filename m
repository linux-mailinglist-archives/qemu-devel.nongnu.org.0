Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC9624AEC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:50:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDY2-0003HT-Oj; Thu, 10 Nov 2022 14:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otDXz-0003Gz-3a
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:49:11 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otDXx-0007oV-1Y
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:49:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l14so3781654wrw.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZP30iwI9WBWM3EHBSZQVEaVDnDf3pQFGhRgDwC3HxY=;
 b=i4GARIbCWODAp/sM2XTGSEvbWUbk7YNjyaHu5iDs0/bqYkAOThs9Fq6js8vEbkQyjm
 i8i3ukWFndZYesiNG4/Gb0jewUv7iHwQ5nbC4o+EAFu7/QiElQYRXAvXJaVCExS5EXev
 aPBcYm2hZTyQtKYsAwA8soGjioEvL+mDcULCgN4mWQKMwgetBO6yL2QVSnA7NqkANs+U
 WxfV9QlcF6X0AexRlj3EdOk5ks1n2+RiHnolGWc7RVbJpJ6vlih0+x6KK2wIb9STTmOJ
 UpZgaKRw9hJHeNCD5/F4HzcR+PpBNk3MCxMydGuNpU1qa32d7sWTfrGLK3waB5XW/3tp
 4j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EZP30iwI9WBWM3EHBSZQVEaVDnDf3pQFGhRgDwC3HxY=;
 b=3tlQd4Hk8jp6aRkzmcpp6axW+8jFQqgzCnciUXpBGGjSzdBN1mSILanHwyd7JpDAjY
 USbvJHuZvGTQz7zLvrxBwzRQqWOyVBNc010pV2l6w0g+/atqsGJf1u3wBoKLMAt3o7Mq
 6sGuAbFCuiEjw5+ihthZA5qH4t8FJZi36MOWatg1m6psGhEw/nPTT50HDIIedhP5bjpR
 iL83RiE7tU+MCA9bMn2nKt2eIeHAljNW/VCgSawTye4QzKBmR/8SvjS55yMDLEE62qOF
 3gqZXA8RMIMl4oVaZ8AZ2/P4XzqP1Sqb3UqOWWFMPna7P2rF91cTaSnOt+P5GB7pJcls
 0+0A==
X-Gm-Message-State: ACrzQf2ecRGZk+ysxiBxJNnV/1R15zR90VzGE9hqMdiB1/9J7zb4J2+d
 71qw7kbkqm8icg6FAFcb3NxV8w==
X-Google-Smtp-Source: AMsMyM6eCN+revb/VQ1hKz8Yx2E7cXG7zOFfVP5LBtzIs6JyUkrKn8x1sFVRPv1KBWIAkOUKuWqewQ==
X-Received: by 2002:a5d:6da2:0:b0:236:791d:e5a1 with SMTP id
 u2-20020a5d6da2000000b00236791de5a1mr41943330wrs.665.1668109747355; 
 Thu, 10 Nov 2022 11:49:07 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c2cda00b003cf774c31a0sm6575136wmc.16.2022.11.10.11.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 11:49:06 -0800 (PST)
Message-ID: <8a9b533c-43d9-104f-2f00-35ccec74719c@linaro.org>
Date: Thu, 10 Nov 2022 20:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 1/2] hw/misc/mos6522: Convert TYPE_MOS6522 to
 3-phase reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
 <20221110143459.3833425-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110143459.3833425-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/11/22 15:34, Peter Maydell wrote:
> Convert the TYPE_MOS6522 parent class to use 3-phase reset.  This is
> a prerequisite for converting its subclasses.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mos6522.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


