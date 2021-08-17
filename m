Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB63EEC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:39:08 +0200 (CEST)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFyN0-0005AW-VM
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFyM1-0004Mb-4r
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:38:05 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFyLz-00044l-Hp
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:38:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id dj8so23493518edb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lH3xujJiY/+QL7m3VogYrMoorawVXFBEOnUhokLnD9U=;
 b=xmtPDoJbeF5KXXEB+PApalYLUlOiKF3HQI7iAb7Ay5k3Kb5Jlq5C8RhMp3zIWstn2k
 mmMxmZRX8kL9bXun0drAPlPT/sm4thsB11YoA2h134DpvC6yFff6PZeqUxC9WOU5pCxu
 FGbBSHXbyORrokgNUkR/1SLCyh183KBRyriWAtpQBHPzjkyEnb3cVQVui3AolBXEM7n4
 0VvX1uIlax/UdqmuaymDqz9lrno02eCW0xPT164iuxqB+Xfs/R6F1OXnDwD23C3NTwUZ
 hu5A6I/DRa28TpzMnLydTUDWKfXw3wEP5zweJOFDyBX3BGS2Fj4UKEhWySur/AFm7rS8
 pZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lH3xujJiY/+QL7m3VogYrMoorawVXFBEOnUhokLnD9U=;
 b=dEdPuNYj0rr9/PTovkzDBZWsTnepF9KoYwd5ohQMiGOw1+MGvKJaCG/0IIlhKF29iA
 GdupgU44k6qc00iHe27z3sa6Zdi6JvlSI9NlUSuekoMIJg7NAXT3/zov6edDerY0zSmx
 os1SGc/jPwFWjyMUFojlxOu99+7NTJMKx2Ym0U8mkDUaCkFS3hGXZ/Ejmo50fe+5hpkd
 Kh9mJR32sHlgQVbLMNz/qDybzWBhXTG8/kqXpgbc4aVj+9Ti27/AFamZ5g+ahktKr6A4
 H9Co5UEq/a3iXO8QIQJ0J/7owNWsNi35mPf2YRIq1hqw7RuZjLAigey8z9nWMKBMvjMb
 eLGQ==
X-Gm-Message-State: AOAM530Mvl9g8CnMNRCvpGuZ2yXwCb274LoqbJ8ACHgW1s3UWmplJqvY
 u8o8snu+rW7c4C6ExMfj+t2IV8T4YdAhXdMYjUWSHA==
X-Google-Smtp-Source: ABdhPJx+5nWs8D7vtJdI3Idd1t9z6Gw01oyI/CaDuqeLl0k8LFs1wSzhM6CLfH4Jx4dKUBuXFOLl9tpI0kG6msP8l2A=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr727875edw.44.1629203881793;
 Tue, 17 Aug 2021 05:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
 <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
 <20210817120250.fdpujloefaqtawwo@gator.home>
 <CAFEAcA_fOa4uV3sA5kxJ1gKTGS3ASgvx2+FrG=5cr0wWaQ48-Q@mail.gmail.com>
 <20210817122238.hb2dk2a2zmhqrv7h@gator.home>
In-Reply-To: <20210817122238.hb2dk2a2zmhqrv7h@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 13:37:15 +0100
Message-ID: <CAFEAcA_=+YuX99KWUS_KqJB1Snadmx9WKUAVpZQQAAcGBPtyAA@mail.gmail.com>
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 13:22, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Aug 17, 2021 at 01:06:19PM +0100, Peter Maydell wrote:
> > On Tue, 17 Aug 2021 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Mon, Aug 16, 2021 at 11:37:21PM +0200, Paolo Bonzini wrote:
> > > > How do we know that no one has ever used such configuration? The conversion
> > > > was meant to be bug-compatible.
> > >
> > > We don't. But we do know that a zero input value was never documented
> > > prior to 1e63fe68580, which has not yet been released. Can we claim
> > > that an undocumented input value has undefined behavior, giving us
> > > freedom to modify that behavior until it is documented?
> >
> > Dunno; I definitely don't want a behaviour-change patch at this
> > point in the release-cycle, though...
> >
>
> Can we replace this patch with the following one for now? And then
> discuss this further before committing to supporting a zero input?

If you can agree on that and send out a patch and get it reviewed
within the next three hours or so...

-- PMM

