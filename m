Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCEE3F4886
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:20:30 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI73z-0007I3-KQ
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI72v-0006cO-TX
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:19:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI72u-00007P-5m
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:19:13 -0400
Received: by mail-ed1-x534.google.com with SMTP id s25so12715607edw.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gEsThX81NSbZmSSYK0Ass7DxhqZ33OSd5rh/bX6VeR4=;
 b=jxYFzMftscvjA/NSfbJafvwXh8XlRcuegYX+Y+hkQEQyI0vwFpSO/JOE6pvVgPojjF
 WECjpG2emWSiSTdTwLmBv2cUcoqj1cbbLQAVewhMhGAfMsbY8pPEr2kIUqn8m2clkKZk
 b+S53PAxGqjCHgkK0tqoksMWMWLgLnhestLYZxXlu+BP/q5ladmnKcCZY+NPCR6BbW0a
 bragd/h8+ni5nAt8jeszbnY1vOn76XVimiXrQ7PVkscDQb9CI0XbFngScGYIyzJ2bfKX
 l8shkRQEh+Kmv/BmUbdLd864fN4/aaNg7LdTfglkOJyeaRMxcaUJUsTfnvuxcNdf3N7z
 xkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gEsThX81NSbZmSSYK0Ass7DxhqZ33OSd5rh/bX6VeR4=;
 b=dztUZh3nUzPOSyGH3Ic++ligynJQ9xgrn5fDr7teNSbon8qmmkflzXiPQYTBvISWU1
 Y8WcgazOCdx6i+mth7LnZbCk9CAE3degXqYsh2daHXdKTfe5H6d1TyXbqarBZEHKHWwC
 gTOyq7JOu8ahJGEb70jL4W8ILf8p0RpjeUZYj7SqQTf4jPINTnwGCNTrC3GfaZGd2RRn
 1cqJ569Gwcei1CuA+AoALFuVu86v5u5Oad9nqtBi1DkUq5WvYq3OHs8OflDBXHHgUHJK
 5y4S+VNA4uB85BIFbRthwJ9Ra9hiDImzEVOyb10i+hCkkDcO9gotaJ68y6ggacfQvjKI
 Zhug==
X-Gm-Message-State: AOAM532sjDnlECB3HVUvyOyId/OYzST1BeQ+os6OhLTXcNFDNUuPjxgG
 5cvwDTN6cTAQlWwQuOiYZkmnOoSTgtNhZpRDIh0NNg==
X-Google-Smtp-Source: ABdhPJxpt2ZZhjY/XE5BRkwYS1nPFSNgnUDlHjyVR667QWvRTscU83977TjUj/k2Y0P7dhGtU15DCf+32BucXO/241s=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr36228813edb.52.1629713950488; 
 Mon, 23 Aug 2021 03:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210818120505.1258262-1-kraxel@redhat.com>
 <CAFEAcA_-wCZQv8bSpUoROzJCz5ND6_5DG-FKOXDSOhEcptqF0Q@mail.gmail.com>
 <de938d0f-7de6-d34e-5f48-c4b6346545f4@redhat.com>
 <CAA8xKjXQOKGAQ3Lkrw4TDWd1wPyUOCZ9PzPc_fdw2uC6S62eRg@mail.gmail.com>
In-Reply-To: <CAA8xKjXQOKGAQ3Lkrw4TDWd1wPyUOCZ9PzPc_fdw2uC6S62eRg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 11:18:22 +0100
Message-ID: <CAFEAcA8_4axCE+hVkk1Lw5mPWBRKKFZ+LE4Gro=pq54Tx7tKKA@mail.gmail.com>
Subject: Re: [PATCH 0/1] uas: add stream number sanity checks (maybe 6.1)
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 10:59, Mauro Matteo Cascella <mcascell@redhat.com> w=
rote:
>
> Hi,
>
> On Fri, Aug 20, 2021 at 3:07 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > Cc'ing Mauro to double-check.
> >
> > On 8/20/21 2:12 PM, Peter Maydell wrote:
> > > On Wed, 18 Aug 2021 at 13:10, Gerd Hoffmann <kraxel@redhat.com> wrote=
:
> > >>
> > >> Security fix.  Sorry for the last-minute patch, I had completely
> > >> forgotten this one until the CVE number for it arrived today.
> > >>
> > >> Given that the classic usb storage device is way more popular than
> > >> the uas (usb attached scsi) device the impact should be pretty low
> > >> and we might consider to not screw up our release schedule for this.
> > >
> > > What's the impact if the bug is exploited ?
> >
> > Bug class: "guest-triggered user-after-free".
> >
> > Being privileged (root) in the guest, you can leak some data from
> > the host process then DoS the host or potentially exploit the
> > use-after-free to execute code on the host.
> >
>
> This is actually an out-of-bounds access issue (not UAF). It's still
> potentially bad, but I agree with Gerd the impact is low. Plus there's
> an assert right before [1] that makes it a DoS if the accessed memory
> is not NULL.

Thanks. OK, (and following discussion of this on irc on Friday)
we won't put this fix into 6.1. (That is, we treat it the same way
we would if the CVE patch had arrived the day after we tagged 6.1,
ie distros and other interested parties pick up the patch as they
would any other security fix.)

-- PMM

