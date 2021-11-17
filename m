Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB354546EE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:08:36 +0100 (CET)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKfv-0004v9-DR
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:08:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnKdx-0003K5-OC
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:06:30 -0500
Received: from [2a00:1450:4864:20::330] (port=39803
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnKdv-0000oR-Bw
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:06:29 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4733154wmr.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JsYBZ/hrxd2PpCka0fA30gSmznK0nWVmIhCCA/bVIE0=;
 b=Wf0H2g2MuspNbv+cT5jXi54PvdxKsp8KrPPmEXIIqy2lCeHUKTplDFv4GeZl3vY3iY
 5ex28vmYy9IpNjMZZBDnojyI8Fxai7gJx/oDi1tWHZi0O7rLAzlhhRYkfp4+sjNXzdUV
 x8keY5t7XXY9p26K6kaO/aIJRHcDYvAkQT8w2kWTGUSQ9DAkahbYdBIMm4H5Hw6WoFk8
 zt6s4oRguj9JuwyqVnEzB7ZjmKWc0WkPwk4TUwM8+rV3U/c7zhZfWLji4OHTZr5QFPIe
 gA/CQ6+o/HapDu7zxfGjxZXBfbauC/VANV7jK15V0KQtbRmo9WuST/5Otc7KX1gOiEes
 c99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JsYBZ/hrxd2PpCka0fA30gSmznK0nWVmIhCCA/bVIE0=;
 b=u01K3i4AqddmiXjAuMKJfivbG1I+SOf2qGNiqvkvblfHua7RRfYgTPau+DuJ1h5Z7A
 KgepCUrzyhWYAlqGGOny6p8OCXxfaPSY1go5/TS1xQJfi6+s9ptKAOGAZgzrrukFpbn6
 HS8holGcwKT7P4F5UXT5ruOwHVdvc/0DFuAo1quvpAjeCZ3HBCy4kXa/b8WbhtCa2gzL
 WP98XOFGEMd5dd6dCkql4TrEAKshpjVqxhlQDyafTEy+qrRP8avhjPVevEEbD/n2GByX
 JcEjkPZAKPv/N5VomuJ/HFrS2x8VMe5sAwJctTdwrQQ5BH9yw947CgDJ1HNLf1PfQ2+Q
 O86g==
X-Gm-Message-State: AOAM533EkfjyE2gHH7eabFPSnaDcCnQasgnntMqcS3+dQ2bhHSvIMn9L
 Gm+HocUnV5YSZi1rfy2WicXP3L1eqDzADCTERnc=
X-Google-Smtp-Source: ABdhPJyTiXQSaSKNT8CVwPUvj5kbCJEyKIKDxldNsrXDixSV47Rv2ZtkbV6VbANdZ5d2WbVfVjsAOQ==
X-Received: by 2002:a05:600c:4e51:: with SMTP id
 e17mr18250581wmq.127.1637154385727; 
 Wed, 17 Nov 2021 05:06:25 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id g5sm30677358wri.45.2021.11.17.05.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:06:25 -0800 (PST)
Subject: Re: [PULL 0/6] Misc patches for 6.2-rc2
To: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>
References: <20211117101921.622242-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10ec19c2-9319-aad3-53e9-495476f1d114@linaro.org>
Date: Wed, 17 Nov 2021 14:06:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117101921.622242-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/17/21 11:19 AM, Thomas Huth wrote:
>   Hi Richard!
>   
> The following changes since commit 8d5fcb1990bc64b62c0bc12121fe510940be5664:
> 
>    Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2021-11-17 07:41:08 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-11-17
> 
> for you to fetch changes up to d06f3bf922679d89815fde9eac9264ba44e37954:
> 
>    gitlab-ci/cirrus: Increase timeout to 80 minutes (2021-11-17 10:20:38 +0100)
> 
> ----------------------------------------------------------------
> * Remove some unused #defines in s390x code
> * rSTify some of the development process pages from the Wiki
> * Revert a useless patch in the device-crash-test script
> * Bump timeout of the Cirrus-CI jobs to 80 minutes
> 
> ----------------------------------------------------------------
> Kashyap Chamarthy (3):
>        docs: rSTify the "TrivialPatches" wiki
>        docs: rSTify the "SubmitAPullRequest" wiki
>        docs: rSTify the "SubmitAPatch" wiki
> 
> Thomas Huth (3):
>        target/s390x/cpu.h: Remove unused SIGP_MODE defines
>        Revert "device-crash-test: Ignore errors about a bus not being available"
>        gitlab-ci/cirrus: Increase timeout to 80 minutes
> 
>   .gitlab-ci.d/cirrus.yml                  |   1 +
>   docs/devel/index.rst                     |   3 +
>   docs/devel/submitting-a-patch.rst        | 456 +++++++++++++++++++++++++++++++
>   docs/devel/submitting-a-pull-request.rst |  76 ++++++
>   docs/devel/trivial-patches.rst           |  50 ++++
>   scripts/device-crash-test                |   1 -
>   target/s390x/cpu.h                       |   5 -
>   7 files changed, 586 insertions(+), 6 deletions(-)
>   create mode 100644 docs/devel/submitting-a-patch.rst
>   create mode 100644 docs/devel/submitting-a-pull-request.rst
>   create mode 100644 docs/devel/trivial-patches.rst
> 

Applied, thanks.

r~

