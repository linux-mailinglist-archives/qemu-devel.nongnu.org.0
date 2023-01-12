Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55566788A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFybm-0001oW-SF; Thu, 12 Jan 2023 09:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFybb-0001mv-9T
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:30:59 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFybZ-0002J6-Lk
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:30:59 -0500
Received: by mail-pl1-x630.google.com with SMTP id s8so12076153plk.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UZsB3mXc9MMJUsCTeAELfgKPo2n5/g1bBJ7BlYhVl54=;
 b=XEjWFc0nQbSk3NwMTm8xY4fKDKdGn7oup/t/Lb7zuMNGkp3qnZJMnxcRQjMmI1YwAB
 rHFVlKHtpEM8xVs8yx41I6zxqjxxlBGMtcMiEhRCuEnpnOwet8HRHcxfejWWgU8VIcV7
 k9rCme0co7bFXvLO/iJP6QzC9Un8GsCG7M+wjC5wS5NFUpLNbEmbENxC1tN9aY2mAc01
 NV49nv+RSFanQRfYzz3kZ/9TWH0UG2gYOGDl3GLd437+Ijkm3STphEEggDEWa5MI1jl6
 NZbXXElJiJKOw5ZM05Rtn44mT+kUAsQJncOFmTZeu1dsmRc2trwWmVN0RQ9lmuIV677W
 q03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZsB3mXc9MMJUsCTeAELfgKPo2n5/g1bBJ7BlYhVl54=;
 b=tJ7lXKuNOplSCs21r/BaQMdr5yh7hMZIh/uLPKBX0a7k/b3EgKqfm9hxcU9chc+jpR
 TJMWeChNBdlFa89T/39dZsneJ7cQe6jz5vsaxTHXLi/Dj12qk6X65YerMv06fFuN9u4u
 G4f+gO8YSFqytjgX5rHxkQ0t1sy8FYH55OPn4XIhs6s5RhMcjxPhXwMHSqxsHpqRkVxb
 1BB0E8vuNxTpLreOhttOQrv7kaVAUc/ENuXRvw18mHYvWRI6skm0iKNDpqyUEs+sKAKU
 9iDGNhGfvwmwmDdlGzZO4wjnkjUDsluOSQMHFcoOA5znZfQWZa23Zfr3hVey6WGF9gwa
 i3qA==
X-Gm-Message-State: AFqh2kqUaky22zwxPK6wHIAUQLdg1LKvtdY583KsbZ1i02NGxBsE8e8H
 qBzSDlyHqZ0NAvdZMyj09WJ6l5o497jISni2o2L0bUCBRRCQYQ==
X-Google-Smtp-Source: AMrXdXsmp7Oer+PTXNQSEcMicf4UPSVQd8Z3aAkT4TY4Tv/3+/HcE5tQWyDqEqBRhcrEk+KL01SVtF+cZyfAdWmj8KY=
X-Received: by 2002:a17:903:28d:b0:194:6083:fd50 with SMTP id
 j13-20020a170903028d00b001946083fd50mr175999plr.19.1673533856014; Thu, 12 Jan
 2023 06:30:56 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9zUTAeSbMd_TaOzWfimHOus-=SdNA1XZ+3FO9-fAG3qg@mail.gmail.com>
In-Reply-To: <CAFEAcA9zUTAeSbMd_TaOzWfimHOus-=SdNA1XZ+3FO9-fAG3qg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 14:30:45 +0000
Message-ID: <CAFEAcA8hFu4sGgJ3CQhc26+j4s=JDbxLRcv1mVdtLTe9wsqLRA@mail.gmail.com>
Subject: Re: tricore-debian-cross-container CI job failing
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Thu, 12 Jan 2023 at 14:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The tricore-debian-cross-container CI job has started failing for
> no obvious reason:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3593581274
>
> gcc -DHAVE_CONFIG_H -I. -I. -I. -D_GNU_SOURCE -I. -I. -I../bfd
> -I./../bfd -I./../include -I./../intl -I../intl -w
> -DLOCALEDIR="\"/usr/local/share/locale\"" -W -Wall -Wstrict-prototypes
> -Wmissing-prototypes -w -c `test -f 'ldgram.c' || echo './'`ldgram.c
> `test -f ldlex.l || echo './'`ldlex.l
> /bin/sh: 1: ldlex.l: not found

For comparison, here's another run of the same job, which
succeeded:
https://gitlab.com/qemu-project/qemu/-/jobs/3594096306

The difference is that in the success case Make doesn't think
it needs to rebuild ldlex.c or ldgram.c, but in the failure
case it does (and falls over because it can't). I don't know
why this is, maybe a random timestamp thing?

Anyway, to make the job reliable I think we need to have
flex and bison in the container.

thanks
-- PMM

