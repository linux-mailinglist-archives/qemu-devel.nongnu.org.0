Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42435639D13
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 22:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozOlx-0006xC-MA; Sun, 27 Nov 2022 16:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozOln-0006qQ-W0
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 16:01:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozOli-0007Ir-Jw
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 16:00:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id h11so6690350wrw.13
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 13:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7pcSe4QkFFO4dwmR4n54BvePW4DaDycxfIOra4AoS4=;
 b=aF2feRUKYH7rDLHsioamPnZ3PS3yom/ehK29WjRZ8pt4IxyPme3iLOp45dLRCLgr9T
 0nyIGk4bdRypXYncF+pZVsmDs5X0CJwTsQAhKfj2rJ2V+vIJWUFWqWfeq+V/iVYpYh+G
 KbnznG3y7q8pu4ZJggKIt2q57IkdapOXy6Vpv1wfYv0m7/TJpwbMFyArWykAMWQ/Wt/K
 wv7t8RPRmat4QMlMhluThPhShGYVe93Z5N8hILpHiDx0uOoZqIKrqKkzuFNQpVWFQiA0
 n4Z8V9SpOH8ERlmDWWQoy2dc1s6XfYJqpipcn4qavEYtOuxjVXOKy8/40/Ri8x5zh51N
 yn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7pcSe4QkFFO4dwmR4n54BvePW4DaDycxfIOra4AoS4=;
 b=G4C5XEIw7o7M7pzXJIRviJL/GcqDTF9RlMQMiaRTHUFiDTcLFVXNjNh4WX19T/pGnM
 HDK6SeN5bzP436cO4l0OhxaMk2hQJBzQ1Ue5zUDGH43/5h9kvobSrU1d6FAJQ4F4yl40
 f1zRtljUDFm1njkOhRsFiI84ZTg5eeXJKnJHdokPWbS+rBmLhDzfeyKoa35d5K1Csusi
 f6LfsjNMztfeDMupEh3p9OlgAIViSKbqRS9KaRm9RJKMIfrAUwIRHdeP7M5YHrmKFMBD
 LT1rBqxrfWuQyd2bXe7XRSTinMpy+4sIL3EBqrMYDLqL7Y3dde+qkNi2UStdhxIYkTxV
 O0JQ==
X-Gm-Message-State: ANoB5plk3mJEItmnj7O2RqwasDAayLlyqGPW2SriYLfKP9EaYFhALTgX
 nyokLPuFEHHuu9cw7UHJtXHMcQ==
X-Google-Smtp-Source: AA0mqf6Tcs2My+hwRte5J07tTEbdftoYPRm8VZ+Zyv+Bx/InepwVb3x6LzIsnxkelpqCtmy00mfZsA==
X-Received: by 2002:a5d:51cf:0:b0:238:3fcb:31ce with SMTP id
 n15-20020a5d51cf000000b002383fcb31cemr23200977wrv.655.1669582849164; 
 Sun, 27 Nov 2022 13:00:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b003cf4d99fd2asm2774261wmo.6.2022.11.27.13.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 13:00:48 -0800 (PST)
Message-ID: <eed03d1f-fe2c-78d4-f94c-0d8d3590141d@linaro.org>
Date: Sun, 27 Nov 2022 22:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/cxl/cxl-host: Fix an error message typo
Content-Language: en-US
To: Hoa Nguyen <hoanguyen@ucdavis.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 27/11/22 04:22, Hoa Nguyen wrote:
> Signed-off-by: Hoa Nguyen <hoanguyen@ucdavis.edu>
> ---
>   hw/cxl/cxl-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


