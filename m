Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FEC3322C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:14:38 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZNt-0002Ov-85
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZN5-0001ve-Ts
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:13:48 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZN4-0005PY-7t
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:13:47 -0500
Received: by mail-ed1-x529.google.com with SMTP id d13so19098355edp.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JptKmCciQKIm2pW+rFmbb3pUD7FQjPTthC+u9k9mtBA=;
 b=VPvc/xWsXIVs+LYqiH9mgX+/s320yFcOHRBqLUqe+Vh6YX5RyxIhzliGzgJX/emvZz
 1zKl1zfS+DMLNuIa8F8ZBevY0rqcHceElwNYygZI9PAow7m5Fy/hmn9tu5O7OpawkTSR
 UwLM/nnaPEN6HWRODD4FuOi9NKZDnw5ru2LvWDwCT8NR7kxjz03wdaSmRy5hcCd7Bajs
 UbeCTKHYw8Mq7SFwvr5ZN7N+6ra0A9iFDskC1sj+1aWB8k62C2XDl7OkB7gwFV4Hdvde
 p0nt/e1iCa9BN+A1+TJiU6Br4eIvID1zQwhgOUnjkh14RdnGQ3tY0iQDRwBxgHufXuPz
 C+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JptKmCciQKIm2pW+rFmbb3pUD7FQjPTthC+u9k9mtBA=;
 b=CCKwfiI9iGZqsgsXq4MKIIpK2AF6IM2VuWF9tw/bmJ697jdHYuT1Vp3Y7RvvKILa9f
 +1m06ER69vMeXumKszM42UZI0C1Gc8A0Xo69pb0bOR3viiR3lee/Lo7r7UAewBd4RD6E
 tEamBzUyG+EUmbJ8aukTpouP7bdOpLs0+WO2KAB9i93pwvJAL/0jwkhlXRCd4OKjn+Jm
 PO3+yxzOlHjW9Do7OfE29EZAdwq8EZ/NonvCv1CQv/bEx2dQC+tIwN0Mr81nyFczJiFt
 u/sQVCKdBPKJosx0WfR/TCzwaBTchC7d6exF2p087mtbL1SawxZVWOVPTt9hdeV1ULLW
 f1+A==
X-Gm-Message-State: AOAM533fOFb0GX19212GU43+juZFu/1CCAxv6h6p9DE5JeVBZYHXhT9t
 lYJyhXZ9MecA1LZ54V1+SWfydgU1205/DlrsHpFqqA==
X-Google-Smtp-Source: ABdhPJxSXmMatzUssNzoiAoyge/BJregLf8BjxBNn5gWRtfnADV/J+A0K9LgB7KEVr+M+YIRHssWBIfZID8UeZ2Pwfo=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr3134355edu.100.1615284824622; 
 Tue, 09 Mar 2021 02:13:44 -0800 (PST)
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
In-Reply-To: <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 10:13:28 +0000
Message-ID: <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Jason,
>
> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Jason,
> >
> > On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> > > > Hi Jason,
> > > >
> > > > On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wro=
te:
> > > >>
> > > >> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > > >>> I think the key thing we need to do here is make a decision
> > > >>> and be clear about what we're doing. There are three options
> > > >>> I can see:
> > > >>>
> > > >>> (1) we say that the net API demands that backends pad
> > > >>> packets they emit to the minimum ethernet frame length
> > > >>> unless they specifically are intending to emit a short frame,
> > > >>> and we fix any backends that don't comply (or equivalently,
> > > >>> add support in the core code for a backend to mark itself
> > > >>> as "I don't pad; please do it for me").
> > > >>>
> > > >>> (2) we say that the networking subsystem doesn't support
> > > >>> short packets, and just have the common code always enforce
> > > >>> padding short frames to the minimum length somewhere between
> > > >>> when it receives a packet from a backend and passes it to
> > > >>> a NIC model.
> > > >>>
> > > >>> (3) we say that it's the job of the NIC models to pad
> > > >>> short frames as they see them coming in.

> > > >> I'm not sure how much value we can gain from (1). So (2) looks bet=
ter to me.
> > > >>
> > > >> Bin or Philippe, want to send a new version?
> > > >>
> > > > I think this series does what (2) asks for. Or am I missing anythin=
g?
> > >
> > >
> > > It only did the padding for user/TAP.
> >
>
> (hit send too soon ...)
>
> Ah, so we want this:
>
> if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
>
> correct?

No, option (2) is "always pad short packets regardless of
sender->info->type". Even if a NIC driver sends out a short
packet, we want to pad it, because we might be feeding it to
something that assumes it does not see short packets.

thanks
-- PMM

