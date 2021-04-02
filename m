Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0D352EB0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:47:04 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNst-0005Sb-4e
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNqO-0004jN-3D
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:44:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNqM-0004YJ-Dz
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:44:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so6460055pjb.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yKy3LSlgcuNru7Ugg0DieW9AI0h+OgW1PInT/FqHnJI=;
 b=fwZcFYALUcCJLDTf9wCaxVsetaq+LIp5hPu+VZHPUlMCWLm8hONaB0zxuAzI+9cr2Y
 OGLWSIir1O7Az5EEMQK7maWilDtDhLpCO/iVIcwRFMeJ4oEqA/vSEq2QlhJPt51x6J2G
 jQM31HVK9qbmYrX5sP8fDBQH+mEKQsaL6botezyObiTYkQ2hz14+6JrklmR4fyOfii10
 OWbtHrY+IG9vMXq8bZqtmB6dterDl7zqDr+8VhkWgvLUkDqEf2YwUTc1w2RBsTS6Q2Lj
 YNserOoU37RdTIMXP1S3Ddc9xzweHMvedtzdtnNVlRyl2VYmQfBnrYaXUo/4zOAn7HP/
 j5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yKy3LSlgcuNru7Ugg0DieW9AI0h+OgW1PInT/FqHnJI=;
 b=KBPnAV8/9xQzSBT/63rVPyq/ibLJS7lHE9tMk7vq1vm9aG/Z0qMf4e9+L5wF8A5rfK
 v6dAzEusMqVmgTEGSfK5dkMqV6SzHw4ZWVEF1UBoXbvjyWti41bNBuG1EMruKc+zoRHY
 OlOrF6Zcx6eypFyvJu7QmKhKdQijCJZOB656ZgqANTP8FXWUWwaJCsZdKINlpN6JJbJk
 VD+wehQF48ZT8SoEqkRPu1m7L5srGM4yFPcjQbFRQDH5ZxOU/O1vGdvm5jMXQdq/Ep67
 ywHCasBP6u0ysKnJvz7sEa/CbQuGpyTixaB+j54MBqIYp/hO2Gq27c14WKD+LtVBLFbE
 nMOQ==
X-Gm-Message-State: AOAM532aFtkRnMrXldS0JOcn1HT2IOGfR3BEsrDQWqHXAzKrlEB3eIKP
 wm/8JBRAWLwBCASKPUH+Rbu4IA==
X-Google-Smtp-Source: ABdhPJxdCfk/jMPsqFk7ttmsKtD+VIToRi9bu4WiKVfcJ5upbkJi9Vk/hxpaexJ+UPhEsfnC5qnIFw==
X-Received: by 2002:a17:90b:344c:: with SMTP id
 lj12mr15146324pjb.208.1617385464821; 
 Fri, 02 Apr 2021 10:44:24 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id w84sm8850590pfc.142.2021.04.02.10.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:44:24 -0700 (PDT)
Subject: Re: [PATCH v2 05/21] Hexagon (target/hexagon) decide if pred has been
 written at TCG gen time
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-6-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5b2e4db-2bfc-7ad1-9cbf-f63fd83de5a5@linaro.org>
Date: Fri, 2 Apr 2021 10:44:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-6-git-send-email-tsimpson@quicinc.com>
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
> Multiple writes to the same preg are and'ed together.  Rather than
> generating a runtime check, we can determine at TCG generation time
> if the predicate has previously been written in the packet.
> 
> Test added to tests/tcg/hexagon/misc.c
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_funcs.py |  2 +-
>   target/hexagon/genptr.c         | 22 +++++++++++++++-------
>   target/hexagon/translate.c      |  9 +++++++--
>   target/hexagon/translate.h      |  2 ++
>   tests/tcg/hexagon/misc.c        | 19 +++++++++++++++++++
>   5 files changed, 44 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

