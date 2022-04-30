Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79751602B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:49:48 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkt6B-0003UU-Ai
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkt59-0002mp-Se
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:48:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkt58-0005t7-BB
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:48:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso13199122pjb.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z5410v2bCn698Db0HA4wPTrHGgEDkNpBQ4SYa3K1HWU=;
 b=TO9sXSf/Hy+fZ1f9d++Kmr5LdZJCp7JfIxHfdUKZUqbNOXKD14JPJ7+p00RlHCwOzI
 yGA+KxZQs3hGPRiMSP7yiuZ/V/4ObKPidQHdZTuZ4sSyPTvfm7CU1pKYMNXTIs5zlnbk
 enU9K6sc3lA0ucnzRIX2y+02psNcKcWDLGY7elu4CKtd2mhdG1okQGYtJtkzb834xyBD
 HaTTJ5OcD1m81gYlkZpEu28vTAk/f/j7XG6E4cN9B46y8wFiW6vB108uHfoy6pN2ku60
 xNE+r0HPbGMXmiMmw+YKJu1T78XfKaIJ8pwqZDTg5wAlQ0TrZhjY4befqAcPiIYMCaNJ
 EQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z5410v2bCn698Db0HA4wPTrHGgEDkNpBQ4SYa3K1HWU=;
 b=cBb424izaA8qVNgoz28ig6BXUaqKZyuOQq7pU58pNHxMJrZDUwof+rPteZJx5a5xe6
 LskyJ8pZ3Kv9rjRcjblV5aqqAaZE7sMBq18ppitKBGIVnsdieXb2NSLUIzXtIksK9jvc
 UeOqEBgLmRCPb9mCYsGrJOp0teEcxUYn0Fdo1XziBz1oz/Mi7XQ90V4JxaOP/Kfn1n+b
 taXlEhb07qP7EctgD+B057RC4vY36FplhYOuYCTpLdN/C2UBeAJnnDBA1xfZ9uHW9AIH
 BXKvLNYlHwe/kDH58zS05SeA2Gb7ZPuhtCcUfPS5TljtNWRzxXGBi9Z9ZwhLm3vI/uMZ
 rlWQ==
X-Gm-Message-State: AOAM532KdD7fJFbry+EtqHMAkOaS9iQKkPIHKWtCusNkZBGs50TBlaUk
 4itrg+hhIrWN5rA9D+u1hlArWUuPXUheSQ==
X-Google-Smtp-Source: ABdhPJyL+Nkk71/3dQCBZ7cCT5gTCubLHbZk5/knBXwHlEJHLZ1LxTpFHlJXHlGpQv3XUD1kekRnyg==
X-Received: by 2002:a17:90a:fd10:b0:1d9:2a41:6fe6 with SMTP id
 cv16-20020a17090afd1000b001d92a416fe6mr10452527pjb.196.1651348120949; 
 Sat, 30 Apr 2022 12:48:40 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa784c2000000b0050dc76281a2sm1866843pfn.124.2022.04.30.12.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:48:40 -0700 (PDT)
Message-ID: <b088de43-0607-6bde-e6cc-089482412946@linaro.org>
Date: Sat, 30 Apr 2022 12:48:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 06/12] configure, meson: move symlinking of ROMs to
 meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> This is useful because pc-bios/meson.build already has a list of all ROM
> files, and thus does not need to use wildcards.  The problems with
> wildcards are mentioned above the definition of the LINKS variable,
> but then the recommendation is disattended.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure              | 15 ---------------
>   pc-bios/meson.build    | 18 +++++++++++++-----
>   tests/Makefile.include |  2 +-
>   3 files changed, 14 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

