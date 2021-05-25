Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04A390424
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:38:05 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYC4-0005GD-IV
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llY7U-0004ut-9h
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:33:21 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llY7Q-0002XI-Kj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:33:20 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s6so36433162edu.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYy9YKfsUlPyS4UsgRXgoLwbQO5UGtNoTeKHL1o76Qc=;
 b=ci/opAAxnRuiN2y7RC/SIWILviO255abHFlFhucm+5OVu+yb0zoSOts0zJ28ugPMrv
 a6c1Bz2bTFA3R5ZytCa1SdfyC/PwuFYgVBhElh++2hLhNrVNCmtsDMLhmQvqnqUd/SGB
 qpnBqAejebUP2DIIEBpuyL0AIC/RKuJAFi2PpaGfWaqyw+FuwoHcDtmLgTF7qxjnHfXT
 crzDE66X9FbpuCzXwyl7Yw2tq9etumss7PUXtuqVyFhuIMc565Lrc2K0HI1IHeYB0+jb
 FmJYQjNYkFaFRYp5RZrneamW+YXNSOvymzTwbWM6LDMK5fAys2SHLbwL6AbvFyCuoTAV
 CmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYy9YKfsUlPyS4UsgRXgoLwbQO5UGtNoTeKHL1o76Qc=;
 b=KOQGk2CCnZyh38gxeFpEFizSNYaCTPUOJCDuiHq65YLh9igdMQJ6T6+AXaGK8ZSVYX
 ONHjb5tylkohI3GbQOzv1PVQh0eb8AfOgnRtJYdtkGKg6C2TjEnFmUx+2eoViRmJD/2Q
 KYbl4yrnDp4OUMXLyFzyMNjF/h/kWufupx/yltTSl8xNIHUY3JQiMDwQmleJwpEoY1fp
 XqS07agd4HtHESyZWNSB4pEbuN0qRHpr2f/+K6F2LA03Nr8Ct9D5lePDaGSWRNm68Qyb
 Lor/2I2ukbAJaQulhj/ycz/9nnUKTGlKZYdCzymnm7sHKFrrY+EwNZTKvpXjG4hvXBSK
 TeKQ==
X-Gm-Message-State: AOAM532NRcfcn5++hin4EH1oNyhbPAJu3u2OzV6JBm4CLdlu3AhOQZaY
 bjZOWNZuJHEbEChLEM6CRVw8m+Sn4HuU/Q5IVTbf4Q==
X-Google-Smtp-Source: ABdhPJzLEdFDpQ+X9GRKe4OS6MBm1QG3vJo0uCY8cGCz879eGL3VEyHPK8z654flCBwplhwjj/eShvpAMoWuTRF58T4=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr31614887edv.44.1621953194950; 
 Tue, 25 May 2021 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210512182337.18563-1-rebecca@nuviainc.com>
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 15:32:51 +0100
Message-ID: <CAFEAcA_7PsBAD_L4-O4JkptOdx6FoQTy2c+hyhmQ4o7O4TGjXg@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 19:26, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> Testing: booted Linux 5.12. Ran "make test" and checkpatch.pl.
>
> Changes from v8 to v9:
>
> Dropped patch 1/4, because Richard's
> 'accel/tcg: Add tlb_flush interface for a range of pages'
> patch replaces it.
>
> Fixed page_shift calculation.
>
> Added do_rvae_write and vae2_tlbmask functions.
>
> Moved RVAE*OS entries from the tlbios to tlbirange table.



Applied to target-arm.next, thanks.

-- PMM

