Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311744AB94
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 11:34:23 +0100 (CET)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkOSL-00082S-Ps
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 05:34:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkOQY-00079e-GZ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 05:32:33 -0500
Received: from [2a00:1450:4864:20::329] (port=40752
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkOQ6-0001ng-VU
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 05:32:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so762206wmb.5
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 02:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YtpNxtZosiP47XTpQHtmQ48gzXDHgH3V1ufFBTSFCWs=;
 b=Vit7qCLn1zsOKEMZNCcoGkiITZXrBSiRCpsJVdTTO+3OFjizLmO8JXx/c4dW7ZsLHT
 jafgnWHAR08DSnLaz1EeOuRzBgYfXNdIvYBg+Dx/gXofEwINffhSTzCI9lwbrSg3HoPD
 fBq9yrhXA13lQZ+w5KiV+Clbv+6aMtM6GitXkIqwp8rCC9DDLAHDgi2XGeMZcjhBsIrU
 Gai2oFWDZ4GzSEXOlVBSxhaF4q/I/KIfCzGaE1wPsIak/G/U5rvcKdh3q265s3PBNFtj
 DM4/+VSkSOdvne5w3qAGvqJ6dj3BpllaMB75YH2hjSZQFamFn6sd+53E01VqTS07jdZG
 cC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YtpNxtZosiP47XTpQHtmQ48gzXDHgH3V1ufFBTSFCWs=;
 b=44EY0ld4NOsu53d5wmzTEjfK0hLLvFaQWMBe7qw3WjJXGGKjbbYxCM+Er61QcuC8D8
 dKh9HGl8usVJZK5HF3DrnE0a1Q/P2zH6fcgk4qzyU++yiRY1s9HGNTAKJuaiyy22n353
 Gejqw4GwzVghz+Bg0cTBZPh2jmsgjPXYO4TDlUpk0Wu7aLYNF5BwlRivMJhmNt57Zft2
 4hQVmjizTETS+gJV5zgEFn+EGBfoMHS0NK/g7sgkf5n5zX4o+uzwK8GnaDE7XZeXvs/n
 bu9SZNdBG7kf/8vOSzyRO9HWDyI+mgi4WpLt//WbU5/hJ0AvgJJ5A+k17yKxOTPTSBYK
 4nsw==
X-Gm-Message-State: AOAM5327hJXZ4qMTdPZWNNIl6oeHBsUuOC+Uu8+WR8JSsMDciZ6bbdWv
 g8fu2r44QOeZAmppzedDX06xvg==
X-Google-Smtp-Source: ABdhPJyEJabtTTp5C1URCjEgJgcRe0gi8ZY0wTPJt2ZthdLJ6lxrJATukrU9uh8UqoxB59RrzMul8w==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr5996546wmb.57.1636453921296; 
 Tue, 09 Nov 2021 02:32:01 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id v7sm19143075wrq.25.2021.11.09.02.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 02:32:00 -0800 (PST)
Subject: Re: [PULL 0/3] Migration 20211109 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211109080247.62559-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb86df58-65ad-4fe5-b5d5-5e53a5bba078@linaro.org>
Date: Tue, 9 Nov 2021 11:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109080247.62559-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 9:02 AM, Juan Quintela wrote:
> The following changes since commit 114f3c8cc427333dbae331dfd2ecae64676b087e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/avocado-20211108' into staging (2021-11-08 18:50:09 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/juanquintela/qemu.git tags/migration-20211109-pull-request
> 
> for you to fetch changes up to 91fe9a8dbd449a2f333aefb82ec8adb1f6424408:
> 
>    Reset the auto-converge counter at every checkpoint. (2021-11-09 08:48:36 +0100)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> This pull request includes:
> - fix sample-pages doc by hyman
> - cleanup colo pages by contiguous blocks by Rao
> - reset auto-converge by checkpoint by Rao.
> 
> Please, apply.
> 
> ----------------------------------------------------------------
> 
> Hyman Huang(黄勇) (1):
>    docs: fix 'sample-pages' option tag
> 
> Rao, Lei (2):
>    Reduce the PVM stop time during Checkpoint
>    Reset the auto-converge counter at every checkpoint.
> 
>   qapi/migration.json |  2 +-
>   migration/ram.h     |  1 +
>   migration/colo.c    |  4 ++++
>   migration/ram.c     | 57 ++++++++++++++++++++++++++++++++++++++++++---
>   4 files changed, 60 insertions(+), 4 deletions(-)

Applied, thanks.

r~


