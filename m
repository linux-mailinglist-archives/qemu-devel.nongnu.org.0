Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671A45763B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:17:20 +0100 (CET)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8Rq-00083V-Lg
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo8Oo-0007Ld-Fz
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:14:10 -0500
Received: from [2a00:1450:4864:20::32e] (port=52940
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo8Om-0000Yo-Ew
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:14:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o29so9298008wms.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 10:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VcO61kZDCSHOYUAry8D3RilMpaXqPBQGfr/mb4z6xsI=;
 b=No3EzMEU19+gEtqJlJUHvlXZR11fzyTgjJEduZxCbMdXOrHzkCvlgbp5JitCE+yt2f
 Ugxyf6N5XraFdmREOdko3R0/Sv3x0zOINt1RpdV3BtzUEwLE075/Pi0xsL6s5tkTETqB
 2gq9+QyTh27xlG5qJu2TjG60r+eHwl4sKPMS3ig3zlyy+mY9Zzely/pC8fxjfH20tyXs
 T/d7nD+eMDolvXI8Fk2sd5ml6SmJeE68Vff1QbMqHCo+6B/vRLJRBihMWptXuIq1sKiD
 3jY4uuKQp0Vot1oNPzATeniFwIvN8xj2lIVNX/MLfBhrrpaYyMij9KWt89DbpT9LYHDE
 iI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VcO61kZDCSHOYUAry8D3RilMpaXqPBQGfr/mb4z6xsI=;
 b=n5lMXvQ1j1+H6dbU+qA4Cjzhf11Clubu0I+vTkmwYgWyTsSycsOZ25FLrHDVMJw8qw
 rJMGx7cN1pYHX364NP+Dwaz8oFUPzSTLvWECqIGRKb38C+1qeYZOFi6Mv6IfKzbMZ4fG
 CHIz+dIdx19/ygw10byzhw+QV3pQYZ2Aa2QMbZTM+ty3wsl+AqA6LFWn0Vf0wM6TMQOj
 oDSo6LsA2kzVob5NnUSgtcfZFwouornw68UdLXUADcdIQQRpf8BpUw+K34ta5kYiwK9K
 4QvZGf/8fpX2d4xmvPRYSht69J0L5baXOgDfzcMkDp58L/bcry9hfFrfcOzevnbYBIKk
 nu+A==
X-Gm-Message-State: AOAM530SUOcCp69oom6Rusnvc9v8httSmSQ9UZe8fwlmh0galQGuf2H7
 GRA223tGzyV2hjqf56AiMZT+aByMvkcq94iHZ20=
X-Google-Smtp-Source: ABdhPJxK4oHyaoJOJwJ9CTVi+EuCHy/FWezVU40vtPptgQgH+126vN4D8XS+QLgEkXco/iZl6tW7JA==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr2090795wmk.40.1637345646822; 
 Fri, 19 Nov 2021 10:14:06 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id g6sm553639wmq.36.2021.11.19.10.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 10:14:06 -0800 (PST)
Subject: Re: [PULL 0/7] Misc bugfixes for 2021-11-19
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211119144539.285740-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a437754-1549-326b-0c63-50dd20c0f0aa@linaro.org>
Date: Fri, 19 Nov 2021 19:14:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
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

On 11/19/21 3:45 PM, Paolo Bonzini wrote:
> The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:
> 
>    Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to fdc6e168181d06391711171b7c409b34f2981ced:
> 
>    chardev/wctable: don't free the instance in wctablet_chr_finalize (2021-11-19 10:24:50 +0100)
> 
> ----------------------------------------------------------------
> Bugfixes for 6.2.
> 
> ----------------------------------------------------------------
> Daniil Tatianin (1):
>        chardev/wctable: don't free the instance in wctablet_chr_finalize
> 
> Mark Cave-Ayland (2):
>        esp: ensure that async_len is reset to 0 during esp_hard_reset()
>        qtest/am53c974-test: add test for reset before transfer
> 
> Paolo Bonzini (1):
>        meson: fix botched compile check conversions
> 
> Philippe Mathieu-Daudé (1):
>        docs: Spell QEMU all caps
> 
> Stefan Weil (1):
>        meson.build: Support ncurses on MacOS and OpenBSD
> 
> nia (1):
>        nvmm: Fix support for stable version
> 
>   chardev/wctablet.c                    |  1 -
>   docs/devel/modules.rst                |  2 +-
>   docs/devel/multi-thread-tcg.rst       |  2 +-
>   docs/devel/style.rst                  |  2 +-
>   docs/devel/ui.rst                     |  4 ++--
>   docs/interop/nbd.txt                  |  6 +++---
>   docs/interop/qcow2.txt                |  8 ++++----
>   docs/multiseat.txt                    |  2 +-
>   docs/system/device-url-syntax.rst.inc |  2 +-
>   docs/system/i386/sgx.rst              | 26 +++++++++++++-------------
>   docs/u2f.txt                          |  2 +-
>   hw/scsi/esp.c                         |  1 +
>   meson.build                           | 33 ++++++++++++++++++++-------------
>   target/i386/nvmm/nvmm-all.c           | 10 ++++++++++
>   tests/qtest/am53c974-test.c           | 30 ++++++++++++++++++++++++++++++
>   ui/curses.c                           |  4 ++++
>   16 files changed, 93 insertions(+), 42 deletions(-)

Applied, thanks.

r~

