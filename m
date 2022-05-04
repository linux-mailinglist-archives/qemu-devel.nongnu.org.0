Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5151A66D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:52:04 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIEM-0006Ka-2T
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6H-0002A5-09
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:41 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI6F-00084X-FL
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:40 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-deb9295679so1735085fac.6
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yHY88eHRrZLnoCKkcXBzZYFzl0VOe0o8bx7BKlrkQ9A=;
 b=muTVIhXIXltzypc37kPbvUu63H5/ckXX+dav4OZj0xX6sFqxmPK6IaV92c2nI5IA8B
 RIcGlQLDZxhdA/zFDPg+CoMc/n4v1BlNny276WpahO7qWnqopdiMfmjV1qa6inFxQBx3
 PrH3nX08WoaSost20rc83srXOlYbhKub13R0V9yqQfCFoET584Ulh0j7uUpEMwgY9nhe
 7KHqqbxJf/bFuS5OxtIEHEM62de+szaBTatHM8OHOFzHIbJTEd1ObRR60VmtndHZ03fV
 vuwxZdx9oDiplHCbNmWzHoRz30MOkFTrrjSjs8ETTMky4KeO62nSEWjhmdLKZPZAR3Xx
 yBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yHY88eHRrZLnoCKkcXBzZYFzl0VOe0o8bx7BKlrkQ9A=;
 b=B8kP5cknckEsMNR5pfn6d+vB0MQmY3RV2lP1lw5BbXjsMnQJaeo0PPuzhSbBM6Exa8
 +bLMFAA6KwJnWO29i8ThrZapezrmU0x6w+6MU9uYzBUT0Ugk/TLV0GnZyIeo7GRyIO3d
 XUsPkMbTPIRtVAkCeIkinCdKceyX/vUCXiyMCxJDeXOILRcaMNTZ51ZHW/FPgJe2an34
 3d3g9aVLIntgnSn5Svn9vHPhJGXYIH4JWHhl1DGQ+9KVe12yVxKVtrByGpdIAg3yPntN
 L2xnijNCzXYX82lu6B1KkuCuqyqdF7VQlAsVel7OzqT9WvIEK/azn3jqwi164cHCMo7i
 O6BQ==
X-Gm-Message-State: AOAM532PTg4rT/k2X+MHLUofMuXwC6hA27Y2QrIKBt1EIev3CdRdOknp
 DbM0wbzcivpU9vkPotpg2n6AlQ==
X-Google-Smtp-Source: ABdhPJxZjSKXjxCtk51+n5yPHh/z64Gq9rMJM7Q6ZzfYTm6KlTPxqEG6+Yc4pZHUeiZK+xJZzdtejQ==
X-Received: by 2002:a05:6870:3388:b0:e2:7175:ec80 with SMTP id
 w8-20020a056870338800b000e27175ec80mr148853oae.285.1651682617431; 
 Wed, 04 May 2022 09:43:37 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a4ad353000000b0035eb4e5a6bfsm6161252oos.21.2022.05.04.09.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:36 -0700 (PDT)
Message-ID: <8fcf6820-b2f4-2b4f-fa54-3b524ca8d6f8@linaro.org>
Date: Wed, 4 May 2022 10:39:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/9] replay: simplify async event processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, crosa@redhat.com,
 f4bug@amsat.org
References: <165165712922.1062896.3966737516733314504.stgit@pasha-ThinkPad-X280>
 <165165715084.1062896.10448117624180064580.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165165715084.1062896.10448117624180064580.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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

On 5/4/22 02:39, Pavel Dovgalyuk wrote:
> This patch joins replay event id and async event id into single byte in the log.
> It makes processing a bit faster and log a bit smaller.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> 
> --
> 
> v2: minor enum fixes (suggested by Richard Henderson)
> ---
>   replay/replay-events.c   |   36 ++++++++++++++----------------------
>   replay/replay-internal.h |   31 ++++++++++++++-----------------
>   replay/replay-snapshot.c |    1 -
>   replay/replay.c          |    5 +++--
>   4 files changed, 31 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

