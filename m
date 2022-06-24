Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595C5595FD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:06:21 +0200 (CEST)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fGe-0005EV-Ba
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4epa-0005B6-99
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:38:22 -0400
Received: from smtpout30.security-mail.net ([85.31.212.36]:15100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4epX-00071P-Ju
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:38:21 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id 6AC0624BD1E6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656059897;
 bh=yb73KlYeFx1/F9HY0nIGWidWEev6s86tmzPjkhz8gok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Zhwlt+5+h4iAdzXebcOaaVl0i0tdBkhQr+p+kU+YWdXBX917t5bpzQW/YVEEV1lP4
 Uhdiku2gBvLVx+ZP2EgBSzBkNuzDV0fvDCVhQFhMgBH79jhghVoASrpi08js9nTfKf
 EWtPLTDGXYgXRuwpotFr51cmjBiVQbSk12EPfXMc=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id 2F21E24BD19E; Fri, 24 Jun 2022 10:37:27 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx301.security-mail.net (Postfix) with ESMTPS id 9F84F24BD18E; Fri, 24 Jun
 2022 10:37:26 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 8F3BD27E04FD; Fri, 24 Jun 2022
 10:37:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 78BC827E04FB; Fri, 24 Jun 2022 10:37:25 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 rZpw2uH0RcpI; Fri, 24 Jun 2022 10:37:25 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 5F3D627E04F8; Fri, 24 Jun 2022 10:37:25 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <c91.62b577c6.4e508.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 78BC827E04FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656059845;
 bh=Ugj+uXdJsU+PFGhH6wJNSDFl8chbLiNxbBZS61dCiMs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=T1Sti9tlTzG7gTudK3YWcTTwDZmOs9tHsCTPPAZrdoggp2kuw4P60OLJVgbpY01ZH
 ufjOQ0lz3Gu8YxfCDK9O5kwOme/RXjO0zuoWmlG/uuT/Cy0huKyxSninIWQyRnfo0y
 f6nlOXEXFP6obkdqRhhQ0EHYA6TZqrzPyrd+BF6Y=
Date: Fri, 24 Jun 2022 10:37:24 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 40/53] gdbstub: Adjust gdb_syscall_complete_cb
 declaration
Message-ID: <20220624083724.GH25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-41-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-41-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.36; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Change 'ret' to uint64_t.  This resolves a FIXME in the
> m68k and nios2 semihosting that we've lost data.
> Change 'err' to int.  There is nothing target-specific
> about the width of the errno value.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gdbstub.h        |  3 +--
>  gdbstub.c                     |  7 ++++---
>  semihosting/arm-compat-semi.c | 12 +++++-------
>  semihosting/console.c         |  7 +++----
>  semihosting/syscalls.c        |  2 +-
>  target/m68k/m68k-semi.c       | 10 +++-------
>  target/nios2/nios2-semi.c     |  8 +++-----
>  7 files changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index b588c306cc..f667014888 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h

[...]

> -static void semihosting_cb(CPUState *cs, target_ulong ret, target_ulong err)
> +static void semihosting_cb(CPUState *cs, uint64_t ret, int err)
>  {
> -    if (ret == (target_ulong) -1) {
> -        qemu_log("%s: gdb console output failed ("TARGET_FMT_ld")",
> -                 __func__, err);
> +    if (err) {
> +        qemu_log("%s: gdb console output failed (%d)", __func__, err);

While you're at it, this qemu_log() call probably lacks a '\n'.


Reviewed-by: Luc Michel <lmichel@kalray.eu>


>      }
>  }





