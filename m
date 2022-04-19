Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B402550797C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:54:50 +0200 (CEST)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngszx-0005GO-HE
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngst0-0006Nq-Os
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:47:38 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngssz-0003AJ-7j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:47:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v12so16640667plv.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WXj1GiuotvGODIZQtf6CcCVOBIEwz+/VP096ywjd/tg=;
 b=eNjW0NuKPT9EHLwwVDCuFj2aiFbDMlTfZU7IiHF0rndSjk1ipETlkwhnt8XoOuHddE
 58mAxgZOxrbH5NSAYUfxToWwSKF6JIFmL8tldopqNSQ+3m3CcayyzHM8NK/4hI+jxdr5
 TXEfnnfJLTtFhiyKZUjxS8sxYSF2jMhudopUQFR+f8vvT/1MyfXCqsYqexo++bqvtatY
 X+Pn4F2wh6a8GvZa6DXbBEynOkgrTewbffEZ/8UFL5e0LeO3HGGNRXXkNW8yUOFxOisz
 krL9qkU/M5gFBzYAIpTeHEJ4PFanlSu1Jnw32f/ONM6e9k5pWBthmqyTgXNrXpPK72cC
 wWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WXj1GiuotvGODIZQtf6CcCVOBIEwz+/VP096ywjd/tg=;
 b=fRj4KlEJ1n17D/qcnl3DgziKg6kbWXeWylWUUwb7hp3OWb/mlVJO2EEyyhTC4I2QzD
 dFa5Ts6rH44gVaqeCGU+j8PMABM9K2+sP4aHppkjo8p+XNl8II5XS7BT6offDSywnELs
 PpB65/Zs5J47jXugwoSwwUM01quPGYgWtJdHLKigyLRD7CQtL2ftbUc2I7W/z/9Sj9PM
 toy14YQwbxkgmw++gf7CUzPuQLOgUcpVQEzCpddjc6rgelLSnesD4VpuyyE5qrpuzwbc
 ++T+ZYP0/QhVJ4wWPgIvcHLmRoN0fVX7ES7PoPx2pHMbgla+M0MaXhFFIZoCpnw9OBCo
 p2nQ==
X-Gm-Message-State: AOAM530jCC/WxDymgQ61m0SzUl+fMp8VNC9T8QyaLrWeNZAaUR2czY0K
 xSQPPI2WFWHWnLYXYdLTBGEkSg==
X-Google-Smtp-Source: ABdhPJwOC8vmN6be4N9x8muZ5N8wdPEv9cjkT9mVGW3e5QtuHm872LnrszDlmyAv6x8StmNR+VrOyg==
X-Received: by 2002:a17:90a:c68c:b0:1d2:86e2:aea with SMTP id
 n12-20020a17090ac68c00b001d286e20aeamr14428898pjt.182.1650394054137; 
 Tue, 19 Apr 2022 11:47:34 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p42-20020a056a0026ea00b0050ab776f6a2sm885575pfw.103.2022.04.19.11.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:47:33 -0700 (PDT)
Message-ID: <27fd8c7b-68c4-eb5e-6c12-8f4a95ced4d8@linaro.org>
Date: Tue, 19 Apr 2022 11:47:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 11/25] tests/docker: do not duplicate rules for
 hexagon-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> The commands for docker-image-debian-hexagon-cross are the same as those
> in debian-toolchain-run, just with a nonstandard path to build-toolchain.sh.
> Reuse the definition by renaming the debian-hexagon-cross.docker.d directory.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-9-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include                 | 26 +++----------------
>   .../build-toolchain.sh                        |  0
>   2 files changed, 4 insertions(+), 22 deletions(-)
>   rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Hopefully we can re-visit a pre-built toolchain soon.


r~

