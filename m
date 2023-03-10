Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A86B5272
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 22:01:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pajqs-0006VM-TO; Fri, 10 Mar 2023 16:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1pajqq-0006Uz-Ph
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:00:32 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1pajqp-0003lO-8S
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:00:32 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-540a12e0e78so19575967b3.6
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 13:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678482030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tX7uW6Z2cKF9q+5qxLX9qQvToTpJocxzcp7TVrMixD8=;
 b=Jc+J2W3QbQ1QRUaMQpVyW6BCPV7NE3PvNjhU2Hrp3ngahcD7XIZDqD78sbZEg0Lfcf
 Vx6FJK2HtBvD9Q93ohZH3hfY40bE/0jkl1rmboOEfCaAGrGFBs4FVAcT/GK1BJXf9VXy
 dBx/46OvJjuc96zRg0kX8IGxTbWSrWL2Tf+BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678482030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tX7uW6Z2cKF9q+5qxLX9qQvToTpJocxzcp7TVrMixD8=;
 b=bezDelTBTZZBWY27Anl317lDkk+/DPV43dxX9W2gqv3u8O6s4vZl3fG/tDAL0SlMmL
 p47I1as/9qO9tLEJB8w1NH+q9LNZAVekKawCB/b1uNJtxgMYSAaidSZHkvnPB089Uh1l
 7k8mwYrSv9qaMAUh9wK7kaC/jWd++RUGwxuJM71DAmAtfazKNwR9g1s/XwaUQHiCn6lH
 tJyiJPprxFBRR/iwxnWQIXoHLNj3IGjuqvDI/3kyiyxLZMy1q7RVq0BTbgDygCMUBE49
 iijrF2yBg59P1kBd5+DQoPbqeDNdRZYWKgg9rNxRGYmiKiK8JF+d/+XItUHDizm6doVN
 jQvg==
X-Gm-Message-State: AO0yUKWKGEqb6CRgWBgTE7ZYrPYv7D+I+xgrF+0/2mLW0mSVtK5WRRvy
 aWfLPOf49L4xMQqnJ8Gfv3TUWXLKlqBjjsTF8FtfVQ==
X-Google-Smtp-Source: AK7set9wSfmYslkG/NwnVIeZi/VLjchtuvCvL+qOm64MZzRJRNyFM9Ph97+y6KlNMDuzHfsBYSPJoIo209SCYqytQr4=
X-Received: by 2002:a81:ae27:0:b0:530:a340:bcd7 with SMTP id
 m39-20020a81ae27000000b00530a340bcd7mr17679667ywh.8.1678482029879; Fri, 10
 Mar 2023 13:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20230309115714.906369-1-kraxel@redhat.com>
 <20230309115714.906369-4-kraxel@redhat.com>
 <CAPnjgZ2KaWyCCFAQMzkKO-mG+iQtQs3n_7gtnJHYQUHQjBO4Qw@mail.gmail.com>
 <20230310063759.tlgfq67awq2tgzs7@sirius.home.kraxel.org>
In-Reply-To: <20230310063759.tlgfq67awq2tgzs7@sirius.home.kraxel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 10 Mar 2023 13:00:17 -0800
Message-ID: <CAPnjgZ3frnGeXV8rgnnW2GiByPawNDVbjvLL12Z8ToYBZxB5CA@mail.gmail.com>
Subject: Re: [PULL 3/3] edk2: update firmware binaries
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=sjg@google.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Hi Gerd,

On Thu, 9 Mar 2023 at 22:38, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Mar 09, 2023 at 02:09:30PM -0800, Simon Glass wrote:
> > Hi Gerd,
> >
> > Where did these binaries come from? What commit and how were they built?
>
> See patch 1/3 for the source (edk2 submodule) update and patch 2/3 for
> the build scripts.

OK, got it, thank you.

I made a few comments. This script is very, very useful. I wonder if
it could end up in the edk repo?

Regards,
Simon

