Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DDB7B3C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 15:55:41 +0200 (CEST)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAwuK-0003Hq-Qe
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 09:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAwcv-00085F-1h
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAwct-0000gs-NU
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:37:40 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:36838)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAwct-0000dP-Gi
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:37:39 -0400
Received: by mail-oi1-x22b.google.com with SMTP id k20so2755425oih.3
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ofXdNtPYtv9GBLdTwK5i2oWyvOmB5u2Cfbzj753CEHo=;
 b=JBCF0CkseoTd11L/fVJE4T0fp5GSbapDQx+5+mPnD7m7YZHDgw0nI1YMHcq/l9wI2O
 sESVzy4xhu81NNdDzcUvPOozdcz9AWEA1RDCgTq//5hpQwsS31wCFmEl6/qFpQth03Ut
 Uy6pLwYFCAtDeXbyZECc7gMe5AIv1eCrxrf8RHe5COrnV64x0H561AgTbwqtbKi2EjTc
 4CLQQF40s6aCCUzNuUnGizSlz9Iir/1nR7AIR7GNodNqICbmHELEYlFeyDIGR4AqeVBt
 zM2m2KKLCaTLb5x97liE7fy80KyR+JdWgELr9Y2LTGoFYNEDEoiA4B8Jaeva3sBVMXLo
 JmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ofXdNtPYtv9GBLdTwK5i2oWyvOmB5u2Cfbzj753CEHo=;
 b=U5D7XL2r9KMOr1uJZVqF22qXHVXJGS4ZaEdJBX9xtcwa3SLFOPEasNMg3A4ybwUwzV
 1Ciqimf9Q8DHXIkMxDp4mazhCu4q6Fa80O1L0nX2g1IBH4T21DzNPVxiSZaKnlLlO8sV
 6u5vgbaJhy4d8cxoJeVyHJPcvq6aR+f+12WFYCi+ifhAyOnEMJIvsJXN4fJ6Feogh1Xn
 DkFR842FClsjqBhx+K7KXYbV1xO4F0UAFkS9Pii+MEFx0/VzgzUlW5Oidk5mFv/CSdXG
 6jQn10dj3jdAyLJx+FvvjO7YfPsCqUJSoobJmCEpax3YED7eJhMQA7TT1q7hShzTgDJW
 yFzw==
X-Gm-Message-State: APjAAAWaxwiJHsQx09i+t6tD4yu+oN3BUUUqTkLYdcscDtmL59WUw5Te
 BaL097IPACV7FUok/3pV5Swdjvz87AAzdw4uWlHTqk52sjQ=
X-Google-Smtp-Source: APXvYqx6basRHjH4icsu4KCS0cAUa3lFB4qeXcHgMF19e2S2pT2TI2rbYDRZI9wZKR6PF7BS8qhl63ajkchWrAvZLXw=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr2257617oih.170.1568900258419; 
 Thu, 19 Sep 2019 06:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190918132112.10418-1-stefanha@redhat.com>
In-Reply-To: <20190918132112.10418-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 14:37:27 +0100
Message-ID: <CAFEAcA-NDMWuey-WDLZa-7s3ds5jk48p46Coo0FHteq5uQRmTA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Subject: Re: [Qemu-devel] [PULL 0/3] Tracing patches
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
Cc: Fam Zheng <fam@euphon.net>, Qemu-block <qemu-block@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Sep 2019 at 14:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit f8c3db33a5e863291182f8862ddf81618a7c61=
94:
>
>   target/sparc: Switch to do_transaction_failed() hook (2019-09-17 12:01:=
00 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to 9f7ad79c16ede0da01902b18fb32929cfbd20f87:
>
>   trace: Forbid event format ending with newline character (2019-09-18 10=
:20:15 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>
> Alexey Kardashevskiy (1):
>   loader: Trace loaded images
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   trace: Remove trailing newline in events
>   trace: Forbid event format ending with newline character


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

