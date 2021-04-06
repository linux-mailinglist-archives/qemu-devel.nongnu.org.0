Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D535E355CBA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:10:05 +0200 (CEST)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTs1U-0001Z9-DG
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTs0f-0000hL-Ff
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:09:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTs0d-0001we-OR
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:09:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so24380pjg.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGeeARD7F0Yk38zqbesLS+UACqWKklQ8JjPb8H5AKmc=;
 b=S8MESJkGaHH9NoqWtJ05IW68/5IYviTQMsqhI/RCzu8VR9mEMclXR7gg20DJJ9CE7T
 hQbSeZg3luFI6XVAPjMFJGxgG0tl06cb0lL2+nTXuE6eGp9e8jpcojziXLxUbtdpGdvq
 XIYnG1uq3cCT0OWhAWOi4bPWgwws4B95MVIUGa9fiZsXQ0sOQrsg9vU4sg9M2hxtnlK/
 rXCUUikLRgnV2FQSEO/sLaD69BZJ976RfgpUMrZV0Tl9hFTbUGB9QWCrqPZgObnE7cFv
 xkJFLjlottE5S7r1ava+991vNbVoHrIZRJskcxHXRwjpMoeURIkmkKcrBw0xbyNz/jMB
 rpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGeeARD7F0Yk38zqbesLS+UACqWKklQ8JjPb8H5AKmc=;
 b=a5A0wPPcDN8faJrVBsxCM6SFx/oo/DrmtvNtsqx4eb7YYqms4vHifLfNPmqCfv3B0b
 XASBkPkwVPRbxepnKdAb1vaBg6UIE+9NZScLM8zvZDqmA8r4eBfmlzTZKPYFymba70rg
 QPvj3J4nxIo5xxYhZQb2KHxfXQho/+1y2KEZ6siEVT0F+zt86P51uJ+sWG5EazQjiNjn
 4bbgof7g4wi+SGyRgO7sUxJfHlFtZ2TSUsLSmhu1LBP42Pampi14xvWud3X0zQ9ACjo4
 +w87CMGY3TNT8jDAScfDljvofdWe63d8QhNTYk9LSlxcTd5RdFRJV0tSeKKKu3jzz/Hc
 FzhA==
X-Gm-Message-State: AOAM532N2FNWnugQow5hvdpwHW9ZtKvpolWk5yCPGMz67HZIk0WLMBCE
 w4KrQ3igsDKWeb7OL/ieVNX/Rg==
X-Google-Smtp-Source: ABdhPJy8ThQzfVoqKJKpG+7I6mYh+haI0naHalQTbLIJeftndek7efkUZ5VqbTmG+YRw191gsG2lDw==
X-Received: by 2002:a17:90a:aa11:: with SMTP id
 k17mr5644619pjq.60.1617739750032; 
 Tue, 06 Apr 2021 13:09:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v2sm3066122pjg.34.2021.04.06.13.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 13:09:09 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] Hexagon (target/hexagon) use softfloat for
 float-to-int conversions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-12-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecfae8b0-e3b2-89b7-a433-73d2d73f4166@linaro.org>
Date: Tue, 6 Apr 2021 13:09:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-12-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Use the proper return for helpers that convert to unsigned
> Remove target/hexagon/conv_emu.[ch]
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/conv_emu.c   | 177 --------------------------------------------
>   target/hexagon/conv_emu.h   |  31 --------
>   target/hexagon/fma_emu.c    |   1 -
>   target/hexagon/helper.h     |  16 ++--
>   target/hexagon/meson.build  |   1 -
>   target/hexagon/op_helper.c  | 169 ++++++++++++++++++++++++++++++++----------
>   tests/tcg/hexagon/fpstuff.c | 145 ++++++++++++++++++++++++++++++++++++
>   7 files changed, 281 insertions(+), 259 deletions(-)
>   delete mode 100644 target/hexagon/conv_emu.c
>   delete mode 100644 target/hexagon/conv_emu.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

