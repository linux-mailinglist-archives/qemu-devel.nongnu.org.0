Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252E453A8C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 21:06:38 +0100 (CET)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4iz-0006Lh-7G
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 15:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn4hi-0005Wt-Pp
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:05:18 -0500
Received: from [2a00:1450:4864:20::435] (port=40914
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn4hT-0008KA-9R
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:05:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id r8so48717wra.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 12:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9FArr6/L/9FanbOEb1SlvihhLJsmqGUPDztX25z3BgY=;
 b=YJAfOPEtrRzOUp3msV6xcVr9M8MGdwmQ+QzI8AeNKLFawjsBQWbcYZ52Dtvg4xw07j
 LjWD2gYa4fCcOW83tJrWnoxerC0fnH21hqZEBaAv7tx43/JkNLFp+hiv7cCWKUumHFFm
 uM611JE0TGhPwTWGIDTlN+jyJ4Wb/DqMHEMIJ7OR+/m+DsY/VnX2GiEJMdhuwyhCQ8Qv
 VS42LuBf/Dm6lX0HhkkXODuY0+n3b+fTnzhXCUEiPh9crSU4VhbXHvN99P3X2vYHXqvA
 YgmrbOYs+3d651iTbKzZ3b7bIpu7l+jSq9KnFlgHlIn4ba8lQYZ+aoQz9vEMd66ruqiE
 zXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9FArr6/L/9FanbOEb1SlvihhLJsmqGUPDztX25z3BgY=;
 b=sh5Iciu/eTJUr+EjmLQmi2nyVW0Vwsip7c9nekZL0AOO71duzqejP2HdJIucdRh/X/
 HwWVWX0X5MimcChTAP5T0GJrjz70xMvdaZd3MIoSEShlQqSJ4Cu0Ou/S6AHHisNz92cx
 siuqwgp10wGb4dDSsLXT4DuhadrP0SioTHjmqfc4RpxuSaC38HaWN/IiTnq/i45sNq4n
 6CCppzPiZ6A2oSq8Ei33pIiSD6XOs3eHSv8UOw9jOIGUlJll59hmQ4vPSn+aQ6JstZBP
 3nEwujPJ/5KMbXJED4/gAypsqyOFJWqaJkdrx3dJ1AtqmIefokDoQiuMfUPmh5sZNCnr
 HyzQ==
X-Gm-Message-State: AOAM531qUCelQZ566J7vxi8iBNeTMWzCqBaFGUoh4oQF5O0N2adcG8xQ
 wkYgi1yjJQCTkmczJCbY7neOm2rKpJtF4tFb9Us=
X-Google-Smtp-Source: ABdhPJxlOwTfwI+G3nebP4FmCNsqBGWnrCTTEbhpz3tAgnWO3g64DlT1iWJKToYaPPSF8naykw+cOg==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr12934718wrp.162.1637093101523; 
 Tue, 16 Nov 2021 12:05:01 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id m2sm3273502wml.15.2021.11.16.12.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:05:01 -0800 (PST)
Subject: Re: [PULL 0/2] NBD patches for 6.2-rc1, 2021-11-16
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20211116165408.751417-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a6ad090-5cad-08cc-4bf2-6ca1de50a5ee@linaro.org>
Date: Tue, 16 Nov 2021 21:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116165408.751417-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 5:54 PM, Eric Blake wrote:
> The following changes since commit 9f0f846465d4c52ce9857787e947dffb64367fae:
> 
>    Merge tag 'machine-core-20211115' of https://github.com/philmd/qemu into staging (2021-11-16 12:50:27 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-11-16
> 
> for you to fetch changes up to 3d212b41e9ccb3f37d04f22c59a960bac099c1d4:
> 
>    nbd/server: Add --selinux-label option (2021-11-16 10:16:38 -0600)
> 
> ----------------------------------------------------------------
> nbd patches for 2021-11-16
> 
> - Rich Jones: Add 'qemu-nbd --selinux-label' option for running Unix
>    socket with appropriate SELinux labeling
> - Eric Blake: Address clang sanitizer warning
> 
> ----------------------------------------------------------------
> Eric Blake (1):
>        nbd/server: Silence clang sanitizer warning
> 
> Richard W.M. Jones (1):
>        nbd/server: Add --selinux-label option
> 
>   meson.build                                       | 10 ++++-
>   nbd/server.c                                      | 13 +++++--
>   qemu-nbd.c                                        | 46 +++++++++++++++++++++++
>   meson_options.txt                                 |  3 ++
>   scripts/meson-buildoptions.sh                     |  3 ++
>   tests/docker/dockerfiles/centos8.docker           |  1 +
>   tests/docker/dockerfiles/fedora-i386-cross.docker |  1 +
>   tests/docker/dockerfiles/fedora.docker            |  1 +
>   tests/docker/dockerfiles/opensuse-leap.docker     |  1 +
>   tests/docker/dockerfiles/ubuntu1804.docker        |  1 +
>   tests/docker/dockerfiles/ubuntu2004.docker        |  1 +
>   11 files changed, 76 insertions(+), 5 deletions(-)

Applied, thanks.


r~

