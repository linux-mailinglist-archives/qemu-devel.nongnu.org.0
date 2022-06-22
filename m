Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B26554385
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 09:17:05 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ubo-00021L-0u
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 03:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3uZg-0000yU-36
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:14:53 -0400
Received: from smtpout140.security-mail.net ([85.31.212.145]:35217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3uZc-00051T-Bs
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:14:50 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id E3FC2323810
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 09:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655882086;
 bh=oS6ijpH8sd4x1xXwPNuKhhpCeghWxZOnDNfbS8kjP48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=PZJbeha353cHaLFWkuSNxH5GhbDYOl/GXIC9tSn9I5UUkhkl8eIkbU7+EcaaNG0Nw
 RMvAWCC0dulbF1mrTB6KwR/Kn+wGFWzqHVmJ/fFyjTVQsT5yIfgoS+jgOSHkQgixVG
 XN/GfhTirG3+FkQf9YJbFbAqCY9xVIbSWixJjbIQ=
Received: from fx405 (localhost [127.0.0.1]) by fx405.security-mail.net
 (Postfix) with ESMTP id 2E08032382F; Wed, 22 Jun 2022 09:14:45 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id A1A10323844; Wed, 22 Jun
 2022 09:14:44 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 801C627E04CD; Wed, 22 Jun 2022
 09:14:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 69CDF27E04E7; Wed, 22 Jun 2022 09:14:44 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 PJ6cCA0MGZKO; Wed, 22 Jun 2022 09:14:44 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 5097A27E04CD; Wed, 22 Jun 2022 09:14:44 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <f498.62b2c164.9f9fd.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 69CDF27E04E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655882084;
 bh=Mowz1V/UQVWdBrDSgqjJy4LNcVcc00W81k2VMLcFKH0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=fQA4fYO5uEKxBjrhSBYttEAWUH29YoeTk7uqVV9m5bQTuySllHzjakvjbQi73CQFv
 cjPrPOsHqjxg2uQdWXcyL4WZTbHx7JIodlDAXsPrimVD8R3p7f22X7GwKsQBsQtLj4
 B1MNweB9nVYUeZHMAsoTh+Wwm4iYSCBubpY8rySk=
Date: Wed, 22 Jun 2022 09:14:43 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 05/53] accel/stubs: Add tcg stub for probe_access_flags
Message-ID: <20220622071443.GB28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-6-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.145; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  accel/stubs/tcg-stub.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
> index ea4a0dd2fb..6ce8a34228 100644
> --- a/accel/stubs/tcg-stub.c
> +++ b/accel/stubs/tcg-stub.c
> @@ -21,6 +21,13 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
>  {
>  }
>  
> +int probe_access_flags(CPUArchState *env, target_ulong addr,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool nonfault, void **phost, uintptr_t retaddr)
> +{
> +     g_assert_not_reached();
> +}
> +
>  void *probe_access(CPUArchState *env, target_ulong addr, int size,
>                     MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
>  {
> -- 
> 2.34.1
> 





