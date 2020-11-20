Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09E2B9EFD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:08:10 +0100 (CET)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kftyD-0007qH-Ad
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kftxA-0007Ba-M9
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:07:04 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kftx7-0007Uj-Q1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:07:04 -0500
Received: by mail-pl1-x643.google.com with SMTP id s2so3880881plr.9
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vXi8NlU/I4hcjMlSi1JN70ve5UPqJ6x7pl8DUVbmcP8=;
 b=whTji0otKuf7crMV24l4X2mt4g2Ae5lEJqCzrUW8Ndq/MLbea0VSH88JSG4GKXkL+e
 jJ6JdMVcESA2XI227QAviHKvN5i03vr9r09DLmTD5XfW5jbnwDU55N109Pqft6ljk7db
 K6sPOTR39/5Y0BckWCCyoX7OuJOulH+SISezgWvHjni4K07bhq3JJIhw6BGm3qSYld9I
 E4hUMRRS6OfDXUd5pV2MQIDnVKJ5mr95ENPRSyudaqag0vE/UCZiGCMPMd/qvOyq0g+q
 JGeupSLTgUeMYwVWvjp2mBengt3uebSjtoDP5n3fFKraBK3Zc/Zwo+EaDzJeuHGCawbC
 zy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXi8NlU/I4hcjMlSi1JN70ve5UPqJ6x7pl8DUVbmcP8=;
 b=BXsP5B4tmMYY+Ofw0lY5XY/YaKp1p0TIt3ClVk7Hy/5evS1DmrvoC4ouQLq+Yr8XO1
 RvinBdaavqNZXe8kXSn6QHXs/x7HFDIuLqI7+CG2bWYqcmAcW0z6tVbVdti0iOpiAIQz
 63cVkxfVgGY7HT3CktMDIOp9Ll+IHoIE1nANBPvKPjT7oNku91YNjKrdX5FYMDaYQXDj
 fXrNzP6FcgGXd5FTTHh4wISeV6dn4IjEgrAvtrDIboCm+rs30kH8FwXiTaJEU9vdRsZ2
 HsKATR07GIZ93rFKAC0vwYGJGVYPPrKoCOlphZwAgApMSwnbVNbWNel2RCdAs+Thhokh
 cZzg==
X-Gm-Message-State: AOAM531YSZ9JukeHHMbxGOcBqSrblbUQ02cMbZ3M7wgBtEusghBM1WTd
 mLLVaha2wjBvjbDWsemJ/6qqyA==
X-Google-Smtp-Source: ABdhPJyq0M0KhQMYA2jIJn3pz0zx6BktCbKIW6TxSelwjekPxwEWdM7gi4RX+IcpP3dZuhRYMi/4gg==
X-Received: by 2002:a17:902:aa83:b029:d8:c97d:9c2e with SMTP id
 d3-20020a170902aa83b02900d8c97d9c2emr11653375plr.44.1605830820157; 
 Thu, 19 Nov 2020 16:07:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id p15sm864567pgk.13.2020.11.19.16.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 16:06:59 -0800 (PST)
Subject: Re: [PATCH 1/6] configure: Remove the obsolete check for ifaddrs.h
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-2-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <333897aa-4862-1fb0-8736-1c098e464710@linaro.org>
Date: Thu, 19 Nov 2020 16:06:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:10 AM, Thomas Huth wrote:
> The code that used HAVE_IFADDRS_H has been removed in commit
> 0a27af918b ("io: use bind() to check for IPv4/6 availability"),
> so we don't need this check in the configure script anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

