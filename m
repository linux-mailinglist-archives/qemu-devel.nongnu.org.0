Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16AD336FE0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:23:37 +0100 (CET)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKITg-0003br-Oy
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKISb-00030K-V6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:22:29 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKISa-00073d-4Z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:22:29 -0500
Received: by mail-ed1-x534.google.com with SMTP id bf3so1938587edb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EDlZIFc5Aw3ddoZcVJQW9e/PTEnQji8LVAOTTiSjRbU=;
 b=X995OYH/juizriNEYzBGeY2IVB9Ssl2yhowc87EjlMPgaigdIVJlGJ9BwDVs2RSWFU
 cNZ4f5YkAehiPbN5iCOkBDhuo1uUMMg04u/HnpqV/Bszw4ZHD0TE0EtU/G7345J5V2yP
 9esFAEj8SI6QYNl0C0M84zs1UkkIfGG0AgZrNvBU5R6LO2dGy51t/msKHgGbC0yBDT4p
 EroRvKCpJH/aUEEsOT1ArOHtSyJ5kJPfgFRPO1k4OK4nmejcHDQg9IArjouiNT6/Sslj
 GX4Y/fLku/ujdTw0Nr6uXV0YQ+QglCC/7RGaM03pWinJD24C8tL0CaBysnemQUP/OrCo
 jssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDlZIFc5Aw3ddoZcVJQW9e/PTEnQji8LVAOTTiSjRbU=;
 b=fiP9dndd381GtSBPqTHpgNbZORH9YpUhQa/LGNwE6EjqhiydQsQEm2OyJ+xe+m58jA
 XD9IFYSkeTY/lZjkhEd7dwGB729uCiDwJ9MSaF1nJcSdn7ZSAfjywasawOhUcnJFH2uP
 dH5nQ2TR74FixY/SfgrQhl930sey6PfhQMDjcfhecC8HaNbM+Xva4br/HL7gRWkzIv+k
 wh+AEoJ3lZlaYK8rUvU7LV5g2LdCewQy2oObmA9fVO+9eMnNMoDVZndDinXYTxL/1O70
 3tgzdOmuSABKANWlSY53KKZZeO8Zer0T6TUh8fZzf3mNxdlPhelmSeIsMAx6RmdBPOrT
 j2CQ==
X-Gm-Message-State: AOAM5313GVSzWKZojfKyfh7P2quzvM6Rdhg33QQRxS9cJw/ba0WDrVuN
 Czv4lBtklNFSlErt4wuxRKeK/rmKnPuITu2vUPC9Gw==
X-Google-Smtp-Source: ABdhPJwkkftzz8nrkVU2zE4ep5HPZenzuTY1ffpS2lexiY4I2HT4IfQgq9GcgbjS2/3CmcVSEcOYavZ2iPWVvcssajQ=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr7666524edu.100.1615458146457; 
 Thu, 11 Mar 2021 02:22:26 -0800 (PST)
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
In-Reply-To: <CAEUhbmW1pz0=TgwF12j5pQUaCGSLPumb5-yiy32PKfdTvvdpVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 10:22:07 +0000
Message-ID: <CAFEAcA8gwa2NGF2s3f=hO+EaVSJNDJrKz7xG60eSm68-CXf-mw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 09:58, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 5:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wrote:
> > > And after a discussion 10 years ago [1]. Michael (cced) seems to want to
> > > keep the padding logic in the NIC itself (probably with a generic helper
> > > in the core). Since 1) the padding is only required for ethernet 2)
> > > virito-net doesn't need that (it can pass incomplete packet by design).
> >
> > Like I said, we need to decide; either:
> >
> >  (1) we do want to support short packets in the net core:
> > every sender needs to either pad, or to have some flag to say
> > "my implementation can't pad, please can the net core do it for me",
> > unless they are deliberately sending a short packet. Every
> > receiver needs to be able to cope with short packets, at least
> > in the sense of not crashing (they should report them as a rx
> > error if they have that kind of error reporting status register).
> > I think we have mostly implemented our NIC models this way.
> >
> >  (2) we simply don't support short packets in the net core:
> > nobody (not NICs, not network backends) needs to pad, because
> > they can rely on the core to do it. Some existing senders and
> > receivers may have now-dead code to do their own padding which
> > could be removed.
> >
> > MST is advocating for (1) in that old thread. That's a coherent
> > position.
>
> But it's a wrong approach. As Edgar and Stefan also said in the old
> discussion thread, padding in the RX is wrong as real world NICs don't
> do this.

Neither option (1) nor option (2) involve padding in RX.

Option (1) is:
 * no NIC implementation pads on TX, except as defined
   by whatever NIC-specific config registers or h/w behaviour
   might require (ie if the guest wants to send a short packet
   it can do that)
 * non-NIC sources like slirp need to pad on TX unless they're
   deliberately trying to send a short packet
 * all receivers of packets need to cope with being given a
   short packet; this is usually going to mean "flag it to the
   guest as an RX error", but exact behaviour is NIC-dependent

Option (2) is:
 * the net core code pads any packet that goes through it
 * no NIC implementation needs to pad on TX (it is harmless if they do)
 * non-NIC sources don't need to pad on TX
 * no receivers of packets need to cope with being given short packets

Option 1 is what the real world does. Option 2 is a simplification
which throws away the ability to emulate handling of short packets,
in exchange for not having to sort out senders like slirp and not
having to be so careful about short-packet handling in NIC models.

If MST is correct that some use cases require short-packet support,
then we need to go for option 1, I think.

thanks
-- PMM

