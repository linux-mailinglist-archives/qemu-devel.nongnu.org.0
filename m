Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643ED39C506
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 04:23:40 +0200 (CEST)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpLyN-0002cM-G6
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 22:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLxK-0001n4-0E
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 22:22:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLxD-0001gO-3u
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 22:22:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so8439799pjz.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 19:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n+5rtVGtMSoon0Yri20dzis+2zLVd4SJGR9BVhMsug4=;
 b=vGBN1DEcnAhl4Kj7g5nv9glgarXTeUknxqRJhwZR8j/VtE8F5rNClZX9Ivj/o4vTcm
 Il9x0KAxKOe8yYU1WGcIPyJi0p8+OGXn+Zqr2cLK9p50A0Y9IN/9gntxRYOYeuymuOBK
 13lxqsV2J20694txXE95OBoOyBPpzjVlj61XdMhOsfCeZp4c5vNPPGNPthmYgKj+aMxZ
 D+WUE8Wg37D5fqexHxvGsB5XKm30svCFSeXFUvM49Pe28mI+MdsMPHolafouchXzLIyH
 KC/BJmzkMVcUVKUzPFdljo+Dt7oP2DlXN1bqWWV9+HN7F4dHVqwowRY5NMPGkam1Yk1T
 MgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+5rtVGtMSoon0Yri20dzis+2zLVd4SJGR9BVhMsug4=;
 b=s7Q5AwUgUowUbkxdtH7sCEmBLe/y5qd8q+Lce6kabTtKKy8QASVJaTIJ5RbwG1UJUM
 s7VBCAeF1ShZQxXJ1sFaXzTex9MN9y92nkakZs6IArr7lDGITdi6R8iOzOg3+gbnj4EN
 x3rd+Buk7fpMkbEK9swKQe9ErHxgR3XB61OGJZhZ4HUF6ZB3dmde7bibrhmzSkBEZCG2
 eQN/lF2AIe/ofllrBvrC+O+Wg6iHXDHber+V+Pr1Lt6FurYrl/RO8d5LFMfny7/JBWXV
 JqlJd9m9gD51YZE3FqKmqgpk3qeYhzDbHk1uuZs3RW3+krFbNtG1JYHyizp5Dvl6RKQB
 PE8A==
X-Gm-Message-State: AOAM5305jFkEyNG+Mk6QNlUAhbOoo32IgQvcmExDFj5hB/dV+Sz2B3Sq
 LYyMQ2KlfLIFjBU18/sWusP+tQ==
X-Google-Smtp-Source: ABdhPJxeW31AWiomQ9Gd1XBIKMY2ozbp9Kea3dTfEJB9z23Lp933H+pl+hnSlWqCeIwOx6rgjR8z9A==
X-Received: by 2002:a17:902:9a45:b029:101:81d0:c5a3 with SMTP id
 x5-20020a1709029a45b029010181d0c5a3mr7212479plv.52.1622859745641; 
 Fri, 04 Jun 2021 19:22:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a25sm2749939pff.54.2021.06.04.19.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 19:22:25 -0700 (PDT)
Subject: Re: [PATCH v16 52/99] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-53-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dcc5f77-e010-363a-367c-59effb15d4fd@linaro.org>
Date: Fri, 4 Jun 2021 19:22:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-53-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> make it clearer from the name that this is a tcg-only function.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h        | 2 +-
>   target/arm/cpu-sysemu.c         | 2 +-
>   target/arm/tcg/sysemu/tcg-cpu.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

