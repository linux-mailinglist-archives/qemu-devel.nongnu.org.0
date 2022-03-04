Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1F4CDD4E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:24:42 +0100 (CET)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDXZ-0002yx-26
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQDVW-0001bX-B0
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:22:31 -0500
Received: from [2607:f8b0:4864:20::b33] (port=41798
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQDVU-0004uP-3Y
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:22:29 -0500
Received: by mail-yb1-xb33.google.com with SMTP id t7so15290478ybi.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 11:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HmLs4QD13dXQvsoDuuwrH3dfyfawmOFH6rIxg7ewjqI=;
 b=gLDFlVbKILCST2IGnEMgNOAo0ajb6PubLEixVLeicXUsPQZhmg2fuPCHO4mBmi6Y2G
 VX/seElJfrEfgO0u2hQoBBwofGAuJ8QxYpa2aTm9t4yP4O+G9p3rvg2cdyGhSBw3luM9
 J5likZ6K5P9CZ0lgWpXsFDWvCw04bw8XpYlyQBI068qAUIKfOR/8cd3BWCaOVbVprOdK
 fAmlSJD/RYOI8ohtq6055HheyAJHTYnCYj470a5292sUBlkEYH+7WsKhmlXf8h3ntikR
 NOnZzAo36MeNeXMmcj2Q7Ae2XR59YrWgt1Zp1lUfkOik1ZlWCvwi0hGcTnqhMVwg6D38
 3ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HmLs4QD13dXQvsoDuuwrH3dfyfawmOFH6rIxg7ewjqI=;
 b=mSXcQHnaSSgS1z88kucBN8Yn5RPfQ7Oj2TWyf4dsNQuu30c/DPp+VqHP1+C0Bk22M4
 3qNrMwSdWdrxKOPluqap5YLDQ4S7TDDZXWWMcFjfQdeJlZ3Skc0CzauLMMtxGfVnO8GX
 a35qNLzAXX+0sKv6R8xldjGF8ZdWWXKzPo43aiwbtPLZN0kPr+z50V9tAjdwpYjQxHhi
 K0yBTyYTaA8kmZRcHNs1Gs4tXJp2JW1ob4VRe8LG7p9xuGAyXBHv/vnkEvuHemdEc4AT
 zLQQUgs7ThHwHMHuWu7xvj+BzSeC+lForVMKE57YtZVC2TFafp5nKjTwkl+sbFfdJ7jA
 wBSA==
X-Gm-Message-State: AOAM532DqgoKacUjmq7fQozk1cdFxUT6luFEDoJw1Wc5F6xVzjUhk3gR
 dl6c6nQoaoocf9DRBW+nyfs6f8zOkULO1iWhiE434g==
X-Google-Smtp-Source: ABdhPJxuD/fkaHQGkGxTmnvDmM/+S6xJCQh5E6pcmJ+P7OXrO31xR2ZolZIWY5PbbcGsq2A7NMavEYb7Qx0cuHrw5+o=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr17115655ybp.39.1646421747128; Fri, 04
 Mar 2022 11:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20220302181134.285107-1-pbonzini@redhat.com>
 <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
 <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
 <CAFEAcA--dtmffH4FJUuuE1d6yR-4Mweu481p_y-EsJKEtPRjTw@mail.gmail.com>
 <YiJlSlJube4dOk/m@redhat.com>
In-Reply-To: <YiJlSlJube4dOk/m@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 19:22:16 +0000
Message-ID: <CAFEAcA9z7bMdRmi8LRuywf8rArAubSk24imPoUgXhz1=roSZWg@mail.gmail.com>
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 19:15, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> On Fri, Mar 04, 2022 at 06:46:51PM +0000, Peter Maydell wrote:
> > Either of these is fine; my requirement is only that either:
> >  (1) the oss-fuzz gitlab CI job needs to in practice actually
> > pass at least most of the time
> >  (2) we need to switch it to ok-to-fail or disable it
> >
> > so I don't have CI failing for every merge I make.
>
> This is far from the first time that oss-fuzz has caused us pain. It
> feels like it has been flaky  for prolonged periods of time, for as
> long as it has existed.
>
> When I tried to switch CI to use Fedora 35 oss-fuzz was consistently
> failing for months for no obvious reason that I could determine
> despite days of debugging. Then one day I woke up and it magically
> started working again, for no obvious reason. Inexplicable.
>
> Conceptually we benefit from fuzzing to find obscure bugs.
> Have we actually found any real bugs from the oss-fuzz CI
> job we have though ?

It did find a buffer-overrun bug in the 9p pullreq less than
a month ago:
https://lore.kernel.org/qemu-devel/CAFEAcA-VRNzxOwMX4nPPm0vQba1ufL5yVwW5P1j=
9S2u7_fbW-w@mail.gmail.com/

But overall I'm sympathetic to the idea that as it stands it's
costing us more than it's helping.

-- PMM

