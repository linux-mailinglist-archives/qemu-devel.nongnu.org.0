Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE59336A78
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:13:53 +0100 (CET)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBlo-0000AY-2C
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBkP-0007vv-Rq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:12:25 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBkN-0007jb-RF
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:12:25 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id b10so20226644ybn.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UpmFqUlcpPUxNYqZ/E+6okbuZOqTn6bIrb73hqxQzwM=;
 b=ZZhXuhg3VLvWOQwF5vV9T5IW5wTaJ24Raaskw1wJeoDT2q8w8RojbrNeT06ACJATVx
 VvLT+gWXkW/VrtsHkWMxZePisOTrMmGcALiytfr3LNdAUPS5hHjGrf1SnPTqSWb08iFN
 XAWaOB2aSgHypVBqk8PUYFDmhI3A0wSjb6FkYDqCyE+c/w4eKplMZTS98dCjqolRbSgG
 DO7Wfjw/2//0a0j0tvoPpHgT4RzMIL5XIvwR67SyJSWluhVxdyfrlIBe1t368XGOcK8l
 geNSei4IjgPwhlS3G/kHsGloN4A/VDAzCcXmGaKcwy4PRLJcXDsi4yoUoL6P2PBL287B
 yewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UpmFqUlcpPUxNYqZ/E+6okbuZOqTn6bIrb73hqxQzwM=;
 b=CVWkxnDhCVObUqv2HFnIIdwNXRgDDjVQusFE7hctF6g+QFldIzU8ISNTHVTnW51C+P
 /eW4+PXqenb8HEIcTngTIxKZ1Tkj7CHsUbhdGahfaSF3JjJbVS3s+dovn+bsaREyfIYZ
 ST1t7Ed7O7dPbfT58kKsTt8GqQ6O0rVg2LMm9qPfAVs93nxS6myOOq85pA0fmxboRjK3
 l242cLRngt+g7D2eHGpTqfsYGPTmF1uDzZqYIf3sToTN8NGqDmKeVRFPs9iwI93MA3zZ
 qE2kubCMmGnD4vppCRKGNqqQNTILt1CxTw4fxmR9HuoL1MuEjG0OP6Gba/PUy58QyfUW
 QP5Q==
X-Gm-Message-State: AOAM532ld360iC2VAgNrGg+eGENtT4oeOG9RoWQQGfNNrzO0+xTLizEA
 gLZ8eOAAv+xVTEpPoOfWs42c1oOy5RK4Qc5UoA4=
X-Google-Smtp-Source: ABdhPJx+ARgwu5TORTB9FEjVy+eIfDjvpGq6LmexOn30DcoeAQAY3oJ7xfoJ9RFtHZ/4MWYAoyh5UwgQCsRq1ViAPhU=
X-Received: by 2002:a25:d28b:: with SMTP id j133mr8134100ybg.517.1615432342763; 
 Wed, 10 Mar 2021 19:12:22 -0800 (PST)
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
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 11:12:11 +0800
Message-ID: <CAEUhbmWVpTN4CofUOCYkdFBvyBDQui-wkJtVjrj5Y+E7tDCWRw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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

On Thu, Mar 11, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/9 6:13 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
> >> Hi Jason,
> >>
> >> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>> Hi Jason,
> >>>
> >>> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>>
> >>>> On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> >>>>> Hi Jason,
> >>>>>
> >>>>> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wro=
te:
> >>>>>> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> >>>>>>> I think the key thing we need to do here is make a decision
> >>>>>>> and be clear about what we're doing. There are three options
> >>>>>>> I can see:
> >>>>>>>
> >>>>>>> (1) we say that the net API demands that backends pad
> >>>>>>> packets they emit to the minimum ethernet frame length
> >>>>>>> unless they specifically are intending to emit a short frame,
> >>>>>>> and we fix any backends that don't comply (or equivalently,
> >>>>>>> add support in the core code for a backend to mark itself
> >>>>>>> as "I don't pad; please do it for me").
> >>>>>>>
> >>>>>>> (2) we say that the networking subsystem doesn't support
> >>>>>>> short packets, and just have the common code always enforce
> >>>>>>> padding short frames to the minimum length somewhere between
> >>>>>>> when it receives a packet from a backend and passes it to
> >>>>>>> a NIC model.
> >>>>>>>
> >>>>>>> (3) we say that it's the job of the NIC models to pad
> >>>>>>> short frames as they see them coming in.
> >>>>>> I'm not sure how much value we can gain from (1). So (2) looks bet=
ter to me.
> >>>>>>
> >>>>>> Bin or Philippe, want to send a new version?
> >>>>>>
> >>>>> I think this series does what (2) asks for. Or am I missing anythin=
g?
> >>>>
> >>>> It only did the padding for user/TAP.
> >> (hit send too soon ...)
> >>
> >> Ah, so we want this:
> >>
> >> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
> >>
> >> correct?
> > No, option (2) is "always pad short packets regardless of
> > sender->info->type". Even if a NIC driver sends out a short
> > packet, we want to pad it, because we might be feeding it to
> > something that assumes it does not see short packets.
> >
> > thanks
> > -- PMM
>
>
> So I'm not sure this is correct. There're NIC that has its own logic
> that choose whether to pad the frame during TX (e.g e1000).

Yes, that's why I mentioned in v2's cover letter that we should
probably only do the padding for SLiRP and TAP. For NIC models, we can
still support sending short frames in QEMU.

>
> And after a discussion 10 years ago [1]. Michael (cced) seems to want to
> keep the padding logic in the NIC itself (probably with a generic helper
> in the core). Since 1) the padding is only required for ethernet 2)
> virito-net doesn't need that (it can pass incomplete packet by design).
>

I did read this discussion before working on this patch series.
Providing a helper for NICs to call does NOT fix the issue for SLiRP
and TAP.

> Thanks
>
> [1]
> https://patchwork.ozlabs.org/project/qemu-devel/patch/1284842625-13920-1-=
git-send-email-stefanha@linux.vnet.ibm.com/
>

Regards,
Bin

