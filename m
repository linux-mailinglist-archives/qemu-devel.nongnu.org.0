Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395C2F894C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:21:50 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YPd-0000aI-IB
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0YA7-0003DU-3E
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 18:05:47 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:38796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0YA5-0002jG-E9
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 18:05:46 -0500
Received: by mail-io1-xd29.google.com with SMTP id e22so21307659iom.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 15:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sc/OZLX6n5pPcUsomLQ1n2IqfgD/WRAqAY2BINg6eQg=;
 b=ZBYiEeed1AGfZXox25JZf93OJ/IKfYPePs0z8Qgx112fNlPDvclFYVs1/7kzb28/71
 hA2fSTfdxlvYh1jKuPunhe+PQFO7S6CCaLf1KCaVMxb2KbClFBiFdrpFUDmLKf8s3op2
 /o62F1wlc/t+1xkiQXXNYlGFi6zqGeKKs2j4f0Lolm2Q0iD5WsEA9eOVhpSyOxRQaPbU
 rzVQzb7XagUAw+NIUe+qenoMlRTBX2qe3HKvoH9Efm18iHHROWKLQdYlfAaQOWH7zQ+Z
 6XYhole9NyJpOfY+OGSzGMjgh6nE6XjxSU4pWxeDln4WpTef1d6RXOeA9EAN7HoNxPPr
 awTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sc/OZLX6n5pPcUsomLQ1n2IqfgD/WRAqAY2BINg6eQg=;
 b=Ct819+oS93cAK1Ji/JKwfzHWtExXVSbsIHNwA9QGkWCelt+GDQE1HrPgsQtHEz3vPx
 mllwfY9LQ1Ib/jLW/cXBlcpezMGcB3/Y+TDNB1NtVM2q2iqmJgQ6an3Ovl9J3/57Pir7
 dG9R8OXYIfnuV2A5LsDUmeY1WvtBTZk6pAhTO8+PsppO39CosRC46zPjhPoYB0pybJLr
 AlzeFqr/pSCZvy+lL8q3S1LJ1joco1wGhrbBEoc3tIJSn70wHb4QPJ7cw7VekQEa3NQa
 TTvFYGukjDqqc8AbBuaAwecyQjWgkS/MifYdGxmrAciNThj6VbGBoAtU83qbmbCtlp2Z
 NonQ==
X-Gm-Message-State: AOAM533TLFM5R1g2wLxZUR5go4hZFMCvGURMi13Kk1IFxDb6CUz4MOJW
 qFwb7GFg6/O+ihw7+aotMqdh7731BdqU9xFuXYY=
X-Google-Smtp-Source: ABdhPJyRDZcaXqHK/Fq64gHVKnPK8fCcL7v3f0v4MBisywTnE6FLedIOnxu477SMHcUO5Be69eInsosijAOIQBB7zFk=
X-Received: by 2002:a05:6e02:194f:: with SMTP id
 x15mr12988882ilu.177.1610751943289; 
 Fri, 15 Jan 2021 15:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
 <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
 <CAFEAcA9QrTA6bEiK608HfB9vfN66SGBPJw6pEDDk2YH3v4M8SQ@mail.gmail.com>
 <CAEUhbmX4GtWfU1Z+cbSb435MCgBo+OaLbSg0qP_mRgPxSJRLnQ@mail.gmail.com>
 <CAKmqyKP=URfpTZXsax=Xmvn9-cz0GY7C6eih+bdycZhRASH2Fw@mail.gmail.com>
 <CAFEAcA9m=y+V_euSE_gWcyeKBY=meTaroRcMdH9_CWtkUjVKWw@mail.gmail.com>
In-Reply-To: <CAFEAcA9m=y+V_euSE_gWcyeKBY=meTaroRcMdH9_CWtkUjVKWw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 15:05:17 -0800
Message-ID: <CAKmqyKMmt178QODH3vY1cq9jG8wsy8Awh6PUF1jS2bc1YzTkUA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:17 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 15 Jan 2021 at 21:43, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Jan 15, 2021 at 6:09 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Fri, Jan 15, 2021 at 9:55 PM Peter Maydell <peter.maydell@linaro.org> wrote
> > > > printf is definitely the wrong thing... you need to either report
> > > > the error back to the guest if the interface the guest is using
> > > > has a facility for reporting read/write failures, or log or report
> > > > it to the user using one of our APIs for that.
> > >
> > > It seems the hardware does not have a mechanism to report to the
> > > software when hardware cannot fulfill the task requested by software.
> > >
> > > I checked all existence of block_pwrite() callers. It looks like this
> > > is not handled consistently. Some indeed call printf(), some call
> > > error_setg_errno(), some call fprintf(stderr), some call qemu_log()
> > > ...
> >
> > Logging a guest error seems like the best bet, I'm not really sure
> > what else we would do.
>
> Looking at the other options, I think error_report() of some kind is
> probably the best bet here.

Ok

@Green Wan do you mind sending a new version?

Alistair

>
> thanks
> -- PMM

