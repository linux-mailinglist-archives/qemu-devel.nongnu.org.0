Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC963D2C2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:06:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JxK-0008GK-PC; Wed, 30 Nov 2022 05:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0JxJ-0008G8-3o
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:04:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0JxH-00068Q-D5
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:04:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id z4so26272678wrr.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yqfIKodWFZoNdcA5OFiZLpo0iM5vDsgPaaIJABZmsl0=;
 b=oQDwhaQs8m+jhk/ImKucv22tMEIbivRrsfTZULpC6MP4wHvcqn5CUsC50Y5srqyXK4
 I95nvv7BwTMEt/yNvA5uxJJFDrwgaMEv3ZE3s9YatD5UfAtKj5vPnGbilqgLguL0BxVE
 hMf34XotAWLRtgwsJBx22alRoWvc/wmqHE1Ulm9qEO6LIeX6Yam0BLcZ2E8uqjT3za3A
 u/H5OA3lkAOajmPOMe01ZvhPuFGF+5goq2B/nWmdxQgE6hioJLgsZ5YU+JUlbqCuYPAR
 qAoiU0BPc+JacTPXuoG6Kpx88C67ii0OaRM9FtWwU9y9iB6by+0OLijGdtXtd1GvtBDj
 rsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqfIKodWFZoNdcA5OFiZLpo0iM5vDsgPaaIJABZmsl0=;
 b=HN3yOrqaqyEEXDkidEaysg7MUwTqNv0Omk3LQHMvz2NSCdgjYMIGfghOn3A6OhCvWd
 BWziIfbMrlx91g17+GG0c/jgLf9ZKmv9PIvVsBkyn7gIytVdTx9nSD170CyDawZZUTJo
 t8ipt32weRlWsd3Cj5XUOXYoa9bNlsFwNgl/zMbjaWVBmc6aXu+eQwoteZcR182rRR2h
 7Y6c342DQ8vbBJ2v/EBg255sRRH6M+6uOsRCsn7N2EPTXjrQ9ahJTC/EDLT98x/p3VAU
 UfxbHiL3q7fXwE+ozpnbqelXJiwFtiMDbR/70nCT9z6+2H8V1Ry4/8bikVVrfCotBlqa
 b50Q==
X-Gm-Message-State: ANoB5plfWjuxI8tpE8VSp/0zR3Q1hH+dhr+F4jw8aE7xVidq+0quiX8p
 pt9xu3Vw6ZYzw62gX0/GeVZN6Q==
X-Google-Smtp-Source: AA0mqf7A+9Y+/cupf5rvkWGOjMd5q85mT6pfyJ/pECPMlLb0usgX8aiIA58duJx5jjs2+gxusuAsNA==
X-Received: by 2002:a5d:4f8a:0:b0:241:7277:6aa4 with SMTP id
 d10-20020a5d4f8a000000b0024172776aa4mr24515055wru.660.1669802677583; 
 Wed, 30 Nov 2022 02:04:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003cff309807esm5474312wmq.23.2022.11.30.02.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:04:37 -0800 (PST)
Message-ID: <15a39311-60ab-7dc1-2fde-a713b9393c21@linaro.org>
Date: Wed, 30 Nov 2022 11:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 2/2] hw/input/ps2.c: Convert TYPE_PS2_{KBD,
 MOUSE}_DEVICE to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
 <20221109170009.3498451-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109170009.3498451-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 9/11/22 18:00, Peter Maydell wrote:
> Convert the child classes TYPE_PS2_KBD_DEVICE and
> TYPE_PS2_MOUSE_DEVICE to the 3-phase reset system.  This allows us to
> stop using the old device_class_set_parent_reset() function.
> 
> We don't need to register an 'exit' phase function for the
> subclasses, because they have no work to do in that phase.  Passing
> NULL to resettable_class_set_parent_phases() will result in the
> parent class method being called for that phase, so we don't need to
> register a function purely to chain to the parent 'exit' phase
> function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/input/ps2.h |  2 +-
>   hw/input/ps2.c         | 31 ++++++++++++++++++++-----------
>   2 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


