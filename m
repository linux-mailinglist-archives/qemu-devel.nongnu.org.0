Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC466583E03
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 13:48:57 +0200 (CEST)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH20e-0002Pi-86
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 07:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH1sH-0007U4-LO
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:40:23 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH1sF-0003sl-GB
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:40:16 -0400
Received: by mail-pl1-x62d.google.com with SMTP id x7so1569756pll.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TieOy/0LrYNgkfsqPcQvbeTrRaZ9N7yJR5kkelaXIhs=;
 b=b6laLTTmEsaXudYsgGBQleCzTpQt4bVG1RkPtSi6ouTiliDGJ6N23JPiixEr/HhORm
 bjN+YgwqBxbDykw7N3LbLpKQoc38SMBmfs5zlApQz+BybgQOy9aOGBo6rbxe9u7gVW3O
 MrkRlJjIH60/T+ULKGBhZtTTxZ+6Q6i6ZiY/3KjLGGqZb2DLZHbSt0iswTScIXa2K7M8
 c5Ti14vhig/73Gy9XonAlX3hlMfnt9oh3g0PaoEcqpxYQBosTdEDjjLvGdJht50mwq82
 Boagg/wao7UsLn5hAVAP7ly4iIRtpIOxYgK13/zNt/+42+eLVqwZNfUkCy7rWjLuXtdW
 fOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TieOy/0LrYNgkfsqPcQvbeTrRaZ9N7yJR5kkelaXIhs=;
 b=Ai0TAmg9C4LLIh/InCMXWa/VQpyIHkJfvH3G0EuVTOQfHZf4jKoAdP3aFrVIxVQP/P
 +2qhVXm6OroW12db1a9CZdrD/lwjLXMq+KsDGlS5TSwSGOX2OFCu7Opw0SPdACSgZq7z
 eFFlSmDd0VZK158bkRl8poLtuWjOKOp8KZRDkv1Pjup5CUQVncgJ8vkpHkzzasS9X1Qs
 W8WNsXltEMr6PPfR/f3V5eCFZkgh9Eo1Lw06TN6LsMBHHMARJ4TUUp6zmrEsiTyYXe6M
 A1d9Wnusaa3gU6M25TtAJjay1wYG5xCVIe9H14mxDPHYx8Z8a9AyRUGE9d+2Rjc24ULr
 5tig==
X-Gm-Message-State: AJIora/mYQQh/4dQN2SsTh0EqrlXc6oBYVUS51nMh8QfvGFE1N+dLJAh
 QJjufT5P1wPZO8kLzLVk6K31qw==
X-Google-Smtp-Source: AGRyM1uWStNkKNK04+KbxCOh0w31sFUHeJBMUcYygges94dJcmbMTZ+B9K4XWI8haMm/6YOJ6P3fuA==
X-Received: by 2002:a17:902:8a86:b0:16d:324d:8a48 with SMTP id
 p6-20020a1709028a8600b0016d324d8a48mr23423967plo.22.1659008413148; 
 Thu, 28 Jul 2022 04:40:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:2ea1:f0c4:958f:1984?
 ([2602:ae:1549:801:2ea1:f0c4:958f:1984])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170902784900b0015e8d4eb1d7sm1027468pln.33.2022.07.28.04.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 04:40:11 -0700 (PDT)
Message-ID: <eec25ab2-1525-9c25-e5d7-28edd7d3ec37@linaro.org>
Date: Thu, 28 Jul 2022 04:40:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] block: fix parallels block driver
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, stefanha@redhat.com
References: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220727190635.1024863-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/27/22 12:06, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit f6cce6bcb2ef959cdd4da0e368f7c72045f21d6d:
> 
>    Merge tag 'pull-target-arm-20220726' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-26 08:32:01 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-07-27
> 
> for you to fetch changes up to 0c2cb3827e46dc30cd41eeb38f8e318eb665e6a4:
> 
>    iotests/131: Add parallels regression test (2022-07-26 22:05:20 +0300)
> 
> ----------------------------------------------------------------
> Block: fix parallels block driver

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Hanna Reitz (2):
>    block/parallels: Fix buffer-based write call
>    iotests/131: Add parallels regression test
> 
>   block/parallels.c          |  4 ++--
>   tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
>   tests/qemu-iotests/131.out | 13 +++++++++++++
>   3 files changed, 49 insertions(+), 3 deletions(-)
> 


