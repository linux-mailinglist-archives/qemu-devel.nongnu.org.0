Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D814560B1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 17:38:39 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnkQn-0003Kk-NO
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 11:38:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnkPr-0002cB-OV
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 11:37:39 -0500
Received: from [2a00:1450:4864:20::42b] (port=46836
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnkPm-0008SQ-BG
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 11:37:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u1so12685553wru.13
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 08:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i114e9uRd1kIShHMcLPbTfzNoyHa9kmAGHdcBM/C1A4=;
 b=NAJBmbg7S/T0URLnZVHp9Wjel+CfqORSJ9Rq9YmU7SQXkBJ9HP8jTzS22/lDhwpuMU
 ArFAJutKHf0DmS1VQzhyzQwZ9nvjrBurvpFNjuzaopYOsDRtgmyp8KyLVLP0TUz/xuqU
 Ju7mAu09MveysyaIFqnSwb9kWqK4jurcJTHKFTZs+pkgCkJCCHz32cqAn/gFz0ZB0V6s
 fHfNXKfhI93X69bd04xTxr0LxEcUtIz50JcH1ZkXlE0iIg/Nf4OoPHy5DOLT5jxa9XsA
 Hp1Jo4oxQRfxHNXvVkZw2Me+7cw0C1T+zYcXFN1bi4rx7a+FrONgci47VbL1s7n6wZ7Y
 dGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i114e9uRd1kIShHMcLPbTfzNoyHa9kmAGHdcBM/C1A4=;
 b=gU+EPmIlyx/DKuX0tUx95llFBMXX5WxXlSn12CVjFSd/3SKB5wBZXj3CPaLd8MfygQ
 Ua8+3l7reGKmQPfdrFgJKGNI0Es2LpAI16xiFhxD9hpx0HSTptACV8Xjn0IHXPtLE1iy
 xU/rrI4zg79vx4pbaMzU0rNq7vefm0yMEAUrvdoeXAnguxFcNUMiXepL/7zSkXBI9+HX
 op8fV3IWOqGhHPlBMDBtKGZSSDLTV+XyRB273+mv3jBtAb5GK/8Al4fCGhrvdixihQQq
 bbaROqCnT31IcL4zJ3rXinZRQ9vFChSysEZLfsa/VFlgN1eYP430zTGlfWMnX7JfB476
 rfpQ==
X-Gm-Message-State: AOAM532+nqYApdYetE6+Ix7dXsBXTTh3WXSItV1vEceyxBUYHXAYy79j
 5stkvHp1mz4neOTNxPWmCMs4cw==
X-Google-Smtp-Source: ABdhPJy0QcEBBWwuvxs+2GNe1FAHH2EKL3Du/NvZWWpji7tTeqjk0jCek1CESgmlhLAJy5ujVcIN9Q==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr32365047wrn.183.1637253452368; 
 Thu, 18 Nov 2021 08:37:32 -0800 (PST)
Received: from [192.168.8.105] (30.red-95-126-207.staticip.rima-tde.net.
 [95.126.207.30])
 by smtp.gmail.com with ESMTPSA id l21sm349990wrb.38.2021.11.18.08.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 08:37:31 -0800 (PST)
Subject: Re: [PULL 0/6 for-6.2] AMD SEV patches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118133532.2029166-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14c735d5-9b36-07f7-08f3-268ae05c3a04@linaro.org>
Date: Thu, 18 Nov 2021 17:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118133532.2029166-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.084,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 2:35 PM, Daniel P. Berrangé wrote:
> The following changes since commit 0055ecca84cb948c935224b4f7ca1ceb26209790:
> 
>    Merge tag 'vfio-fixes-20211117.0' of git://github.com/awilliam/qemu-vfio into staging (2021-11-18 09:39:47 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/berrange/qemu tags/sev-hashes-pull-request
> 
> for you to fetch changes up to 58603ba2680fa35eade630e4b040e96953a11021:
> 
>    target/i386/sev: Replace qemu_map_ram_ptr with address_space_map (2021-11-18 13:28:32 +0000)
> 
> ----------------------------------------------------------------
> Add property for requesting AMD SEV measured kernel launch
> 
>   - The 'sev-guest' object gains a boolean 'kernel-hashes' property
>     which must be enabled to request a measured kernel launch.
> 
> ----------------------------------------------------------------
> 
> Dov Murik (6):
>    qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=on|off option
>    target/i386/sev: Add kernel hashes only if sev-guest.kernel-hashes=on
>    target/i386/sev: Rephrase error message when no hashes table in guest
>      firmware
>    target/i386/sev: Fail when invalid hashes table area detected
>    target/i386/sev: Perform padding calculations at compile-time
>    target/i386/sev: Replace qemu_map_ram_ptr with address_space_map
> 
>   qapi/qom.json     |  7 ++++-
>   qemu-options.hx   |  6 +++-
>   target/i386/sev.c | 79 +++++++++++++++++++++++++++++++++++++++--------
>   3 files changed, 77 insertions(+), 15 deletions(-)

Applied, thanks.


r~


