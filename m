Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D685C10EDEC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 18:10:33 +0100 (CET)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibpDU-00084X-R0
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 12:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibpBv-000717-Pb
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibpBp-0000rR-G3
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:08:54 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibpBo-0000pQ-U7
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 12:08:49 -0500
Received: by mail-ot1-x343.google.com with SMTP id 59so74104otp.12
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 09:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R8cQcTi3oOBv6Tl/R0jBeQ1KtsQu2Q/y6G6u+miI3PE=;
 b=U3VMcAGJC+wWyVVxHfT26+6cjCjJfmSZKxgy1JTXbcHnfIerhkf95Y3/mR5VLsKlPw
 QhLOQCfbLNMvmCWYANKrNY7v5uAjaKmNjttFnP36dbDZpmHOWPQ588HwSVwhx3vXlThE
 A7NGynf8khQkTZIx2OzLX8va2SdGHhWx+u2x9MToOLzfJIKDtfcFb2PO7guOZD5kBn96
 gid/v+EL6vWaQ4eNr8rM3k4xi8yiFocwnavmQeUtGn9FyiIwDuXIGwDpsu68+o7G1OfI
 21ApqiudshJGTHbialREBVKsezcB5m3XguGot0tIhD5QydZWhsjsBmhsPSV/wc/+KINV
 LTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R8cQcTi3oOBv6Tl/R0jBeQ1KtsQu2Q/y6G6u+miI3PE=;
 b=VQOrtRLs7nHwD4zrfVvPP8HZt6CcvpCD+fJQ+sLooXRs9O42p3KgqKnP8yUHL9dz43
 NkBagy+mu+o7FDmqqsIM2+v8NKjag/I7/vQ8W2bbX6cLhD4rPPecv6gr/BryvuvGm30V
 Wxm6Y1cOXG0DbxZGIHb7v1N0T7uCjFlYWKjyCR0CA5SLfi51JCYJWASPmBlrZs27QshC
 wnI0KPQsW9oT+J2/+Zzl6cW5zQbMPOekbJjXVJEkXPuDjjjufoSYOvO/OdQ1jmMrV5e3
 BgOOzvCsUbk2NvaoUsZnNZoREkY29KTHWegs+L4JEbrkVshA729/CJuxbwfl2zu/IMzP
 Rzgw==
X-Gm-Message-State: APjAAAVOM3HM2LEpiMLd9SN+ebfDzuwGi18OYrSupLMqXoKV9EbBcxGu
 2ql2ppMA4dEXllAuXQ1fk2IppitZKLWx7PORGcx7gg==
X-Google-Smtp-Source: APXvYqwONTSPnDvVvi8HcZ/a/YY50StN/4KLk1ykJGtcbrR6FkM+jI4XzilAttK7sVjUaBIqHSg4db61b0mkVY2Aw3g=
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr57641otg.232.1575306526343;
 Mon, 02 Dec 2019 09:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20191202140552.GA5353@localhost.localdomain>
 <20191202170018.GD139090@stefanha-x1.localdomain>
In-Reply-To: <20191202170018.GD139090@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 17:08:35 +0000
Message-ID: <CAFEAcA_fB1o95JitpzcZ4rtspxfD8dfkUZ3ZOcdMcAQpDFtYYQ@mail.gmail.com>
Subject: Re: [RFC] QEMU Gating CI
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Jeff Nelson <jen@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Ademar Reis <areis@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Dec 2019 at 17:00, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Dec 02, 2019 at 09:05:52AM -0500, Cleber Rosa wrote:
> > To exemplify my point, if one specific test run as part of "check-tcg"
> > is found to be faulty on a specific job (say on a specific OS), the
> > entire "check-tcg" test set may be disabled as a CI-level maintenance
> > action.  Of course a follow up action to deal with the specific test
> > is required, probably in the form of a Launchpad bug and patches
> > dealing with the issue, but without necessarily a CI related angle to
> > it.
>
> I think this coarse level of granularity is unrealistic.  We cannot
> disable 99 tests because of 1 known failure.  There must be a way of
> disabling individual tests.  You don't need to implement it yourself,
> but I think this needs to be solved by someone before a gating CI can be
> put into use.
>
> It probably involves adding a "make EXCLUDE_TESTS=foo,bar check"
> variable so that .gitlab-ci.yml can be modified to exclude specific
> tests on certain OSes.

We don't have this at the moment, so I'm not sure we need to
add it as part of moving to doing merge testing via gitlab ?
The current process is "if the pullreq causes a test to fail
then the pullreq needs to be changed, perhaps by adding a
patch which disables the test on a particular platform if
necessary". Making that smoother might be nice, but I would
be a little wary about adding requirements to the move-to-gitlab
that don't absolutely need to be there.

thanks
-- PMM

