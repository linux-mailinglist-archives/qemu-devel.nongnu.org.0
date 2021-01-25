Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D9302EC1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:16:26 +0100 (CET)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4A9n-0002lw-G8
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4A8G-0002KE-Sr
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:14:49 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4A8F-0000Dy-9R
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:14:48 -0500
Received: by mail-ed1-x534.google.com with SMTP id c2so17153149edr.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 14:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JNDLeX11ZB5He+69HQk25KQkKshgJzaP7X0CmCCsKnU=;
 b=HK27TS2p84N5iE75wtgMmcRQgkPwGvW43fdnyXxbrSV2x8H+QFZgbUidwRV/631enX
 15hcck4+myElYACiEQ1SCnF4I+7e26iRYcsUWxWTKeXJ6ZXZMSzujFr557/IyDpLKID7
 GvJvEEmj/eD8M3iRWh/ECV80wTKl75xVPm62nIri3oWe3gd1EIeMaLvZ0faPc1UAOdsC
 y+HpRakewQHT6UN8gAdH0VMvgeAncwKV27huvcy0mVBSceUtJWdTQXc2BV4MuIUoLgZM
 DrYRpCccTdLz+BSCmCZK5pr2Dz1gZJzYkYr4F67wQHJhGakzgvASqgFTrr/dt5AuDSk3
 /2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JNDLeX11ZB5He+69HQk25KQkKshgJzaP7X0CmCCsKnU=;
 b=ShEeGFB78lrXDUf/snc30Xb/teOhqcSKnm06C+VJyAqPeS1LWAnRNcEbo1saq9GIGQ
 X48Td1dLMFKzFMk31KWx4qBYQAGpdUa6Lvg++uxirGE/8MEr0UbpwP9m7Qm4FSBdNJjD
 zPaX+R5howJLsIro2K09bMTeQEg/NGCFPvI9RyMnGhNPvWl7+avk95X3eQ7K6cXWRCPV
 xPLtz0xjYxyM1QahnVft4hRVt99LNfPw4cRHvG3bw7VWgAZNWwYhv3Rmros3V9qqgqQp
 DyGWeqCVLQ+OVjM6bKIGAnlhpUXMokqhhDjITxd0ouI3MXRtO5vLgP8XL88RVBCdLo5J
 L1bA==
X-Gm-Message-State: AOAM531CmmyrGsrUjVgmkvPGyda3XtuXl0nqthJ8ll2uZRR5Q7QRKwAi
 RDhhi2HrMXubhkhjnFVcYP0=
X-Google-Smtp-Source: ABdhPJyOJLs3/DlcMwSxjIpJexYF4xtjBd36WjIsC+LQuo9MEJpYk2rCsgPRjhcEc+BzFrr8lkj97Q==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr2260909edx.218.1611612885978; 
 Mon, 25 Jan 2021 14:14:45 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id zg7sm8934921ejb.31.2021.01.25.14.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 14:14:45 -0800 (PST)
Subject: Re: [PATCH v7 00/35] Hexagon patch series
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <02e7217d-6376-b93d-842d-197d9e13fc58@amsat.org>
Date: Mon, 25 Jan 2021 23:14:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> This series adds support for the Hexagon processor with Linux user support
> 
> See patch 02/33 Hexagon README for detailed information.
> 
> This series assumes int128_or() is implemented.
> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg06004.html
> 
> The series is also available at https://github.com/quic/qemu on branch
> small_series_v7.
> 
> 
> Once the series is applied, the Hexagon port will pass "make check-tcg".
> The series also includes Hexagon-specific tests in tcg/tests/hexagon.
> 
> The final patch in the series add docker support.  Thanks to Alessandro
> Di Federico <ale@rev.ng> and Brian Cain <bcain@quicinc.com> for making this
> happen.  The default container (debian-hexagon-cross) uses a toolchain built
> by rev.ng.  Alternatively, there is a container that will build the toolchain
> locally (debian-hexagon-cross-build-local).
> 
> Here are the commands to verify the code:
>     mkdir build
>     cd build
>     ../configure --target-list=hexagon-linux-user
>     make
>     make check-tcg

I'm looking at stressing a bit more your work.

Are your Hexagon Linux user-land binaries available on some repository?
Eventually busybox binary (known to work on real hardware) is a good
candidate.

Also I noticed these sample apps:
https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps

These could be nice to have as integration testing:

- appi_fir
  APPI-based module that applies a FIR filter to audio data
- image downscale
  Example showing deeply optimized 2D image downscaling function
- cornerApp
  Example that detects corners in an image, using aDSP FastCV primitives

Any other real-world binary you could share?

Thanks,

Phil.

