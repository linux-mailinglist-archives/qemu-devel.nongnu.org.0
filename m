Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611E61DC4F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMjt-00056P-VX; Sat, 05 Nov 2022 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMjs-00055v-Dc
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:13:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMjq-0006yL-S5
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:13:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id h9so10941655wrt.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H3ZocKBi62wDR2FanTbw/KCjrX2wd5uFkEFy40VIG5M=;
 b=jTdFBZqxFAW/OVnu2rCNfQ9WXZoM8Bq3AGqQjjmKVfgLnXr66yeh747hNnuWP8Vapu
 bRe23CwwpHP3MPDZXESzh2Ov55VKzOtAiWjEKst94+St54AZijoMFQPlMCCEIm7ZFwDl
 2Camj49VvvC2XosxayQPPGYqHL/65X5NLjyH8vXqRNIibMAKc9PxHWM5nAzdQrseOrEq
 pR+s7J0r755BHh9JLrq3lZxdTd4IXo6gtMKaHgFzYVFAn1gEDQPKTbVSoTmEKfPLpafI
 xPw185XiXXNd89HKFDro65DuwlSHhLrHmc4edVP+z0crbbZOBhQOyJGm5DTtE235k5Fe
 LrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H3ZocKBi62wDR2FanTbw/KCjrX2wd5uFkEFy40VIG5M=;
 b=gcVz21M29foTJq+qOHr3APYoV9ICHNm0KP7BIZAfSIbGoojwibk/uCRB82sqjG8N8e
 w/K+kAZimG732TF9oAqxCWfaRuN9Aku0ZgPSW2rwPq22J8P7uBLZ99KR2uyWNzefXkmd
 TyqRTh0ALFngREFxjD2naoufJDk4qNV837CPsDL/Q4DqYUTQwl6ASlDx2ePd3ugUusew
 mB5ztt21QRPJOjIGuH3MvsXaiMn308VZET28RT21T+wHJRGLhpt3nw7lGklVUtvemDXq
 38+qh9SWE53bEkGFd/OBsr595eFJ9cm/AxvJoxv18P4zgsnh+12KwTeZOFNQnJ2LtfgN
 i4jw==
X-Gm-Message-State: ACrzQf22Fan+T3qgFlPXWORKXa4nCXWFH2ZBVraRnghjgJzgkmKvCzXo
 ++TbI9bTfOGosBpLN08ufzBxxg==
X-Google-Smtp-Source: AMsMyM5T+3tygoyUtcicb6zY5Ln1oiiV+xeu/zYzHjnY6xvkChBkTeG7hZdI9D/jIx/a6EnfGcNnsg==
X-Received: by 2002:a05:6000:1f16:b0:238:3fc8:1f11 with SMTP id
 bv22-20020a0560001f1600b002383fc81f11mr9406911wrb.9.1667668425254; 
 Sat, 05 Nov 2022 10:13:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6104000000b002368f6b56desm3095476wrt.18.2022.11.05.10.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 10:13:44 -0700 (PDT)
Message-ID: <4d55c6b0-befe-02a7-2c13-7bfe71bc22ca@linaro.org>
Date: Sat, 5 Nov 2022 18:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 29/30] qapi qga: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Konstantin Kostiuk <kkostiuk@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-30-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104160712.3005652-30-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:07, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qga/qapi-schema.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Konstantin Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qga/commands-posix.c   | 32 ++++++++------------------------
>   qga/commands-win32.c   | 40 +++++++---------------------------------
>   qga/commands.c         | 11 ++++-------
>   scripts/qapi/schema.py |  3 +--
>   4 files changed, 20 insertions(+), 66 deletions(-)

> -int64_t qmp_guest_file_open(const char *path, bool has_mode, const char *mode,
> +int64_t qmp_guest_file_open(const char *path, const char *mode,
>                               Error **errp)
>   {
>       FILE *fh;
>       Error *local_err = NULL;
>       int64_t handle;
>   
> -    if (!has_mode) {
> +    if (!mode) {
>           mode = "r";
>       }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


