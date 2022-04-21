Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C297050A24F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:28:41 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXnU-0003TK-T0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhXhN-00076J-FS
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:22:21 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhXhL-0002gT-Lp
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:22:21 -0400
Received: by mail-yb1-xb32.google.com with SMTP id b26so3388773ybj.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rzvfw33Z8Dg1Q48qq/lnG1mHNwQjYrK/ghp/pZsQqgE=;
 b=eiBBpzsbEu4wn8RIdPcAS+MH4lMSqD2HDqQbXF/6SDmXRSjxw5L2//DGKwcCCYrOkv
 2ljfYHNaSZhOu6fB/zbRcz8dELqhn/En6kYSsNRza6ITbe4khnY7T1gdmm09de32EPYJ
 jkLfmkvMYqPcRzwmcuVojrnfICRmhqevn3oB/8fTvBRHTmMkojK439rJVf7brsCY+LU2
 X7YKTyjGpf+iFgrQvFk5Rg3nzGra8p/hJt/M2r1mlrDIJ1ukYGuLb8r95+/ufi8Tg0GY
 E31E/Zna/PjIIykUdfQvAUKH0kWITDptAXk2o4DhX7CYuh4Xicrvn82H7PKaw+AO/fXJ
 3PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rzvfw33Z8Dg1Q48qq/lnG1mHNwQjYrK/ghp/pZsQqgE=;
 b=GQ5Q88Mpi0WayCPXZ+3XIRB1m35IkJEB0Ag8KDiMDHlTkSy9sXiSrXd8K7lsBcx+6L
 +77Hd9SQ3xpTz8dpwJdJYNDjqe68SvD4i2sFWfVYXSNyLX/J5DizQOKppP1OJt1Z77h+
 OnDEfDooA1mTFVHhAoE3GwM3vjf36GaKUjbD03dy4Nc+pqj3kb7fAtz6FxoXo6xD/ITJ
 jupDgDyVOiOXOb+qrjCqT87R4byvCN5iF7Gni5jc4DI3NN4fW5KpJXxD89gZxKUGqSNQ
 /bMO6RfsuK0ze6jk/0voUFQaFiBwoVXXeBuH0l5L+GBbRVi3X0uWd5cSKZmOzO0Sd0P1
 cqJA==
X-Gm-Message-State: AOAM5317/qqESS0hgWB9FoTgf476sgh1VhPRKNwlNt8O0ekc9harkj+s
 0vzHjnOrA2JsMsPtcBj4S+yImoGHqLpbt3cJO2sxqQ==
X-Google-Smtp-Source: ABdhPJzd/IC1ZswkYzIjfBPFKGciJEp7ixHGoFhdfUzBN8UACAfY3iiKRXQsYb+hKR3MregdY+aHBVmB/oCK8v180qo=
X-Received: by 2002:a25:ccd7:0:b0:641:7c61:de91 with SMTP id
 l206-20020a25ccd7000000b006417c61de91mr24625065ybf.288.1650550931270; Thu, 21
 Apr 2022 07:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220420221329.169755-1-danielhb413@gmail.com>
 <c98b72fd-f462-7e4d-5255-cf1017d2a7e7@linaro.org>
In-Reply-To: <c98b72fd-f462-7e4d-5255-cf1017d2a7e7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 15:21:59 +0100
Message-ID: <CAFEAcA-R2io7Rdem7YdC3CUEf-3MXKWFd-1__HoqKA24wTBpzQ@mail.gmail.com>
Subject: Re: [PULL 00/23] ppc queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 14:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/20/22 15:13, Daniel Henrique Barboza wrote:
> > The following changes since commit 2d20a57453f6a206938cbbf77bed0b378c806c1f:
> >
> >    Merge tag 'pull-fixes-for-7.1-200422-1' of https://github.com/stsquad/qemu into staging (2022-04-20 11:13:08 -0700)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220420-2
> >
> > for you to fetch changes up to 2d94af4b16c40758eee3a8591307ae173090d4ad:
> >
> >    hw/ppc: change indentation to spaces from TABs (2022-04-20 18:00:30 -0300)
> >
> > ----------------------------------------------------------------
> > ppc patch queue for 2022-04-20
> >
> > First batch of ppc patches for QEMU 7.1:
> >
> > - skiboot firmware version bump
> > - pseries: add 2M DDW pagesize
> > - pseries: make virtual hypervisor code TCG only
> > - powernv: introduce GPIO lines for PSIHB device
> > - powernv: remove PCIE root bridge LSI
> > - target/ppc: alternative softfloat 128 bit integer support
> > - assorted fixes
>
> Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.

I created the wiki page last week, incidentally, so you can directly
quote the URL in these applied-thanks notes:
https://wiki.qemu.org/ChangeLog/7.1

-- PMM

