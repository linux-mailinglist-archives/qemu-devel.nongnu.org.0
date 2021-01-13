Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF22F45DC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:11:09 +0100 (CET)
Received: from localhost ([::1]:35138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbFE-000058-3a
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzbEL-000860-FU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:10:13 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:38973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzbEK-0005K7-6n
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:10:13 -0500
Received: by mail-ot1-f54.google.com with SMTP id d8so1129848otq.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 00:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1A0bOoKUTsNIW/EP0w/YRXRlO1K0mLBnupNrYjQoN7I=;
 b=H0k17+BgybdmY0ElXB09/gqTn6seE5hKgWMwhi3byYvqq+/PiwPvhhWjvs4oZMqPre
 jypipT3wQZgR0wK/kkLBUHAGPavy71qMVFzZo9+vAeftztBFft+SzgenoEGS2V5g4aF9
 CXJrIKTkUS7p7gdt/pqn5WyvIjjGcyNn8Xw8IdjO07cnHy0pe3RmUflYT4w4eoFD8hla
 7n3vfcTTEKHCgxLQ7HMp7sEQfPl8vkGT0oJrKgmrtSQ8czTtRO1enSuP8iQtvmtXWsn/
 pqYGu26MDGchRdkTyzsDsCQcG4Azf4L9fU1f5DgcNVJLVHCJ41SAmiThtQAM6/eJ+byr
 jHzA==
X-Gm-Message-State: AOAM5318xcGiXY7QHQD0zqfdsS0+7wOTc3suW+N6oo+eWr/lEqmnv6S2
 ZEg9CckCDxxOjy4hfS6DmviyLp+Nqbks2Ona4tY=
X-Google-Smtp-Source: ABdhPJzdsSDa67CEb5pKtJ+fWlSiCag6pRplpg4xZhXVZ2woI0iOgyVVuzWU6Ft7sLYI2VP40xSvcR8j6kU5QfZt6DU=
X-Received: by 2002:a9d:5c8b:: with SMTP id a11mr484602oti.126.1610525410924; 
 Wed, 13 Jan 2021 00:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <0e1b22ca-7ca0-f92e-2d43-fc10eafd565f@flygoat.com>
 <d58c8ba9-56e7-06da-c074-ea225fd45a39@amsat.org>
In-Reply-To: <d58c8ba9-56e7-06da-c074-ea225fd45a39@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 13 Jan 2021 09:09:59 +0100
Message-ID: <CAAdtpL4FqxDBL-H5quhNRaiohEDMzMB2ZOx9XeN2-6qV0Cf4kw@mail.gmail.com>
Subject: Re: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to
 decodetree
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.54;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f54.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 9:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 1/13/21 3:15 AM, Jiaxun Yang wrote:
> > Loong-EXT is a super set of Loongson2F's Godson2 and MMI instructions,
> > how could we tell it?
>
> MMI instructions are currently handled by the ASE_LMMI flag,
> a different decoder (which will also be handled by this function,
> similarly to ASE_LEXT).

(BTW no need to spend time converting ASE_LMMI, I already did it, I'm waiti=
ng
for the review outcome of this series before posting it).

