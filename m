Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B237C37F591
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:25:59 +0200 (CEST)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8XW-0001Tr-QA
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lh8Kc-00071N-9C
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:12:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lh8Ka-0007cR-R7
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:12:38 -0400
Received: by mail-wr1-x430.google.com with SMTP id x5so26367657wrv.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=URPP3722BLybY/SibxsSINSV9UgV3j6MlqL7cFxJ3AA=;
 b=L19xEwiKzDFYaTeFpRlUdLGTDHZICoEieqgo/JZGGrte1HE1Q32Gnbii1SvPwIdS2s
 Uwyb4w8nJfOyRZRNQXpm+EU1IcfD8egtEDlR/IQI61hQGyLSW3k5LvjUYZiq4p+dB2qG
 v1xUcGjF807kKYQLZAIH9WBYsiGVS9ILlzm1j3cuwIRSLSUln4LGlKycr+nTtcbxkCMz
 H5wtrkKQ8mfs8f1eNPUFt57s7y66FqnCBTRmu06MsHhIPMZZ0MWUTTDMPB48HVNGv8nH
 GK1xVXxYFoBMaTwNcsaYYfgxhXLXFRfP+rajlmZoavq3mOB+zLcHU3s/xJsKtyR+CeHQ
 /Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=URPP3722BLybY/SibxsSINSV9UgV3j6MlqL7cFxJ3AA=;
 b=InZvbUmwMdIO+XBsCqd8dulBZYbsV15CawtlM7Fx/X5OIBJ/IHr/pypVHILFGnRosa
 RRdQozWkkpxqllmbgW3JJ3jGaCac7fLWNypgFLzU/isk7mB7FpOymf01bRcX6upzAkCZ
 FCcBl07PTEu6feZx2WLZclDQz7YSVFU3KE6zmsTAG08LEcBW+JgoRtLS2l99V/ctM0FJ
 GwMgQr1odDZb7j0YHucV1pvt8CaGtHRYpDzj0fR0G7dvbruCMiShfSfpLUL39tKnM/nG
 S/zR8JWoMXZTB4zID2F0ddasZ2XuMHNny7OkUFbNvwEuW1sv9TutLHaSiTdema05kFDQ
 GHrg==
X-Gm-Message-State: AOAM533uAyqHAe88ZPhn7/pC7zXgznre6lISZ2eyL6mLk4m9zwA+HQA+
 9DXn+bCOhhL2I2sukY8XNvs=
X-Google-Smtp-Source: ABdhPJwXKejROjjCOTIAMf4sdXuZ+lsaVAuX5Qsscpn4Id+fgVgNFzgHrlK9KFym2whcpNIuDFkvOw==
X-Received: by 2002:adf:d227:: with SMTP id k7mr52043083wrh.390.1620900755384; 
 Thu, 13 May 2021 03:12:35 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h9sm1882436wmb.35.2021.05.13.03.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:12:34 -0700 (PDT)
Subject: Re: [PATCH v3 09/22] tests/docker: fix mistakes in ubuntu package
 lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210513095519.1213675-1-berrange@redhat.com>
 <20210513095519.1213675-10-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c43d991-fed9-f7c9-2aa8-f9753f8a3eae@amsat.org>
Date: Thu, 13 May 2021 12:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513095519.1213675-10-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 11:55 AM, Daniel P. Berrangé wrote:
> librados-dev is not required by QEMU directly, only librbd-dev.
> 
> glusterfs-common is not directly needed by QEMU.
> 
> QEMU uses ncursesw only on non-Windows hosts.
> 
> The clang package is clang 10.
> 
> flex and bison are not required by QEMU.

I included them to use the same Docker file to build Linux kernel
we test. Not a blocker, this is the QEMU project, and I'd rather
get the vmlinux images prebuilt from elsewhere, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Standardize on nmap ncat implementation to match Fedora/CentOS.
> 
> Remove vim since it is not a build pre-requisite and no other containers
> include it.
> 
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
>  tests/docker/dockerfiles/ubuntu2004.docker | 10 ++--------
>  2 files changed, 2 insertions(+), 11 deletions(-)

