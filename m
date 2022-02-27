Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD34C5F96
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:52:58 +0100 (CET)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSPR-0003yT-C4
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:52:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSOK-0003Ix-UK
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:51:48 -0500
Received: from [2607:f8b0:4864:20::62a] (port=41669
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSOJ-0006rv-Hr
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:51:48 -0500
Received: by mail-pl1-x62a.google.com with SMTP id z2so9173670plg.8
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZFywRTU/a3eoeGHxkKpc+AAU9udZqNxt+lGxzQsaFno=;
 b=MOWQQN0I0TtcQdpoCJHuE+1XkVde+y+/kPchWolXWFK8hryhkFXrE2cKc31qWRaJ7U
 z1uiQnxEwQR0ISQq4NmssRBGek0gMjrltQ7XA3GdRpPHwZe4r8czERcsDSnh0rrhIoqD
 hjysneL6jeIO6hktolkTSgacnbejL/NBI5K4doKh/iUPNNyO3U21i9vD94WFvmkLYo9V
 bFMVo3zz1LjsZRqCpUf8/0q3EF1vT7d67y9BIZh5OLuZNs21BUo98j6x4laXCkTqZKsA
 QmD7P7cqLweGx1Oxr6ZUi7Tj2CJ7wR5yvOUcdjw4unvj4kdvRB9P5dR8WJRsuXv2e7a/
 iEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFywRTU/a3eoeGHxkKpc+AAU9udZqNxt+lGxzQsaFno=;
 b=Xsqq/RgH35avF/B6g5WltPt0bDhQUwHlrI1T8krB+vsp0d8XrRA6aIb6rP+QStjWAL
 3UcAv1CHGpCgakX/3YwLHBMwnLvKSgeLYsSsWoS+L4YiXW6DQbvEKi4L4V3LbtdTgFSM
 xSi7BH1hjwkA/QmozuiZG5Pwk3ghqp5apPXIyblMkBUaK3aACHXui5e5PIe8RU56vImr
 GSo3zGrJKsx7p1N3rVDn2WNQreLptMrQolAN5eGuT1fUo+ZtsgWdXVWDwxIjb+piRNc+
 5nsfDJq6wxBLQwf2g6LSBKzSi4rs5Qh1xAlr0Zeg7/qQoiiTh8TNe77IjDOf1T3WDTw6
 1bqw==
X-Gm-Message-State: AOAM532bs1cPZRIumcpcD4tO32BPot2DeqstvJE1b3S46n1fnlzNgWAM
 ITXKOtJ/tvkrAStV4Xd1xx4=
X-Google-Smtp-Source: ABdhPJyaVeBHVXMaPrq+F7Y7lUeOLQdvu07tqKTdJ7wz99QQhrfVoUqLO4DIwctknGJudJM+As9Jww==
X-Received: by 2002:a17:902:bf07:b0:150:9b8a:a14f with SMTP id
 bi7-20020a170902bf0700b001509b8aa14fmr12991081plb.127.1646002306242; 
 Sun, 27 Feb 2022 14:51:46 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 l7-20020a056a00140700b004e1c206b99bsm10457192pfu.48.2022.02.27.14.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:51:45 -0800 (PST)
Message-ID: <c2313c36-6977-38a0-05ce-fb2e942b8b74@gmail.com>
Date: Sun, 27 Feb 2022 23:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 7/9] tcg/mips: Support TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227020413.11741-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 03:04, Richard Henderson wrote:
> All 32-bit mips operations sign-extend the output, so we are easily
> able to keep TCG_TYPE_I32 values sign-extended in host registers.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target-sa32.h |  8 ++++++++
>   tcg/mips/tcg-target.c.inc  | 10 ++--------
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

