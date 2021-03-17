Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA3F33EE81
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:42:50 +0100 (CET)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTdZ-0005UK-Cm
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMTbR-0004Sc-4h
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:40:37 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMTbN-0001Z4-1E
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:40:36 -0400
Received: by mail-ej1-x62b.google.com with SMTP id p7so1777059eju.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eO6DA/9RtWnpxx+P6uJyRpQ2n1tpRIoglDA6TlGPVcI=;
 b=KgrSSnPAjOYdvNpL+LIZej1A7O9GriQtKwjeVem25jqQPedouGRM6xWIx6bZyFJtcL
 SmjIrzrGvgNXfvBsQ3chNMoIpAv6xvkyyd7lmrqPPcF8FzI7q6wBFxpBqXO5Bk5mD+/y
 etiejBnevt5RRUgDgChX0DO4aCsbhHxltGOxi3sb51xCDJY6TE1ySgAYgJhkchsO8QXq
 G6fT2k5sRf4Zy4F/nni38FUsnkXA6ePp3D/n63nFuZyefbV5XP4Jqh0ARP1dnhkzTY9z
 NDEZXoOoyl093YWwCp2rorpb+GvbFmq0gyLXX1XQY0DKrKHBqDZvr19Vn5uMPvuYMpic
 iufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eO6DA/9RtWnpxx+P6uJyRpQ2n1tpRIoglDA6TlGPVcI=;
 b=YKbXck5aI7kT+L4DCcMggWl7Wx224uAq7BN/lAJJgY+jPJv53upPWxjZDSvoljKZ6Q
 gJBQMpTEpOzoGZTxFvfq683DWdvV6jQkG13El6u1X/vMyBVdmQ7eUy8Zp87oXt/71did
 qX/Ypc1/ZtnpHyE8tA0yVF9VYB3eRW9uKHpsHY2J+nWuPIfpGaC8cauXP05hzAEnI6yp
 Iz1wC1laHI32rgEX5bJYA0cmOQXSA0n5kpmRafGuxsEqOgqeUSVrRnScr6rDHMf5H27B
 wGKpWNuraJc2+hDig8Nxhv/q83LJMXzcIB6DtvzNeHQxXapbT0r2Dfm3SCOFBm4TQZM2
 qA0w==
X-Gm-Message-State: AOAM530ObY3kRv96Q/4883Wp4uH6SoaPdSKI7i4esoUOmei7KRqJZWcI
 3zexu8ItFWAQbGfeydV7/ry22xhipKi0OsV82k35Lw==
X-Google-Smtp-Source: ABdhPJyYefMU1AnW/IzsRh+Kxh2oYRpkNe19Bf2oizDMfpp6tBfLIuRy1RLB71Pu43T5eafGcyg2yuRLqyj7yDzA5iE=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr33889780ejz.382.1615977631613; 
 Wed, 17 Mar 2021 03:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
In-Reply-To: <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 10:40:08 +0000
Message-ID: <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/17/21 8:09 PM, Peter Maydell wrote:
> > On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
> >>
> >>   static const VMStateDescription vmstate_pl011 = {
> >>       .name = "pl011",
> >>       .version_id = 2,
> >>       .minimum_version_id = 2,
> >> +    .post_load = pl011_post_load,
> >>       .fields = (VMStateField[]) {
> >>           VMSTATE_UINT32(readbuff, PL011State),
> >>           VMSTATE_UINT32(flags, PL011State),
> >> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
> >>           VMSTATE_INT32(read_trigger, PL011State),
> >>           VMSTATE_END_OF_LIST()
> >>       },
> >> -    .subsections = (const VMStateDescription * []) {
> >> -        &vmstate_pl011_clock,
> >> -        NULL
> >> -    }
> >>   };
> >
> > Doesn't dropping the subsection break migration compat ?
> >
>
> It's why this patch needs to be backported to stable branches.
> In that way, we won't have migration compatible issue.

No, migration has to work from the existing already
shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
the correct "virt-5.2" &c versioned machine type.)

thanks
-- PMM

