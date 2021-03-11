Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF2336F65
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:00:04 +0100 (CET)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKI6t-0001ez-LE
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKI5S-00015u-8I
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:58:34 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:40395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKI5Q-00088p-LB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:58:33 -0500
Received: by mail-yb1-xb32.google.com with SMTP id c131so21086753ybf.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 01:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LvcU97UmRDhfmkrSoseZQvgmKRnl43gU1f4zxjsWOTU=;
 b=aZeWdPORLq5Vmty32i5MWttJsU8XEW4pwL2KIJ9DGLGqpVPohL4Xe4xICYKicsQUQc
 qEYIE2r0PIBMeZjBu9oVjEcIG+3G3XAX8qXlQ+VmnDx8ruObK79KHvM8ljJUirpltryV
 iM+cw65KKVFRU4+nEi0JNJKKfMAOwF7tSMJRPu2blKWjMhqC99f9JIjiJ7kPYUoGSYqa
 eWizMSpVEt7KZtJ3J7S/fCb9RkNZcWXT8pWcMeum9EIhOeIQDPBF3grn+BNr5kW3Qi6R
 hncSkyzGTGmQdpF3NgawETMoPHwdMx/axbMhqWCT/f86gIy4ZDkokdeiDJLVgnykuvFO
 QDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LvcU97UmRDhfmkrSoseZQvgmKRnl43gU1f4zxjsWOTU=;
 b=eYtcvtIsB0w+hx8V1jZuSXFXQKOeZieqxq0uzQuDenL7Zv8etJmEhzovbyPbVR7ZD1
 UQmkeX9W34NQ35FP/PG4De8jMi0oJFgHDkgteiIgRXp9UJi0GVf86IxxJt6c1hxJdCD+
 QwE6DwJf95Y/ogoLlM5SlrAvPK1JB+z4mQeW4BkpLfpb5RVK9w5f1xGyyFF+WJFKreio
 oe3VDPDslIh+qpUAPAfe4msjjGD0AamfeQ4I9xxIi6kYJAM+CKl9H7pvIejVGHht67Tp
 7L9gerChFfb1fynHTmNmGDjofPEjZOXE7moIvZ1Ndn6nuvgCMYSaEzCXqkQ9oFY8W7Cf
 jl8A==
X-Gm-Message-State: AOAM532bLGy4eZvVaV0pO4M6U0dhPnj67CsUC+9Lg+SGje/wvQDL3Wah
 ccFXPuCeyQ1yauwpb5JIqHALE+9951S1E1jMyZw=
X-Google-Smtp-Source: ABdhPJzZCkFwU9wU45rSQmmwfVpZ7cHPyPqS85md2gNRvp/TsUy4uHz+rEWnpIL7of5Rbr8kgkjMtWkjHvsNI/MoHlU=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr10048441ybf.314.1615456711220; 
 Thu, 11 Mar 2021 01:58:31 -0800 (PST)
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
In-Reply-To: <CAFEAcA8_j6q8PweuoUVyW+BAGojZ8HdNnedrZwQNcBFWbn9Kbg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 17:58:19 +0800
Message-ID: <CAEUhbmW1pz0=TgwF12j5pQUaCGSLPumb5-yiy32PKfdTvvdpVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 5:43 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > On 2021/3/9 6:13 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > > On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >> Ah, so we want this:
> > >>
> > >> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
> > >>
> > >> correct?
>
> > > No, option (2) is "always pad short packets regardless of
> > > sender->info->type". Even if a NIC driver sends out a short
> > > packet, we want to pad it, because we might be feeding it to
> > > something that assumes it does not see short packets.
> >
> > So I'm not sure this is correct. There're NIC that has its own logic
> > that choose whether to pad the frame during TX (e.g e1000).
>
> Yes; that would be dead-code if we go for "always pad", the same
> as the code in devices to handle incoming short packets would also
> be dead.
>
> > And after a discussion 10 years ago [1]. Michael (cced) seems to want t=
o
> > keep the padding logic in the NIC itself (probably with a generic helpe=
r
> > in the core). Since 1) the padding is only required for ethernet 2)
> > virito-net doesn't need that (it can pass incomplete packet by design).
>
> Like I said, we need to decide; either:
>
>  (1) we do want to support short packets in the net core:
> every sender needs to either pad, or to have some flag to say
> "my implementation can't pad, please can the net core do it for me",
> unless they are deliberately sending a short packet. Every
> receiver needs to be able to cope with short packets, at least
> in the sense of not crashing (they should report them as a rx
> error if they have that kind of error reporting status register).
> I think we have mostly implemented our NIC models this way.
>
>  (2) we simply don't support short packets in the net core:
> nobody (not NICs, not network backends) needs to pad, because
> they can rely on the core to do it. Some existing senders and
> receivers may have now-dead code to do their own padding which
> could be removed.
>
> MST is advocating for (1) in that old thread. That's a coherent
> position.

But it's a wrong approach. As Edgar and Stefan also said in the old
discussion thread, padding in the RX is wrong as real world NICs don't
do this.

> You've said earlier that we want (2). That's also
> a coherent position. A mix of the two doesn't seem to
> me to be very workable.

Regards,
Bin

