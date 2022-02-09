Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4E14AEE5D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:44:26 +0100 (CET)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjWT-0008P6-HD
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHjDy-0005VV-Gs
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:25:19 -0500
Received: from [2a00:1450:4864:20::429] (port=43874
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHjDv-0004N1-EN
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:25:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id i14so2855685wrc.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 01:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o6Jr4SLb8Ku4LzniSg+241NvwzP5CYahbmslxhsTzIo=;
 b=CgsTkzvcFSnHLefuLmj8Uu23fxeWsPjTzBt1/awFOV1R6w6n2gzRbsVGfg5IRtVwiP
 DKrny01BJuzC335kxJ5SgY+DyNHIb3W0YnQmkdt/T2Lq6v0XEvMEPkA6ZspNx2ERVpSn
 RjEKShPuudcw33hQ4dRniyM8Kye3ZPZPCgZ9J9BP021ynnBPEUbZxyJfD30t9xWGg8vV
 M4DYbtCJje1V+u5GVf3F/vSYdYjR9LfozlkRrALFohbDejIw/OBz0Z5JxUqh8aKh19XV
 FrQrKQnlhW6+w3Gu4TZslroc6+oy9129GNeWuO5SU/j9gl8aimleRAahqVKIrMPJ+yLN
 EJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o6Jr4SLb8Ku4LzniSg+241NvwzP5CYahbmslxhsTzIo=;
 b=w9KjTThhg1Or1vF3mc5XK8cXovekmR4v7vpAI8+fByWr+n5WlrX9f8kI7r7YN3JI15
 J+ybX/r9i0gvN73qIHOrzApXdQq7RmRLARVNsIEgm/b7jEl6JYEXbumBoUJ1CI8eesHt
 izP7q0xBf5XhWXAhQ5sb/PiQ2dIMmMesZb/qy5seOkfA7NYQO695zd+6xRCv2d357fjm
 cxdnhokM1WHCcOPV0shpf1CzFTTmIDlKL3TJxLcgP+ECkQK8XKhVOOyA/NjTqVO7rn/G
 AD8SHJflUfW2zR899WhOCxF0t4zORBqikS0QzbvQm6FKxafA0l2ewFQIXgY2i+sV8sy/
 py/Q==
X-Gm-Message-State: AOAM533J53Tw2j5BJJMGL2CLla8PdWkLX5GxTrR8JIcohT0/Vyh9WuTc
 2oEVnNfvYxAoyoRc6S5lb6/OIIRRzbSpb36AUuWqaA==
X-Google-Smtp-Source: ABdhPJxrFtuJso71utXFVsq+Q5CF1Aa+HUOQ45njTUB//qsDwmypbPmfBz+Y9gN8UItwU0YQNNMyTxNf8XppmqQ9hng=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr1263342wrs.295.1644398712824; 
 Wed, 09 Feb 2022 01:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-6-peter.maydell@linaro.org>
 <4a8c6105-b1b2-99a2-27b0-ebb48463a50d@amsat.org>
In-Reply-To: <4a8c6105-b1b2-99a2-27b0-ebb48463a50d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 09:25:01 +0000
Message-ID: <CAFEAcA-At8OFF4tU-c3T0simXX5B90ZzJ9Efj573RF6MM3D+JA@mail.gmail.com>
Subject: Re: [PATCH 5/5] include: Move hardware version declarations to new
 qemu/hw-version.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 09:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 8/2/22 21:08, Peter Maydell wrote:
> > The "hardware version" machinery (qemu_set_hw_version(),
> > qemu_hw_version(), and the QEMU_HW_VERSION define) is used by fewer
> > than 10 files.  Move it out from osdep.h into a new
> > qemu/hw-version.h.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/qemu/hw-version.h | 27 +++++++++++++++++++++++++++
> >   include/qemu/osdep.h      | 16 ----------------
> >   hw/arm/nseries.c          |  1 +
> >   hw/ide/core.c             |  1 +
> >   hw/scsi/megasas.c         |  1 +
> >   hw/scsi/scsi-bus.c        |  1 +
> >   hw/scsi/scsi-disk.c       |  1 +
> >   softmmu/vl.c              |  1 +
> >   target/i386/cpu.c         |  1 +
> >   target/s390x/cpu_models.c |  1 +
> >   util/osdep.c              |  1 +
> >   11 files changed, 36 insertions(+), 16 deletions(-)
> >   create mode 100644 include/qemu/hw-version.h
> >
> > diff --git a/include/qemu/hw-version.h b/include/qemu/hw-version.h
> > new file mode 100644
> > index 00000000000..730a8c904d9
> > --- /dev/null
> > +++ b/include/qemu/hw-version.h
> > @@ -0,0 +1,27 @@
> > +/*
> > + * QEMU "hardware version" machinery
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +#ifndef QEMU_HW_VERSION_H
> > +#define QEMU_HW_VERSION_H
> > +
> > +/*
> > + * Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
> > + * instead of QEMU_VERSION, so setting hw_version on MachineClass
> > + * is no longer mandatory.
> > + *
> > + * Do NOT change this string, or it will break compatibility on all
> > + * machine classes that don't set hw_version.
> > + */
> > +#define QEMU_HW_VERSION "2.5+"
> > +
> > +/* QEMU "hardware version" setting. Used to replace code that exposed
> > + * QEMU_VERSION to guests in the past and need to keep compatibility.
> > + * Do not use qemu_hw_version() in new code.
>
> Can you include the "legacy" word somewhere in the include path?

I'm not completely convinced that (a) we have a clear idea of
what of our APIs are legacy and what are not or (b) that we could
coherently move the 'legacy' ones into separate files.
If you want to propose something like that as an RFC, I don't
100% object to it, but I don't want to do a very small subset
of that as part of what is really just a "get stuff out of osdep"
series.

thanks
-- PMM

