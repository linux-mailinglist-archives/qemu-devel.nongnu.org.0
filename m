Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A965EE58
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:06:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQs7-0002Xa-1A; Thu, 05 Jan 2023 09:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDQrn-0002WZ-Q9
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:05:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDQrl-0006wa-V5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:05:11 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so2137952pjq.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MlPLEj+wdRna7xuYkGDgUVIJMmAAR0/I+z65slej6q4=;
 b=YuXgB2Ojd+vn6OIu+Q+44x7aA5GprycJ2lsh+FcEr1j3dEq7odywmRu/76bPMQaHSh
 u3Guod8ZTr0Y83uqnQgiEqBV0a5V09M3MwC2b5Rrm3PA9zO1HBWEY6pR8xD2YeW8nzf+
 4ID9gNsGo6P0QpGmf9rRaP5uOgFZVIwHflqzUsnnfSlUvQNaipwSpCELbit1yzgpARGV
 MpkO0kv1050d/3Zb/CyVEPMha/bae2lV8T2T8gAP/C1OePqGdPxp7J/32RixGtidrVxh
 OvrTH1Y6AuGYt3sq/mL6MWK2iHPn9SCQCCZqQ0Jt2sMsFPRkFtc/H7UtNLrNFDHUrVEG
 dxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlPLEj+wdRna7xuYkGDgUVIJMmAAR0/I+z65slej6q4=;
 b=QvSsOLh2jNdA8VC90I8U5llMISphncjCEFY0a8CByPEX3b1p8ptrT/vBWItzK3iBtu
 a2wctLXU3N/Uuzl2INZTRJGjVcmt14AJ5kftoVyLcbfxbk9I8jdz0lKhCr/PclP2jnZq
 n3nSlx/uM+sDOlu1Y05QIpKkAL7zL3s7uhUDhgVpHi8xLVSLFSFQMoIlKW8DIHCQrXFi
 sl/e7tJEc3M30S0QDSRCCSPMq0pjuk+PnwFS15QQZo3++t6yYpk94633EITDnAexhVDE
 pw1Q+O8oZ5T4DIJm51vIN4mR/402jdTlFxu03AtO+oyHsTQzDW3GaSI39SQtOs/gqv1f
 rr2Q==
X-Gm-Message-State: AFqh2kqHVj7aojqUX3ICZxnSwfiOrULj2Fl4I6vLZaiuE2EfW3rx8j1j
 yqe/sLeqOAayM7lm6boyPdGr9Zq5PHlOSXaRH+yjRA==
X-Google-Smtp-Source: AMrXdXvmgk06+jrKqhZ/v/WxCTUdtbeAdaCJDFyx3e243FDNxpHETmpkxrtN0yRryxAX9QhqtBEUv0Z4D1NYntUbHMg=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2357945plp.60.1672927508192; Thu, 05
 Jan 2023 06:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 14:04:56 +0000
Message-ID: <CAFEAcA_5Qb3+YGC+mfJzrkXMrmjyC_BpY7hoS6dONxaU+VA3Rw@mail.gmail.com>
Subject: Re: [PULL 00/47] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Fri, 30 Dec 2022 at 00:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:
>
>   Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221229
>
> for you to fetch changes up to b05e35533782a71a9fda472afd08442f50622a3e:
>
>   tests/tcg/multiarch: add vma-pthread.c (2022-12-29 12:39:45 -0800)
>
> ----------------------------------------------------------------
> Fix race conditions in new user-only vma tracking.
> Add tcg backend paired register allocation.
> Cleanup tcg backend function call abi.
>
> ----------------------------------------------------------------

This seems to consistently fail on the sparc64 boot-serial-test and
prom-env-test qtests on the cross-i386-system job:
https://gitlab.com/qemu-project/qemu/-/jobs/3556359194
https://gitlab.com/qemu-project/qemu/-/jobs/3558798430

A couple of the sparc avocado tests also now timeout and fail
with the INTERRUPTED state:
https://gitlab.com/qemu-project/qemu/-/jobs/3556359335
https://gitlab.com/qemu-project/qemu/-/jobs/3558798558

So it looks like there's a problem for sparc guests here somewhere.

thanks
-- PMM

