Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CA4010FA
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 19:08:47 +0200 (CEST)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMvdO-0006E7-Sh
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 13:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMvcb-0005Z3-VD
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 13:07:57 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMvcZ-0003ZL-JY
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 13:07:57 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id k65so8660046yba.13
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3spuEvgJoplz0vZD+t0B+fVo+GOUQTVUT/KxPtQEw9k=;
 b=P4cD3ccdhBe6J18yXdFiwqIBpm7lWJXGvTgvdsZ8mAUbTqutfIBW5EIMrSlDPF80iY
 eSW43Y8Cblb/KVe8q+J60KC+zGqDugS1gYxCi8TIzhIExAGk3qOwun/UeuzQ11tcL3qj
 JzCNIa8Qc0O2vO/45Q3ZQQEeO8wD9Xt1j8Gjc3meUWW/MaebrAr+Fv6rlYQ94F3ulIlk
 EoGVGt3q/OGU333cZFjyME8TdWZ0SV9svR/Lvl3RnHUA9tlDrImwcTmsuOaQ14RtluVl
 san13R9h9JBX+bCy4rzYwCTYNtQmeleijBLOpHpxb+ncy9hqokPYE0gOtGjZ0onCsEUt
 L3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3spuEvgJoplz0vZD+t0B+fVo+GOUQTVUT/KxPtQEw9k=;
 b=sEZbYnGOd+BWVzIBqqgLgNjqnLb47SK5YwUdRDgPu/OEj0R2BJ4aE3Pu3Bn1Pk1+3w
 ildmKXvI0aHzUY33NxVrQjaVtDYfhakujEhWlQbr29reGO1oZXqxHEy4claMWJIv3/zZ
 ofzepbfndR7II6akmXuMi3WDPsnaFyIoWCPtry6RzTTCKV3Srit9hjzNrCbbv0lsuG/N
 AFg5NJni3TRoJgOMAxuLoRmLLSGzAkAUkFfHw+QucccgJudZ6SvfXkqgEB0hUXpIyEZl
 DkeTKbqmygOLkg8DqJ7XksttvR/ywuvI9S0vcP5A13kL3ffn+cwcvkkcTMiQ5+Dlzte8
 IcQw==
X-Gm-Message-State: AOAM532XZ4e5tRssTFXe+mPOrLVP37paHAmhv9zmAdpy3Jvi38PfZkrk
 zPsYGAkGFxVRB2c31YlmSZz2cmMOjJRK9rdRFUo=
X-Google-Smtp-Source: ABdhPJzRZ/I7W/i3LucC1u7kJ6i+WySLhkhR5WNY+kAhiGNmMgeFF54s2mc4KFjDBRtVrIK9tIj3HgU7N/avlxIMLO8=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr10859906ybm.345.1630861674527; 
 Sun, 05 Sep 2021 10:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
 <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
 <CAEUhbmVjuYhk=Ebh6VeaPtC816Dssys3g8+dwMo5rv4yHMeHSg@mail.gmail.com>
 <CAFEAcA9JDN-bGSyjqauKsjJH43TUwk7YTSN0mSvPg9obd9yCUw@mail.gmail.com>
In-Reply-To: <CAFEAcA9JDN-bGSyjqauKsjJH43TUwk7YTSN0mSvPg9obd9yCUw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Sep 2021 01:07:43 +0800
Message-ID: <CAEUhbmWh=8MntXf=TJr8g8FPB2oQJfGhw7Kqs+Tb_ZqpmXUthg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 6, 2021 at 12:54 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 5 Sept 2021 at 17:49, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Sep 6, 2021 at 12:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Sun, 5 Sept 2021 at 16:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > {read,write}_with_attrs might be missing, and the codes currently do
> > > > not validate them before calling, which will cause segment fault.
> > > >
> > > > Fixes: 62a0db942dec ("memory: Remove old_mmio accessors")
> > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > >
> > > This 'fixes' tag doesn't seem quite right. Before that
> > > commit 62a0db942dec, we still required that a MemoryRegionOps
> > > provided some form of both read and write.
> >
> > Did you mean before commit 62a0db942dec leaving MemoryRegionOps NULL
> > was not allowed, but things changed so that now it's possible to have
> > NULL MemoryRegionOps? If yes, then the commit id of "Fixes" should
> > probably go to the changes that allowed NULL memory ops. If not, I
> > don't think "Fixes" tag is wrong.
>
> I mean that before commit 62a0db942dec leaving the pointers all
> NULL was not allowed, and after that commit leaving the pointers all
> NULL was still not allowed. It's been a requirement that you
> provide at least one function pointer for read and one for
> write ever since the MemoryRegion APIs were introduced in 2012.
> You're proposing an API change; it might be a good one, but it
> isn't a 'Fixes' to anything.

Where is the requirement documented? I don't see anything mentioned in
docs/devel/memory.rst

If it's a requirement since 2012, then I agree "Fixes" can be dropped.
But a doc fix should be made to document the "requirement".

Regards,
Bin

