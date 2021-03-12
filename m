Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6333863F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:55:06 +0100 (CET)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbhR-0007gB-2L
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKbg5-0006iQ-4t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:53:41 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:40117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKbg2-0003rq-Op
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:53:40 -0500
Received: by mail-yb1-xb31.google.com with SMTP id c131so24301139ybf.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 22:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bL7TxPI5yDFKrq1lCBu1ssG+TEgQHjWRxCE+Z3ODoxQ=;
 b=isk0YQl3fFW0goofMarER6fhgWhNxKWUMD0TdxtaC9AUDD3XTByoI1vIP3B1Pplk53
 9G8+QPs1UcnE/o9ygBc33lSzB4Urr5Po6kNMh+XMw44xUD6xJnVj3eHVZHxa660iKdFf
 NxfKwvixKX1mi65Lmow0MORRzAW39W2be2LYKvCq6y9BEMsdalJC0hiFwj+ZpWDMqc4E
 hQ/4p8DJqH7QhOQXARlMdDekcSZehoyAN9+SCJJRw4N79TXBny2xiLXwkkvg8LecOVnp
 vvJXJGUodXdHc3Vww/M0sb3LvZJksF2zdzxIgYrDEhK9/SX0V4mOrzSD1LmNE/NBnY4D
 WbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bL7TxPI5yDFKrq1lCBu1ssG+TEgQHjWRxCE+Z3ODoxQ=;
 b=hZ9EUDYeXDmG19sw6GOSE2WfpA98eGiwOgbHrdNi9+mgNBfIhNUHM2Fl2bw4awjmgU
 hi4Bsydqc1X61xdGzmhkNAbUVxHk6p9yThvWz3xXa9kw7/SYss9cYo/TWuQcXjo7M4EU
 0NBG/ZIqraWHiFRsG6GnbJsDUkboFqMekwGBxsL84P2Aq9dwCoAB4U6IANYMcRABdtRz
 ro0gjpoOoc6lL1Z3PxnlGpkK5nWNN8I6XMbyJEYLh6XKp1SF6Lc0GZnYTbfPzx6/YY3a
 jfF8ZNCKHiGyBIDlNM3e4AKmfqgdtAkaZk6qZoyJYb9BphfgV6aAtSjRRx6IuTEGWiVm
 l0Kg==
X-Gm-Message-State: AOAM5318awIykokjn/3i4XjVf4Q/wyDowWNZNz4P4Q7RY9Oboh+nkeVt
 evryvgoL3u0XNvRzr6TUe8zo1QExV9lEukkWZRA=
X-Google-Smtp-Source: ABdhPJwS/S0wWhdvDpt+UzBxTopDL7LY2yyjLD9ejijoUuEz3fnn6lNS/XV51/hRtA6d/1vK+y50qAnlA0KlvwNIeUs=
X-Received: by 2002:a25:8712:: with SMTP id a18mr17179446ybl.306.1615532017535; 
 Thu, 11 Mar 2021 22:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
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
 <CAEUhbmWPWA_0wWBzacu1K2Kx+A2dgmFs89TQrbcG52mX=P5o7Q@mail.gmail.com>
 <4cc1bcb9-2288-ac03-4a5f-a1ebad4d34ef@redhat.com>
 <CAEUhbmWmU9=WyESkdRbQp5DQrNQbf_q4mZZrOHXTH+tYavpTMA@mail.gmail.com>
 <a241a760-1758-0e78-5f7e-50f778171fdb@redhat.com>
In-Reply-To: <a241a760-1758-0e78-5f7e-50f778171fdb@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 12 Mar 2021 14:53:26 +0800
Message-ID: <CAEUhbmX53nSdgGEVaSaBti1gmsmjgeaaoLrPSsb-h9VGUawZJw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 2:50 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/12 2:28 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> > On Fri, Mar 12, 2021 at 2:23 PM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/3/11 6:27 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> >>> On Thu, Mar 11, 2021 at 6:22 PM Peter Maydell <peter.maydell@linaro.o=
rg> wrote:
> >>>> On Thu, 11 Mar 2021 at 09:58, Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>> On Thu, Mar 11, 2021 at 5:43 PM Peter Maydell <peter.maydell@linaro=
.org> wrote:
> >>>>>> On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>>>> And after a discussion 10 years ago [1]. Michael (cced) seems to =
want to
> >>>>>>> keep the padding logic in the NIC itself (probably with a generic=
 helper
> >>>>>>> in the core). Since 1) the padding is only required for ethernet =
2)
> >>>>>>> virito-net doesn't need that (it can pass incomplete packet by de=
sign).
> >>>>>> Like I said, we need to decide; either:
> >>>>>>
> >>>>>>    (1) we do want to support short packets in the net core:
> >>>>>> every sender needs to either pad, or to have some flag to say
> >>>>>> "my implementation can't pad, please can the net core do it for me=
",
> >>>>>> unless they are deliberately sending a short packet. Every
> >>>>>> receiver needs to be able to cope with short packets, at least
> >>>>>> in the sense of not crashing (they should report them as a rx
> >>>>>> error if they have that kind of error reporting status register).
> >>>>>> I think we have mostly implemented our NIC models this way.
> >>>>>>
> >>>>>>    (2) we simply don't support short packets in the net core:
> >>>>>> nobody (not NICs, not network backends) needs to pad, because
> >>>>>> they can rely on the core to do it. Some existing senders and
> >>>>>> receivers may have now-dead code to do their own padding which
> >>>>>> could be removed.
> >>>>>>
> >>>>>> MST is advocating for (1) in that old thread. That's a coherent
> >>>>>> position.
> >>>>> But it's a wrong approach. As Edgar and Stefan also said in the old
> >>>>> discussion thread, padding in the RX is wrong as real world NICs do=
n't
> >>>>> do this.
> >>>> Neither option (1) nor option (2) involve padding in RX.
> >>> Correct. What I referred to is the current approach used in many NIC
> >>> modes, which is wrong, and we have to correct this.
> >>>
> >>>> Option (1) is:
> >>>>    * no NIC implementation pads on TX, except as defined
> >>>>      by whatever NIC-specific config registers or h/w behaviour
> >>>>      might require (ie if the guest wants to send a short packet
> >>>>      it can do that)
> >>>>    * non-NIC sources like slirp need to pad on TX unless they're
> >>>>      deliberately trying to send a short packet
> >>>>    * all receivers of packets need to cope with being given a
> >>>>      short packet; this is usually going to mean "flag it to the
> >>>>      guest as an RX error", but exact behaviour is NIC-dependent
> >>>>
> >>> My patch series in RFC v2/v3 does almost exactly this option (1),
> >>> except "flag it to the guest as an RX error".
> >>
> >> Is it? You did it at net core instead of netdevs if I read the code
> >> correctly.
> >>
> > Literally I don't see Peter requested option (1) to be done in net
> > core or net devs.
> >
> > If doing it in netdevs, the following codes need to be duplicated in
> > both SLiRP and TAP codes.
> >
> > if (sender->info->type =3D=3D NET_CLIENT_DRIVER_USER ||
> >      sender->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> >      do the short frames padding;
> > }
>
>
> So my understanding is that it's better to be done at netdev where we
> know whether it's a ethernet dev, core should be protocol independent.

OK, will change to pad short frames in SLiRP and TAP codes in the next vers=
ion.

Regards,
Bin

