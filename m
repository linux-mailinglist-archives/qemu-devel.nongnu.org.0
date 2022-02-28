Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25A64C705F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:14:18 +0100 (CET)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhj7-0001tm-Ih
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOhhv-0000YF-UZ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:13:03 -0500
Received: from [2607:f8b0:4864:20::112b] (port=45503
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOhhu-0001MJ-FB
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:13:03 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2db569555d6so55374577b3.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tKnIu3axuhtLi8C9AxOmxd1qcNSHmyK/Yy4DXkR7Xx4=;
 b=lW/f9WXwspFiOc2jXsIbIdoesqHgb6eVI4o55k2v5ljMEhelTCHeEQbb4xmYwvIDbz
 tC27Y/w+QXn6QB45OewkU5mgx4EXaJWgjw3N5oY/oj5t4wmQyIl3cfa+m1wt09sGzSZS
 hdFWWTU0HbysmR05GKbhd967uawo6WVEmM3KVCjseK94WiQz1hC3EtF9jurf7imrZqrS
 eya5f7Hsf82Hdt5NU/5vqmsHPO2IEMrOcSEm9s8HDzUuvUR+9RZHZFgrqt2qmA7ZNlBo
 EZdqjmSSWgzqKpsRmMQsQ1Fu3GGtVJmy49uwfmSqYTTx1uGMD4uJyd/f06IZRWX9Dnyq
 cDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tKnIu3axuhtLi8C9AxOmxd1qcNSHmyK/Yy4DXkR7Xx4=;
 b=HbHnhHnC8xpLiQlwImUp4VA/mraSDGaFgTXF4ynfL3F90KxXjIVqBwYKsi4h1ngMB/
 2wBVH4+yFj6y/XtKpDkHFuYjm20HLBkuafkSGYkkEb64D4mF9Xol4hFlRC//ruSanyEY
 GY6v5ztt7BYF0wq3RiYBQAKWe3NaZAjn3Xc/Iae7Kfw1Tn33HxZl6/AARFLd+yjXuCOW
 rSlM+KESg1sDFYPy3LAUvwAM2nAEaI1rjO3S7DoBJOf9mUPVkdPItDhhHbxaqlptw4T6
 MC2sijEg2KdCCYPJVVFOjyea0S3vqzoDLAMOJ8mSgOWiyCWHTePxWReyWXS4vVTXh5JT
 YDsg==
X-Gm-Message-State: AOAM532KN3hp8HIS6l6nja7UsuVuTqetl6d7WwrrYUKEAnY8UVBfL1pn
 uc6IYFLw0ytNZfrMMJB6qEcFXBj8hVTXYI2wEuV+Ww==
X-Google-Smtp-Source: ABdhPJwzPMZ7IALliO/4wyLZ8mRnsdxyn+vZBlGwXMAJXRwSdGUB7suhLUuWXHBXu/yyICm1Ixi67hc2wLBm5eeIUVs=
X-Received: by 2002:a81:1006:0:b0:2d6:e14a:ca72 with SMTP id
 6-20020a811006000000b002d6e14aca72mr19974892ywq.455.1646061181130; Mon, 28
 Feb 2022 07:13:01 -0800 (PST)
MIME-Version: 1.0
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
 <YhzeYQ7akrGqAIW7@redhat.com>
In-Reply-To: <YhzeYQ7akrGqAIW7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 15:12:50 +0000
Message-ID: <CAFEAcA_POR_p9QmrJHYKPFQt6R=4-+uGk1RvYfsb5G08Wzb8uA@mail.gmail.com>
Subject: Re: [PATCH] explicitly link libqemuutil against rt
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-trivial@nongnu.org, Simeon Schaub <schaub@mit.edu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 14:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Feb 28, 2022 at 02:15:11PM +0000, Peter Maydell wrote:
> > On Mon, 28 Feb 2022 at 14:12, Simeon Schaub <schaub@mit.edu> wrote:
> > >
> > > >From e77de12cc33846a3de71d1858e497fbf4cdbff96 Mon Sep 17 00:00:00 20=
01
> > > From: Simeon David Schaub <schaub@mit.edu>
> > > Date: Sun, 27 Feb 2022 22:59:19 -0500
> > > Subject: [PATCH] explicitly link libqemuutil against rt
> > >
> > > Qemu uses `clock_gettime` which is already part of more recent versio=
ns
> > > of glibc, but on older versions it is still required to link against
> > > librt.
> >
> > Which version of glibc are you seeing this with ?
>
> The man page says
>
>    "Link with -lrt (only for glibc versions before 2.17)."
>
> and even ancient RHEL-7 had glibc 2.17, so I can't imagine any platform
> we currently target in QEMU has a glibc older than 2.17, so QEMU should
> not need this change, unless there's some other scenario not described
> in the commit message.

Is the answer "actually we're using musl, not glibc" ? I vaguely
remember that possibly being different in this area...

thanks
-- PMM

