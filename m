Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171541E658A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 17:11:18 +0200 (CEST)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeKBg-00035r-Lq
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 11:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jeKAY-0002It-OA
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:10:06 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jeKAX-0006zx-Pt
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:10:06 -0400
Received: by mail-oi1-x233.google.com with SMTP id l6so287041oic.9
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oedAfTxD/429O6L+ofm12Jw/htrOdTp/Ysn0QgXCFhE=;
 b=dwu+NJYF1WOS1056feK8akbVqS9eh6AqcfYpVk58ombyPy8osqpDqCF/LDz30xR8TI
 NUtQ3JiO5YGhSCmGF3iV18XFqtSubLt/AKr9atKwdt2nbh/oZu68d9kcDKIkhvJ9AvNv
 pw1Lj/RZy7lhLMP+/CqLXYaZZJaqKwJjv92uXMbiqtDnSDeMiOhBJv0QwkmSjyWp4jK3
 2oCnDv291ahR2CNuWRVW1QDrnCRjPt1broUev10CxqBQGpYmZ9zK6+0bq5wHXNhNngTL
 11WSM8Z9R0cTefwSq4r26ZYScHhAlniMKrjIqoQaQuGIyVAwRnhU/UtKPIkMMYYJylbs
 MetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oedAfTxD/429O6L+ofm12Jw/htrOdTp/Ysn0QgXCFhE=;
 b=Sp4xdrnzI6Ftz1jmZwqp4e/dgRvx1hs9rfI6qivWWfbgID5gXwWPhr7++XOKvtYedN
 03oJBXyxeXjdT+ry5rO1dlt0stXfoIBbbd1yz0N9qFvyMsXx1JJmJvYnyJBRpkZBqWlY
 fb8Jf97uFOT4rVV8JIriw5Q6POzU/my3BwlanUQviV2i4tViZH5QnxNJiNzfWoqpRwHe
 xqiRliNx1CwV2OlJl5pP9I69gaeZqfzntPLiT7i/yfDPhtZmQesu5sY9aLwPgSCHZ6vQ
 BiAa86JzzF80peZxY/l3wsqaqxDinv8epCDuNTCnBLpwWgRGgHCgv+IRm99Q4JZGbSBm
 eGDQ==
X-Gm-Message-State: AOAM533QRkyhheCujS8Dz4K7spGV7xwzMbWHo24j5y1GJLpGcq7rHeRY
 rkOjnvtS9WRzv38Qn1uSgyn/0HAWFBHAbvH7uyFW2w==
X-Google-Smtp-Source: ABdhPJyfSlNaheR9eplpS5C2NXBV7mZ3Mo7DBmDogHiuX3bZvrzsu7SqcP5nN00i4Z2jmn7TUOg8Aimgkt61OIa01qE=
X-Received: by 2002:a54:469a:: with SMTP id k26mr2494554oic.163.1590678603680; 
 Thu, 28 May 2020 08:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200527145455.2550-1-alex.bennee@linaro.org>
 <CAFEAcA_LrZjBY_y3UR=fdOtDvnY=zGG-10Yeq0ZjbBc=EsvRfw@mail.gmail.com>
 <87blm83y5v.fsf@linaro.org>
In-Reply-To: <87blm83y5v.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2020 16:09:52 +0100
Message-ID: <CAFEAcA_QTkWA7eBwORWMmpcH1E5bF4A3mFtkzdstkucd-2+p3A@mail.gmail.com>
Subject: Re: [PULL 00/12] testing and plugin fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x233.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 May 2020 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I get these on commit ddc760832fa8cf5e93b9d9e6e854a5114ac63510:
>
>     LINK    arm-softmmu/qemu-system-arm
>   ld: /usr/lib/libc.so and /usr/lib/crt0.o: warning: multiple common of `=
environ'
>   ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may co=
nflict with libintl.so.8
>   ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may co=
nflict with libintl.so.8
>   ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may co=
nflict with libintl.so.8
>   ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may co=
nflict with libintl.so.8
>   ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may co=
nflict with libintl.so.8
>
> which makes me think the build environment has changed and it was simply
> that my PR triggered a re-build of the NetBSD VM.

Yes. I see them also now on the next pullreq I'm trying to
process. How do I get back to an environment that doesn't
produce all these warnings?

thanks
-- PMM

