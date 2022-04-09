Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85FE4FA965
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 17:59:47 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDV3-0005Ty-Sw
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 11:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDTw-0004cr-BD
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:58:36 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDTu-00069L-Um
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:58:36 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n9so10451870plc.4
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=pHV+UAwUn9RxJlUlyw0NuKGovC5UxbwEBJXsEc2+FS8=;
 b=BvGsoL1EcjnWAv6XulQIYH+2Vw4iIAKDuaRlN3yT3jGOGjeA/puRSLjA7lC2aRlHUp
 R6lohEyHqq317r5efc/e0nQuagF1FcpqhRismjEApcbH7jqv6oOrk8BYsMn1ORA5kyJ6
 uyJ2vvjhjXW+kgOgs5LQt7rFGFB445oYxqjw1jSxO2Ck39fahmbVeAcz+eCSTqBlWM4O
 +z7lP821sMh41JXrTsTEmSM3sFrqO7He3GlLdUHG9QnKgwRZnFR4LPWTO5ZmWf0oTJJn
 4pL/oxZIt/iPCS+FX4M+SMGCqeWev3XWImHRS8x/gTBmrGhx6xFgInJXPK5lo+atbdbc
 mS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pHV+UAwUn9RxJlUlyw0NuKGovC5UxbwEBJXsEc2+FS8=;
 b=HJGqnbwuWcdL/J6pAi/tzXDXPJshVVt0joUmPWZl9UiQU4BtWlAYSg5XNboNEUmtWp
 3maVnHw67hVNbi07moA+6UkE67GTvh7OPsK1b+3DqnvgnxMTVaO4HJJ9wGApuqrP+cDn
 PnkP+ICbfIViadAx7sLnvl0RIvOpSwUmnGzBLr5v8Df7BOOKddUSMLAJIjqWfI6AMiVr
 sroxUjL3GFV+kjhcX5gTWoM2ggaZmuD+8IyP2mq2sagRjGie0IJHuOZhDwlpejfOsEBP
 vyj2oxZaeRi1jNcGM7FFm+67zt/3p+yFP9Z5tOPhIzEDnrcq2JjCznH8ct54TKmKuCxH
 /Y3Q==
X-Gm-Message-State: AOAM533q7mtAjG0M3Zhaog0HqmtvIbcovnIF6dU7+0MC3i1b2cvagtvS
 U8xY8b5yG5bP7Yz2jdTVMqoV1WW4djozNQ==
X-Google-Smtp-Source: ABdhPJwOqwumdCGc/bM/jJlVf/Q0GvsQam3yfg0obefOkl8LH7+i8o+k3dCzsY7xDFS2iLINEpAHOQ==
X-Received: by 2002:a17:90b:1d82:b0:1c7:1d3:f4 with SMTP id
 pf2-20020a17090b1d8200b001c701d300f4mr27731990pjb.223.1649519913481; 
 Sat, 09 Apr 2022 08:58:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056a00438f00b004fb6a6af05dsm26962688pfb.187.2022.04.09.08.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:58:32 -0700 (PDT)
Message-ID: <67a2a587-287e-4bc9-4cab-6f6eb7a57791@linaro.org>
Date: Sat, 9 Apr 2022 08:58:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 06/15] monitor: expose monitor_puts to rest of code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/8/22 09:47, Alex Bennée wrote:
> This helps us construct strings elsewhere before echoing to the
> monitor. It avoids having to jump through hoops like:
> 
>    monitor_printf(mon, "%s", s->str);
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/monitor/monitor.h  | 1 +
>   monitor/monitor-internal.h | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

