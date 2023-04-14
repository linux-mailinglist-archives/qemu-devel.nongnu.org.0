Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3536E2587
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:22:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKJE-0002Mv-TM; Fri, 14 Apr 2023 10:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnKJC-0002Ld-LL
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:21:50 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnKJ9-0001qI-1x
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:21:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-504efe702d5so2190629a12.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681482105; x=1684074105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1H8IYKFkqTLeNxtC7ByfKI3UpfuZhTmDGbA9y/uvBE=;
 b=Oo024dB7VqpL6RTdKhC/K/U6445KoM5mUUyRX2HxwC1z/qf9m90Ho2iyTjAlE/XeVB
 Pz3MUKb86SOxHANR2+uVLNrfnpaY1/c20hfaXM+Dzx5Sk3d1iX1VTtZmUFqoIV6DM0cb
 xaM7Y/5TuNwpllLedlc271d9V40i5OjAmawVSFZHG+hC5YP0GgQw2v003T50x0vaB0im
 /dHjr/nd/3DfVHQTXss+c3Rekkwf7LrAsof2d4fWilePSE4Dq+A8WskA65G3WTg60MUy
 GiOZ5MGNr2tTefCbMW2nVUFs3iZRBezr3dbDHxwUBYge8fQoY6p/byuvduy843ZDuvmN
 IynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681482105; x=1684074105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1H8IYKFkqTLeNxtC7ByfKI3UpfuZhTmDGbA9y/uvBE=;
 b=McserS/OvHM+cSUF7i0wLT48CGE6egkZXWEIjClwqwl9jPJfUM73cjtv8KaQkGiPjl
 6SBB5XvXP4qf8GLqA6RSKEZxSLvJ6LXG29NV7f60AjHk1eAx9KZ67rNjjEhP1t6UJgST
 +J0iNAfTC7ni+R+0jpCW7XBU+JL0qQow4SUCLLtYMu6Pa2MG+kPN6ow1R0/FgmIUzORQ
 Fe7fnfboD4p8oZcSZq4BkvIX/3pG2aD1AnZeKCuhA3klp0Az5kokB/KJyN2++ESPEnWc
 r8I77ltmRH9BXrlsjJI0HB6EeclByxPrQcySCM9mPVrgAmPGJPpd2TdAbKnTD8BsP5GY
 AUyw==
X-Gm-Message-State: AAQBX9c9LQFPJ4tkzEi1rzacDmuuaDfh5PvxY7k51lQ5qlrVwITBnEy7
 rqux/FuubbDMNoxTvYXZtVU+YIvnUN8KhLM0Is9BQw==
X-Google-Smtp-Source: AKy350Ywo046G2k6nOcvEPKGQzOZ5A1qsx14EvZNbZvj4mCV1Ynh20OrB9wyr2S2K4A7xF145NmFd5e6bn4zhR9BPeU=
X-Received: by 2002:a50:d783:0:b0:506:6ca5:3128 with SMTP id
 w3-20020a50d783000000b005066ca53128mr3175387edi.6.1681482105168; Fri, 14 Apr
 2023 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230413150724.404304-1-peter.maydell@linaro.org>
 <20230413150724.404304-3-peter.maydell@linaro.org>
 <6e38f2c5-5dd6-3fd6-39e6-d51d975fc582@linaro.org>
In-Reply-To: <6e38f2c5-5dd6-3fd6-39e6-d51d975fc582@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2023 15:21:34 +0100
Message-ID: <CAFEAcA9S5q-uKEks4t7pWshu1DzdP2Wjyiu68tMZz7pR-BLjRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] chardev: Allow setting file chardev input file on the
 command line
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 14 Apr 2023 at 15:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 13/4/23 17:07, Peter Maydell wrote:
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
>
>
> > -``-chardev file,id=3Did,path=3Dpath``
> > +``-chardev file,id=3Did,path=3Dpath[,input-path=3Dinput-path]``
> >       Log all traffic received from the guest to a file.
> >
> >       ``path`` specifies the path of the file to be opened. This file w=
ill
> >       be created if it does not already exist, and overwritten if it do=
es.
> >       ``path`` is required.
>
> I find "path" vs. "input-path" confusing and would rather rename it as
> "output-path" for consistency; or at least add an alias.
> Possibly deprecating the "path" alias. Maybe matter of taste...

The much more common use is the preexisting one of "write the
output to the file". I don't particularly want to break all
the uses of that just because we added this option.

thanks
-- PMM

