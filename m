Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE337252B1F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 12:07:02 +0200 (CEST)
Received: from localhost ([::1]:57968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAsKb-0007De-Vz
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 06:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kAsJw-0006p3-Rj
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:06:20 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:37822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kAsJv-0003fO-67
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:06:20 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id e14so648036ybf.4
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IBlWzqg1x3SWdj4VWhi+AMYq+xiFJAIJuQ8pHd5gDlE=;
 b=u1TSi+eRTfaZPVc7r7ANwclQlBBQOCvt7fTCkuiK3EN/ibVlc6MwaipJxaqm2DXyeR
 fLkNZLkCWAEjxvLID5GJ773nJQnxx6EAB5eieLS/3O1J5hSi3yPjHxpAwhwfjlJkXAk+
 9EK+hJmXuVx5mc3/C1e/+/fMOvgD6XK8C3/JdwwnAKgFsXEtiZpK2KXRLFlYuTNiUJKI
 yqAs4rrKRI9+ESNEr+DjdQQzm0rkJBakU/qfOlJWVsKVZuyIbP/FhZhFJ8hnEFtGjArW
 d9OkIWPqUpAm+PaGgt3kLTgd6DDDleYa4pmrBTMyVy2JOO6zwx8n3keKJ86jUW26uGZB
 49lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBlWzqg1x3SWdj4VWhi+AMYq+xiFJAIJuQ8pHd5gDlE=;
 b=Dvbt0YRupVq+yJ8bhNuTxDRUjeSQbPw5aTGR0c8VO702Vsj3vPRuGmV8Qud2k9ty3w
 7VOUf+nMWM47Su3H+jZ7lIGYPx+K1NW4LnetXJeLCbvEB8c9mRh1WEL669bi+zmf3jz6
 OnLXRsLUfM0d0pQ7OaTIrX10ko0WyHT+Y6v0UPU0ylDywlklkStOtzFfScctC3n8NC/G
 9uKc+cQ63ncreSYvw4Ht/KGp7zBEnKxPNi/7qjbKbmgx0ftIB6IdZBx4k+/i22YO+Yy1
 1pZMAp38PkjTETwX3XI2Sh4CdZHfZC7tObyii1nMTDqoSK0sfrzZ7OCqULlQy98CEnK4
 RMjQ==
X-Gm-Message-State: AOAM53153XR9NW4YJSbLBCw0Wtu931gp9odwS/TYLThom1lm6ggnJcE0
 pxx963UNqUYBGqN9leZ4RUdcp5+5/w8sx/Xl1ew=
X-Google-Smtp-Source: ABdhPJxSAcfKygIWlmjjnXJV/1sn9GkAsS93DOWdKQo25nxTZvjUiZCLVRXCq/u9wvcVUQTbDv8aaBgtVVaQ5jmMGBU=
X-Received: by 2002:a25:d946:: with SMTP id q67mr18199585ybg.517.1598436378137; 
 Wed, 26 Aug 2020 03:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200825184836.1282371-1-alistair.francis@wdc.com>
 <CAFEAcA8=Mf=EPh__tNhJyGv8+ouD-HH+MuMb+HhtTFes+XqUSQ@mail.gmail.com>
 <CAKmqyKNxURXyNSEePPU1jY7FzcZjRThr2qAvwR393+nqUXBxJQ@mail.gmail.com>
 <CAFEAcA8x=ck1mmJ8Y8o-0NQXWhRgOg5Gp7GvHNkNnLb6rDxygg@mail.gmail.com>
 <CAKmqyKP6OUoaR6iZ6SD6qZPvYF0bKqpB_rRNeQOteg8BtcqKeQ@mail.gmail.com>
 <CAEUhbmWN93n1JoGszsW6WrkGbdFD6VsGyi7Ji6bS6wF+DbMOBw@mail.gmail.com>
 <CAFEAcA9026WV-t5Q9EbV-nZi+6GZ3WoKCx2tA9QeAXu5iD5ryg@mail.gmail.com>
In-Reply-To: <CAFEAcA9026WV-t5Q9EbV-nZi+6GZ3WoKCx2tA9QeAXu5iD5ryg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 26 Aug 2020 18:06:07 +0800
Message-ID: <CAEUhbmWv52oeQb6z3JTpa16utD2NmB1sKZ-sT7uD1R8_3KwNMw@mail.gmail.com>
Subject: Re: [PULL 00/18] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Wed, Aug 26, 2020 at 5:25 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 26 Aug 2020 at 04:21, Bin Meng <bmeng.cn@gmail.com> wrote:
> > On Wed, Aug 26, 2020 at 6:41 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > Richard and Philippe review patches and some of the RISC-V patches get
> > > reviewed by the RISC-V community. The main problem (which is a common
> > > problem in open source) is that large technical patch series just get
> > > ignored.
> >
> > Yep, I am only comfortable reviewing patches which I have confidence
> > in. Right now I am not working on any H- or V - extension for RISC-V
> > so I cannot contribute to any review of these large numbers of H- or
> > V- extension related patches. Sorry!
>
> So, everybody has a ton of work they need to do and only a limited
> amount of time they might have for code review, so it's important to
> prioritise. But I would encourage you, and other people contributing
> to RISC-V parts of QEMU, to at least sometimes review changes that are
> a little bit out of your "comfort zone" if nobody else seems to be
> doing so. Review can find bugs, areas that are confusing or need
> comments, etc, even without a thorough knowledge of the relevant spec.
> (In fact, not knowing the spec can help in identifying where
> explanatory comments can help the reader!) And for the project it means
> we have more people who at least have some idea of what that bit of code
> is doing. Review that is limited to "this code seems to make sense but
> I haven't checked it against the spec" is better than patches getting
> no review at all, I think. And it's a good way to build your knowledge
> of the codebase and the architecture over time.

Agree. I really wanted to spend more time on this project but like you
said it's priorities.

One thing I do not understand is that according to MAINTAINTERS there
are 4 custodians for the RISC-V maintenance work but it looks to me so
far only Alistair is actively reviewing patches. I know Palmer used to
review patches but if it's only one person that might be some issues.
At least MAINTAINTERS can cross-review, and we have 4 there.

Regards,
Bin

