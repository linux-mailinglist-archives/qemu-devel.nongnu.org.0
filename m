Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACF330B07
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:23:36 +0100 (CET)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJD31-0006nf-Fj
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJD2C-0005xv-Vi
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:22:44 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJD2B-0002nQ-BE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:22:44 -0500
Received: by mail-ej1-x629.google.com with SMTP id mj10so19182774ejb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1I5pAy37KUzIUsvrcseeN1J8NdaFRAjQ198WM/0KUY=;
 b=x1qSl+B2/C1ducn7oKw7FSMyeW7WmUIdbDeythd1UYedw2wFz1M0ZuyB9N2wNPi9v9
 AWk8ihktIt15B2j0DJ8qwWv1VF78ubQ9DEAHSo8bL1PuPEXGFx/dKa6aEU0ZzLXDYoPm
 40Wl1FTtp2WnhvTAjGN6ZMgfLPpKKxuLcg8dq80LIilisyOT281GDVg2iHsv/bMnv6yB
 5jclcMq+xWj01dRY2yoNBdJoA2OG7td+kwBUutc8r0CBAguKc7HgeDxsWkgW7SpeOxUZ
 ydySkjULPl8fF+byvGW46hcpgRl2e1DDKs9cfa2Ufuc3nF+Hb1QUJT85lELDSf6VmeOA
 3H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1I5pAy37KUzIUsvrcseeN1J8NdaFRAjQ198WM/0KUY=;
 b=TG6ZyG8zyHE0JXT1GQMJKiRCuR2zaQwiZMQ2ZbHVYvW4XSngrNjtlQOtvcZZhsVPvA
 jJ51xVa9DaIIVXizCbiKngdVHkp6iQJMtpZ0uhqWxBU8nXN6b7WX5FtjbEVi1jDdcRTo
 7AH1C3eeXRyywLb9rIuU7TfX/3M5UdI6a8nPiiuCDeqaSQfgPz4fYlsvYohd2i+WyYNx
 rMBrOujWpyaaowuUuNLPZ5l5JMmVzn+w3g4V3SdgRJvc6aackxWt9uCtrWhQIB3cuA21
 9Tt511pceex5L71dq0yiQUNUsT4tXgXDgPGtK9/Txp8uToj3X9AYJiZd8lTYf/MQVTD2
 LtLA==
X-Gm-Message-State: AOAM531SWsz0ZDlKyAt/XbRQIDQ04fOS+y/PchkwshPFQlIR887qiJ9n
 AWF558NDQo+hcAGeqwSMYD2uzH+2cIIHNWS3OpnkLw==
X-Google-Smtp-Source: ABdhPJzvHm/BhX26fsbC4I0aImCRad4MuYuzCCOwFOa9TbgwJyAYfdMQ2O4RVwJrUcHaOK0JqmKkBksXJWXagoj9X4w=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr14473885ejd.85.1615198961883; 
 Mon, 08 Mar 2021 02:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
In-Reply-To: <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 10:22:25 +0000
Message-ID: <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 03:48, Jason Wang <jasowang@redhat.com> wrote:
> Do we need to care about other type of networking backends? E.g socket.
>
> Or at least we should keep the padding logic if we can't audit all of
> the backends.

I think the key thing we need to do here is make a decision
and be clear about what we're doing. There are three options
I can see:

(1) we say that the net API demands that backends pad
packets they emit to the minimum ethernet frame length
unless they specifically are intending to emit a short frame,
and we fix any backends that don't comply (or equivalently,
add support in the core code for a backend to mark itself
as "I don't pad; please do it for me").

(2) we say that the networking subsystem doesn't support
short packets, and just have the common code always enforce
padding short frames to the minimum length somewhere between
when it receives a packet from a backend and passes it to
a NIC model.

(3) we say that it's the job of the NIC models to pad
short frames as they see them coming in.

I think (3) is pretty clearly the worst of these, since it
requires every NIC model to handle it; it has no advantages
over (2) that I can see. I don't have a strong take on whether
we'd rather have (1) or (2): it's a tradeoff between whether
we support modelling of short frames vs simplicity of code.
I'd just like us to be clear about what point or points in
the code have the responsibility for padding short frames.

On
+    if (sender->info->type == NET_CLIENT_DRIVER_USER ||
+        sender->info->type == NET_CLIENT_DRIVER_TAP) {

vs
> if (sender->info->type != NET_CLIENT_DRIVER_NIC)

another option would be to add a 'bool pad_short_tx_frames' to
the NetClientInfo struct, and have those things which don't
pad set it to true.

thanks
-- PMM

