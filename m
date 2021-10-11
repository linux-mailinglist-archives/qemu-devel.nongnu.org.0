Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD09429959
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:10:52 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3VT-0006aX-Si
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3SQ-0005Bz-FO
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:07:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3SM-00083e-7f
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:07:39 -0400
Received: by mail-wr1-x436.google.com with SMTP id e3so26909605wrc.11
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Tyy+CuLcnc7Z1pev45M2cc4fld5sb0G5OqJFdd5A84=;
 b=LL51qgU0ZRzCh+WXkE1IrZn0cLKDKdFXcwaHFNTavK3pupPasachMsVhfZewg4HqMm
 TMuo7t8calh5xHgqPrrNKsgYsX7eHYwjAyCF2/4HqVgcNgAqYmqu+eIXAWvM4En1JQLW
 gqgdbl1zhMZ9bFSI7baVxOzVhr2C/ph5TLx9vkv/U6ucs/HCtqP5ux35/1+2NpQaSogc
 kXIcFwWYg8IpE8bSLNzInLSurUAqXRzuMpuMYz+tslAzkDArL1IDNhUb7yB4OF/IMYgU
 HpOZ1Y6MVpYfl2STEQMzbFi78D3AeBZAzD40VIT8dhKdtjogOkOMetKYUTPz+9+PS1yY
 AGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Tyy+CuLcnc7Z1pev45M2cc4fld5sb0G5OqJFdd5A84=;
 b=n/u2YGmuoA5goccpFO4ok3VmHFzIsRjY22bolJoRDkNPaqJy8bJlt4MHzvrZQ+JFns
 YWTcS2ezib57/s3jeji3Qd+cznA/r8/kEB/xdPxtWQnNpRI99W+obRHWs/4BblXZV40g
 5lykpdoXjU+9P6q7HHPUWoZiZSwA3+WaMswcIKtw6zaJ6v5QwlMd50i62g5MQaC2ecm1
 Mz1kIA2WTiqXd6fgwRD1MzFCIpnq28WqkgqPbzxCMQbIbQXmAh8Rc2kR6Hp4fArjL1rZ
 Lb+pA6bj+KAfeGfDAMclKQ5TgYc8DU3/PRh33fNp7du0DIWB2G8DpB55ZHaSM9AFt/WA
 AU/w==
X-Gm-Message-State: AOAM530p35MjIdyv6z5i2hY6oAhsPqpg9aRc8zlOaYmFLQIcSxyvQfjl
 bDoHby13b5KIK0sz75N15/8=
X-Google-Smtp-Source: ABdhPJwlwJUJRFU2t1hovxkmH1ipyk6GNoZYL/7LgfpnAJmkw0bZ7+LVQbnYDIzhIEqqdVultqQGag==
X-Received: by 2002:adf:b604:: with SMTP id f4mr28185438wre.111.1633990056945; 
 Mon, 11 Oct 2021 15:07:36 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z79sm668636wmc.17.2021.10.11.15.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:07:36 -0700 (PDT)
Message-ID: <a46d7a56-8f1e-758b-c1f0-eea0221b0b27@amsat.org>
Date: Tue, 12 Oct 2021 00:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/8] tcg: Add TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211010174401.141339-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: git@xen0n.name, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 19:43, Richard Henderson wrote:
> Define as 0 for all tcg hosts.  Put this in a separate header,
> because we'll want this in places that do not ordinarily have
> access to all of tcg/tcg.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-sa32.h | 1 +
>  tcg/arm/tcg-target-sa32.h     | 1 +
>  tcg/i386/tcg-target-sa32.h    | 1 +
>  tcg/mips/tcg-target-sa32.h    | 1 +
>  tcg/ppc/tcg-target-sa32.h     | 1 +
>  tcg/riscv/tcg-target-sa32.h   | 1 +
>  tcg/s390x/tcg-target-sa32.h   | 1 +
>  tcg/sparc/tcg-target-sa32.h   | 1 +
>  tcg/tci/tcg-target-sa32.h     | 1 +
>  9 files changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

