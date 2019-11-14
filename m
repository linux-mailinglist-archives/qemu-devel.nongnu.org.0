Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BAFCEB0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 20:21:57 +0100 (CET)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVKgm-0007MU-E2
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 14:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVKfT-0006Wp-C3
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 14:20:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVKfS-0001Gz-Bu
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 14:20:35 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40568)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVKfS-0001F7-75
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 14:20:34 -0500
Received: by mail-ot1-x341.google.com with SMTP id m15so5862196otq.7
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 11:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QSiJz3Ked6l2WNvVwIICO+DFlM+1AbOJLQpy3dASzg=;
 b=lhq1gDyo9FCFHPHk5Gje88+0Z8w+/0n6D8P3dvf+8/sm0Nw3yS2vNXCxzv0w/t06zr
 420IPjOtWUqS1sa+DCG3aQrFziBUmjEKr6XoteReS2LoUW5xTy2jO3prJ5FOxRzk73bD
 GdAflBpdbcPbQzf3FGJ9Wm75i88G/iqFspEWd6PzdKBARAJcP3yLQ6THi6Yy1B9ZArkp
 tamQpN+fyDVN/modt4ULBMI6V/5duEpPBQBhBId2OsUtKz2Zh0+0HapZBoIuExOyxTXt
 L7FucyOVYH+REmy6R3Lqzz5ZmidKry9MO6r0XY3UKn+IvkARBr4+3Tws3mB+wACmZJr2
 Dfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QSiJz3Ked6l2WNvVwIICO+DFlM+1AbOJLQpy3dASzg=;
 b=GNuH1n3KNrhCCq83SjIfRxf2It4PE0o+U44T77UdtX+UcY7PD7ouJzGoxGuCNsWXFW
 Z6P2FURrpQYoXai4SxTvJ9XVyv/v54FdX7YSbJQHbAlYCgrCV5xzMaqCWkR1VGQCWfIU
 OCHTtsddTCPvw2kkITjz8f6ZSt95sT6OFQJFoz5D75XbqlMtVoBdPiLhZae0V3aX9xvw
 fQBavnnRmwvBSDOEQ8itvLKV7H/1pJEdd2nGAnfsB+LluaL5Tbh4WVYcxrXeOltZUIwN
 hWuIbM3jwWe7beXkc+P2ss1b4x3xBZXvORdvr/pWhAXrLy5j4Or7gH+ze6QAjyiNDjis
 7HuA==
X-Gm-Message-State: APjAAAUVp8fESeevr+mFN+509AljmWRr1fodMbafRwa5w2OPv2J3rdf/
 oQOcp05S95wiFVTVsOVs+zsAgvO0cqaxC6mmt7U6zA==
X-Google-Smtp-Source: APXvYqz3sgw2hVpmvm7I+KLjnfP6tu2SAxl1r9sWCeorsnHYhtXfhj4yhGjMbPKXCtzLa68TyP7wuN3Y6O0wsj7clMI=
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr8820022otn.135.1573759232932; 
 Thu, 14 Nov 2019 11:20:32 -0800 (PST)
MIME-Version: 1.0
References: <89ada4b1-ee3d-a512-07c2-9bc1ba5806da@redhat.com>
 <20191024224622.12371-1-keithp@keithp.com> <8736fhm9tw.fsf@linaro.org>
 <87pnik4w9n.fsf@keithp.com>
 <CAFEAcA-g+RkvYjseDE=1Z=gnLum0Cjvn_7bqB3ti+cBq9UZ3Eg@mail.gmail.com>
 <87mudo4owu.fsf@keithp.com>
 <CAFEAcA-nnkHuj4y8+vFu5=virUoxwarg=kqQvUWeN73SDs+TzA@mail.gmail.com>
 <87eeymx603.fsf@keithp.com>
 <CAFEAcA9rSS8jwSOSFjHd7GZ0gNywEDDJPBJhJ4FxhyqqtjU6OQ@mail.gmail.com>
 <875zjmuzl3.fsf@keithp.com>
 <CAFEAcA-EdFTUZc5+3n1_t=2QUBaaCLUCotu00Ju4UWnLdSgq1Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-EdFTUZc5+3n1_t=2QUBaaCLUCotu00Ju4UWnLdSgq1Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 19:20:26 +0000
Message-ID: <CAFEAcA9tzs7ho16Adi-qZqt4uiu985+N=A_3wLRsnX3eJfuVKA@mail.gmail.com>
Subject: Re: [PATCH] Semihost SYS_READC implementation (v4)
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Nov 2019 at 17:47, Peter Maydell <peter.maydell@linaro.org> wrote:

> The ARM semihosting ABI also has a number of warts
> which are basically historical legacy. With a clean
> sheet you get to avoid some of them. (Notably you could
> skip the whole 'negotiate presence of extensions' business
> by just getting those parts right from the start

...better still, if you can define (a) a mandatory "return
version and feature bit info" call right from the start
and (b) the required behaviour for attempts to make
a semihosting call with an unknown/unimplemented
function number -- then you can avoid the nasty
kludge "magic behaviour by opening a magic filename"
we were stuck with specifying in arm semihosting 2.0.

thanks
-- PMM

