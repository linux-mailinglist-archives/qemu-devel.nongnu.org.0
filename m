Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD657145F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:21:48 +0200 (CEST)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBB9P-0007ma-MM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBAeq-00044H-OE
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:50:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBAeo-0001O2-UQ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:50:12 -0400
Received: by mail-pl1-x636.google.com with SMTP id c15so1742285pla.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=Npteieh0SmvtMG7JWdmMzrBPutwm0Meex8R5FS4I6wg=;
 b=wYPkJBUFAhvnKO9O04V6JRsVueuQ0MH+1WdARsZhOqlWZkAPTGfsQhyrOe8cCgoPpP
 axk+c7Nh2FKNAYqzvMqZm9ayTRITL1UPVrUOwUe6Y9sQz8bwvJteN+3sgi50rULsbUug
 OzAKh+KUxFc7h2Wo/uHRR3coIMvVklvCSM28Hnhx5XJCT7uProxoulTZP9GEOCPqtyFJ
 pxJ4ZPBgUagOEA206AC1vVw3hmltZISE8dBwYvEAQVG9SKvXUJ6NKXVeBoXKd2u49Zzq
 +BQnKlvOkRgteWGZL2qXcAQ/Zgq7Aw8DnPw6LMCH4X3PIZiGUTOjqbj95tFt2GKQ9faI
 D4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=Npteieh0SmvtMG7JWdmMzrBPutwm0Meex8R5FS4I6wg=;
 b=L0cRPeT52cOf/9uz+wplwHQPCCAP0NJ0m0VspgEo76dlftC1LvdCfn63c7ohGyqdRs
 FJ8LGV3RsOwWrJgLwanT4ym19ILsw/TImngLLSEhIdmN7NOqOFWXPoXNptdkZ3SZIkUr
 zw+kPp5XsmwR1BfhUZ3vt74nPWiNUQVfN6EuNq8YWXdY7h9Jdo6gxeKbdwCIj2yKRP6q
 bm79v67bQR9JNXNhEOTFCHAZbnH6IAirOCFXiKlcrp4FlkJawT0kj3KRU8AVNlBsM3uK
 E3C0rV5HvvWb6IyEuU1KmCHHOFElNEjEis95NmZ0HKEphnUNFb9TKERXwpkpB1cszdiY
 bA2A==
X-Gm-Message-State: AJIora+qaKgBlUBB3WmA4Tzecpr1mUiC147p2xfINxE1km7QKaU1Ripa
 ZLkCQe2BVo3b7Mb6MBlMM8FE979uoro94BhX
X-Google-Smtp-Source: AGRyM1shLItw/DvU39ohmf99Oa/oyKRYPpbSEb5mrMoVZ7+LF/nKl5JA94I+1puZl6TS2rhnox+urA==
X-Received: by 2002:a17:902:8644:b0:16b:ea77:a6cb with SMTP id
 y4-20020a170902864400b0016bea77a6cbmr23006050plt.59.1657612209301; 
 Tue, 12 Jul 2022 00:50:09 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a170902ea1000b0016c1efb9195sm6112380plg.298.2022.07.12.00.50.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:50:08 -0700 (PDT)
Message-ID: <690fa3f1-fe31-6443-e65c-bbd3550541df@linaro.org>
Date: Tue, 12 Jul 2022 13:20:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/2] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220712062025.197634-1-richard.henderson@linaro.org>
In-Reply-To: <20220712062025.197634-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 7/12/22 11:50, Richard Henderson wrote:
> The following changes since commit 9fed1bca6bc643ce91b6117f4974421aaede4751:
> 
>    Merge tag 'pull-target-arm-20220711' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-11 22:02:09 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220712
> 
> for you to fetch changes up to b0f650f0477ae775e0915e3d60ab5110ad5e9157:
> 
>    accel/tcg: Fix unaligned stores to s390x low-address-protected lowcore (2022-07-12 10:43:33 +0530)
> 
> ----------------------------------------------------------------
> Fix for duplicate tlb check on unaligned access.
> Fix for w^x code gen buffer mapping.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Ilya Leoshkevich (1):
>        accel/tcg: Fix unaligned stores to s390x low-address-protected lowcore
> 
> Shaobo Song (1):
>        tcg: Fix returned type in alloc_code_gen_buffer_splitwx_memfd()
> 
>   accel/tcg/cputlb.c | 8 +++++---
>   tcg/region.c       | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)


