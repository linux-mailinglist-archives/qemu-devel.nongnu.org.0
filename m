Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC20600FF7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:10:52 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPtL-0000be-R5
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okPmF-0004iI-9r
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:03:31 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okPmC-0006oo-6B
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:03:29 -0400
Received: by mail-qk1-x72c.google.com with SMTP id a18so6555458qko.0
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6oBlGA5Pz5LuGRpSjcpBDX3q4QJZ7B7vanm7cs+u54M=;
 b=FQwhEI+pqhGWYW/x/Z7DQxHLHPIy/zuKw0/sBpiNYOl5STncjR/Bw0J9819qWKpmPn
 MWFaqao1azUfGiy81D8Rtl1UAHVN1cbmAP6bDOQQm4dwE27x8tw/dew4M599t5W6RHT9
 PhOkZ13Vvmq44jRu+8fLpPc2ey2B6pCDYyeY2SGWApEn8sA8deFTTZpL0a2MpFEBiyRM
 ENFHYtyHV4x3fmImWefQFMOxPTj3hwnlZqg076giJn6XImUPjpQjDIJzMBOfo5H7ojOc
 2uAZBU6mdDMHO4SeyA9ir/esC3898XvHIBlkyaxvGnbjxhafrpibS5YGDG/5ithAu2Og
 sGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6oBlGA5Pz5LuGRpSjcpBDX3q4QJZ7B7vanm7cs+u54M=;
 b=TagZjoJYakOdP5MDZ1wt0ozXRu7noeo1MM6r09LpgQHq4gRQPNzSbS1Sbafm2ocLP3
 Lo5AeI/JzMweyq0e5ShbSRWpJ5aOmP4YvXYh5eqbvHZ9+shVgli4cYGF7Wv+h+zpHSSx
 ee1U3lvuNAvUkePyIvdUwpobMpebeRFj+QnkVM8vZ8OEzNpCUSioA5/L70HvfRj10gEt
 HeakD2qXlddRG3B3MY30bWNUndsQ5C69E8J3oGok915wZNgzReFATf6SF6ctpDSF1nsV
 EpzSFwfHheLCIb7QFGJM/HZRyAROSd+cZOE8fovgHLAKVOpu7ZEHZH6aSJo52oAZB4fl
 iB1Q==
X-Gm-Message-State: ACrzQf1TylAnhnw09PMhlveC25CBSyO1ScBIiLP/WqVk9QymCGe9KAF5
 4cagM2O08PfoWcKsr8tfj03yVhw8g1foPIVOQF8=
X-Google-Smtp-Source: AMsMyM4yQt918fB4ACZ0q9JcT48MRAjQ3OIIgy7K11M3mNoUQ5tpt0QlC3hRvj9DNIDro/J8VQTWl7h4Duz9N3+05qc=
X-Received: by 2002:a05:620a:19a6:b0:6ee:d3d6:6b03 with SMTP id
 bm38-20020a05620a19a600b006eed3d66b03mr7447085qkb.376.1666011805906; Mon, 17
 Oct 2022 06:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307EhBSg4ENykkbqsT=5oBjc34JR+d3bJAVSTaxRM-uG4LGg@mail.gmail.com>
 <CAEUhbmUAF0W_SCtYOuAZ+xc7Y4So3J4QB29Us0AV44eVF8KtLg@mail.gmail.com>
 <CAJ307EjyXxbGLK-PhBjf18p3AApYM-jGqA2L9q3xLS9wX16h_w@mail.gmail.com>
 <CAEUhbmWStgz4oUEgrtAVU_YFdKSPFJrK-4kd+DP4jqLS51+X+A@mail.gmail.com>
 <CAEUhbmVYPo46nx8LLXcS21myzxcwT0HAzKt+cTRprmn06+g0PQ@mail.gmail.com>
 <CAEUhbmUSLgiZM4w-rnrOeW+tER8SBdj5=1DvC85jp1e4GvKFoA@mail.gmail.com>
 <CAEUhbmUXUiW_Gr4wpeJR-32djq=-E_UJRYc8KN86Ko16w_ysNw@mail.gmail.com>
 <CAEUhbmVs3QXP7iDH1O5M9utLeyVmkMwf7hW8gty49SDcSBFj+w@mail.gmail.com>
 <CAEUhbmWkS1rx9O=mhPaoYm-Bk7AC6USrVb1iw-Vf0q6SB4Jn2w@mail.gmail.com>
 <CAEUhbmWV+7HxRE=oo9Eb9ys7tYE8uGp+PbaDVrD+wPULYSFfNw@mail.gmail.com>
 <Y01K+XFZBtm/YaCw@redhat.com>
In-Reply-To: <Y01K+XFZBtm/YaCw@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 21:03:15 +0800
Message-ID: <CAEUhbmVdGu-Afk5hfX724eXjPxi-vGg7q-Sik3O2GC35y=D3AA@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 8:30 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Oct 17, 2022 at 08:21:37PM +0800, Bin Meng wrote:
> > +more people
> >
> > On Tue, Oct 11, 2022 at 6:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Paolo,
> > >
> > > On Thu, Oct 6, 2022 at 11:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Hi Paolo,
> > > >
> > > > On Wed, Sep 28, 2022 at 2:10 PM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> > > > >
> > > > > Hi Paolo,
> > > > >
> > > > > On Wed, Sep 21, 2022 at 9:02 AM Bin Meng <bmeng.cn@gmail.com> wro=
te:
> > > > > >
> > > > > > On Wed, Sep 14, 2022 at 4:08 PM Bin Meng <bmeng.cn@gmail.com> w=
rote:
> > > > > > >
> > > > > > > On Wed, Sep 7, 2022 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> =
wrote:
> > > > > > > > It seems to me that resetting the event twice (one time wit=
h the
> > > > > > > > master Gsource, and the other time with the child GSource) =
causes some
> > > > > > > > bizarre behavior. But MSDN [1] says
> > > > > > > >
> > > > > > > >     "Resetting an event that is already reset has no effect=
."
> > > > > > > >
> > > > > > > > [1] https://docs.microsoft.com/en-us/windows/win32/api/sync=
hapi/nf-synchapi-resetevent
> > > > > > > >
> > > > > > >
> > > > > > > Paolo, any comments about this issue?
> > > > > >
> > > > > > v2 series has been sent out, and this patch remains unchanged.
> > > > > >
> > > > > > Paolo, still would appreciate your comments.
> > > > >
> > > > > Ping?
> > > >
> > > > Ping? Can you please comment??
> > >
> > > Ping?
> >
> > Paolo remains silent. Please let me know who else could approve this
> > change. Thanks.
>
> Given there has been plenty of time for objecting, I'll queue this
> patch on the basis that you've tested it on a real Windows host
> and found it better than what we have today.
>

Thank you Daniel!

Please queue the following patches from v5 instead.

Message-ids:

20221006151927.2079583-15-bmeng.cn@gmail.com
20221006151927.2079583-16-bmeng.cn@gmail.com
20221006151927.2079583-17-bmeng.cn@gmail.com

Regards,
Bin

