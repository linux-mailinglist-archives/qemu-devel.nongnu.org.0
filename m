Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB131113E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:33:47 +0100 (CET)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86rR-00074o-RO
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l86pO-0006RF-8l; Fri, 05 Feb 2021 14:31:38 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l86pM-0001WN-RN; Fri, 05 Feb 2021 14:31:38 -0500
Received: by mail-oi1-f169.google.com with SMTP id k142so8686309oib.7;
 Fri, 05 Feb 2021 11:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cwFa1USdzW0+VscxRo5AApRRcXP6vpeFrhMNguXPAw8=;
 b=rWDDQHTbaYgww1tpbAHAOwbDNas2M/C62FuHb9MkXarqwbji7/lqX9AMfyjbcK6fvV
 hjXblCE0hIVcBdyfcSs3CQ30xq2NXSARf40GR12+rnpvnvNNLC70GhGPcI7a3fntrMmw
 kXzi3lI+mq1c7GeHpvHgZ+R/qHs7k/ZPUBQVQ5gimvyRSyMuZiSIEAvjBi2fWSvXNdwv
 gv5PM5b0wrL5LzPJFZ+/IvCpecKpbdTcGxC5AO+Ol2CPOdptzJegCO4V41gygdORQuFn
 Q5vWJp7VF1a0R8tNbAQfcBEAwWteLX/uFUWi/lEkj7LbAWxExt1tx3kB+5VTGmVlEOnE
 jI9w==
X-Gm-Message-State: AOAM532yQ2WT6+gtgsbvIXOwPQMS5ltqw5xCxd0uLibxq/XhhlFqxiH7
 LSirQLydShR8c/Pn6OYOBE3FC80EhWbO5lz0nuM=
X-Google-Smtp-Source: ABdhPJxHzKTk5u/AM3YXmnd1mjMo8HFxUW8N7k7fj4iUFvBvllvm1D2NC2F+1E+pvsHbgwiicjjlCGprU2RLIWGUg0w=
X-Received: by 2002:aca:5e84:: with SMTP id s126mr4176187oib.175.1612553494713; 
 Fri, 05 Feb 2021 11:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
 <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
In-Reply-To: <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 5 Feb 2021 20:31:23 +0100
Message-ID: <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.169;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f169.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 5, 2021 at 8:21 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
> On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> > On 2/5/21 5:59 PM, Peter Maydell wrote:
> > > (The selftest is part of the AN524
> > > download so it's behind a EULA click-through and we can't put it
> > > into an acceptance test. We might be able to get something
> > > based on Zephyr or Arm TFM.)
> >
> > Wondering about that... If anyone can go/click/accepts the EULA and
> > download artifacts, then I'd like these tests to be committed to the
> > repository, with a comment containing the download link, and the test
> > can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
> > binary I downloaded is the same you used for your test.
>
> I would rather not get into that. The selftest doesn't actually
> exercise as much of the emulation as you might think anyway.

This was clear from the previous paragraph, I was asking about the possibil=
ity
to have developers/maintainers individually accept EULA to download artifac=
ts
for integration testing.

>
> -- PMM

