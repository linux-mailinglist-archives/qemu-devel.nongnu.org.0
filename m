Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5CF382B80
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:52:20 +0200 (CEST)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libnH-0006z6-0a
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1liblV-0005ZF-4J
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:50:30 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1liblN-0007US-9n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:50:25 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lz27so8718207ejb.11
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8YhtBtVgRcHG2irsDJlUTBpMwqxppkZax5qGRGZiau4=;
 b=uNoTgSK38DIxpt/DsLcAsRRQSWPY/SHtK1uXP+P3JVC+OwstearPLRA4wL0baRxi/w
 QYj4CtnzjjWzH1fP5fbAuUUAOvdr4+2YgHsmBeCaLjzEV+FZoDgioL9NK2+ZHiCnHegu
 it+RULz722X+nJ1FyqGoNM+pHwu+54lKyz5geVfolcZYUV10SUp5vRfQ0OQxpvsfzPUw
 y5nDnVBsbIONFR/aZwI8arz0tXe26d1PXfMUbxf1yZ8bUuMHkgnqCzTbqDpWBChlyMlZ
 LKmOLpw9IpG8HZik6PYUdR9zyN0vCJX6OxlwaOX/gLB+XetHfBtm5EGip2NmUJV+RidD
 j1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8YhtBtVgRcHG2irsDJlUTBpMwqxppkZax5qGRGZiau4=;
 b=XqV6fLC2I+jsP4FXsfAnJlXVwTOX8LRXh5l6PQ/AD2bGIcQSXAXuTj5Jwprne1Jpfm
 fudUBOtEQVnMoOWHqtJB+C+SFxLEZmaocN2uvnH6PK7qR9mGPXuvH2QncFlKJAOiS8xP
 TTjVXuASGjsottIxVo9BXkG+crsWS/OQbnEk0d8Jurm2rC8nh7DMvmdfww2ZS5vOiM/v
 Xl9oHskgQ8xUTZscEZt866aySw94k8JeKzEdxs3LqV1TNlz1NGnkeeD6DYJTK6C92G+H
 bR2X8L3FC0k69NSozk8XqRhTojKGr91XzZZ/DaDHT5QE0ShZHxOsPZ0dWxacErrHiYQ5
 ka+Q==
X-Gm-Message-State: AOAM533zv0AxxrF/RgqWsak79QzXYEle97W+iJAW2wqtbMO2btSlwIJs
 if3sG1WD75nd/l/wJ8f+5lqXwE6BYi2nDcFKGos=
X-Google-Smtp-Source: ABdhPJwj9vF2YIIR8/mJHJu0OBol5pdAV51vIr+NTc3L8ZOvSpwHgFHop880G1cLzvwrP+UQpHNBkb8l3zF6yC1Wu9Q=
X-Received: by 2002:a17:906:2f91:: with SMTP id
 w17mr42618800eji.443.1621252217113; 
 Mon, 17 May 2021 04:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
In-Reply-To: <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 May 2021 04:50:05 -0700
Message-ID: <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe@mathieu-daude.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daud=C3=A9
<philippe@mathieu-daude.net> wrote:
>
> Hi Max,
>
> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > Move remaining non-HELPER functions from op_helper.c to helper.c.
> > No functional changes.
> >
> > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> > ---
> >  target/xtensa/helper.c    | 61 +++++++++++++++++++++++++++++++++++++++=
+++++---
> >  target/xtensa/op_helper.c | 56 ---------------------------------------=
----
> >  2 files changed, 58 insertions(+), 59 deletions(-)
>
> > +void xtensa_cpu_do_unaligned_access(CPUState *cs,
> > +                                    vaddr addr, MMUAccessType access_t=
ype,
> > +                                    int mmu_idx, uintptr_t retaddr)
> > +{
> > +    XtensaCPU *cpu =3D XTENSA_CPU(cs);
> > +    CPUXtensaState *env =3D &cpu->env;
> > +
> > +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_EXC=
EPTION) &&
> > +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT=
)) {
>
> I know this is a simple code movement, but I wonder, what should
> happen when there is
> an unaligned fault and the options are disabled? Is this an impossible
> case (unreachable)?

It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
is disabled. In that case the translation code generates access on aligned
addresses according to the xtensa ISA, see the function
gen_load_store_alignment in target/xtensa/translate.c

--=20
Thanks.
-- Max

