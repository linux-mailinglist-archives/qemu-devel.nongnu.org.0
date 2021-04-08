Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE85358D42
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:08:55 +0200 (CEST)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUa1O-0000BD-I0
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZy8-0006Fm-9p
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:05:33 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZy3-0002dz-OZ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:05:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id 11so2539576pfn.9
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jle3oP00E7OmHJkTr0tSg6O8rDczwYDXeHwYHdrkTzc=;
 b=kFEDHI2a6wh+cKQyas9CUDwle4kXDbd9i6cozHAOSDwa9qPI7ke2muxfOrvnSU0BGh
 QfLnwcb9+tZG2KpsH3Z2Euf2kooH9pNJnNpzA+8FBbbZy7BdQdLdJ4UQxulfaZoQciHa
 3j8cKDveB2oGOC3PxkxvJ8QwtZVSAg0cGm08ZrDwWdfQH1TFKccmRiF+U32btUDVb9q3
 CUOrNe4NmY3hb9oE09cKbU44BBMUaMnIbtL5582f2hAy7CyR59axIOty500M0IAHs2Pl
 8adB2bol+Bo88r7k32GAlEnvOVMVK3dN49Ql0BOQkpJ6Kb8yrEk6hkBR0RhgKRMOxwmN
 Rthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jle3oP00E7OmHJkTr0tSg6O8rDczwYDXeHwYHdrkTzc=;
 b=mNc3Gte40rwjaXFs7RFoYqjM0v/y2imdyHHOaxMlOc4HQl4ui4zhMPk2DogiXDZrXS
 0dHh0v13TWXrFXlIj9HJxRe25QwXSM0CpP5/ehuJ74Guv6HySDhuemqUj2ba7l7RkL+h
 OntdHiQd/x9z6Z+VHwkkz5kkJYICa5t8iTSoddQ7Flk7XdrtDA41RhAPq8raEIrBj5Ry
 FujqFmUL2EWQ85FiRfVZ9TGJ/DBcMfwG2h2drKpfzb2fwLKbNMe8Hp4ddVoUnm2S1h+m
 N9gM8ShC5CZFpXaWCW32Wa5CHsxj5bpO5IXsQqFUcf/XLB++h1/ESNwVxR+EWkSjqx55
 78oA==
X-Gm-Message-State: AOAM531SgQVedp7MqcsCA4GzwLMEBwsvZKgVnxJF6yCv22UejB2NRvaA
 RCIJ2LOK2b5QUZhGYBaYxytL2Q==
X-Google-Smtp-Source: ABdhPJwN3dnPbRLQS9yp75E+3rys3cwZjR6b03WXEYGmbUmBmNi5F1Iy3EWAHRkl/iR2GHgHljYBrA==
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr1692192pgh.94.1617908725985; 
 Thu, 08 Apr 2021 12:05:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id az9sm158301pjb.54.2021.04.08.12.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:05:25 -0700 (PDT)
Subject: Re: [PATCH v3 02/26] Hexagon (target/hexagon) cleanup
 gen_log_predicated_reg_write_pair
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd60c83f-1676-eaab-82e6-184c6001a880@linaro.org>
Date: Thu, 8 Apr 2021 12:05:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> Similar to previous cleanup of gen_log_predicated_reg_write
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

