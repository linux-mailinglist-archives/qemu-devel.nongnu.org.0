Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA812EA0F1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:36:16 +0100 (CET)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZOZ-0007Tg-82
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZEU-0008KL-V1
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:25:50 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZET-0000Ob-Ab
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:25:50 -0500
Received: by mail-pj1-x1034.google.com with SMTP id j13so567273pjz.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 15:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j9+H48URuLcD6S4ntQCEnlLysJkqbtZlOYGuLEzy+5E=;
 b=fQ3E6Ah9s3vpcxhkCq0jirjZeCScIidNgP4b2ELbHuOUT6md4ik9JE3msP3DUyXdtA
 IwL9V3LovWbESSIKNQFOSd2w9XqQ480YdBkjk89rQKXc+Sl3g8ws6OJ9Uyw0kXPYRoJD
 VXOtgkfRrlCzvw/n24XbvRkkP6u7itA4KaQGoVL8xVX+ZwkMq0TjE2llSAxr4zTe6Vfs
 3DX/vv87GwWHhf+ySSMDjEL8QYLidrfHR3L6RBsZIBv5ipNcgAo1iS+4jVHQKPxOzdS+
 YIGDS5a7/I0u2YA3+8mUNlk68eNR4oERsc2apCr6EkdORGY3FxJYydNZatKaCgQPmhdS
 yH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j9+H48URuLcD6S4ntQCEnlLysJkqbtZlOYGuLEzy+5E=;
 b=LTP26ymqB6Q0gpIVf+LUjcoWSAH6dHXs/MiK+/ISl198PX0zyqcGd9CmEG0xWjtSA3
 ir+5QV3GRMm/KRDNUZaQHZH5148cCFfiNGTc1wzpeBgWka2HXad9mttQymOchrpr0cuI
 n19csfTu7ervMyOepp8ImSizwhovKWChwyI2HGeQa0jZ7EHA37FH24pX1cZTmPx8Qgzr
 wh2L7jsosmpW+SjjsDO4GnSvdpXLQT82k+N8fRY+tjcnvmuLgv6Wx7LvVf2UHrm52sAd
 b7B4Q7zbGigh/JeeAGkXTCVb+aFsKAk6Gc4QiV+4Oc893h982L64WbUwam6vlwVGHulJ
 9wGQ==
X-Gm-Message-State: AOAM531vJ1XCPkFa40vsYZ/sBo6uAsmgnHw2UQScWJhVtAIUzIa5aXPK
 UvTkBOl1foHxoQVCZxiA+qkPew==
X-Google-Smtp-Source: ABdhPJxKZN29ECJP/eAta2iSkbWeQFTbe+gm4DtS+d/KegN+BgpwttG4hTJFbgGao/XPfvgHnbGggw==
X-Received: by 2002:a17:902:7592:b029:dc:3c87:1c63 with SMTP id
 j18-20020a1709027592b02900dc3c871c63mr62910866pll.47.1609802744645; 
 Mon, 04 Jan 2021 15:25:44 -0800 (PST)
Received: from [10.25.18.35] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a23sm415351pju.31.2021.01.04.15.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 15:25:44 -0800 (PST)
Subject: Re: [PATCH v3 03/15] target/mips/mips-defs: Rename CPU_MIPSxx Release
 1 as CPU_MIPSxxR1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3928b6c-7524-2d1b-4e30-9863d81afb63@linaro.org>
Date: Mon, 4 Jan 2021 13:25:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104221154.3127610-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
> 'CPU_MIPS32' and 'CPU_MIPS64' definitions concern CPUs implementing
> the "Release 1" ISA. Rename it with the 'R1' suffix, as the other
> CPU definitions do.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h          |  8 ++++----
>  target/mips/translate_init.c.inc | 14 +++++++-------
>  2 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


