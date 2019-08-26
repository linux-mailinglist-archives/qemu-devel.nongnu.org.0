Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5199CB2A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 10:00:07 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i29uz-00012Q-0K
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 04:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42453)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1i29p7-00030v-9e
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1i29p6-0003r1-2n
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:53:57 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:38054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1i29p5-0003qU-RD
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:53:56 -0400
Received: by mail-qt1-x842.google.com with SMTP id q64so5352277qtd.5
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VQSJ8FaRH0MzeXOmZ4sot/W5wa5fsOU4ckIlLvavVeM=;
 b=JX+IzB0ecbca9NWhDdMGRo1JasPfXLvtKGb9Drnxypr1qHgw8vpZv+1fKknNfg98wR
 u+MdSgGwi8mWZ92oQUIblXkl5qyID+yB5xdf+kVFUku3c3cXTs6piveTxltJXW9gTQDS
 ajaSOs0h+1a95csoijnyocxuBLa1nmHjVyogOe/jCumpL13xaTV7TGmQWGqyRgxwyaID
 vKolYv/z09J3Lc7qEd4q4zjaijJ5IFXgua8Zs6QMIjEarN61GW4leZ1+SptSrsu7ioJP
 h737t0JUFnRRQBr5Q1NjMypETAvk3d3vPFfjosjt69FHS6WYLCcbTwpGl9itXNStlVfm
 2Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQSJ8FaRH0MzeXOmZ4sot/W5wa5fsOU4ckIlLvavVeM=;
 b=g5vUhM0cGrwgIeMZor6cmbe8p92rCof/CXntLUNgd+1RdaOGBJs5oZFD4lpOWmB8mX
 Kd98h1lxKxC1ZfOouSyJ/wexhkfdHfUJS9JMgAf2/n3yTsE6F/MZL4cOBDtzwInIplJz
 RFwP2bORJzpZV2/Q/4mqe7lwil5x46fMo89jfAoIc2ZXQ6cq5biS6LGW77Ssxp3W1Ar4
 4cCCi+Md5bThDKZksqDPX8CvO46hWJ8mNOAa62hziZmGgYMAuKgyxpWiyBl//PQFfXnN
 oeuyiFFjJYwh370SQS4zIM5nD8RSvfvPvmNJvCzZZiHt+vjvUkN1uLGABbKHbprqKK4m
 9ciA==
X-Gm-Message-State: APjAAAVFV1tduK/2MsP+rk3Vj8JPjVyMs0OmpliAu6CB/vfqIyopCtAH
 ISeusBYLqBCcRqfC5ag4yw4ZvDOGTL0VXJ5zjxc=
X-Google-Smtp-Source: APXvYqwpzzBqqvklQqhNCbcqQBdJ2voaSyv5HQRbPWOe24SXpWHAFq7MBz/mD0qNava9xNka+wlzkU8O2lm+4fRXUIE=
X-Received: by 2002:ac8:376c:: with SMTP id p41mr16605189qtb.306.1566806035075; 
 Mon, 26 Aug 2019 00:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190824184635.34192-1-mrolnik@gmail.com>
 <20190824184635.34192-2-mrolnik@gmail.com>
 <55f37e1b-8ed3-b295-0298-4299279e4043@redhat.com>
In-Reply-To: <55f37e1b-8ed3-b295-0298-4299279e4043@redhat.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 26 Aug 2019 10:53:18 +0300
Message-ID: <CAK4993iY908S85hvHT64+Zo=AG8ihoTnTsFEJQSNBew7TBWWTg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v29 1/8] target/avr: Add outward facing
 interfaces and core CPU logic
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the commit was originally mine. Then Sarah rearranged it, signed and
submitted. She no longer maintains it. So' I believe I can remove her sob.
what do you think?.

Michael

On Mon, Aug 26, 2019 at 10:21 AM Thomas Huth <thuth@redhat.com> wrote:

> On 24/08/2019 20.46, Michael Rolnik wrote:
> > From: Sarah Harris <S.E.Harris@kent.ac.uk>
> >
> > This includes:
> > - CPU data structures
> > - object model classes and functions
> > - migration functions
> > - GDB hooks
> >
> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > ---
>
> If the patch is originally from Sarah Harris, what happened to her
> "Signed-off-by" line? For new code, it's important to have the S-o-b of
> all contributors documented to make sure that they agreed to the
> "Developer Certificate of Origin". If you made changes in addition to
> Sarah's original code, you can document that with square brackets, e.g.:
>
> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> [mrolnik: Fixed some bugs in xyz()]
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>
>  Thomas
>


-- 
Best Regards,
Michael Rolnik
