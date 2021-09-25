Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8241838C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:26:27 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBRS-0008La-5A
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUBPz-000773-H2
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:24:55 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUBPy-00082A-1j
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:24:55 -0400
Received: by mail-oi1-f171.google.com with SMTP id s69so19160964oie.13
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 10:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wCXbJA93mN2kXUVwD7u8JRwyjih+rDpA21wahtcI3N0=;
 b=B4mAA1b5cZCJgAXNWRjQ9HbKYJjSi0hE7vphZuBpl7wZEXZDXaoG1asnqo+65KPimb
 QSOKveyLM1mQAYrl3qwxDz4HMZQqDHQ6Zx2aLKwasni/yYijHLMHIsUAOApgZtEfUecs
 De8sdYzhQX/2NcI+1TLua4IHD8B0koRQ8fxEGTg+6/vQrNaq3wJ9gkK/h6kQR/4DeK+e
 w6+IXXyBaoKekLj5vhbI6frAoGzWLCGIOqTA9eAJqPCpGVqBZeeERI+j53oi5DUhvd6e
 /ISNRvT8/+ZZwmLsEDGb7/l/2UttH6L1pVDW/3xaiKMfE3G3ky5pRxSS4MhSt6eybJzP
 taQw==
X-Gm-Message-State: AOAM531e9bz8xUyn6W2B3npMfGDax11qsJQ6ozub1+14HtzMej6Tl7OU
 Tgys8DJYMjNHK1cyBzMD2149Zmq7SUUfk9NSSfE=
X-Google-Smtp-Source: ABdhPJzPu9i7vu5dbn5qo6znmY8+oYlafKta9jzbiyT2l920IHmf2piHnwLIrUzVL3VYLbXyxIqa5W6tBqZF22t7NdA=
X-Received: by 2002:a05:6808:179b:: with SMTP id
 bg27mr6033178oib.46.1632590692891; 
 Sat, 25 Sep 2021 10:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
 <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
 <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
 <9c7adce3-6e51-10cb-9935-4857f822c332@amsat.org>
 <cab11f59-c90d-8228-2226-1e3d1a727196@linaro.org>
 <a48e885b-0027-68fb-ea0d-3edc8918693a@xen0n.name>
In-Reply-To: <a48e885b-0027-68fb-ea0d-3edc8918693a@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 25 Sep 2021 19:24:41 +0200
Message-ID: <CAAdtpL5FZqx9j2aU0P=e6bwyr99iD42AONA=e1ATxu3jj-dX0A@mail.gmail.com>
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
To: WANG Xuerui <i.qemu@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.171;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yunqiang Su <syq@debian.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 25, 2021 at 7:11 PM WANG Xuerui <i.qemu@xen0n.name> wrote:
> On 9/25/21 23:20, Richard Henderson wrote:
> > On 9/25/21 10:31 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Xuerui said on the cover 1/ we can buy a board on Taobao and 2/ Loongs=
on
> >> might help the community with hardware.
> >>
> >> I tried 1/, spend more than 2h to read a translated version of the EUL=
A,
> >> succeeded at the SMS verification, but then when I tried to log in to
> >> search for boards my account got banned with no explanation. This
> >> doesn't seem easy to use outside of China, so I guess we're back on 2/=
.
> >>
> >> Cc'ing other QEMU Loongson contributors in case they might give us ide=
as
> >> about how to add this arch into our CI.
> >
> > It does seem like a good idea to have some sort of testing in place.
> >
> > Perhaps build upon debian-hexagon-cross.docker to set up a cross-build
> > environment for loongarch.  Add just enough more that it's good for a
> > full cross-build of qemu (glib and pixman?).
> >
> > Like the hexagon docker image, the build time would be substantial, so
> > we'd push a golden copy to the qemu-project repo.
> Testing is of course very important for infra projects, including qemu;
> I'll craft something and post a followup series later. I'll need maybe 2
> or 3 days; the entirety of cross toolchain must be built, and I'm doing
> all these in spare time, usually midnight.

There is no hurry ;)

