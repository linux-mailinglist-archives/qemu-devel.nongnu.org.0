Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F13322D3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:19:11 +0100 (CET)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZSI-0004Ve-CH
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJZRI-000437-0o
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:18:08 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJZRG-0008AA-8Y
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:18:07 -0500
Received: by mail-yb1-xb32.google.com with SMTP id f4so13363541ybk.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QVTFd8LzAzeA94RJuOg4b+T1W+WQCzVje88pnJi2aMc=;
 b=VOcqbZvaGc3+Gp+Un+QjSAW5tcgXbM54z+Q1FBQDu7ftZCexx8cdPR17ke4jabhNyS
 ORnmFJNyCF+4gWlvcfirgBYR7cfbWdr8no8xnN3/ZfVnJ+GdJ5sfzsB5lslr4OGuPV7Y
 JKsJUrATgIN+N+C+2UxMyJrgJBG57H3WWjuEMU5jviMyyMVXEIC/bNeFIurK981nHO/7
 RkHj0BEUHjkheJ2Llp7g3uj2L5eKrsarE7w1kJbuWHFRUKBEu53B68l3GSTEOIex5h9c
 sEKuNzDFYpZBiBNsfIbVt5JVlAajmarsBxkXToUi8Cnn6AANkA5xX4dNsnSwmGC5yclj
 sGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QVTFd8LzAzeA94RJuOg4b+T1W+WQCzVje88pnJi2aMc=;
 b=M1N1Qtl7oYdI04fD5ndIEFJsw1KfYsI03fWOJsNG6N39vhzLmL2Y4L8K23+pHNrotD
 MnbGu2j+u/t/I7HmzUKku9nyv6fM36tAAUr4kYwGXjuCBjbsHbePSRgKrdZkRVEsqdIy
 F2haUS5+yFsaJmEe3W0N2ULa3FYaXiz8YP7Tfoi+u4hz4LAJV2rTtVsPM/HFQR+XAAdX
 9EPc945bHGDv0hBC3jd95sN4DnfFnKj3lbY1TUZE5Ut48GZc96tBvQWeBdKY3oy3XtWI
 rre7onS+MoQl6HqnPKalQyoiX42K4KZ1hOYmAcXNMj2RgmW/NPOjKTwEhjr7lbs/vPs9
 +QSg==
X-Gm-Message-State: AOAM533H4yGNsYZD37CdZsZbh/La/cCcLwuCPkWZZYXqhc05f0DyZ+jM
 ePK701WpmFOy0cqjS5aSEkh8DWRwQ7IPgiY427Q=
X-Google-Smtp-Source: ABdhPJwzU1Ukf9vjgTAD7nhDGnIjyVawfxddECo7Wn4wOaSeEXtPkt9bRLtbk02jbmfXyq9Pl1q7qbgPlWCYoGk+kKk=
X-Received: by 2002:a5b:147:: with SMTP id c7mr40583219ybp.332.1615285085466; 
 Tue, 09 Mar 2021 02:18:05 -0800 (PST)
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
In-Reply-To: <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Mar 2021 18:17:54 +0800
Message-ID: <CAEUhbmWvWrXEQxqc66=j5ZaP-ySP2vETKJiHUw6ueLKMfWB82w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Peter Maydell <peter.maydell@linaro.org>
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
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Tue, Mar 9, 2021 at 6:13 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Jason,
> >
> > On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Jason,
> > >
> > > On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > >
> > > > On 2021/3/9 4:35 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> > > > > Hi Jason,
> > > > >
> > > > > On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> w=
rote:
> > > > >>
> > > > >> On 2021/3/8 6:22 =E4=B8=8B=E5=8D=88, Peter Maydell wrote:
> > > > >>> I think the key thing we need to do here is make a decision
> > > > >>> and be clear about what we're doing. There are three options
> > > > >>> I can see:
> > > > >>>
> > > > >>> (1) we say that the net API demands that backends pad
> > > > >>> packets they emit to the minimum ethernet frame length
> > > > >>> unless they specifically are intending to emit a short frame,
> > > > >>> and we fix any backends that don't comply (or equivalently,
> > > > >>> add support in the core code for a backend to mark itself
> > > > >>> as "I don't pad; please do it for me").
> > > > >>>
> > > > >>> (2) we say that the networking subsystem doesn't support
> > > > >>> short packets, and just have the common code always enforce
> > > > >>> padding short frames to the minimum length somewhere between
> > > > >>> when it receives a packet from a backend and passes it to
> > > > >>> a NIC model.
> > > > >>>
> > > > >>> (3) we say that it's the job of the NIC models to pad
> > > > >>> short frames as they see them coming in.
>
> > > > >> I'm not sure how much value we can gain from (1). So (2) looks b=
etter to me.
> > > > >>
> > > > >> Bin or Philippe, want to send a new version?
> > > > >>
> > > > > I think this series does what (2) asks for. Or am I missing anyth=
ing?
> > > >
> > > >
> > > > It only did the padding for user/TAP.
> > >
> >
> > (hit send too soon ...)
> >
> > Ah, so we want this:
> >
> > if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)
> >
> > correct?
>
> No, option (2) is "always pad short packets regardless of
> sender->info->type". Even if a NIC driver sends out a short
> packet, we want to pad it, because we might be feeding it to
> something that assumes it does not see short packets.

Then this is v1:
http://patchwork.ozlabs.org/project/qemu-devel/patch/1614333786-74258-2-git=
-send-email-bmeng.cn@gmail.com/

If yes, I will respin v3.

Regards,
Bin

