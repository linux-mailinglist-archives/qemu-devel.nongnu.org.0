Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C014C27986B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 12:32:40 +0200 (CEST)
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kM7VP-0008Dx-SG
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 06:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carenas@gmail.com>)
 id 1kM7Ub-0007gh-18; Sat, 26 Sep 2020 06:31:49 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carenas@gmail.com>)
 id 1kM7UY-0008Sq-Sc; Sat, 26 Sep 2020 06:31:48 -0400
Received: by mail-vs1-xe43.google.com with SMTP id e23so2921642vsk.2;
 Sat, 26 Sep 2020 03:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCux6ibpwv2WidxVbb/6aY5wr47jk+W+hdcfe8EreII=;
 b=I2PvJSTzIp4YOPuDBcfAkOCbpqZXIkzMKVEcNDXvlGeF988SfRxKtroV55v+n1x1aa
 /mJiFFduR+XTEmX0mNiMq3mhtOcEP7frmk2OlA9Yd7ZdYndgY4Y7vi+UgztECB29xA1+
 5RaTCfM8ZoGoa/JGECdZIXS14ubOYKRiFds5y3qynP/yG88m83CVcw/Qjrnz/KbR9p+v
 bEx4tEzeWjVVR7wFWm1D5+aOzEaD/tOr0Q3HZ5oYBdnUma0rGLPZzGnEsdiawFF0Lnas
 fmn1ScD0FOFjLS92PvVYlGqohhR3ZFqQs7q9d591K45RmaOVNlpsgRt6NIBMRIU5qI9O
 rdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCux6ibpwv2WidxVbb/6aY5wr47jk+W+hdcfe8EreII=;
 b=oQGZfPX6Y5twnRsZ4K6jGcITjeRFuJgpb1KKtHJKDt1q9MmR1/8zqUpMWJ3S9l5Zzl
 3VerJvNlKw5Ob66YwwgbJA1XRsRFj9ZBrjUXF3WqFIQXqeHJ7MKeW57SLIDGSZtPtE9e
 En2Ohe/ccBxfRvzuwS8/xCUBR7XLAlC5ZA/66VkzZ0R2aDmH2rZQWPt/Ixb9Z4sag5Yt
 WF+oamPLVq7adf1X0sArAIbXz82FA5n/mFjYQhxKbTbx6dv2/dfFZQgXMZBk5keL4E15
 q6WfmZCJLLZKnBz0X7+DNYhUhlwf6w+r/ALe2PuYEaymNScFdwPUscnXqU3WIvZ4QbW8
 ujUg==
X-Gm-Message-State: AOAM531nAyy+0UFkINi1QDHP6tOH9RnNe8ObqrowYkL4Rb0AdhJEw/mw
 2UBoDtzJU4p8BQnMKPkuUAi223S1iXoLjsQUnzg=
X-Google-Smtp-Source: ABdhPJwVrAY7Hw5pGhJpGbNvf3x3TotWvZq55jONHcltYi6l4uo41OVtPvYv/+0jrkwtp1ovfvxRHNWRCn2uwPCZBwU=
X-Received: by 2002:a67:8802:: with SMTP id k2mr1301197vsd.42.1601116305129;
 Sat, 26 Sep 2020 03:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxQ3o_h7_Fwho7gu9x9Pw5jCw=z-goVMyzJgQYqZR-cgA@mail.gmail.com>
 <CAP+75-XwpLiutpW6-J3DLKFGXOVd=tLF2fG2=0=nP9+KZ0UYug@mail.gmail.com>
 <CA+XhMqwWuMrnUsFx7re5K6Yo7UP5xdF5kNaPmVsabf-4LU9Rfw@mail.gmail.com>
In-Reply-To: <CA+XhMqwWuMrnUsFx7re5K6Yo7UP5xdF5kNaPmVsabf-4LU9Rfw@mail.gmail.com>
From: Carlo Arenas <carenas@gmail.com>
Date: Sat, 26 Sep 2020 03:31:34 -0700
Message-ID: <CAPUEspiBbM1N_=2or8P7VuFtpHNWvcjD2orkUFNOFOW-ytHx8w@mail.gmail.com>
Subject: Re: [PATCH 1/3] Include endian.h for Haiku to solve bswap* macros
 build
To: David CARLIER <devnexen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e43;
 envelope-from=carenas@gmail.com; helo=mail-vs1-xe43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW the 32 bit image (haiku-r1beta2-x86_gcc2h-anyboot.zip[1]), uses
gcc 2.95.3 as system CC
a newer gcc (the same version that is used for the 64 bit port) is
provided as an alternative though

Carlo

[1] https://www.haiku-os.org/get-haiku/r1beta2/

