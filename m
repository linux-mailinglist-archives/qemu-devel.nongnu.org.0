Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0E3320D6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:37:26 +0100 (CET)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXrp-0004W7-2Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJXqN-0003JO-Jj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:35:55 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJXqL-00066F-Qc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:35:55 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id x19so13163797ybe.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SEwR5AH7SeLObOiQTUZKW2Fqaf8NIFre/dsfNL5A4Gg=;
 b=uptD6MGtQocSQX9xEHH4+B+SW2QAd7J8Ejm6pmgGvuDYidExQh8hOucKInBCgnG2Sm
 cwCZFdGefYFO6rCiQdRkCO/L71Obho8kdlQT9yooRHKqNL2vkbWBroVmztvW+Cn4wP6Y
 gk/V/Q/sOHbBZpRFo/5BOFeXLczrsgK6G3pArktv4bdhj2jdephtPQQ/GWwiXBGtPutc
 jMPySEK9yEOHT+ls8VUOl+FHSHx8f/QFOZDL8sei9/wbZRnU2hZq65ckVplMJI+RCkae
 0+0sl2zb+VWfgHMQl2eWuTGqJaANEZ8JUyBYI9M6f2myqRdg4F8FioJH4yIcafyxsZhh
 cTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SEwR5AH7SeLObOiQTUZKW2Fqaf8NIFre/dsfNL5A4Gg=;
 b=YkiZa1eICJs8V87yhNMPexpnwv4mR5Cel2UrWe4UttHwW04VcX8sUs3vM1vzZiI6Bu
 3Y2XvnTSijRrUyk7bR7MUWUr6mb1bxI4xtSReX8WonoUk6/XWD3JlXoEdQWsiOfs6XXj
 F2lA61gdcCrzwZO6HKOmbL0cfxcH9cf89xZciAxLvMckwnIJD4QshBU59Vv8IzKyRKc0
 zmIxdShh03LPBFJRCEyjz3Sb54/zf2S8BjjH//hB21QsXM/XUBXWCrPr8K++xgidGLGI
 vXbgkR0DryLcVbHBA3al09QZbiIK4NoBfvJLIaWXcqjIS34W7KzUpjGxPj+vL03z0236
 S2cw==
X-Gm-Message-State: AOAM532MK0bG7C0x1rYCJeqrMno+4R8yfiLxY5LbVH4k+5+s/orRQ7SB
 9t0H7lTpmuDi/uxsj78Xkrh5+WnaHnUvsIDdFiM=
X-Google-Smtp-Source: ABdhPJzAcbQnjh+a5AauqAwxzdIzaCH10XjGLunvqRIKjmzfsMepq8lc1tEdZniRj562iFHFQhGAPQxPNNg4HTaRtSo=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr40982945ybt.239.1615278952458; 
 Tue, 09 Mar 2021 00:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
In-Reply-To: <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Mar 2021 16:35:41 +0800
Message-ID: <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > On Mon, 8 Mar 2021 at 03:48, Jason Wang <jasowang@redhat.com> wrote:
> >> Do we need to care about other type of networking backends? E.g socket=
.
> >>
> >> Or at least we should keep the padding logic if we can't audit all of
> >> the backends.
> > I think the key thing we need to do here is make a decision
> > and be clear about what we're doing. There are three options
> > I can see:
> >
> > (1) we say that the net API demands that backends pad
> > packets they emit to the minimum ethernet frame length
> > unless they specifically are intending to emit a short frame,
> > and we fix any backends that don't comply (or equivalently,
> > add support in the core code for a backend to mark itself
> > as "I don't pad; please do it for me").
> >
> > (2) we say that the networking subsystem doesn't support
> > short packets, and just have the common code always enforce
> > padding short frames to the minimum length somewhere between
> > when it receives a packet from a backend and passes it to
> > a NIC model.
> >
> > (3) we say that it's the job of the NIC models to pad
> > short frames as they see them coming in.
> >
> > I think (3) is pretty clearly the worst of these, since it
> > requires every NIC model to handle it; it has no advantages
> > over (2) that I can see. I don't have a strong take on whether
> > we'd rather have (1) or (2): it's a tradeoff between whether
> > we support modelling of short frames vs simplicity of code.
> > I'd just like us to be clear about what point or points in
> > the code have the responsibility for padding short frames.
>
>
> I'm not sure how much value we can gain from (1). So (2) looks better to =
me.
>
> Bin or Philippe, want to send a new version?
>

I think this series does what (2) asks for. Or am I missing anything?

Regards,
Bin

