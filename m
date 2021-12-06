Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4846A6A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 21:14:07 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muKNB-0003dh-U4
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 15:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muKLA-0001bg-3E
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 15:12:01 -0500
Received: from [2a00:1450:4864:20::430] (port=36539
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muKKz-000247-HD
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 15:11:59 -0500
Received: by mail-wr1-x430.google.com with SMTP id u17so17491676wrt.3
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 12:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMpmHnCs3iJAZNBehfOhIRS3ARA6xrnmWGoqPrdCQlI=;
 b=cr2iNTpLVmyHfXtkLTgX8iRrvZOzY2F5eUi5fFB4J30MBLwUzF/fnY4qB9TIA5upjg
 k21dkSJ4Tghj6S0IsixzvBP4/Fk+jA/Kg6abDg9GIWXLRXiriiv8ezEqPpAwxDJaNzip
 JLpOKiHClyqBPTeas8e0gjG4TO6UjYY+BmLDHY3XhQE8RC28y9Cl49Xc9XJqGOFA7VIj
 +JtNYX7xzMGMtXNuhRogFTS/ul7BoUm1L1anYGOSnuZvypxs72SfnkbTjKIvewGByaxY
 mAcyhpQHndW9LgBn50Sy/Ffggmlx117bN7osMXZIHoT+H1jqs2FwHbbZOAks4s3sSu4P
 bYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMpmHnCs3iJAZNBehfOhIRS3ARA6xrnmWGoqPrdCQlI=;
 b=6qwJKhw45B9QBP0lkZccB6YDyXCs1MHc++w02RIokngQaKYqOPtfdxRPKVYb+F+seL
 3srNrspaZEMO5vMqb6Dh1n3g2o4tSls+P/f547Vv2op7mkUjsa6/DSCyJ+Dl3xyi1KzR
 9s47q1DDa6yxx9ads0F956TCaIjF/RC1f1CFkDlVcCLNpFHAxz4v0LC7Bs6VasvQq8DI
 4Yi296DFhzPsdlthPuAXHBDjIHMf3s51gQ9YUXfWcBf8T8TxK7Dkp2NR84riB5DXkkmb
 pqGuGO3K3HoLfzwBq03h0gZVGkD3aR2jHI+zIDOzHp2gPQ2CewCQ104Puv0bke+P8L58
 mzWA==
X-Gm-Message-State: AOAM533gQQ9txPnPduE7km2kxrGxjDaqwHErBgodsFNOW7KlxJDgLLN1
 5uHgDPcCL8VLP9tiGUyTDDA=
X-Google-Smtp-Source: ABdhPJzbpu1rT3kd51zCMMo/05lE+PTjDiY8OZV15NZq/MnqmCFIEO70kjsa1rcL75kA2QPMiY46cw==
X-Received: by 2002:a05:6000:252:: with SMTP id
 m18mr45421825wrz.117.1638821500547; 
 Mon, 06 Dec 2021 12:11:40 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n4sm13984563wri.41.2021.12.06.12.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 12:11:39 -0800 (PST)
Message-ID: <77f1322f-a389-a6bc-62f7-23ed02a0bc76@amsat.org>
Date: Mon, 6 Dec 2021 21:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.2 1/1] tcg/arm: Reduce vector alignment requirement
 for NEON
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211206191335.230683-1-richard.henderson@linaro.org>
 <20211206191335.230683-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206191335.230683-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
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
Cc: peter.maydell@linaro.org, elima@redhat.com, alex.bennee@linaro.org,
 rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 20:13, Richard Henderson wrote:
> With arm32, the ABI gives us 8-byte alignment for the stack.
> While it's possible to realign the stack to provide 16-byte alignment,
> it's far easier to simply not encode 16-byte alignment in the
> VLD1 and VST1 instructions that we emit.
> 
> Remove the assertion in temp_allocate_frame, limit natural alignment
> to the provided stack alignment, and add a comment.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210912174925.200132-1-richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                |  8 +++++++-
>  tcg/arm/tcg-target.c.inc | 13 +++++++++----
>  2 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

