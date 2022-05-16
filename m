Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DB528B47
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:56:40 +0200 (CEST)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe1P-0001P2-Kn
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqdtL-0001SC-3H
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:48:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqdtI-0003wn-6Q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:48:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l14so4097796pjk.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Wn40OcoodjXJe4ai0A999LACOTNxlNffZZPU6IZ+N48=;
 b=d5+lqcqCVwsdNsqkuSdV/IWKUGJRS5V7b9p0HEELmU8p9Ha4t9bzWUT89L8kgcn51o
 +AqUCROKFi1Sauee1XXwLVldSaWa1Oj2jjUoqyUtN4ZUPpsO1SkGWyQVvCHrrfEnt7a7
 tpoeKVyVfZhT9fW2EEFITcy8OZNQHezbpKam2W8qr5S9BpjmUId256sg5nTtxbWea0xX
 DUGsY1Q3Z46jdOcAnPcAdN2xmvjaMCQ5St9BNeBRf+VRm+wxppsxyvq9UhvQ2XdxEPcs
 kG7bEpqxMExtEyFdo+b+PERApCACsFX4E8Z1ntyAy0h7wUCxDTgY4uDHez9BDx2q/fGW
 Z1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wn40OcoodjXJe4ai0A999LACOTNxlNffZZPU6IZ+N48=;
 b=X/xbSUMc3CjNPCoJ5geWZX07H2HwQ0HpLXjmHGYt32sQ/8ZtvloA0HYI/way10/euS
 pgGMwYSlwfmn6mRiaWZN8teFyat1KFhjxuDvtsPP8SfguJeazsxdh7OVis9l7h3t0rER
 GPAEuqIyPndTSVphrDdTmklcirrIVfhhMheZS1nkjsOdBiApNdG2Fp2C/q5B1666snZL
 rbDBiYyGSfiwD/OgueCCJ7iUvfKTbNXxZPNxxA5E1TQp8NUiGtB7jSkNLX9g5Ha/xdXv
 IacXEIyqXHmUQhYZibmj/0Mt/gPLyMgbb2WmBQ87gQQZ7Pyf44kTbaSBJtay6YVwTMMj
 WbTg==
X-Gm-Message-State: AOAM530YDzFqyLRJbKZ7z92aS2dVz1/rf+gswwyf+dc9mW06myxalG+2
 Jj0qXi3zxJicgjVb6lOklDHAJw==
X-Google-Smtp-Source: ABdhPJykyuKU+aCX+uhxGhrzE8B8mrJO4wcx1P6nmwuis/5zADniXpXKUZXJ94RyFRl+DkRO2hHsMA==
X-Received: by 2002:a17:902:ab8c:b0:15e:fd9f:3f39 with SMTP id
 f12-20020a170902ab8c00b0015efd9f3f39mr18287872plr.103.1652719694819; 
 Mon, 16 May 2022 09:48:14 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a1709027e4f00b0015eaa9797e8sm7211023pln.172.2022.05.16.09.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 09:48:14 -0700 (PDT)
Message-ID: <dcb2762b-3834-2acf-2df9-26820d378adc@linaro.org>
Date: Mon, 16 May 2022 09:48:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/11] QAPI patches patches for 2022-05-16
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220516073522.3880774-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/16/22 00:35, Markus Armbruster wrote:
> The following changes since commit 10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c:
> 
>    Merge tag 'or1k-pull-request-20220515' of https://github.com/stffrdhrn/qemu into staging (2022-05-15 16:56:27 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-05-16
> 
> for you to fetch changes up to dd8f0f332f34a2466d855d1067386b04ff2eb6d9:
> 
>    qapi/pragma: Tidy up comments (2022-05-16 07:31:26 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2022-05-16

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Andrea Bolognani (7):
>        qapi: Drop stray trailing symbol
>        qapi: Fix comment indentation
>        qapi: Add missing separators between sections
>        qapi: Drop unnecessary empty lines in comments
>        qapi: Drop unnecessary empty lines outside of comments
>        qapi: Drop unnecessary whitespace in comments
>        qapi: Stop using whitespace for alignment in comments
> 
> Markus Armbruster (4):
>        qapi: Fix malformed "Since:" section tags
>        qapi/expr: Enforce feature naming rules again
>        docs/devel/qapi-code-gen: Belatedly document feature naming rules
>        qapi/pragma: Tidy up comments
> 
>   docs/devel/qapi-code-gen.rst |  9 ++--
>   qapi/audio.json              |  1 -
>   qapi/block-core.json         | 97 ++++++++++++++++++++------------------------
>   qapi/block-export.json       |  2 +-
>   qapi/block.json              | 13 +++---
>   qapi/char.json               | 10 ++---
>   qapi/common.json             |  2 -
>   qapi/control.json            | 13 +++---
>   qapi/crypto.json             | 64 +++++++++++++----------------
>   qapi/dump.json               |  4 +-
>   qapi/job.json                |  1 -
>   qapi/machine-target.json     |  1 -
>   qapi/machine.json            | 14 +++----
>   qapi/migration.json          | 19 ++++-----
>   qapi/misc-target.json        | 13 ++----
>   qapi/misc.json               |  8 ++--
>   qapi/pragma.json             |  3 +-
>   qapi/replay.json             |  1 -
>   qapi/run-state.json          | 10 ++---
>   qapi/sockets.json            |  6 +--
>   qapi/ui.json                 | 70 +++++++++++---------------------
>   qga/qapi-schema.json         |  2 +-
>   scripts/qapi/expr.py         |  2 +-
>   23 files changed, 148 insertions(+), 217 deletions(-)
> 


