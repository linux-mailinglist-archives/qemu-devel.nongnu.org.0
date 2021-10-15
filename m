Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7F42FBF3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:24:06 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSoH-00058O-Qr
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbSYx-0001sg-N4
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:08:15 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbSYu-0002M0-SI
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:08:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id c4so2363425pgv.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jF6zukw5JXL+Hu0pmNDKaDkjlDE8cJ4VyAbu6INmlS8=;
 b=UaphomJHUuHh93fJwtp1vnf3VpVvoDOmiTEcjL+fEDyxP+FXeQ37ih1zWBWk/6PADP
 TVNXGtsToSyIpBtrAZgAxXBk/Y7ZfrJRtdTTdvGJOAnrMqwTiBOw8vjwRkllavw/vad0
 LRT4k6Ux42QLA/lZ1l+rXSiltzaA31sRirh/RrPUywO2UrF5haZCUkeFifbYFIQdHDp9
 LI6STGE349abm0yJLsg2ucxYW01LMl44ngjrmTBvMNB8mnhxPkxqoaVZI8FUrxPXgzt/
 sUBRmiZBSku4l145TzQsvNSNVNDzD4wv5n/IiiDnsCdzXpScrwDXdRjxjHHyyt680JGL
 ZG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jF6zukw5JXL+Hu0pmNDKaDkjlDE8cJ4VyAbu6INmlS8=;
 b=IY2hMmiHiU5FSfH91Xhjs//PPxInXFEQ3mNdr3KLrS1PKirc3eGHxfefFJeLhxYYiR
 GAYf7eBNyEa2PRBI1URcC6ZDFKmv3AM2bmBNAFSadRafb/u7r2htfj2lOp69lGTitCS/
 E0+B8EPUJhVAChmmTIXLS3lA9QJmSGyZz/JXsG/Y46LYVp+/NJ6z2PMKdRHVscjNcBaZ
 NFZCjdoB7zWCAvX3KTJsgkJpPYTdMzh/pgsxAXJUuQ+2j9TXtmYaipQseoU5iujqT0wE
 /rYMDCURheblA+uHhHepqClorpklPvnu5RAjR/sRyyRIUH0Kj7kz02mLobJ3AwuMQI0G
 0lVw==
X-Gm-Message-State: AOAM531gMOtNueN7zvUSgLLnVzeZl3XsIOJo8L9FLBbGJ2EOnuWEXznX
 K2lOYxdqz3B+P73edDbB2t27Ig==
X-Google-Smtp-Source: ABdhPJzVRA+xPNIiYz2+stycKyJevAO+tfXln+XM5B99Z4kJnZWrHr3+g+F4tcneIMih75iEwo2cxQ==
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr13464238pfc.53.1634324890910; 
 Fri, 15 Oct 2021 12:08:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y22sm11885957pjj.33.2021.10.15.12.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 12:08:10 -0700 (PDT)
Subject: Re: [PULL 0/6] s390x patches and dtc update
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211015091622.1302433-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a7ba8ed-d9ed-0115-7a60-10b90d392f1f@linaro.org>
Date: Fri, 15 Oct 2021 12:08:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015091622.1302433-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 2:16 AM, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit bfd9a76f9c143d450ab5545dedfa74364b39fc56:
> 
>    Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-121021-2' into staging (2021-10-12 06:16:25 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-10-15
> 
> for you to fetch changes up to 962fde57b7d573281619cb2b7068d570470ef833:
> 
>    dtc: Update to version 1.6.1 (2021-10-14 08:08:11 +0200)
> 
> ----------------------------------------------------------------
> * Check kernel command line size on s390x
> * Simplification of one of the SIGP instructions on s390x
> * Cornelia stepping down as maintainer in some subsystems
> * Update the dtc submodule to a proper release version
> 
> ----------------------------------------------------------------
> Cornelia Huck (3):
>        vfio-ccw: step down as maintainer
>        s390x/kvm: step down as maintainer
>        s390x virtio-ccw machine: step down as maintainer
> 
> Eric Farman (1):
>        s390x: sigp: Force Set Architecture to return Invalid Parameter
> 
> Marc Hartmayer (1):
>        s390x/ipl: check kernel command line size
> 
> Thomas Huth (1):
>        dtc: Update to version 1.6.1
> 
>   MAINTAINERS         |  6 ------
>   dtc                 |  2 +-
>   hw/s390x/ipl.c      | 12 +++++++++++-
>   target/s390x/sigp.c | 18 +-----------------
>   4 files changed, 13 insertions(+), 25 deletions(-)

Applied, thanks.

r~


