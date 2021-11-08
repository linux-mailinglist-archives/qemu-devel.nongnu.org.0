Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35769449B19
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 18:51:04 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk8nO-0002fZ-Tz
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 12:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk8mI-0001mL-Rg
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 12:49:54 -0500
Received: from [2a00:1450:4864:20::431] (port=34352
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk8mG-0003US-Oy
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 12:49:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id d5so28351179wrc.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 09:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8QsUJ4te04xID3c7ZHW+EglvedKp+pbQNiRJOYCdKYY=;
 b=CzKbpxbjSvF+8RYqwVJ3ZBqlXdWO8vR1T7InIe8NQfupsVFHWsY6m/01+O2sKTIUDB
 vOMHtkF2pmUqA5uOuHoCdcYrhwpeA8DGYLMrHUanHdEQspT82cD72lLEoLEtVg0+VWCM
 8BVtpsmJlaSpDuIOZvM2PwrAfSxlly9IO7tE1wpUzkTfW86NH90rDIKKP69U0JZBaSfZ
 dMqmdSLrKVfvqj4Yc+9huea3DLeciJkE8l6aXFq5fsfBYU1bSObyeUn/lf01e28CLu3J
 bfW/X9rGli6A0y2iJjCNQg1rXhCXdY8Bxx4WMonu2X7m359eA7/H3QY3bUZAw1dT/g8w
 e9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8QsUJ4te04xID3c7ZHW+EglvedKp+pbQNiRJOYCdKYY=;
 b=Yq2MZiGGhSS1bMkR08yG/xOwtHgo3MwwUkx+msCFr2Hw2zlfiRebfYEAEZgp9oUZ/Z
 tSiTgog0fZQPBmmBMKeXwFWYpaqiFQOeGlxLzS6tNzcWxUXoUxTw0HzACQCOfIqY92gx
 KrfYev/7yfuEKH8q5IvlvRLft2y5R40xkuZaBsElMYLpoLfCSELtQcx0wo8L951U5wTe
 vZ/wM1NlPseCEwhOXzvJ/ITvEbqOAzieSjHI/tO4M1S/3jfcJeguqHhmDpL/egqVIcs+
 4B6AtlaOwd5tQGCLk0kW2qWmSKAa7yX4++T0TzvWz/Q7ViS3BD+qr8jQ03yhwJrR1dGp
 /Giw==
X-Gm-Message-State: AOAM533TImttlGdXmrbnJpcbgZZABDwoI9plBXD2Yfm7dFgDbWKbP9Hz
 0NH7+F2JUR2Pqfy5kPc3fYWbzqyd7G1zNfXjwSc=
X-Google-Smtp-Source: ABdhPJwTPVubTH5e4A6tWJjl0a1j0MtmzixkidBkjQt6MJ7VoLwbXUAqen8WMTANeEScheMTHLMD+Q==
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr1069133wrq.411.1636393791180; 
 Mon, 08 Nov 2021 09:49:51 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id k27sm22197wms.41.2021.11.08.09.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 09:49:50 -0800 (PST)
Subject: Re: [PULL 00/10] Misc QEMU bugfixes for 6.2 hard freeze
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108143616.660340-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e44efd4-6ba4-9aaa-3e89-6f6833966241@linaro.org>
Date: Mon, 8 Nov 2021 18:49:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 3:36 PM, Paolo Bonzini wrote:
> The following changes since commit 63ed851de474b1e2458cb9b4ba6e02a88f72c25c:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211106-pull-request' into staging (2021-11-06 19:43:42 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 8b4ed0dabae559ebe1fd6f8eb54e1ec6000a0a7a:
> 
>    ui/gtk-egl: Fix build failure when libgbm is not available (2021-11-08 12:20:13 +0100)
> 
> ----------------------------------------------------------------
> * Fix off-by-one in MODE SELECT commands
> * extend --extra-*flags behavior to meson-based tests
> * allow using snappy in static builds
> * i386 TCG fixes
> * fix build failure when libgbm is not available
> 
> ----------------------------------------------------------------
> Mauro Matteo Cascella (1):
>        hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT commands
> 
> Paolo Bonzini (8):
>        target-i386: mmu: use pg_mode instead of HF_LMA_MASK
>        target-i386: mmu: fix handling of noncanonical virtual addresses
>        meson: perform snappy test with the C++ compiler if used
>        docs: adjust for demise of scripts/create_config
>        configure: simplify calls to meson_quote
>        configure: preserve CFLAGS, CXXFLAGS and LDFLAGS in config.status
>        configure: propagate --extra-cflags and --extra-ldflags to meson compile tests
>        configure: ignore preexisting QEMU_*FLAGS envvars
> 
> Philippe Mathieu-Daudé (1):
>        ui/gtk-egl: Fix build failure when libgbm is not available
> 
>   configure                            | 46 ++++++++++++++++++++++--------------
>   docs/devel/build-system.rst          |  9 ++++---
>   hw/scsi/scsi-disk.c                  |  6 +++++
>   meson.build                          |  6 ++++-
>   target/i386/tcg/sysemu/excp_helper.c | 25 +++++++++++---------
>   ui/gtk-egl.c                         |  2 ++
>   6 files changed, 59 insertions(+), 35 deletions(-)

Applied, thanks.

r~


