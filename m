Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E017D209C25
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 11:44:12 +0200 (CEST)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joOQV-0002nr-Go
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 05:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOPn-0002Nd-OE
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 05:43:27 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:32908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOPm-0005zT-20
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 05:43:27 -0400
Received: by mail-ot1-x344.google.com with SMTP id n6so4704512otl.0
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I6of4YI/4DxG4OC0kHiW5np7Xk3ln16lCnstIfBzF9c=;
 b=wt7TXcHKaKr+DwOhU/joUW+DgOi7DlZy2rYzYsnQDayHyNF9/+k6k6FcrXu7wvzb8Z
 9nLECxd1D1YLu+eXs771NKYF89pOVytYyeY7R/Gu1pX3XHyYKcy2P4IKDG3RBX9qUOhx
 p8POpHZtdtnq5JH9b1i54TugsUhgJDoZYeke5fO52EmkvQvQ7pA9+LeYvXI2Tq28iCDh
 Ql9qjuTKd5ZjpkUesNakeGPBOiy81244gDGT98gzTyAyBiK4b8jZ2Qt4965jz9I8MRYY
 yJoIuon6OolO8sVMxnTaZJFLLWT3uqCWl7p/rwtzHYa5TezsbiW7oIVvBqVuI3FAxloY
 xaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6of4YI/4DxG4OC0kHiW5np7Xk3ln16lCnstIfBzF9c=;
 b=RFsbKL+xlFJh7n4REU9S4kIhFa0pyQO7KwxReF1IKCzPifQ7UEh0sdxffYeXjehDGv
 JTh9kABUmt/tPujaEi8dRt+bkRUW4Nwvo6yVolrZ07NEJawHqQHZmiI6GgbyuRPBXTXk
 nI0+mZqexf7BVdcInD6KlF6olLsoIYTF8RmlcPcyaK6G2mgNWiO0MW6rvuKZeaqnZ+wv
 AvhDx1EJFoMAQC+TCYNYcUxuO0O3uyzTBFLCyxdkvhwnAFmvlaHPNTmMdDFPjI64p3ny
 ddJIcscI/DbXRxk7uZYbAtfpD/YQw42oRRMTTaC+o+zmndcEibwAbkq8TwP0ML4IaucK
 UY8Q==
X-Gm-Message-State: AOAM533FhJwsrI7gj9j4JaoPzO1vc5hRa3AsdUxI5PjGLsVgtL2pEecW
 nWHrdC3s48eOW0aIfNd442K86Q+KddTyEAVf5ORKEA==
X-Google-Smtp-Source: ABdhPJyiaD9xj10CkxMX7xKwXZ2QPXlUoi1++TRM+pYAvw1dLt17LTuTbRCzRDoPYdEiH0alVBFjgxhvO0YozD8tj3c=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr25888084oto.91.1593078204685; 
 Thu, 25 Jun 2020 02:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2005070038550.18350@digraph.polyomino.org.uk>
 <alpine.DEB.2.21.2005070042360.18350@digraph.polyomino.org.uk>
 <20200623214226.GH9925@habkost.net>
 <alpine.DEB.2.21.2006232159560.6195@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2006232159560.6195@digraph.polyomino.org.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 10:43:13 +0100
Message-ID: <CAFEAcA-7ynHi2pDsPtSXWpG9PsfnCZzp4oXOodaccL5k3ggqcw@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/i386: implement special cases for fxtract
To: Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 at 23:01, Joseph Myers <joseph@codesourcery.com> wrote:
>
> On Tue, 23 Jun 2020, Eduardo Habkost wrote:
>
> > > +        if (EXPD(temp) == 0) {
> > > +            int shift = clz64(temp.l.lower);
> > > +            temp.l.lower <<= shift;
> >
> > Coverity reports the following.  It looks like a false positive
> > because floatx80_is_zero() would be true if both EXPD(temp) and
> > temp.l.lower were zero, but maybe I'm missing something.
>
> Yes, that looks like a false positive to me.

Thanks; I've marked it as a fp in the coverity UI.

-- PMM

