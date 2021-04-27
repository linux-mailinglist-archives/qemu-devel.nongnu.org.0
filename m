Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4529536CA18
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:10:05 +0200 (CEST)
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRDo-0002A6-A5
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRB6-0000hL-UG
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:07:16 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRB4-0004sp-Hv
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:07:16 -0400
Received: by mail-pg1-x535.google.com with SMTP id w10so5397004pgh.5
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3boFMRowZ2b0ST9QKrRswSPlPGq8B0Kqz6A1z7xcLUw=;
 b=BBiuiPCmarHcSwO3292E/l569srBsCiRoWIEWoWIDM8bRZYJWnPqQeAcGsABbQKsSv
 DvigjktFHLMjfXD4FNuwbf/1bTLq7tPsJ7q/L3kTBPLP77xor34RHydiUo7Ov4IBX3Wk
 wKrLeQNXa4Ytr/7Z6D10WWNQIUpsby1ggp5sfqPl8EBCL0kZmB87Y/upDUFqZxT+p0hG
 fffoZe3ZYDwySCblK2GB6lFAOj/Pa+lNkhJ4CJQBDENw6EzkWph26uRIJM8qImPjwtuc
 sMazqdKWBj314zRzeAiPUbAGZ5+szLl+vYe+MTt1I4P3BHSQIw5gymilQCt8/WwF6ipY
 fa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3boFMRowZ2b0ST9QKrRswSPlPGq8B0Kqz6A1z7xcLUw=;
 b=XUm7sgFj9lTTECEpVW1YX2phwaQK1TCPdNuVnVIYfyhLPRrVHeZBpYcwNiUWPdcXC+
 l+QGwVzGTzHu5QTUwFyjaRHG5Ue+hLZZnmPUdiPFPEhdDjH5MaFV3lmhrMTMT9EFsyTf
 o9FmFBJOzuOgmqWjcs3Q5QOae2Urbevw1DJ3aWuG/dQ2ybNCykkUhHscMQYzUfnRSEOi
 ZOUA+ED8NfsvCySoEIcIkF8vg4SGSdMhb/iQkVIMq4n/4wDiu90qErmROnjTnEeCSMiJ
 mMfMSToHrHJmv/kbdiBhWm7Y95535I8WALoPKcRHuyv956pJCVHf2HMt7he3PRKfH+YA
 ntpg==
X-Gm-Message-State: AOAM5315Il6wRToJqsnS2yVX8vYXNCUN75a0oMzH0qhdgxiuR/LbV0/o
 biMhMJIiB2DpRCuum9Zwzzp3cBAa/O2Q+Q==
X-Google-Smtp-Source: ABdhPJwT6E6AEoPKZ9FzEbDKJA1N1wwn7kR84UYmoX0v5hWleSzmyezSjsXelYPS3ymcEFRkphvTVw==
X-Received: by 2002:a63:5004:: with SMTP id e4mr22380258pgb.61.1619543233134; 
 Tue, 27 Apr 2021 10:07:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n25sm2988230pff.154.2021.04.27.10.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:07:12 -0700 (PDT)
Subject: Re: [PATCH 10/13] target/arm: Delete unused typedef
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <699ef103-11e7-7f52-f3bd-a35421480843@linaro.org>
Date: Tue, 27 Apr 2021 10:07:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> The VFPGenFixPointFn typedef is unused; delete it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

