Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFA332182
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:03:22 +0100 (CET)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYGv-0007Xm-FH
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJYEw-0006Sr-LY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:01:19 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJYEt-0004sr-Go
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:01:18 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id c131so13170307ybf.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FoDyWnZak5/1BlEPLdnS+/bskDrdqQLqrwkyOevMcq8=;
 b=vY5N0gXYt619wcYgOMPUxf9GPwtbTYQQUOZ78hxy/91KPL9Vd3GcD1wTKetzt5TGOh
 xBl8odWojOTWnOrM4Fm4cavzUI8i7LLMPF3EA9rlbG54ZFIrnvaPp+neuXvMefHbIiO4
 CNTbZdRszvn2yiU5SHIYw1svjU9CL+EoywZQWA8qXSdyZbTZZ/a/bMX4MnPeYnfjcfm/
 +Yl6szkKGY2jMGaxarwyvl6jF+AYBi/zvj6kV6a+wkX11Sr9hbAAfuqTEDTyfQyVedcq
 0D7s9IMbbKSM9L990PdDuE/ut4RQ/p3is5peA/RKEljkBQPP/YeSbgq4uFZke+36svxI
 gQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FoDyWnZak5/1BlEPLdnS+/bskDrdqQLqrwkyOevMcq8=;
 b=ayw97xUQ6iC/C+VPYuer4URLpWIC1Dtzlzwd3HmeE3jsQjGrcTRlRFVzWuNjBiqTAX
 YCPSr1uJ+/SYShtQLTfSNgCc6T3/DFW4m6FKthDgWhFZ3qTjNa8G5c/0cMWHqRzY1gQ3
 OYNILKFqyluVC6ADOF+H9cxyuNchoEtNtxVaU1ID8WBzPr4RmHpl0t4aSGZ+m75bY8Um
 C5ToEYQXcpwB8WrRpjTeYe78untB/M5OiHiCegoL0+gS2PnClgml3N7+IkGgY2/Gt1/x
 Ekebkv+3fFvWdUlz7PNLfqUkuiBEh0lseLL0QWf2aUWN3KpKzRaBktRA6wqomUJg6opo
 cXsQ==
X-Gm-Message-State: AOAM533xtnbYUfwDs6Yet47goJ6w0PDKDfCnxboPF4Vam3qtL9R/WFcW
 hvLPpfrVqBBAgqGRNGH2zj8cI1qlxPQOsbKZinw=
X-Google-Smtp-Source: ABdhPJz2lmEN+5ST4v8ZYDzWT3lHfRUWOpTIg4KFk/lrOq4VPxblsP6rZ7izwXQJbwB6+BlY1RmdGiJMAJVWSUA+K7g=
X-Received: by 2002:a25:d08d:: with SMTP id
 h135mr39832777ybg.122.1615280474637; 
 Tue, 09 Mar 2021 01:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
In-Reply-To: <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Mar 2021 17:01:03 +0800
Message-ID: <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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

On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Jason,
>
> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> > > Hi Jason,
> > >
> > > On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wrote=
:
> > >>
> > >> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > >>> On Mon, 8 Mar 2021 at 03:48, Jason Wang <jasowang@redhat.com> wrote=
:
> > >>>> Do we need to care about other type of networking backends? E.g so=
cket.
> > >>>>
> > >>>> Or at least we should keep the padding logic if we can't audit all=
 of
> > >>>> the backends.
> > >>> I think the key thing we need to do here is make a decision
> > >>> and be clear about what we're doing. There are three options
> > >>> I can see:
> > >>>
> > >>> (1) we say that the net API demands that backends pad
> > >>> packets they emit to the minimum ethernet frame length
> > >>> unless they specifically are intending to emit a short frame,
> > >>> and we fix any backends that don't comply (or equivalently,
> > >>> add support in the core code for a backend to mark itself
> > >>> as "I don't pad; please do it for me").
> > >>>
> > >>> (2) we say that the networking subsystem doesn't support
> > >>> short packets, and just have the common code always enforce
> > >>> padding short frames to the minimum length somewhere between
> > >>> when it receives a packet from a backend and passes it to
> > >>> a NIC model.
> > >>>
> > >>> (3) we say that it's the job of the NIC models to pad
> > >>> short frames as they see them coming in.
> > >>>
> > >>> I think (3) is pretty clearly the worst of these, since it
> > >>> requires every NIC model to handle it; it has no advantages
> > >>> over (2) that I can see. I don't have a strong take on whether
> > >>> we'd rather have (1) or (2): it's a tradeoff between whether
> > >>> we support modelling of short frames vs simplicity of code.
> > >>> I'd just like us to be clear about what point or points in
> > >>> the code have the responsibility for padding short frames.
> > >>
> > >> I'm not sure how much value we can gain from (1). So (2) looks bette=
r to me.
> > >>
> > >> Bin or Philippe, want to send a new version?
> > >>
> > > I think this series does what (2) asks for. Or am I missing anything?
> >
> >
> > It only did the padding for user/TAP.
>

(hit send too soon ...)

Ah, so we want this:

if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)

correct?

Regards,
Bin

