Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B96A6B5C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:08:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKJ7-00018B-M7; Wed, 01 Mar 2023 06:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXKJ2-00017m-Sp
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:07:33 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXKJ0-0008Ol-Q8
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:07:32 -0500
Received: by mail-pg1-x531.google.com with SMTP id p6so7499181pga.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 03:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677668849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jd40nXEPULCiqmNunfWG4GF091rscPbWMG/uxlvoFZQ=;
 b=oEjG6MTS7H1p/gMZJSHY10pe4PCvTBK3/g1tyfmptNGTDPXIagN+kfPgEWrJSOEdCT
 QbhBfjmXZJUtaXdFIUw/B9t5mHg+VRnnrGpPBy+TuEDqztuTGS71JV8l+ooEpvoNp/jP
 RlocMNDe0xJ9U3ec5XIjnsesaYXhYwSpYG3IWOueTnaBvAxWRhUpgHNi17AK60oBaZa2
 7w9+98xYgeLZTxt2ZXEndoI0ZClRZQrNlaCa+/EcphNsEilble3HISrfvaBN94G56vcv
 3l7ZilfQf5ySE8JEIwZKHXfsOy7oMSdnCQNGx39UikiZqQXmgYkQdpuPhWW7P3GsB5kk
 +UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jd40nXEPULCiqmNunfWG4GF091rscPbWMG/uxlvoFZQ=;
 b=zetJZc2PF+hl+QQt35y2yBcmzpAlxxcnqXkf0uKVxlI71+6E+Hukd6YqxeNlPIi0Wu
 w55GSM4wrvGvCxuksy6c6Yo6piDrrY11GoNXCq+oEMJo+TR86RnUbik/CQkcSL41HnUq
 EDNCAlSRlC3pWYXfVEjofKbR//eDR38PGzkNFNQoUI2GRDqHcQZQmifFz2XikYzXdPAg
 7h2lkKb+vOmASZ88VfrZZoBwHrBDHJT/D9e0cKknPX461a65Jm4wSMOPOUOvSYNqOJMx
 Tq/La8pCl+0BIJVliLunf2qcBoJUTtB6mBeA5U/ESlHLW1Z017GJsUlUHRWBvz1R4XuB
 Ujgw==
X-Gm-Message-State: AO0yUKX9XkOOVy/gkUR7dIiw4Zl0tuM5pNbHHwC6VLup7RL+2THTMdOe
 Nrw/nzE7a8fTmZ8EiOuR0zM7CPcGZ5pG4w/0VIsxQg==
X-Google-Smtp-Source: AK7set9nEJZ5MsUQo3SCmnFglklbS4JEPpXyLGlMdIrtQrbLGqw3FDfAzI2Tom10eIcMk9niVlW5+MxFT9megbL13IY=
X-Received: by 2002:a65:6a94:0:b0:503:a7:d244 with SMTP id
 q20-20020a656a94000000b0050300a7d244mr1908044pgu.9.1677668849062; 
 Wed, 01 Mar 2023 03:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Mar 2023 11:07:17 +0000
Message-ID: <CAFEAcA8-T8=jscNP14vCx+1mudMpNbHeo2cELr9Ao81T+JSNQw@mail.gmail.com>
Subject: Re: [PULL 00/62] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Wed, 1 Mar 2023 at 02:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230228
>
> for you to fetch changes up to c7fbf10db8718d2eba87712bc3410b671157a377:
>
>   tcg: Update docs/devel/tcg-ops.rst for temporary changes (2023-02-28 10:36:19 -1000)
>
> ----------------------------------------------------------------
> helper-head: Add fpu/softfloat-types.h
> softmmu: Use memmove in flatview_write_continue
> tcg: Add sign param to probe_access_flags, probe_access_full
> tcg: Convert TARGET_TB_PCREL to CF_PCREL
> tcg: Simplify temporary lifetimes for translators
>
> ----------------------------------------------------------------
> Akihiko Odaki (1):
>       softmmu: Use memmove in flatview_write_continue
>
> Anton Johansson via (27):

ERROR: pull request includes commits attributed to list

Can you fix up these
Author: Anton Johansson via <qemu-devel@nongnu.org>

to have the correct email address, please?

thanks
-- PMM

