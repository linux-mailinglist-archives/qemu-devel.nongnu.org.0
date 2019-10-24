Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2659E2CCD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 11:04:36 +0200 (CEST)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNZ2p-0007au-VZ
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 05:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNZ1S-000700-DC
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNZ1R-0007mB-4A
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:03:10 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43843)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNZ1Q-0007lf-U3
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:03:09 -0400
Received: by mail-oi1-x244.google.com with SMTP id s5so4558979oie.10
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=usKIs/kF2rogKRM32/e9Iv1QaJmv+ID5mJNXiu1sNZ0=;
 b=JfXQ2REnXB00yCh3zW67mgedRXYuYnoH/EWCCIV1bucfH7BF7EaA4sGg9+hRw0R2ZN
 U8649fupq03DiI77JtXQp7MQOvIOBp+4hQ4ogEGyONC56vQc8HXMy+wi16aE4r6OY7hh
 hLYbjtoitQBqHLBMxGAPshXfOO3KJUFmu6yK+LqtO1PTCKAxn3GVhMj7y7366gpD0j2X
 ShxZtDTuPGtW2WCl7NESFLkS1SDQo9FPXfPrM7KZ6+/zaGzp40l2eqg0Hc8O3uENdKAq
 Z94xm1WhXGsV1sOAL3ZPOobhx7r1uunC9qtbridBrKIuLSxei35NPGKPzH5C8fB2yRhi
 5C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=usKIs/kF2rogKRM32/e9Iv1QaJmv+ID5mJNXiu1sNZ0=;
 b=gFLYlelQYGQv59UbZa+mw5kBiEkiPFp6/GvGEIBzgBKIL17bNZMXpH9mpy1/08v1Rz
 UwIUJCD074JwHXN+ul6XH9bu+8dzUJlRyix/Xhu7+2xn8hQnXMdhdhzltOa4KzPI5TTZ
 Xg5pKssUTwzGwK17LkAGM9b2Lu5KMc5ys18tpVGBzWRPB5lsLkgJBTz4wtn8Dxfs/BH0
 8q0PipSQjvBHGzMFUY9x+PIzn6LNMInWRVV+NxwkYFPx2TWGm5BHmqraYHIt4nc03nrZ
 qkwVwpkN1jQsES7GobrWsOEZxTQNnhutL8hHNfr6DIYSy9nvPtQbwVDDfY0zFX4Dz6xF
 MUrQ==
X-Gm-Message-State: APjAAAW0Gl1TbDHqCRcJ21ajkiyRaRH/XGrnk1WKggiL4CLIkOaEZWy2
 QoSSmVimIPxJa8+UhsVI8eHJY1zyOwHaKz1ZEp2PtQ==
X-Google-Smtp-Source: APXvYqystBSP+0jxpZtuC5oTiAwAWa8orxFCK4/SwA9RVnPo4waMkaOP4MZWFSMr0qZknj82Vwz2b3F+miwLJfWHPhg=
X-Received: by 2002:aca:49c2:: with SMTP id w185mr3675748oia.163.1571907787539; 
 Thu, 24 Oct 2019 02:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191022191704.6134-1-alex.bennee@linaro.org>
 <20191022191704.6134-8-alex.bennee@linaro.org>
In-Reply-To: <20191022191704.6134-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 10:02:56 +0100
Message-ID: <CAFEAcA9jeb_KBy9jMrFoY9=fp0+7YqNU8WrhRr7zxAk308MFXQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] cirrus.yml: reduce scope of MacOS build
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Oct 2019 at 20:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The MacOS build can time out on Cirrus running to almost an hour.
> Reduce the scope to the historical MacOS architectures much the same
> way we do on Travis.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .cirrus.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 8326a3a4b16..4b042c0e12c 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,5 +1,6 @@
>  env:
>    CIRRUS_CLONE_DEPTH: 1
> +  MACOS_ARCHES: i386-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,x86_=
64-softmmu

I don't know whether Cirrus is our long-term plan for doing
CI of OSX (maybe we'll be using Gitlab and some runner on an
OSX platform??), but as a general point: since OSX is one of
the non-Linux hosts it's therefore worth making sure our
compile-coverage is as wide as possible, not narrow. It's
safe(r) to have narrow coverage of x86-Linux because people
catch issues with that anyway, but it's exactly the less
common platforms like OSX, the BSDs, odd architectures that
we want to be compile/make-check testing as much of our code
as possible.

thanks
-- PMM

