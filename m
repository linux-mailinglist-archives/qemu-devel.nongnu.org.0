Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79C651F9E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ai2-0007c8-0t; Tue, 20 Dec 2022 06:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ahu-0007aj-VS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:22:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aht-0005w7-9E
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:22:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id o15so8429043wmr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yfJptWYUP/2JqlEXtBF4QN2AC9/vU72OYf/UML5OCC4=;
 b=gMekManS3oqqD+legi00jplFS82FX7V81QLQya4uf6IefLoeOk1wHmiZg/8kKHP3F6
 IG8MVkNlDzJZ9iAy0TehCv3FmLMJaRESsaOSSZ3h0GPxZbvkHnhboD4IDfNfD5zRFdhY
 8Cfs8If8t3fpdx9SLM2ibPmfgiyRf2mf7e/CcwqpbPm3VA0D8VBd17gxfF9BpFmVABKG
 sdyqGfgXS0zxVC52tPGOz3+8o51bRFG3xolPJE0FQgn5uN/yKpBgqv0KDTgoyy3LzG4q
 BTufoPaZ69NxaOwAqAZ3I44cdloDxek4lAZJK1rMjZ237hVYT5pPW5TqdB6pedUwNGMb
 JPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfJptWYUP/2JqlEXtBF4QN2AC9/vU72OYf/UML5OCC4=;
 b=Ua8Bu1BN6SrEYxu/gz0V+kx+Y10yBz801iqtp6UBvbghecJYcPn41/ylL1IHEvyFgd
 X71akabXvXV5BxzWHXPFa63E1BTbpALOmSHn3lo6IDwrNTGioSfnnA3jSqfUSzxzweqe
 CGzn9DIn1Rz3oU+9LTAlVlODMnpk8EBiyqt2hi1GjXOaLAKkHrjNk7FtQUmDfGS0/jEv
 1M7UCoqbWi6MpOVG2jG/s5CN+cmpJGKKR/eYNKl5nDc6Qc+5hIo36kVq4m1CaPULJa2e
 hoLFhi08ymcv5vpH5FvU858EytgSzb/5B8FUZ9zg9QruBOvL6PVgS6GLro+UzaJSANrT
 nD/A==
X-Gm-Message-State: ANoB5plPBGUhMSRTks/Rtkwq5WRvm7uJcQ1ydH5oWlSxHeqsfM7hUJED
 1y2uV05abcXA86jwaz0TDQA5dg==
X-Google-Smtp-Source: AA0mqf53O6kj2r0/OqSPFxn36vpUJ/PVsjWOIOPAS3cnzqPUSUKosWuflke6pnROJZl9YmdQRQHswA==
X-Received: by 2002:a05:600c:4f93:b0:3cf:6e85:eda7 with SMTP id
 n19-20020a05600c4f9300b003cf6e85eda7mr36930638wmq.14.1671535367270; 
 Tue, 20 Dec 2022 03:22:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z13-20020a5d640d000000b002365730eae8sm12588627wru.55.2022.12.20.03.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:22:46 -0800 (PST)
Message-ID: <cd8d91b0-b639-b7e5-ba62-f9b11fe5567b@linaro.org>
Date: Tue, 20 Dec 2022 12:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 12/18] ui: Move more HMP commands from monitor to ui/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-13-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220090645.2844881-13-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 10:06, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "Graphics".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/monitor/hmp.h |  2 ++
>   monitor/misc.c        | 66 -------------------------------------------
>   ui/ui-hmp-cmds.c      | 66 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 68 insertions(+), 66 deletions(-)

You forgot to move hmp_sendkey() along.


