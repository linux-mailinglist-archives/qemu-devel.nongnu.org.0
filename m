Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254E336D31
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:36:37 +0100 (CET)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKFs3-0006TX-Ja
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKFqu-0005xw-GL
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:35:24 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKFqp-0004zT-Km
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:35:23 -0500
Received: by mail-yb1-xb36.google.com with SMTP id u75so20702705ybi.10
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 23:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c4AHkVPVtv8ExDxydo1Kt1JJBZfsld8ySwTJZrk/qoQ=;
 b=XU0+mpYydjVu5BCA/2ihSF1nAOxmg0EAUCP2HSWXZU7XD9QHxDGaX1ufX0+clQZVXC
 TCN7uu9QK/VXug6BMdOC6M563gOJjNWHrXgVbePZJm7ov1OBNLlmS+tiEjkjuSUUixvX
 Ko/zQN7DWZ6HBQ0zPKTyetBlDDfBFeiwvwYvKayhgGu5QBzIbELNlhTreBmcscq5QtUP
 3FycXMQ8pe3SiOPr99922aMDnBmlEZUGcaOsJe/SU0O/s9KoDuuuGyKY1l4U0rMCtXuH
 judF5hek44sWmwq9r6Bg107wtHcc3xlmw8oWeucgwSHA9IHhDNRKWuS96N30urgS+P3U
 SRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c4AHkVPVtv8ExDxydo1Kt1JJBZfsld8ySwTJZrk/qoQ=;
 b=Z5MN7TcHv+ErVxLSA+y9F7TR1U4BGrm7mQVIY5SOoEeKBQfW5f9BRag8SkrNP0yTUE
 T8OO2BnKI+o2CVmN6gsApgDyafUga2dPLzAjd4l80sYmlxpCoeTr2ui1mQGZVJpYRd9N
 niE9fw5I39HMEZ0247jZ01PBn+J93iweLn6FC8FxzIXOicyZ8snV646yfePlAalL+nKo
 Ga4X8oM3VAmT0JLt2hGZ/lTHk8QmzLIUvDN0Fr1d5Q6GInRrar5OlaZ3puYnjSwe8I7b
 4VH5XUwujq2pXXsZ/WwZZWxagw3cdYu6xxVjfsoXWEeypHXkdBymGYDdzL+n2qudPhO6
 mm7Q==
X-Gm-Message-State: AOAM532NuQrz8iZOlDQCzyZ1i+qeY9cEuJBfhSHrvx6H3t3B9LPZWVRM
 Ydss/FotGPNvMg+He0/YkmtWqqAmgoPsUuIYDiY=
X-Google-Smtp-Source: ABdhPJx6E7XvnBG9qFB9Yvh3zDXtKnpOr61f8az6RZBaHvPfGE513fHuJKdE3ZKDrD/lIbhTfWnKboBIm7rtQlE7roc=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr10260295ybt.239.1615448117513; 
 Wed, 10 Mar 2021 23:35:17 -0800 (PST)
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
 <CAEUhbmWVpTN4CofUOCYkdFBvyBDQui-wkJtVjrj5Y+E7tDCWRw@mail.gmail.com>
 <f5d819f2-16f1-9ffd-74be-c2a2614dc52d@redhat.com>
In-Reply-To: <f5d819f2-16f1-9ffd-74be-c2a2614dc52d@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 15:35:06 +0800
Message-ID: <CAEUhbmWMJSp8AUPNX8HhhTjN9R+q-Z6O3RWgmNHJov4HX_=DcA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 11:33 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/11 11:12 =E4=B8=8A=E5=8D=88, Bin Meng wrote:
> > On Thu, Mar 11, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>
> >> On 2021/3/9 6:13 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> >>> On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>> Hi Jason,
> >>>>
> >>>> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>> Hi Jason,
> >>>>>
> >>>>> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>>> On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> >>>>>>> Hi Jason,
> >>>>>>>
> >>>>>>> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> w=
rote:
> >>>>>>>> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> >>>>>>>>> I think the key thing we need to do here is make a decision
> >>>>>>>>> and be clear about what we're doing. There are three options
> >>>>>>>>> I can see:
> >>>>>>>>>
> >>>>>>>>> (1) we say that the net API demands that backends pad
> >>>>>>>>> packets they emit to the minimum ethernet frame length
> >>>>>>>>> unless they specifically are intending to emit a short frame,
> >>>>>>>>> and we fix any backends that don't comply (or equivalently,
> >>>>>>>>> add support in the core code for a backend to mark itself
> >>>>>>>>> as "I don't pad; please do it for me").
> >>>>>>>>>
> >>>>>>>>> (2) we say that the networking subsystem doesn't support
> >>>>>>>>> short packets, and just have the common code always enforce
> >>>>>>>>> padding short frames to the minimum length somewhere between
> >>>>>>>>> when it receives a packet from a backend and passes it to
> >>>>>>>>> a NIC model.
> >>>>>>>>>
> >>>>>>>>> (3) we say that it's the job of the NIC models to pad
> >>>>>>>>> short frames as they see them coming in.
> >>>>>>>> I'm not sure how much value we can gain from (1). So (2) looks b=
etter to me.
> >>>>>>>>
> >>>>>>>> Bin or Philippe, want to send a new version?
> >>>>>>>>
> >>>>>>> I think this series does what (2) asks for. Or am I missing anyth=
ing?
> >>>>>> It only did the padding for user/TAP.
> >>>> (hit send too soon ...)
> >>>>
> >>>> Ah, so we want this:
> >>>>
> >>>> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
> >>>>
> >>>> correct?
> >>> No, option (2) is "always pad short packets regardless of
> >>> sender->info->type". Even if a NIC driver sends out a short
> >>> packet, we want to pad it, because we might be feeding it to
> >>> something that assumes it does not see short packets.
> >>>
> >>> thanks
> >>> -- PMM
> >>
> >> So I'm not sure this is correct. There're NIC that has its own logic
> >> that choose whether to pad the frame during TX (e.g e1000).
> > Yes, that's why I mentioned in v2's cover letter that we should
> > probably only do the padding for SLiRP and TAP.
>
>
> Actually it's a partail implementation of Peter's method 1. If we go
> that way, you need to make sure the packet is padded for every ethernet
> backend not just TAP and SLIRP.
>

This latest version series implemented the method 1, except for
providing a flag to indicate when NIC can send short frames and not
pad in the network codes.

>
> >   For NIC models, we can
> > still support sending short frames in QEMU.
>
>
> Then it will be padded as well.
>
>
> >
> >> And after a discussion 10 years ago [1]. Michael (cced) seems to want =
to
> >> keep the padding logic in the NIC itself (probably with a generic help=
er
> >> in the core). Since 1) the padding is only required for ethernet 2)
> >> virito-net doesn't need that (it can pass incomplete packet by design)=
.
> >>
> > I did read this discussion before working on this patch series.
> > Providing a helper for NICs to call does NOT fix the issue for SLiRP
> > and TAP.
>
>
> I'm not sure I get here.
>
> For TX, the padding is controlled by the guest driver. So we just need
> to emulate what real NIC did, pad only when it was required explicitly
> by the driver.

Correct, version 2 of the RFC series do allow NIC models to send short
frames, but the latest version changed to pad short frames for every
network backends including NICs.

>
> For RX, if we receive short frames from an ethternet backend, we simply
> pad them to make sure it won't be dropped by the NIC model.
>

No, we don't do this. Hardware NICs don't do such. They either simply
drop the short frames, or receive it as it is.

> So we're actually fine here?
>

Regards,
Bin

