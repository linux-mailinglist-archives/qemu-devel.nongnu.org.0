Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC44285B8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 06:24:07 +0200 (CEST)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZmr8-0006fZ-Cl
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 00:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mZmoz-0004yt-2v
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:21:55 -0400
Received: from [115.28.160.31] (port=50120 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mZmox-0004Ip-Ev
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:21:52 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 821D260184;
 Mon, 11 Oct 2021 12:21:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1633926107; bh=M2XLLitSmNL5LGO8DawNW6YUyl25Al5U5kEy+A8s0dU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OzrFnMu2PEyIiv4KnAXu6mGg6ZBZdHHyEpH8qALAd49fW5yShLk08A+3h3cb/6s+Y
 qiWOD90i8F0QM3CzUsklx33+svqLGQ1SA/kORY5ZrVjwNli1g71GCZQ3eWmBOCshW/
 uToJAp82CI7d21U2f/IQT54obx9KTMoT8dMNYm0A=
Message-ID: <db959936-3301-1037-b550-8ad022a55559@xen0n.name>
Date: Mon, 11 Oct 2021 12:21:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH 1/8] tcg: Add TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-2-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20211010174401.141339-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/10/11 01:43, Richard Henderson wrote:
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
>  create mode 100644 tcg/aarch64/tcg-target-sa32.h
>  create mode 100644 tcg/arm/tcg-target-sa32.h
>  create mode 100644 tcg/i386/tcg-target-sa32.h
>  create mode 100644 tcg/mips/tcg-target-sa32.h
>  create mode 100644 tcg/ppc/tcg-target-sa32.h
>  create mode 100644 tcg/riscv/tcg-target-sa32.h
>  create mode 100644 tcg/s390x/tcg-target-sa32.h
>  create mode 100644 tcg/sparc/tcg-target-sa32.h
>  create mode 100644 tcg/tci/tcg-target-sa32.h
Reviewed-by: WANG Xuerui <git@xen0n.name>

