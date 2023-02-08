Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0C68EFB9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkUw-0007wa-3k; Wed, 08 Feb 2023 08:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPkUt-0007wE-9d
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:28:27 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPkUq-0004px-3F
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:28:26 -0500
Received: by mail-pf1-x431.google.com with SMTP id 16so3332464pfo.8
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 05:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WCaNMyS5vxSUdfk5de+paXO0xKi2Mht/V0+HY3/fDhk=;
 b=ZtHvLOCajZkvFddY4aooUBW8QABncdxyVbHHW+TPPeR+PPlaAgy7E6DNr+eOJiEEud
 061Xrgrhj2aRigRR5oLlF7MPM3UjCXbR/+QuvSpLleukF1rxwqBiPud7d44SLRe97fDJ
 9js6UJMxWP1s7ZVGhSK9T01MGeMBuE5QVdd4KiebeDWSwQSsw9aPwmrnw92AJSz141Qz
 DPGvkZZFkrzPWBcktD+euG+eDa5a6PhqUloR1N33wa538bKmpT/KDc4pksLf+/xFvDbC
 oh9OgLEE2GwcVXKg9YJa1n69jQ075vAiyU5nW2UqaFQdGee2j9S8sLLya1XP4DauSYEr
 XCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCaNMyS5vxSUdfk5de+paXO0xKi2Mht/V0+HY3/fDhk=;
 b=M0YkuJUm4aNIn/W22xGelywq4HROeSp9kz28UagjwAD3v/3P/aDbg8VkM17ojj4bbq
 qHzNdwK9yH3qfh1mswFnU79JwkJdC63nI+dVe/4f2QulPs+b1nYyuVbB1FaLnQRxqSM0
 p/YVcxyn6/1fHOlgY3tows9gmgBgHGdAfovftKr/iNh2N9KCKPQ6/BR9Rh9sfTZ7VvUV
 S4igw3hMCBYHuQ3eFq8HSflJpiuNFKwIADL0XU0KNSmkoFHjP82PMC8DohPw7bUWRGmM
 7R10HFZ1a6FtK7JT9OReoBlN63UrU3nOBHQ5/vOhKTK7ganzXy+fhVFoZdWXx5r6pv0F
 nV3Q==
X-Gm-Message-State: AO0yUKXntiMsp2dnP0z/aIF5bmuETHpn59rMpSFyIbcbcGPBnUdlmyOv
 CQ9gaFTj2mpK3xDo1YgRn8cxZW/6JhffmwmgUGeHGQ==
X-Google-Smtp-Source: AK7set/YBD04BFNNv7UtJNEREARsjsaO1TulP8sQX+RB89ZGADew5sbbt2K5Z35lpkhtFW+w6rPvdH2IgJCxEZIpEH0=
X-Received: by 2002:aa7:9e5a:0:b0:5a8:482f:c328 with SMTP id
 z26-20020aa79e5a000000b005a8482fc328mr353491pfq.39.1675862902175; Wed, 08 Feb
 2023 05:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20230208064939.226818-1-armbru@redhat.com>
In-Reply-To: <20230208064939.226818-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Feb 2023 13:28:10 +0000
Message-ID: <CAFEAcA_k_egEFULr9U9VYaNvSKbSLeLQeYJuFFLo9Hd3Q7jYSQ@mail.gmail.com>
Subject: Re: [PULL v2 00/19] Header cleanup patches for 2023-02-06
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 8 Feb 2023 at 06:49, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 969d09c3a6186c0a4bc8a41db0c1aba1c76081fc:
>
>   Merge tag 'pull-aspeed-20230207' of https://github.com/legoater/qemu into staging (2023-02-07 20:13:38 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-include-2023-02-06-v2
>
> for you to fetch changes up to a67dfa660b0dd944c8fedfac02806de75b0c08b1:
>
>   Drop duplicate #include (2023-02-08 07:28:05 +0100)
>
> ----------------------------------------------------------------
> Header cleanup patches for 2023-02-06
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

