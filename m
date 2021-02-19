Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E531FD19
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:28:10 +0100 (CET)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8dV-0001Le-8A
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD8Q1-00064y-Lp
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:14:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD8Py-0006Q9-0y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:14:12 -0500
Received: by mail-ed1-x531.google.com with SMTP id s11so10866168edd.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 08:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CBL796UhhdITlTku0CzZZwQl6nZdf9RA8FYrdWG9d2s=;
 b=x6y2sdd2sKOdSo5PNsZ5h1suIX5RgZsTAibylaAN1qEZu000EmPxDaWrNJQrZIKB8h
 GB2BR5OojoiNdWwUWVUbB7dmk14nmv5BGiggEBgc9I8Hgz1ugRnRy2Mq7OXHXlmrjLaw
 +5MilxkfrEa5+ZOqJL6DcvsVJV3u9DDWKNaY4Zb1mtqKYdarSX33zsv0LzmAfi2boQnL
 xo0RaItcaiCoI8Jjgp/gkoCZ/3vV6QF7Tn+FhXzFcA+PjaTG48dgL4x0S8ubzhOtcYHq
 vt/+vvhymnGaJxTuObWEHzMVhsNOThEo8pWdjycZTa58c9vQx4QlY+EAru6uHnPa7Q+Q
 ZdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CBL796UhhdITlTku0CzZZwQl6nZdf9RA8FYrdWG9d2s=;
 b=B1U2Q9M0yxYC2bzI8lTN9T6MGgXpCXTiPUvDoZ2lfFjlHfIl3bcGbMh3p2VXi/8vsA
 Jwjen00Goif5wMpvLiQeW4j3D+HPrBhmNnA6pGHn0jUe7PrT5bpN6Y/jmylohAM1YFe+
 RjCrGaFMC7MCaw/CO3tl6HujVxHkude++tK+213wo4eVqF/DKr1QcgGulqArHjX/c9ko
 CZhzI6wVqy4DYFMFbIAXRY8+128WBnMJeVVH3o/wwvSYH0Wcl/tTNgti8u+xbpRWa7bu
 3gHQ4TUwRL4+4wbdeSCD8WeGfxpeqzsWzy/1upc9hl5UgfvvEBLc6Fm/7LIJFZ7qHmVU
 c7tw==
X-Gm-Message-State: AOAM530IsOuklaGwr+lHgM7cyqJKW2rPv6nmbSiEAQ2g5UQq3iEkFApT
 +Z0ngaS0kBcj6/KsGzhjh1w1ypvzdrSusIwJWy81QQ==
X-Google-Smtp-Source: ABdhPJxzQSKk7KuuVLtXuQJVm7A3iTCR7NBz+QbWUq3mLDH6e508QTIFzm9l/Y+ozfPoiT1x0wY+SzocA8h6ATZnL8s=
X-Received: by 2002:a50:d307:: with SMTP id g7mr10005107edh.204.1613751248149; 
 Fri, 19 Feb 2021 08:14:08 -0800 (PST)
MIME-Version: 1.0
References: <8735xss5q3.fsf@linaro.org>
 <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
 <20210219152408.34ibwagyqzgye4yd@sirius.home.kraxel.org>
 <CANCZdfqx+kCTkkw3jbDUwJB77DH0Qm3q8BpOY6-YJzKdY1eJeQ@mail.gmail.com>
In-Reply-To: <CANCZdfqx+kCTkkw3jbDUwJB77DH0Qm3q8BpOY6-YJzKdY1eJeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 16:13:56 +0000
Message-ID: <CAFEAcA9hW-hvjrS+tFt9KAkvVH+cCS_4JkMx+TUNEy5uFU-qaw@mail.gmail.com>
Subject: Re: FreeBSD build regressions
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <gerd@kraxel.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 16:08, Warner Losh <imp@bsdimp.com> wrote:
> FreeBSD builds packages on the oldest supported version in the stable bra=
nch. Due to forward compatibility, that means all supported versions of Fre=
eBSD 12.x will work. Recently, FreeBSD 12.1 became unsupported, so the buil=
d machines clicked forward to 12.2. Since there's no 'forward compatibility=
' guarantees, this problem was hit. While you can run binaries compiled on =
old versions of the software on new versions of the system, you can't neces=
sarily do the inverse because new symbols are introduced (in this case clos=
e_range).

It makes perfect sense that you don't want to support older
versions forever and that at some point newer packages aren't
valid on old systems, but I don't understand why an
older 12.1 system then says "but I'm going to go ahead and
install these won't-work packages anyway" rather than
"oh dear, I'm out of support, there are no newer packages
available, I will install whatever the last archived version
of the package for my OS version is" (or "I will install nothing").
I'm surprised this doesn't break a lot of real-world users...

-- PMM

