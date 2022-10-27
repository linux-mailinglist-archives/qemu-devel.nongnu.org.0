Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E810A60F56F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:38:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0FQ-0007yN-Oq; Thu, 27 Oct 2022 06:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo0FG-00074v-Di
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:36:18 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo0FD-0001AK-Hc
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:36:17 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w189so1074195pfw.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtrWVhJzWjwYLWS9PASHfq0E1uoMfGTChshx2zstuTo=;
 b=lEY3HK7Sm5j7Paw9+6RSuhrMaaEnNixwf/bfcsJJjKdkc4yYEbftpNA4BUrAJNqAF+
 RnFq72PZE6yXWbqL//DUHDNDyESEp8EayF26nJuKcuT6n0RJd6VYYcbj14Jiddx4vRjg
 En1nZjVP+Kmt3w16HYGm4La6I4NdphNVnW1kuFYItNRnpbKYZYPbvIGdyYKxHkjiOa67
 iDdGl3nN6qzxay7AUuloSh3oaueDjCipWC+ktWUSM3FZ9FWd6p9FUHgVzLoub+aahlzd
 1R4FXii2s53uzmSq6yk89bhC63GUQrHYMnLl/OQlSDt28C3BRtBKtvMnRdvIrhC6y/rY
 Gx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtrWVhJzWjwYLWS9PASHfq0E1uoMfGTChshx2zstuTo=;
 b=4cb1/QUqsV6V9gntXhykkLg+hR0BQRqfU8iNlVf5zTmOD+Siqmtbr/OZSxka7h9zrX
 rur1SmSYa6vot9iMV+ShAKATbcCSNv4hDQ7jglPthU8fPlcOFLhBrR0dxq/VwE2VfKoX
 bfWLB2ynbqewtNcAMzxlRTPyvJQMG0eYf++ZLeoPWFF8PC6IlUg3eehhYbyyFTiZxP8s
 Y0vJugntiELhCY2imXQzIQLpG2Uh0iGDU2VrXCF+YaxpVXklfMOPXRFNoDV/CasDHTl+
 t9oHmvqYocr2+kNMyu8yqg2MRtWk/GwHbqOkPFuW25RDCKaEbhRopWEh1ey1/VTtvfvF
 MD1g==
X-Gm-Message-State: ACrzQf1ToRV400XeI3mqAOg9+dFZCvkCxOOVNZqX/uu9lbiNxFe+dCaJ
 v+HGMvL9O8TvdJUxuedLPPSInnZyttrvjkzDtvTQEw==
X-Google-Smtp-Source: AMsMyM4s5DSkvqy/vDNXEtfV3XUIuQrEiIZqN6G1LsWeiOVMELXQRr9e6AL+zSPKUGGTTchjpnRHWDT9gkSTVxsrduk=
X-Received: by 2002:a63:5b47:0:b0:46f:4d37:ec89 with SMTP id
 l7-20020a635b47000000b0046f4d37ec89mr3509867pgm.192.1666866973529; Thu, 27
 Oct 2022 03:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
 <CAJSP0QW1wAhsYUV=WPhitKfC2LdAdGJnXoPGBAxPVPg0YZ4n6Q@mail.gmail.com>
In-Reply-To: <CAJSP0QW1wAhsYUV=WPhitKfC2LdAdGJnXoPGBAxPVPg0YZ4n6Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2022 11:36:01 +0100
Message-ID: <CAFEAcA-oTF-qFELo6gdGBd_iSocvvq0zkiT37-nYfSRsgnNxRQ@mail.gmail.com>
Subject: Re: [PULL 00/30] target-arm queue
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 at 15:52, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, 25 Oct 2022 at 12:51, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> > target-arm queue:
> >  * Implement FEAT_E0PD
> >  * Implement FEAT_HAFDBS
>
> A second CI failure:

> libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.o -MF
> libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.o.d -o
> libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.o -c ../target/arm/ptw.c
> ../target/arm/ptw.c: In function =E2=80=98arm_casq_ptw=E2=80=99:
> ../target/arm/ptw.c:449:19: error: implicit declaration of function
> =E2=80=98qemu_mutex_iothread_locked=E2=80=99; did you mean =E2=80=98qemu_=
mutex_trylock=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
> 449 | bool locked =3D qemu_mutex_iothread_locked();
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~
> | qemu_mutex_trylock

Oops, sorry about the CI failures. The windows one is an accidental
use of PROT_WRITE when PAGE_WRITE was intended; this one's a missing
include of main-loop.h. I'm not sure why it doesn't show up on my
system -- I guess we're dragging in main-loop.h via some other
header somehow.

thanks
-- PMM

