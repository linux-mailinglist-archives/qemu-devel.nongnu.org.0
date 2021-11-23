Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15C45993C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 01:43:05 +0100 (CET)
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpJto-0001Zw-G5
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 19:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpJq6-0008W9-2V
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 19:39:14 -0500
Received: from [2a00:1450:4864:20::42b] (port=39921
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpJq4-0001RU-87
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 19:39:13 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d27so35872606wrb.6
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 16:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=41EfO6HDDD9WE46vmX/71Gu419vDBI38UQTI+sJNA3Q=;
 b=GREO11+2MIIYPBouTQS7BcW/hxhKM7imwdfp3ywD4Sg1X6hhiiMZuWUY2vyWfZMSNb
 UypVVzlMwKnr7kzr6JkhJcPiZKAO5W5wBQE1w3bqgsqcLXdtcmTc32A+NvVQsI/qTqbb
 eMoqDnezZKg4BZCL4cqn3hfQvL/no9KBpSHPewf0WYQxjVDbyWSBOUO6wfmC2m7/veEb
 yRJOqMO09iOwSSH+Jg5IzwBtzl+JAdlhIHQOtfeRAWo658kq5rPLIdcagv05LUfUiV+b
 h/lt1+3BrqCjuto2NoelIKL255IFUV4a+GR7Uo1pvHiK9iIw8dVXC2IkqmPNcNh8H3X/
 wE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=41EfO6HDDD9WE46vmX/71Gu419vDBI38UQTI+sJNA3Q=;
 b=X5ktpXaC69pni6jj4ouMBFI46T+nm3VJiz2MTJBxxuJMOZWIgb6X5P4a1aiQ9/HCre
 VdMFn0pLaADb/N6DO4zieylibUhyNLf26dh73dbObHbl4oJLxaEb0Uaf7QeHhlLPCUXk
 FhmhmtDR1qPx1h0mWO2yjuecUykoabmFSzis1iYLbqzbUGCszSQ977mCxS8BqdYK+Zfo
 5fsBefOn3AIJAGlLTSCLL1/faDRjMNYIsPgIS88MPHe9EBTt0CA5NmtU+KenAJSWVAcr
 opPRSCFADp8EveFCFSqKGss9U6JA4CppnUaV/aElDEu10CkHx0iVOeEkFLsl4PDAc0mQ
 +Q5w==
X-Gm-Message-State: AOAM531aX6Z4tmAS06nmfmiT6WPwy+7ZGmRLa887x7N8WyhTMSlM40Vt
 IZjQHBeFtL1/9d9HiBIjDRDuU8re8iSBxUwtkuk=
X-Google-Smtp-Source: ABdhPJyfTbW9cxoVl7vbFEulhPA5hV5oAJonwNkJbU+VMvsaSAWGtFVVpmvHNl+mXkftDkjw7IXPNw==
X-Received: by 2002:adf:e68f:: with SMTP id r15mr1376030wrm.359.1637627950360; 
 Mon, 22 Nov 2021 16:39:10 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id j134sm10876873wmj.3.2021.11.22.16.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 16:39:09 -0800 (PST)
Subject: Re: [PULL 0/6] Documentation updates
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211122144320.29178-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17d3d1fd-68a7-c04e-f59c-a150ff73bb8a@linaro.org>
Date: Tue, 23 Nov 2021 01:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 11/22/21 3:43 PM, Thomas Huth wrote:
>   Hi Richard!
> 
> The following changes since commit c5fbdd60cf1fb52f01bdfe342b6fa65d5343e1b1:
> 
>    Merge tag 'qemu-sparc-20211121' of git://github.com/mcayland/qemu into staging (2021-11-21 14:12:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-11-22
> 
> for you to fetch changes up to c5ba62195427d65a44472901cff3dddffc14b3b3:
> 
>    docs: Render binary names as monospaced text (2021-11-22 15:02:38 +0100)
> 
> ----------------------------------------------------------------
> * Documentation updates
> 
> ----------------------------------------------------------------
> Kashyap Chamarthy (2):
>        docs: Fix botched rST conversion of 'submitting-a-patch.rst'
>        docs: List more commit-message tags in "submitting-a-patch"
> 
> Philippe Mathieu-Daudé (1):
>        docs: Render binary names as monospaced text
> 
> Rao, Lei (2):
>        docs: Drop deprecated 'props' from object-add
>        docs: Use double quotes instead of single quotes for COLO
> 
> Stefan Weil (1):
>        Fix some typos in documentation (found by codespell)
> 
>   docs/COLO-FT.txt                         | 106 ++++++++--------
>   docs/about/removed-features.rst          |   8 +-
>   docs/block-replication.txt               |  52 ++++----
>   docs/devel/build-system.rst              |   6 +-
>   docs/devel/multi-process.rst             |   8 +-
>   docs/devel/qgraph.rst                    |   2 +-
>   docs/devel/stable-process.rst            |   2 +
>   docs/devel/style.rst                     |   2 +
>   docs/devel/submitting-a-patch.rst        | 202 +++++++++++++++++++++++--------
>   docs/devel/submitting-a-pull-request.rst |   9 +-
>   docs/devel/testing.rst                   |   8 +-
>   docs/devel/trivial-patches.rst           |   2 +
>   docs/devel/writing-monitor-commands.rst  |   2 +-
>   docs/hyperv.txt                          |   2 +-
>   docs/image-fuzzer.txt                    |   6 +-
>   docs/system/arm/orangepi.rst             |   2 +-
>   docs/system/authz.rst                    |  26 ++--
>   docs/system/cpu-models-x86.rst.inc       |   2 +-
>   docs/system/devices/nvme.rst             |   2 +-
>   docs/system/gdb.rst                      |   2 +-
>   docs/system/images.rst                   |   2 +-
>   docs/system/ppc/ppce500.rst              |   2 +-
>   docs/system/qemu-block-drivers.rst.inc   |   6 +-
>   docs/system/riscv/shakti-c.rst           |   2 +-
>   docs/system/tls.rst                      |   2 +-
>   docs/throttle.txt                        |   8 +-
>   docs/tools/qemu-img.rst                  |  18 +--
>   docs/tools/qemu-nbd.rst                  |   6 +-
>   docs/tools/qemu-storage-daemon.rst       |   7 +-
>   docs/tools/virtiofsd.rst                 |   4 +-
>   30 files changed, 307 insertions(+), 201 deletions(-)

Applied, thanks.

r~

