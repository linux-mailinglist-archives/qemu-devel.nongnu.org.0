Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF8B23C37
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 17:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSkJ9-0003Uj-Pa
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 11:34:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSkHs-0003Af-HX
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hSkHr-0006xt-JM
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:33:16 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hSkHr-0006vw-Dn
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:33:15 -0400
Received: by mail-oi1-x243.google.com with SMTP id v2so10312990oie.6
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ufxjpzH4YuI0m0iro1fdW/i938066NCrZ0A0YNQ3mk=;
	b=apfzkZPkaCg8lH3wYIWNU+DnSGTC9yt+XJm74Z465h6i00V7VlEmtwlgxTwRuG3O80
	+1oeNRrk1MPOhi8Zwj4Dshnvc0MESYh5buwjn5TKOZX+A/D3eKF+JZrcz1Tmv6xGwYEn
	cTjoziiaNM5YRCV3pvUEMdhkLZnEZDPjo8du5kAOPE7beQ62iIRXkUPFMeJ7x7Cl0a37
	DjZgKSzB8Li7Asr2aBVvwv1pkIt/jVnRL+1XyqJNE3YedcsaTYTbW9H0WM5LgXTXofRe
	T56FQJvGrLaeAgfSwGB/iFFzWR/1xnbG8EUd29HigQ6Cm7k/hCTYk8UqWXOGreRk+YBZ
	ImMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ufxjpzH4YuI0m0iro1fdW/i938066NCrZ0A0YNQ3mk=;
	b=cLLFrztjhj7GHFzaeIGBjmArNtZaKgkgsBysK6N7SXOyCpKtV4DcnzeCFM1UVFcp4g
	EfY0bAPvioICpXGh42NlY8c4+1dvTS5+O1Fulh7FntMlF5HARaw9QEJ/6mrmgniNxBu/
	96C+VPBR/IXN8ZtcZePHPihMaLJPuiDL0yAXWW1FEOTJCoVTbBPJ377bevboUaQWhoVL
	MPp4qSiSIGzuq9S7BSiuWXFIgDNc+Ngk3QRELMmZsnSW5HLoxidXusw597dQZR2MeVLM
	RNKfIru4JhcT92KXlCZ/BV5S3kBaoVZqbWCew+nZcHkljKF/5NlClTSlwhWWJ89+OAUU
	cb1A==
X-Gm-Message-State: APjAAAWIJYpQz2VEFpjEUeHVBqafz1N777GCgC5+/V+BuUI76TaMt/ve
	i/b+pvmT4REDrdaVYPhZ2aiprdCRBZJg+Ec+tEikWXrMx4o=
X-Google-Smtp-Source: APXvYqxGNrS54N8SBGz2VZqMa6oa2cuXeyUovoQ21rKZvbAZT+cXNuaIjyQreuaHIwRCp0PzPw7dST0zxHVlLSARjQI=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr23609829oib.170.1558366394415;
	Mon, 20 May 2019 08:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190510161614.23236-1-kwolf@redhat.com>
	<20190510161614.23236-14-kwolf@redhat.com>
In-Reply-To: <20190510161614.23236-14-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 16:33:03 +0100
Message-ID: <CAFEAcA8NthV=ZDV3yhb7Jzp-Mt4SZMHOpgYUEmdTconhresEUw@mail.gmail.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PULL 13/15] qemu-img: Allow rebase with no input
 base
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 May 2019 at 17:37, Kevin Wolf <kwolf@redhat.com> wrote:
>
> From: Max Reitz <mreitz@redhat.com>
>
> Currently, without -u, you cannot add a backing file to an image when it
> currently has none:
>
> $ qemu-img rebase -b base.qcow2 foo.qcow2
> qemu-img: Could not open old backing file '': The 'file' block driver
> requires a file name
>
> It is really simple to allow this, though (effectively by setting
> old_backing_size to 0), so this patch does just that.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Hi -- Coverity reports some new "resource leak" errors
in the qemu-img.c img_rebase() function:
 * CID 1401415 : Coverity complains that the memory assigned
   to out_real_path gets leaked if we take the immediately
   following "if (local_err) ... goto out" error-exit path.
   This may be another instance of Coverity not understanding
   that the function won't return non-NULL if errp is set.
 * CID 1401416 : leak of the 'options' qdict in this
   error-exit code path. This looks like a real issue (and
   there seem to be other error-exit codepaths earlier in
   the function which leak this too.)

Would somebody like to have a look at these?

thanks
-- PMM

