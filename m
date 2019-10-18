Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EAFDC7E8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 16:57:27 +0200 (CEST)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLTh0-0007D0-P9
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 10:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTfO-0005xc-Kh
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTfN-00050M-Fm
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:55:46 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33474)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLTfN-0004zm-9b
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:55:45 -0400
Received: by mail-ot1-x344.google.com with SMTP id 60so5216285otu.0
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jf0iD0Uy01XhbMi090dz1RGh1Cj6ASQdG9bTgwlfeCA=;
 b=uyap7VIdyhvAbA1h0uyEzHfgED7ZBsAqhh+Tv5gAU9Jfzo7t+DaJ9A5TeoPrxtw0eN
 QDG2FBpLgsEZS9/flyLmG7VXz0CNIxDkOMPhdzRyNREvDri/9RJyzm9K3qfwvKzYzsuD
 ewKhQNX/aoTXQ7DwwxXd3ae/z6ilPUV8V6a7nbQ6pr4eem3FwwOC3hJ55S9dE6E4DH95
 6gsyhBPuYSkpVf6k8ygi4XZlrGTssJzROe7Egle5dkvAt8wFaoKT65vOXz/+DJA69CUx
 BzpcgvQ/DgkIrByxNTKBLEwt7r2oGyGy7UIi9n6zySCGL58JOHfC3u2mjoqfH31xH/nx
 PkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jf0iD0Uy01XhbMi090dz1RGh1Cj6ASQdG9bTgwlfeCA=;
 b=RvI3ZFku2SmSrZU8JfdmJP5qI8PRz9aUXVOW7nw0gzKS4EG95YjCn2RTh3pm6HHwnH
 H2YZRhoeY4fBqlgHrjzyMZQywOXL1plpcqVTzUGdufYc1eEjCqKM9HwKX8dQaCNu1z7Y
 BXVTGW1mkuLpUfJNiQLl9Eq+JvMkJlF5X0BHKzjLR+isH5aChywkRGOWyJSGRly/Ocwi
 82KR41vuS1158hhUfWrLJTDA4MkjUQXgWt1dorQmiMvdIrpCGmxitNpYsZoffRMzSFNQ
 XsaQ8ADHlRn46S8lZyPqVETr7GruWImqZCt3K34gEXGh1goD1ChcbRJ2OPCPzF8K2V1q
 Cm6A==
X-Gm-Message-State: APjAAAVZrzhyJ6J0451FP1xp+W8P3zx+6ZuhLJa0KFx1jbJ5TChkwwnz
 bWuOrObcajDDHY3LP9YmVx/z+Ltt8NjRVMp8rUWaAA==
X-Google-Smtp-Source: APXvYqzikFpvt6a998nlZ4O59b4UfEq+zbdX5q1JGt9C6/iY2cducgBr9yaFnZkhRdRVjPgGSE2tOt9dWurbnGfe2PA=
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr8183098otg.91.1571410544166;
 Fri, 18 Oct 2019 07:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-20-richard.henderson@linaro.org>
 <CAFEAcA9oJ0P-g87caLKyT1mS2k7YhtNXAOhSgXuMy0bCGwX0WA@mail.gmail.com>
 <aa753ee9-40ce-d6c8-801f-eda74d76fd3d@linaro.org>
 <CAFEAcA--tmMXeFauHRAFeeLr+MXmQq4qcsoxpx1vOVM7ZuLoAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA--tmMXeFauHRAFeeLr+MXmQq4qcsoxpx1vOVM7ZuLoAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 15:55:33 +0100
Message-ID: <CAFEAcA9hzEvmvopeY=nLhFNObxVx4ZVOXjGPs8_u8ySO45Hzpg@mail.gmail.com>
Subject: Re: [PATCH v7 19/20] target/arm: Rebuild hflags for M-profile.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Oct 2019 at 15:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 18 Oct 2019 at 15:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 10/18/19 5:25 AM, Peter Maydell wrote:
> > > This seems fragile -- we have to remember to add in
> > > a call to arm_rebuild_hflags() for every individual
> > > case of a memory-mapped system register that we choose
> > > to cache in tb flags. It doesn't seem consistent with
> > > the choice for A-profile to rebuild hflags for pretty
> > > much any sysreg write. Maybe it would be better to just
> > > always rebuild hflags at the end of nvic_sysreg_write() ?
> >
> > I thought about that, but there were too many returns out of the middle.  I
> > suppose a wrapper function would take care of that.
>
> I hadn't noticed the early returns from nvic_sysreg_write().
> You could just turn all the 'return MEMTX_OK's into a
> goto exit_ok and have that do the update.

PS: just for clarity, nvic_sysreg_write(), not nvic_writel().

thanks
-- PMM

