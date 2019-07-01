Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A105B32F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 05:58:35 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhnSd-0006zN-7H
	for lists+qemu-devel@lfdr.de; Sun, 30 Jun 2019 23:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52095)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hhnRH-0006S1-SV
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 23:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hhnRF-0000V8-TO
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 23:57:11 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46014)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hhnRD-0000TD-Uq
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 23:57:09 -0400
Received: by mail-ot1-x344.google.com with SMTP id x21so12014216otq.12
 for <qemu-devel@nongnu.org>; Sun, 30 Jun 2019 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dkfQeiXDLXUYX17x2rDqaUzaQBqjEjkxW7FN8vv7u9g=;
 b=grS2NQteYtXl3S1f/KFyr35z1O4CFvH76bb4fAMj2uXa3D/cUHqsxiFgzSO9gcJ3If
 6EDMPo0mZdcMoosL+Bnc7I0+DZdTzUBnm78tbiN7uXaRk8Cua6ww91aMRW9WIR6dBGrf
 Ct8Wldxc5vn4++w/rwRLOyyajnpY08Be8DBBEtHtIyidJoxBZO/W+YDTgjPr/qk/uTq7
 Lw+U7XOTDdY9rMnkjvWBR2MGMyyONLjwZzlqP2qy5qa5Jd/X3Y6qY+WJQmEi5VFg3v5D
 6AYHfYozHDseJ76vyn4n0sPcrzGrisUNzN5BxbRmcAWBB39sp5VtB9Pcrmy0t+zbsyYJ
 U99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dkfQeiXDLXUYX17x2rDqaUzaQBqjEjkxW7FN8vv7u9g=;
 b=qQ4Q8iv8FFLfag1CZ+85BdScZfv5vZHJ6zhOmvoV8BYfpTz7UHvxFy/512kgpkTwPD
 4Go0qmx/jsXgOV3X74iKhiNuX9mFExoPSrvnUShLQOux2SMAK7mmpR9Z21BIXLfoVXzn
 vpMk+XJPnTu0ocyIkAhtSUVuMAvImaZ1zVj/CBeK56en+OmXAXcgisZLqM3c7c2We/Zw
 3XzjH2Qcg5aSbIJWBXnAWhXjSXjdWJ2P/Grtag2FJbVY3U+93w2DWkqe0SBl4PSxzu6w
 2w5wFlQrCRpFM76BglK4hmi3ki93YcfcTPS2ALCUx5N3+ccoqpTdyKrkUjjKO4X8twPW
 +RQQ==
X-Gm-Message-State: APjAAAUiCFq8twchEXsAOtDkwpFnvtnVCpqEK/sodeECdjIKQQbJtS8f
 DTQFP4eKRQRjGopTvaybzLzwfaTkx4iwWzEezDCKiA==
X-Google-Smtp-Source: APXvYqzL6r+EzEDFPxxKmhUjWSQWWRO02TlBNaPInGROyXYEcAMJsWF3vyqatbAZwFXW6eKdLw8hQv7/05QsL/pTu5M=
X-Received: by 2002:a05:6830:c6:: with SMTP id
 x6mr17643890oto.64.1561953425932; 
 Sun, 30 Jun 2019 20:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Sun, 30 Jun 2019 20:57:05
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Sun, 30 Jun 2019 20:57:05
 -0700 (PDT)
In-Reply-To: <b376dc86-6879-2a72-3261-7fdf06172456@linaro.org>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
 <20190629130017.2973-16-richard.henderson@linaro.org>
 <CAL1e-=ghMjUtEyqKX+s15RcyQp6uQO_hJ_u4RTSJ5ZyPvFnymw@mail.gmail.com>
 <b376dc86-6879-2a72-3261-7fdf06172456@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 1 Jul 2019 05:57:05 +0200
Message-ID: <CAL1e-=hS_nQQYY39j-mx1QBFw+Xe3V5NgFW7ifrkMZRxFbB=OA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v6 15/16] tcg/ppc: Update vector support to
 v2.07
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 30, 2019 5:12 PM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> On 6/30/19 3:37 PM, Aleksandar Markovic wrote:
> >>  bool have_isa_2_06;
> >>  bool have_isa_2_06_vsx;
> >> +bool have_isa_2_07_vsx;
> >
> > Does this flag indicate support for PowerISA 2.07 or VSX?
>
> VSX & 2.07,
>
> >> +    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
> >> +        if (hwcap & PPC_FEATURE_HAS_VSX) {
> >> +            have_isa_2_07_vsx = true;
> >> +        }
> >> +    }
>
> Like so.
>
> While it would have been possible to have one single have_isa_vsx, we
would
> then also have to check a second flag to see which revision.  Therefore I
> created these composite flags so that we only have to check one.
>

Yes, but, in this patch, for example, among other things, the support for
doubleword integer max/min vector operation is implemented. Why is the
existence of that support dependant on VSX (PPC_FEATURE_HAS_VSX)?

>
> r~
