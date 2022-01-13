Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A917F48DF3E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:57:23 +0100 (CET)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n879u-0006Xd-Qr
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n876S-0003Er-B2
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:53:48 -0500
Received: from [2a00:1450:4864:20::430] (port=38812
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n876Q-0000Rf-PG
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:53:47 -0500
Received: by mail-wr1-x430.google.com with SMTP id a5so12349843wrh.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fZAkvVtZHwqrHdaG4RpnqkW/SdxcPRBAucfO2kuhQw=;
 b=maDK0PImRn8ULCEjPAqO5maQ8eZSyDEiP1hquAdw9VJVV68WHo3g0bTAUM+gtNAX7S
 vNnqEVWQ7hhfie99lQt71pk7Vi7Yg+8ZiwKETlE5ppDa6MtjlMIo7q7kM/AuYuaA/g90
 36Htd8i98NlgXt3AV1l5lhkrB4yrTPeemTvHY3omr7SxfcJk8dhr14aY+6qc/gWomYa9
 Sxsg14zY5yAXbPAr3UUhZv5fSFUf0xyHDIMzD6AXg6NLvIrAEcr0X3tRHBtZvXL/eVtQ
 4JfB59CfYDOLHgQsE0QUakQpcfYz6V2CisnrY08jHsi3rUKrwucmKtRk+7V0Kl06Jy0c
 YG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fZAkvVtZHwqrHdaG4RpnqkW/SdxcPRBAucfO2kuhQw=;
 b=RYVAX5HyQzbgMe7tHjwVXGWA4h2xzjJRE3eBS9VClGiduHu8ItKVh+UzbuTlvtjiB1
 wfdURKaJgSkkDJGB+tD9+tlhofVgWPPKh4352RIdnRWZQODsvYkXSgsjwasmgH7pUeE3
 A5axZUofALGNLjy5ilwB2u4k91h6NCcmuUviEHe70Qd76h6HT3anzkM+xW7K/O/jfbUD
 UJQFD8s8ZVQVYYvaCdCcnAgjQINnX8ZbIhUG7oQL5B6JaCAE++5d/q6oDi5RH5U/NzWj
 DhfuIM0FfruEzAo2OtkwWZ1e2VLs6KsI1xaNTnM67Rn5cc9h4kXQCMSqgJAVZKh5xL+3
 ZRLg==
X-Gm-Message-State: AOAM532FpDEH41wrPUoefGJHc1qvBG78awZMFb+j6nh6993VAGbr3DcF
 CFisrd4oGzEoqcmmE5MyLdH9HE5oOdsX+a7nMvDs/g==
X-Google-Smtp-Source: ABdhPJzblBN5lb16iVxLxiu/RF4dR1n0SvKd1x1HmrKfXKSdByfRB7os3HrF/BC1DvNRD/qkrDs/8oJRjIpQ6IvdJOI=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr5651446wrv.521.1642107224827; 
 Thu, 13 Jan 2022 12:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-22-imp@bsdimp.com>
 <CAFEAcA9xbOCjc7ZLULuyWNYi5jHtS=N8_HWiob_gaAE+3vxZAA@mail.gmail.com>
In-Reply-To: <CAFEAcA9xbOCjc7ZLULuyWNYi5jHtS=N8_HWiob_gaAE+3vxZAA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:53:34 +0000
Message-ID: <CAFEAcA8bdDdn8-UOeGX_aHu1E1QuEasCK++x3qNrvRfg6MqCaw@mail.gmail.com>
Subject: Re: [PATCH 21/30] bsd-user/signal.c: force_sig
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 20:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 9 Jan 2022 at 16:44, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Force delivering a signal and generating a core file.

> > +/* Abort execution with signal. */
> > +void QEMU_NORETURN force_sig(int target_sig)
>
> In linux-user we call this dump_core_and_abort(), which is
> a name that better describes what it's actually doing.
>
> (Today's linux-user's force_sig() does what the Linux kernel's
> function of that name does -- it's a wrapper around
> queue_signal() which delivers a signal to the guest with
> .si_code = SI_KERNEL , si_pid = si_uid = 0.
> Whether you want one of those or not depends on what BSD
> kernels do in that kind of "we have to kill this process"
> situation.)

It looks like the FreeBSD kernel uses sigexit() as its equivalent
function to Linux's force_sig(), incidentally. Not sure if
you/we would prefer the bsd-user code to follow the naming that
FreeBSD's kernel uses or the naming linux-user takes from
the Linux kernel.

-- PMM

