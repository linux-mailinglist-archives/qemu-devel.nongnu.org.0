Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7437F336F1C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:45:48 +0100 (CET)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHt5-0007dO-46
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKHrN-0006hl-BB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:44:01 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKHrL-0007Qj-FW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:44:00 -0500
Received: by mail-ed1-x533.google.com with SMTP id dm8so1769787edb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sB2aHs0Y+3AFLBBaf7KmmINMm7Tiz5ZCMdeTFQx2y5w=;
 b=KMyoIXE3vAN4iEG4DYf2Wgl6CIfIdlXgkESM25x7qpeqJG+QOqLOmP2b01dEOejUNG
 QOppCZpJm4pSdJem08Ix6sSbYYJt0D0NPHkNKd2cOrdRbASk1Yyv/ZFw7Ti2nCcrWml8
 T9oeMAUUV5oVNvVgOGfyuzqTmzWL0wnC21S9DSmt6VTyFehdYtnG/Ps0JBeuIU0+WjKa
 1DGH3zzDfU7rLP1FjVbKDpsHdwU3hnnuq4x6uvHyFz7nrpoF8C8NgIajIC8YD5EOqtHQ
 bTtSlozIUZVMU7u4JyP0DmJOicneTFx6CTvSTrF2eR+09dbCWEN5qQSq8O3lZMuD+V8H
 H4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sB2aHs0Y+3AFLBBaf7KmmINMm7Tiz5ZCMdeTFQx2y5w=;
 b=KavpGrmtL+YHAZEvw7uGvEDZTS5fAz/Dnx/b8w5N57rY7fUp6J1JeGPrHdjZSo9x1c
 SkHE4RYGyleZeIkxxMfr21Pz6/AHxPm11Zb6S/ha0YDP+PwOBe/zpboWwHir6gKb5te+
 i0rt+zgd8uMAMQbDXqcSaJ9THOUsKrTubicVxs2uiHvwKScuEWmMaYUNT8TOvePfxDfW
 PDALppnF0u9DVtxPqM/O5ei2I6OpmAN5FiD7F2w80VFnT6vhs6CNjwgNOhYQxLnLT3P7
 +Ur7fB0ZGFI0ji29REL4la8aaEf3eOFG1j82Z7yDGqaGvRY8yDlVXpocKdcgYmMHMXsp
 3TfA==
X-Gm-Message-State: AOAM532GW/bJHghU0HuFs01oILUMM9ZL1wqWf1U6cynmRbnGhUhJbjNK
 HXmkBeCK/Dr3SWqkwv+wb/e72b5OcDhnYYmpLhuqnQ==
X-Google-Smtp-Source: ABdhPJweKpd8aHGJ7yBGjVN1+RjQVVMJ+owta1mniN1D5l4mJPwj0xT7XdySekTHQJVvgSuxjZ75pk6Bb0toqx58shc=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr7831914edr.146.1615455837410; 
 Thu, 11 Mar 2021 01:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
 <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
 <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
 <f682a3a0-cdb1-4746-ceed-c900c3f669ed@redhat.com>
In-Reply-To: <f682a3a0-cdb1-4746-ceed-c900c3f669ed@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 09:43:39 +0000
Message-ID: <CAFEAcA8_j6q8PweuoUVyW+BAGojZ8HdNnedrZwQNcBFWbn9Kbg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/9 6:13 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
> >> Ah, so we want this:
> >>
> >> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
> >>
> >> correct?

> > No, option (2) is "always pad short packets regardless of
> > sender->info->type". Even if a NIC driver sends out a short
> > packet, we want to pad it, because we might be feeding it to
> > something that assumes it does not see short packets.
>
> So I'm not sure this is correct. There're NIC that has its own logic
> that choose whether to pad the frame during TX (e.g e1000).

Yes; that would be dead-code if we go for "always pad", the same
as the code in devices to handle incoming short packets would also
be dead.

> And after a discussion 10 years ago [1]. Michael (cced) seems to want to
> keep the padding logic in the NIC itself (probably with a generic helper
> in the core). Since 1) the padding is only required for ethernet 2)
> virito-net doesn't need that (it can pass incomplete packet by design).

Like I said, we need to decide; either:

 (1) we do want to support short packets in the net core:
every sender needs to either pad, or to have some flag to say
"my implementation can't pad, please can the net core do it for me",
unless they are deliberately sending a short packet. Every
receiver needs to be able to cope with short packets, at least
in the sense of not crashing (they should report them as a rx
error if they have that kind of error reporting status register).
I think we have mostly implemented our NIC models this way.

 (2) we simply don't support short packets in the net core:
nobody (not NICs, not network backends) needs to pad, because
they can rely on the core to do it. Some existing senders and
receivers may have now-dead code to do their own padding which
could be removed.

MST is advocating for (1) in that old thread. That's a coherent
position. You've said earlier that we want (2). That's also
a coherent position. A mix of the two doesn't seem to
me to be very workable.

thanks
-- PMM

