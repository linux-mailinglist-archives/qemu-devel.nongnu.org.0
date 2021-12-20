Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F60247A426
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 05:52:23 +0100 (CET)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAer-0005u0-1Q
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 23:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzAZz-0008Ew-8f
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:47:19 -0500
Received: from [2607:f8b0:4864:20::52b] (port=38454
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzAZx-0006dP-Df
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:47:18 -0500
Received: by mail-pg1-x52b.google.com with SMTP id y9so8279402pgj.5
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Aa2edXlgZ1e7oQhow9sduSIaEkNmQ2HtX1Xbl3wDWUo=;
 b=vBicS9dLiETGDpgQXPrfQtbPCgx4sqOiPlHeUEOptXI2fIT1KthyVWN5P3opQvapOc
 mfJH0+ItEOfjxcj4VGIYhxaD3nzfKWFPX1Fy2n5tOooa+a/NYLqKQl22d5u0Zh/2QYiq
 ohyxM4DipBdYZ8R+KsQyIMAwDBgK1VFdvSrpwfcyQL4Ic56fCTs7+acX10pUgalJjgt4
 ZmFXG954JztCvfToK0FCpN5hDCcHrfpiOY84rOaG+MhysJWeajObpakFue2OP+f0S3wc
 XpVk/BJB40aBQeMLQ4ibR7qsc9bJnR1/M8i2S2oMFrS+2NMO+uaoYgZa/OhfYkPVHOOS
 Hz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aa2edXlgZ1e7oQhow9sduSIaEkNmQ2HtX1Xbl3wDWUo=;
 b=pqwDw1GXTDOb2cVn1AK203MSuYPbwfuLb8hq6Ej2B4gscGxcZFtxqFTUMZkHXjhMQH
 17x6U7uXOG1QNL3OMyRYdFKrntmSCcFvW/I5EE9fz4leCX1K55mEvxKiyBuEE4bQLty/
 W1CF+XkeHrztn2G4F6zMI9g1kF0WxVO/vX6SXIuCqfXzUyFhHfxoYzn5Kp9DLf2e8I3k
 JVpg3RJAoRNPHRQx/ix/4MxyjxLcGh3huAZ78lYvQV0x+vt+eJcfkxaTE0QPFNvXqop+
 5uYhYIUgq+fM6PwdrbKQfIn4Nm7SXiV6IzyzixrlvV4fMmfdMcCblu1GaTeN7XdQ54bm
 rykQ==
X-Gm-Message-State: AOAM532qjS+2e8sk6hr/o+ZyVmuUcpcdspvr6sio/pNhwp29z63Iwikt
 AtV9O/IBr12BVJpESEm7cCiIU839duGQWw==
X-Google-Smtp-Source: ABdhPJy47za6P8AvO+mwwsKW0inWHThLs8vkViJ3D4jGU9m3y9UHc3tle3ysm6kkDDfivQmM0i6J8Q==
X-Received: by 2002:a05:6a00:1a8d:b0:4ad:df18:8be3 with SMTP id
 e13-20020a056a001a8d00b004addf188be3mr14735125pfv.33.1639975635590; 
 Sun, 19 Dec 2021 20:47:15 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id y4sm17997548pfi.178.2021.12.19.20.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 20:47:15 -0800 (PST)
Subject: Re: [PULL 00/16] Misc patches for 2021-12-20
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211219141711.248066-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1a86715-d1c0-4dab-993c-63b81a6d2de9@linaro.org>
Date: Sun, 19 Dec 2021 20:47:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/19/21 6:16 AM, Paolo Bonzini wrote:
> The following changes since commit 90978e15bc9a23c208b25bf7ea697a5d0925562b:
> 
>    Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2021-12-17 13:15:38 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 5a3a2eb3b1096a52580c1b8c3eb0739714e7d941:
> 
>    hw/i386/vmmouse: Require 'i8042' property to be set (2021-12-18 10:57:37 +0100)
> 
> ----------------------------------------------------------------
> * configure and meson cleanups and fixes
> * remove unnecessary #ifdef
> * SCSI and i386 fixes
> 
> ----------------------------------------------------------------
> Paolo Bonzini (12):
>        configure: make $targetos lowercase, use windows instead of MINGW32
>        configure: move target detection before CPU detection
>        configure: unify two case statements on $cpu
>        configure: unify ppc64 and ppc64le
>        configure: unify x86_64 and x32
>        meson: rename "arch" variable
>        configure, meson: move ARCH to meson.build
>        configure: remove unnecessary symlinks
>        configure: remove DIRS
>        meson: reenable test-fdmon-epoll
>        cpu: remove unnecessary #ifdef CONFIG_TCG
>        meson: add "check" argument to run_command
> 
> Philippe Mathieu-Daudé (4):
>        hw/scsi: Fix scsi_bus_init_named() docstring
>        hw/scsi/megasas: Fails command if SGL buffer overflows
>        tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521
>        hw/i386/vmmouse: Require 'i8042' property to be set
> 
>   configure                       | 253 +++++++++++++++++-----------------------
>   cpu.c                           |   5 -
>   docs/meson.build                |   6 +-
>   hw/i386/vmmouse.c               |   4 +
>   hw/scsi/megasas.c               |   1 +
>   include/exec/cpu-all.h          |   2 -
>   include/hw/scsi/scsi.h          |   2 +-
>   meson.build                     |  39 ++++---
>   pc-bios/meson.build             |   2 +-
>   tests/qtest/fuzz-megasas-test.c |  30 +++++
>   tests/tcg/configure.sh          |   4 +-
>   tests/unit/meson.build          |   2 +-
>   12 files changed, 173 insertions(+), 177 deletions(-)

Applied, thanks.

r~


