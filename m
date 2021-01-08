Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D272EF66C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:26:57 +0100 (CET)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvXN-0000k6-0E
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvLX-0003sJ-Kq
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:14:43 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvLW-0005XT-0U
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:14:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id r5so11847866eda.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/j2ysI53yJgO5pnipk+fGK4XsZkoo1uaFSJUKGQC+00=;
 b=MURwSPJUPy8EPC7QNMNjxB0Z2uOO/lm4O7fmUdNc86N9rmI6jp+CFFDH4oZN6bk99Y
 qVQYs3MJ3YBUC1SddTDBNw29cXWnvF1VXXNf0ZML9dB53RTQ0NXDoZwSPhxPN4RzzbYD
 a2aPui0cZdn3jfw2PQ6nZoG4x8OStGAdyUhjM1bemLxB+k8P+2Ea/oAVP8wSC/F8QhxR
 YTpUJYoiwBivxfGS1Sp3fM3zRgmEotZXL/zSpPTXRdni1UbgzCxI5z163PXv8KTYHZ1H
 09ExeR0K9FYeYWo1j9D6k/QCEtTGlvdvVqCItkp3KrJ8uO98oVo/WyD91eBh5OFQgtg9
 Dm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/j2ysI53yJgO5pnipk+fGK4XsZkoo1uaFSJUKGQC+00=;
 b=k3lzQQQhj7ygAc5lM3yTg/ptuDPaMJGx0jhUbnlRaOvxorE5j9l4wqu9LvKgu6XlFc
 Yqz0W+PQi3WhhH18X7Yit3lPtxUzMAZP8xLGMFfVr0kpojgWFwCpFPQgRQSQc6CYJxlb
 IsFLMMVdCrCl4EvhxdzOTR1X+JNhejp4e9+TqvupnRKmbog7NQzjRHsY2Y+oe/4G4YW5
 oLhOMb/YAKhUdr+0oMVlk3nyuZuLSmcKU6QGQGxWMugwmekKFg4+Z7yowqod8nC5wFwQ
 y9kCuZ+VPFnP58OccHhcXaQ/O7l66MyDfI+ow2g5pzRa57bN0iv1trQilZ8q3ruErhwZ
 ArwA==
X-Gm-Message-State: AOAM530fHhYqxNZ3I/TLnbILX3BDrX2vhAJVIzt0o7R+drqZYmWBJfnD
 EMMbicVjC8mZqDvQooIv9jSCOJpOLTYAmOWswaaGyQ==
X-Google-Smtp-Source: ABdhPJy7xKZTn6OfmoZGJV08iKQ+w7cNQb3QwKiJ6hkvvJicbtE6pYx/R7GmvpjCbSR6/MONnonDXQnAd4weleRW5ZQ=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr5788635edv.100.1610126080706; 
 Fri, 08 Jan 2021 09:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108151632.277015-1-f4bug@amsat.org>
 <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
 <9c5d25dd-6b4e-85ac-5e71-36540d1f1525@amsat.org>
In-Reply-To: <9c5d25dd-6b4e-85ac-5e71-36540d1f1525@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 17:14:29 +0000
Message-ID: <CAFEAcA87yvTykxUGkPZaDcD0i8LN2-6Yhh_HpSrZc_ZD3dbMqw@mail.gmail.com>
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 1/8/21 4:38 PM, Peter Maydell wrote:
> > Should we also be opening the output file explicitly as
> > utf-8 ? (How do we say "write to sys.stdout as utf-8" for
> > the case where we're doing that?)
>
> I have been wondering about it, but the content written
> in the output file is plain C code using only ASCII,
> which any locale is able to process. But indeed maybe
> we prefer ignore the user locale... I'm not sure.

I'm not a python expert so I don't know what the usual thing
is here, but it seems to me better to insulate our build
process from what the user's locale happens to be set to,
even if it happens that we currently only output ASCII.

thanks
-- PMM

