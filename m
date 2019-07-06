Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3741612F4
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 22:36:34 +0200 (CEST)
Received: from localhost ([::1]:32996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjrQ9-0001Mh-4B
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 16:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hjrPM-0000sS-Ho
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 16:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hjrPL-0003mF-Nl
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 16:35:44 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35687)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hjrPL-0003lg-HV
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 16:35:43 -0400
Received: by mail-ot1-x335.google.com with SMTP id j19so12321800otq.2
 for <qemu-devel@nongnu.org>; Sat, 06 Jul 2019 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9AERadkVHpX9vyVXn3xVGHBAEPmGL8QddFRJZWdB65I=;
 b=NpBdyjRQgMajytsNvl+FkheouZKsSCzR3bo9KRH+cRZwke7R/4zYnW4rhme4liQG2w
 ML/h+Ha4oV/e6fEm3yqnkaTLdb+sIIpRgKO5FE93cMc/x2t/2VWp69HyngYjYUGuDn05
 38VoeBMeGXbUlpJ7taI/Qs4I8rQmyKBET7MnWmYGEkwg0AaigHTZMH5jNHkwsX+hXz4v
 GnkSDmV5c1cHxfn9kU+JvjXf2C1CqQN3ol16fbDI1lSxQGnjs44TezG/YOPnB5JC6xsA
 kBHcmA7LWJoiEwDDN3yCuuVeOJSYTv3MebC1rwzZhEHO9w+xsoYhTuVWjYvq9mvEBTHe
 EIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AERadkVHpX9vyVXn3xVGHBAEPmGL8QddFRJZWdB65I=;
 b=N68noVYqA4ah3ry8H5ryavnNaALvxor5pHIbSE+5dKDL6AotD27kWsEy+UdbGmJI+E
 AeKEe82YJdtb7Ah4WSCghC1q/tFS3O/FhyvMbig248lCQWteILXXZpbYsp+LBAEbjxBF
 UAzQe14QGkrkGcbqB+xJWe9XIhTqbTvj6pO0mdaroRIAtftTPF9LRWb6i6koOsRx2WKs
 4cy50K7O97a0hhisnbj8xenqJuiC+N3NGbdamQchO6hJTlmuq70NhgijGbjG5yL3IKFL
 iQpJTbD79KGVZcCGCzVTNsSb6CGON2w6TPnnfzHTe0V3h1Mkdl0U6iU8GkfT8rFuCu8t
 LWSQ==
X-Gm-Message-State: APjAAAX8eAGTW7YTBgOw6fHkoYclH1liR0jqkd7hP9s82EIPFr4dVs3l
 eUvkbuiMpEjHygT+1K8Vglfca7uHHys/G+TFBFbX/Q==
X-Google-Smtp-Source: APXvYqyuGeOnhA8e707dw2bnQ8Z2X1+FCwXDLEFBm90lKr1pIdQ+mAVRzGrbqwyfUZa2Ml8jlHa95g4Lc1HtA+8q6dQ=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr8326461oti.91.1562445341564; 
 Sat, 06 Jul 2019 13:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <3c8b83fe-120b-40e6-84d5-5a3b88e46ee3@ilande.co.uk>
 <CAFEAcA9KjJUE7R0OYfM9AT=Ydu8eXBYJR=sGoGog25xrpRMZig@mail.gmail.com>
 <914f608a-5128-87a5-1c08-e20db88ad216@ilande.co.uk>
In-Reply-To: <914f608a-5128-87a5-1c08-e20db88ad216@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Jul 2019 21:35:30 +0100
Message-ID: <CAFEAcA9=KKtbR624rV77cu41zUTyu2N8-+1Gjmg-rQwdS1htuw@mail.gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
Subject: Re: [Qemu-devel] Parallel make build fails on fast machine
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Jul 2019 at 11:28, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 06/07/2019 11:16, Peter Maydell wrote:
> > If you just do 'make' rather than 'make install' does it fail the same way?
>
> Interesting. A quick test shows that "make V=1 -j2" works fine, it's just "make V=1
> -j2 install" which is failing.

Mmm. I suspect most people just do the plain make (with the make install
phase either never or as a second command afterwards), so missing-dependency
bugs between the install targets and the build targets are probably more
likely to lurk around. We should stil fix them, though, assuming we
can track them down...

thanks
-- PMM

