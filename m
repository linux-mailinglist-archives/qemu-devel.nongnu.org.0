Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23924441AE0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 12:49:09 +0100 (CET)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhVoK-0005nu-8h
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 07:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhVk6-0003Zy-On
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:44:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhVk4-00024y-C0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 07:44:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so8574973wmj.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SWeGR6xU2TyWWP4ySDcHNWGUbnPJsnaq3OHaEczYm9I=;
 b=puBxso7D8ToJ5LX65yrmghJPNxI334S6uUH3ywsLVSs63d2rLo6IRGBU+LhMVYfDvF
 tc+ZYAsArQTlWkm2HGqZ62AgxXyYWy9dInrE3j1UdxNqgJ68WU8gXa+UyXiDU65K7OVt
 BAeL2qXWElNu/uDAvrLhfuC3FILaaBGPSnKafUK7Yviq6uZPkrYLTSbfWRLCkA3WeMq5
 TJi3bfEeVl9Wqq9iYJYhiKFFZ/XxsufbjAS41yz8kDmXiJPSnXbXAF8mKG4Gx5yjnijj
 y3FsMl3kgsjcXAzYxgoAPqlW3QIfOF7KjnhHJbpRziJrV/4n1p6vwFlS4q+lmj6SfSj3
 N4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SWeGR6xU2TyWWP4ySDcHNWGUbnPJsnaq3OHaEczYm9I=;
 b=XNXOBnmGIAq4Lw0EVoE9/sAmtD+ACTcu3s4mEhbpS5N3GWp7o+APfPVuYMWFFQmI06
 OEjRi6c9qSUmBYKDBLyvqWmw4o5bKwl6QbI22UDYjutmf4uDT6hApWWlUyZ4WVngFUqD
 S/efaPZsmO31xv2mQHEa9Y8w4oyZUINkLwMwSyEfLIs4fC8ZzmDz2lyRkTXDQFt04Ps2
 RUJtlDvcZhKQkUGD19I7vxbtme291nUHkqTFWoJX8FA6iVGPc8boxe6tV2aV3Chg+PIS
 7xVJNtojc5CQbldCGDDVVr4OWblZw68/ZeUvPX0HAD7uHMUQN7wgTmhVgOz80Lk1e9D5
 OWHA==
X-Gm-Message-State: AOAM531u5Wnuln4Z8XYs8cxTtzpMHvnGHYtlkBEtPTPywC7HkADKJPLe
 zUkoBzmfdAAq4QCL19/4wGVUer5/wfA=
X-Google-Smtp-Source: ABdhPJw2GRSfo9wxzVQiBC51TnoDlyBGe5eiBn6Yqm2N8vzhrNK4q45Tu9+5aCKaGSRckg5dv4KTAA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr38836831wmq.21.1635767082524; 
 Mon, 01 Nov 2021 04:44:42 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm13991907wmk.23.2021.11.01.04.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 04:44:41 -0700 (PDT)
Message-ID: <68b77c6f-ebf5-4bb5-e004-aad7d40fe686@amsat.org>
Date: Mon, 1 Nov 2021 12:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Agree to maintain nanoMIPS TCG
 frontend
Content-Language: en-US
To: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211027041416.1237433-1-f4bug@amsat.org>
 <20211027041416.1237433-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211027041416.1237433-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: libvir-list@redhat.com, Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 06:14, Philippe Mathieu-Daudé wrote:
> As of this commit, the nanoMIPS toolchains haven't been merged
> in mainstream projects. However MediaTek provides a toolchain:
> https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01
> 
> QEMU deprecation policy schedules code for removal. If we don't
> need / want to remove, we should un-deprecated [*].
> 
> Since I now have spent more time with the ISA, I agree to maintain
> it along with the other MIPS ISA. Therefore remove its deprecation
> notice.
> 
> For historical notes, see commit a60442eb8 ("Deprecate nanoMIPS ISA").
> 
> [*] https://lore.kernel.org/qemu-devel/YVx7YGqUENP83vNF@redhat.com/
> 
> Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
> Cc: Petar Jovanovic <petar.jovanovic@syrmia.com>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: un-deprecate (danpb)
> ---
>  docs/about/deprecated.rst | 23 -----------------------
>  MAINTAINERS               |  6 +-----
>  2 files changed, 1 insertion(+), 28 deletions(-)

I tried to add nanoMIPS testing using the Codescape toolchain
suggested by MediaTek [*], unfortunately QEMU user-mode is not
able to run any nanoMIPS binary. Various pieces are missing.
In particular, mainstream QEMU doesn't implement the p32 ABI,
ELF binaries are handled as o32 and the syscall table doesn't
match anything correct.

I am sorry but I can not proceed further with this patch.

[*]
https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01

