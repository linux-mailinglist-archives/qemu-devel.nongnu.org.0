Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E16AB9FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:35:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7FX-0004hI-JZ; Mon, 06 Mar 2023 04:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pZ7FV-0004h5-BU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:35:17 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pZ7FT-0001zH-Tp
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:35:17 -0500
Received: by mail-ed1-x52c.google.com with SMTP id ec29so4928003edb.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 01:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jmdk0kJEpLbV2qIdKX1yXbhq2nAzKsMLS3QztVXigzc=;
 b=XBONkiECqO0PbE6EcVokeuSlEVZU++HGDh/BiCa9Rs7aYsZiK5cyY46HMX97F730FD
 DvRtOmSQjv5p8uDUyCqB24vIx4RrmOuA4wTvfwVjMdybywCb2z9GWPDkWinzNtK8Tpso
 gzDpCYb8k+zd3ldgOLaRtOxG7frE8kc/8cyrY4PffTNqOgJlCGTfitc/sCgl8Xj7K+g4
 kQmIDazyB0jDB2chFi3bAOlXc+zv/CJRWfIY25vb7fbMif8woT973sVc6j5w8CU6Z1wn
 mvlF23TTEEfgXSNkkWgvtFYRcCFsTWvG0NgIT6hRSLBYuK1I7LZ4xYlNpZ0yl1xburK4
 sLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jmdk0kJEpLbV2qIdKX1yXbhq2nAzKsMLS3QztVXigzc=;
 b=xux0U/HGSp1fVl471g+eDb+7aOTTHCVsQET2rnvCJALm3bWBaWY9n3DoNtX5PBg3D4
 odS5r8khsIfFQRSW3OiPeJa+JvY3sMUFm7VQhQSpFuXHVybzqc43b6gr15MMvx9vK84/
 0uV3/9GsJCay+clCC+U7gHlF3ws4PCDTVN7/mU1WGyp6eEAn2ZMD7+bBqYl4x+qaJd1h
 saYX/wlgpOnYpya19zhgbnIOjf5ReqspOQBZ1XH5049ZU26kznpsJfhsViCZkO7uqSzK
 8avM3sUyt6DHSNepDfYIk577+sncR9hI5M1QaVXeJ8j3oaMAnD1kwN4V8HJnbtaAagZ+
 9hPQ==
X-Gm-Message-State: AO0yUKXlfjL55MIJ/bEElU8/RYr/Cpl7Qf5pD5XHTiymnJxdhxx0r2Ys
 RyE2CdpGiBoFvXpp94U2mejqRAKM0fmQ2jOqP8U=
X-Google-Smtp-Source: AK7set8IFlz0OVy/R4YfFx+UVyzuO8y4YIaOYe/bIx7smc++Jnn/0Kng6Sr+6bYbxcW2+fV78J6KhOw+AuSi9OZvje0=
X-Received: by 2002:a50:ab1e:0:b0:4ab:4933:225b with SMTP id
 s30-20020a50ab1e000000b004ab4933225bmr5450791edc.6.1678095314477; Mon, 06 Mar
 2023 01:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <20230220100815.1624266-4-bin.meng@windriver.com>
 <541532c2-9c92-87ba-b649-3440e65c83c5@linaro.org>
In-Reply-To: <541532c2-9c92-87ba-b649-3440e65c83c5@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Mar 2023 17:35:03 +0800
Message-ID: <CAEUhbmUN2_qT-fup=tXK9gezaEhxBeJPNWf4FZz=mz=wJy1rCg@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] hw/9pfs: Replace the direct call to xxxdir()
 APIs with a wrapper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, 
 Guohuai Shi <guohuai.shi@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Mar 6, 2023 at 5:32=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 20/2/23 11:08, Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > xxxdir() APIs are not safe on Windows host. For future extension to
> > Windows, let's replace the direct call to xxxdir() APIs with a wrapper.
> >
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   hw/9pfs/9p-util.h  | 14 ++++++++++++++
> >   hw/9pfs/9p-local.c | 12 ++++++------
> >   2 files changed, 20 insertions(+), 6 deletions(-)
>
>
> > +#define qemu_opendir    opendir_win32
> > +#define qemu_closedir   closedir_win32
> > +#define qemu_readdir    readdir_win32
> > +#define qeme_rewinddir  rewinddir_win32
>
> Typo :)
>

Ouch! Thanks Philippe :)

Regards,
Bin

