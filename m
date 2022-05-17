Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D3529C53
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:26:16 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsX1-0002sU-Ds
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nqsQY-0005hY-EH
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:19:34 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nqsQW-0000Fs-Pf
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:19:34 -0400
Received: by mail-lf1-x131.google.com with SMTP id b18so29928725lfv.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXWrCuJGfCChpx7Yms+vqW6cV/aCkUY+FO9z/khhUTc=;
 b=D7ceDiSpdw/S2CGh2u0YAzWygppitu5qvso+9RH1wICCHnCzSyOMtf2mRA4XnIqE2A
 cZiK0N61XXFtw6yP/D9kJ+igcmKuox2uzTQw9Dbti7UoEsjAOU/EuPRAk3nwJE4jQyze
 Gz/Sef/3JNH7XC2l8z+w+KlrxpPQoO05JHkYILmhUjzE9cURmZNQOciApuL1L/TYcF6z
 jJngXDxU/QzIVxw5I0ghg3aPdLRgwtuG8fVc03U63lRGzNMlxiZOz92f71w5Z+++p2Rm
 eiXieUw7VU7mB+re0zen2dDI72a5ErbnQrWeB2s3rPkXkMaQOUgU2ODhgKWK09L8zfQp
 jU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXWrCuJGfCChpx7Yms+vqW6cV/aCkUY+FO9z/khhUTc=;
 b=ZEpAByk8r1mIMFF9bV54Fi0COcZMbjANz39ccAg1fk9hlVDSgb8c3FnEs7LaPFOFlT
 trMFNS8S6mOrLC8lreEyjUumv7NsuYhBzrmXjODm7mOJCMTE5dczbIknzG2VSYNZTsyp
 WdQbUfIo24cPEtlWvClQDiIfbmsKRO21MdWKW3dbgyArkeL/AECZz22ezNBzr9xyJhzy
 ykuwbQu3nErsZlL3lFGDtsf4/e5omdw47rQ0nUzb58wD+mm+X0SOP603Fv50RGC/dpse
 PziJ2eGqcZXbKTNDWJzVoFQeohlilmkMmbWeMT7thV6o13glrIcXQqAxu8920p2kD4vJ
 aRLw==
X-Gm-Message-State: AOAM531+HczApWQgGUbNEWcT/8sleF0E3X3YUGJo3mAn7ymZSxanlquL
 H75vkIJleqAuxZI8e4+xfdMFGg2TBKW5vmIjFr4=
X-Google-Smtp-Source: ABdhPJxRapTOiNUsP7lo76Rma+Xdb9xjgTavlNTSZlW+H3CaFHNvLJ6AGC5qw9eim/0Z/lVkTX17ZHvtf9GRl3l/a5w=
X-Received: by 2002:a05:6512:114e:b0:477:96b8:b387 with SMTP id
 m14-20020a056512114e00b0047796b8b387mr4967083lfg.177.1652775570531; Tue, 17
 May 2022 01:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok9Zjav40T39VFfF6bvR8=vCKOM-O8Z-pJ5t3tnc9281Yg@mail.gmail.com>
 <CAFP0Ok9vNmWLG+2Oxwk8PQ2pjEdL0RVd4mpVKcf2e9xm10gWKQ@mail.gmail.com>
 <CAFP0Ok-8zv1FFcwmP5pc6boWQB513bsTPX7B-VG5m6D48m2WYA@mail.gmail.com>
 <CAFP0Ok_w_gKWze_K0v6M+YCLAdjJKCRj=WEPLbHHXrPZtPbqfg@mail.gmail.com>
 <CAFEAcA-K-aJrSbEfJnkJ1p5j_9DfxTrwMftQo9Vhg4NRYjy7Ww@mail.gmail.com>
In-Reply-To: <CAFEAcA-K-aJrSbEfJnkJ1p5j_9DfxTrwMftQo9Vhg4NRYjy7Ww@mail.gmail.com>
From: Karthik Poduval <karthik.poduval@gmail.com>
Date: Tue, 17 May 2022 01:19:19 -0700
Message-ID: <CAFP0Ok8CYvyGzQrb5skpNUVKttxDi8hLfsG0hYZDqLGpoEpOMg@mail.gmail.com>
Subject: Re: QEMU 6.2.0: Segfault while calling address_space_init from
 emulated device
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=karthik.poduval@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Peter,

I am building it from git but not directly but via Yocto Kirkstone (it
was originally designed to build via downloaded tarball archive). I
will add the --enable-werror to the build recipe.
May I ask why address_space_init should be called from device realize
and not init ?

On Tue, May 17, 2022 at 12:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 17 May 2022 at 04:39, Karthik Poduval <karthik.poduval@gmail.com> wrote:
> > Ok digging deeper, there was a compiler warning about a missing
> > prototype of get_system_memory but I never thought it would lead to
> > this sort of an issue.
>
> If you're building QEMU from git it should default to
> "warnings are errors". If you're not, then pass configure
> --enable-werror to do that.
>
> PS: not related to your problem, but you should really do
> the address_space_init() in device realize, not init.
>
> thanks
> -- PMM



-- 
Regards,
Karthik Poduval

