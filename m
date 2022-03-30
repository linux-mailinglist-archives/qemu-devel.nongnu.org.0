Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A50C4EC651
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:16:13 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZ7M-0007Q0-3u
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:16:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZZ5S-0005x9-Au
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:14:14 -0400
Received: from [2607:f8b0:4864:20::32f] (port=41837
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZZ5Q-00036l-Mo
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:14:13 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so14997733otk.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TUCQc9hyvX3bXBttGNsCKWZ3eWW2OKe4FMXrqE8odyA=;
 b=P9Ak1SK9VRza6WImV4UwO2GOICO+aYUVDvtgz5/NwWnJjQNsQfb0gxEqA4rDJk4qiG
 V7mOSXUOF1rdKnUDMdM8gZO89Czi2Jv093BziWQAAiPTyurSyHW1ZeFxHOllC7ZEirwL
 7ApcN7c0AHogCQEc/Zfkbfz95YKvr6fqfzD/ui9P/8uRV2Fv8BTyS+Hfbi3u6tQCK/W7
 Al++D2dwR+JkynAIZsmmHePLQGjAkfAuv0/gl1N+Bd6iIJxAH5EcX1Wo6zbztV5h0xD4
 aIPKcAiw8h1DcKDURs5VPb0bOR7Jh1ZMk8dn0a8Ki+sBOpFgb0KD5PoU0jjgyEsD3kM2
 r+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TUCQc9hyvX3bXBttGNsCKWZ3eWW2OKe4FMXrqE8odyA=;
 b=O1rLrPPlzE3ctJhYRE51Y+/+5UVv8vHzCHwu51aDuO3BXTtldsq3sXEUvLBs5kq9mD
 AbuFHzv3HtRXlDjufRmjGHBI9b9/1fhkdcmTWZbhlolaUI8NzBvTZf/Seqio+BMFrpeb
 JQrvfxe/1T7mNr4av4eA9dvln+ylt4pnWIqdIwbpqH9EOElAq32YIqarsHzDAcXWw5Rb
 lQK+zz59WJGIX45eoTDsp+I4g7t+dCcVcW+Nago5fy9wXYD51ql33bNEDRgdmrqDxkKH
 65UKpDynuu61dzoRXzBGsbiW0HF/dMZ+94mvWUrCyhA50gWEWHc0/2MQCuPuxI0tUQxr
 AbMg==
X-Gm-Message-State: AOAM531qN1dpUXEyV3V4HQCcFP6qJCagWkURN2EPyxY3y+7YZnhkjoIO
 l/oe4NVlqNmm0+c3LJ++D9m3ig==
X-Google-Smtp-Source: ABdhPJxlq5Df/7PzWyVngB+qs+w4eg3C3OnEXuvaoDrU5j76lPRRlZ/ThZESHHqn5Pdb4GMefP1FuA==
X-Received: by 2002:a05:6830:1bcb:b0:5b2:4b0a:a074 with SMTP id
 v11-20020a0568301bcb00b005b24b0aa074mr3221514ota.32.1648649651608; 
 Wed, 30 Mar 2022 07:14:11 -0700 (PDT)
Received: from [192.168.249.227] (172.189-204-159.bestelclientes.com.mx.
 [189.204.159.172]) by smtp.gmail.com with ESMTPSA id
 u2-20020a056870304200b000ddb1828e3csm9808375oau.19.2022.03.30.07.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 07:14:11 -0700 (PDT)
Message-ID: <3e1d9ef5-f260-eb2a-fd04-2410e87ae8d9@linaro.org>
Date: Wed, 30 Mar 2022 08:14:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] meson.build: Fix dependency of page-vary-common.c
 to config-poison.h
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220330114808.942933-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330114808.942933-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 05:48, Thomas Huth wrote:
> Before compiling page-vary-common.c, we have to make sure that
> config-poison.h has been generated (which is in the "genh" list).
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/948
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

