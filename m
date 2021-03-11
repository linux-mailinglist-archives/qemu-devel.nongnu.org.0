Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C3337001
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:28:50 +0100 (CET)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIYj-0005UK-4C
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKIXb-000501-UF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:27:39 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKIXZ-00028W-TW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:27:39 -0500
Received: by mail-yb1-xb31.google.com with SMTP id l8so21148211ybe.12
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67DYMBuMn0iCT0qftYUD9hlJns87k/ozXY7E3O4J4NA=;
 b=QJfu+Mb3vUXyYAhgg7zAiMUBxrc4+BqfJGYJoGrVBulqcR2VENwnTnHsc3EtOq9zZL
 7RckqpvxefDqcy/eHlQZTm76lCZXXU3Rueg0PmIsalIYU1NWKrB0uXaP68F3E7eiPcex
 lKnsIw3uFMvISgaYJycASi/uqHCffAj7Oaby1kwbqfgZn8LFNN5fTvPLOYjG0qByoO5y
 QaZYIwqGE5lS+Gw/K44ATxDiZvyhIAKgHF5KFVFmmjwwiKuNltruGsEDanRsfUp7fw+j
 aWHa8o/4qqJFXicvwTEDwrVtqO2M8a5MXQyvNOymB3S3WxdhmGr3i6jDeuKcAyusEL/c
 Cl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67DYMBuMn0iCT0qftYUD9hlJns87k/ozXY7E3O4J4NA=;
 b=rRT7aXTDL/kNz+e05tGU3ieeqNY8GG3W3SjzcjB9es/PAqjjV20saLF/6QBJqmcHAx
 z+I29U1aNyi0DGY3a5Wj16YNvW1UBqZpUjxhFnuuxFXeAkgIxXBSMaW14OUqsj1kN/Bw
 +P7WjjH+LCiRR3z7KS3bXdM9gyRw8t3g++ehkxRsyUvXCpBsUmONvivB+X416dGkCvWu
 3biQuEevL4tP+gmil0W4mqW4eeWHzTACk0EdXWnz9292JcFBhfd/t8eJok0CE7LqkFmT
 Kdyax9+lRoMhjmwDGfMGQTp5/MK11fckbV4YqEN0DrbFIp9cavAyB4fzRxmFD2Gey3l5
 Vqtw==
X-Gm-Message-State: AOAM530MygL7eS8LevlCPeC03zqNiUJvKVQ3dQasHtu5HARGimzcNiGJ
 rdUmab+BDGXK1Gxv91Nb4mm0G3b6qgVNQSlaQdc=
X-Google-Smtp-Source: ABdhPJyJ7qRCFOAijrOsBAIQ/eDwJ4ZoP5pOrAumiVcCp2mrTyoDPWqsX5pd/9jkLjc7pyl9cGOAtn0vZPavss1QTJU=
X-Received: by 2002:a25:d28b:: with SMTP id j133mr9785435ybg.517.1615458456912; 
 Thu, 11 Mar 2021 02:27:36 -0800 (PST)
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
 <CAFEAcA8_j6q8PweuoUVyW+BAGojZ8HdNnedrZwQNcBFWbn9Kbg@mail.gmail.com>
 <CAEUhbmW1pz0=TgwF12j5pQUaCGSLPumb5-yiy32PKfdTvvdpVQ@mail.gmail.com>
 <CAFEAcA8gwa2NGF2s3f=hO+EaVSJNDJrKz7xG60eSm68-CXf-mw@mail.gmail.com>
In-Reply-To: <CAFEAcA8gwa2NGF2s3f=hO+EaVSJNDJrKz7xG60eSm68-CXf-mw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 18:27:25 +0800
Message-ID: <CAEUhbmWPWA_0wWBzacu1K2Kx+A2dgmFs89TQrbcG52mX=P5o7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 11 Mar 2021 at 09:58, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Mar 11, 2021 at 5:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wrote:
> > > > And after a discussion 10 years ago [1]. Michael (cced) seems to want to
> > > > keep the padding logic in the NIC itself (probably with a generic helper
> > > > in the core). Since 1) the padding is only required for ethernet 2)
> > > > virito-net doesn't need that (it can pass incomplete packet by design).
> > >
> > > Like I said, we need to decide; either:
> > >
> > >  (1) we do want to support short packets in the net core:
> > > every sender needs to either pad, or to have some flag to say
> > > "my implementation can't pad, please can the net core do it for me",
> > > unless they are deliberately sending a short packet. Every
> > > receiver needs to be able to cope with short packets, at least
> > > in the sense of not crashing (they should report them as a rx
> > > error if they have that kind of error reporting status register).
> > > I think we have mostly implemented our NIC models this way.
> > >
> > >  (2) we simply don't support short packets in the net core:
> > > nobody (not NICs, not network backends) needs to pad, because
> > > they can rely on the core to do it. Some existing senders and
> > > receivers may have now-dead code to do their own padding which
> > > could be removed.
> > >
> > > MST is advocating for (1) in that old thread. That's a coherent
> > > position.
> >
> > But it's a wrong approach. As Edgar and Stefan also said in the old
> > discussion thread, padding in the RX is wrong as real world NICs don't
> > do this.
>
> Neither option (1) nor option (2) involve padding in RX.

Correct. What I referred to is the current approach used in many NIC
modes, which is wrong, and we have to correct this.

>
> Option (1) is:
>  * no NIC implementation pads on TX, except as defined
>    by whatever NIC-specific config registers or h/w behaviour
>    might require (ie if the guest wants to send a short packet
>    it can do that)
>  * non-NIC sources like slirp need to pad on TX unless they're
>    deliberately trying to send a short packet
>  * all receivers of packets need to cope with being given a
>    short packet; this is usually going to mean "flag it to the
>    guest as an RX error", but exact behaviour is NIC-dependent
>

My patch series in RFC v2/v3 does almost exactly this option (1),
except "flag it to the guest as an RX error".

> Option (2) is:
>  * the net core code pads any packet that goes through it
>  * no NIC implementation needs to pad on TX (it is harmless if they do)
>  * non-NIC sources don't need to pad on TX
>  * no receivers of packets need to cope with being given short packets
>
> Option 1 is what the real world does. Option 2 is a simplification
> which throws away the ability to emulate handling of short packets,
> in exchange for not having to sort out senders like slirp and not
> having to be so careful about short-packet handling in NIC models.
>
> If MST is correct that some use cases require short-packet support,
> then we need to go for option 1, I think.

Regards,
Bin

