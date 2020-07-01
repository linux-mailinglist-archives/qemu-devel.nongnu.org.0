Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9A21135A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 21:14:59 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqiC9-0003Aw-KJ
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 15:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jqiAw-0002jb-0g
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 15:13:42 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jqiAs-0004eS-Sh
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 15:13:41 -0400
Received: by mail-wm1-x344.google.com with SMTP id f139so24597480wmf.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HXvuCmrjD5x5GRr10731YIVy9synudFti8oEJspfnE=;
 b=stzNA+ZwLUBQVZ2YzxKUWCTgbz7A+wtx4QU9SJZo03BVXveFE3VnSHmYB8i/W4JCux
 aqAv4EF9+Si/SqMpQ1IDwKY0IbeSD3g1UO8txwKdalE1RjWu9hIr5jkTLIs5u/aqgtTP
 qrIfKJN5PhCalfxxyMjZnobP2f4UdAgX1VjG8HYdJxjvibsuPByfRAvqp5y/LuJCM+Ql
 /rigXx+COv6MW8SprqQ9vXcGXynUollO5UHjb8hKNrfF/g8+K1307fOhs8DB5KuXcp23
 fhwv8ihQwbEm70AJV+rSDCS0FIVBeXetnKYNObD5a1K/bZvjWWFXboSTrAt0ce8tGozy
 18eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HXvuCmrjD5x5GRr10731YIVy9synudFti8oEJspfnE=;
 b=C76DU0bTjEhZ9cBjxNVmG2Y8oK4n7zR2UuzAJBfqvxvgkPfi2zw8MlWf73E8GZKxQi
 ey/nAXz9pgnedc3GEzigGmmJYK4AtMsk+07RgrgMt9eZrLzwjLTS9iT+mmH/RtQud3Hs
 p61hS7wf/fO6yeJCmxU7DM1GHcAg6GhiN8QwxtnoTK7qN3sVccqAtLPqdQdOHLQL49jN
 Wavy/q50PP97PCGdhwlZXxyzTHdn7bnnPvaXBpq/3RBR902MAxjEAoJD0YBrYzWHv2eH
 OuJteuOL4Zh+SB0sq/joNjsLK43pI4BRR8ppGQjrCDmQWF/6JWUSs7GZnfNjlbZheo7n
 l2rw==
X-Gm-Message-State: AOAM533NdyP7w49JOQwiXEtt/CpCj1FrDxPhOmpvh4bFguhVcgt2ysV3
 Z6ShkSTmrv41ouJwKupk+R6hDd7G1Vl+ZSRPdes=
X-Google-Smtp-Source: ABdhPJx8vYbNGcjU1IqkNyzPXmS43R0g4BilH2f3Izs0QMfXBoWMAMoYZ8BIuMwohb4dXn8zHZriIHwOxsR15x46CtE=
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr27060424wml.36.1593630817575; 
 Wed, 01 Jul 2020 12:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200701182559.28841-1-aleksandar.qemu.devel@gmail.com>
 <20200701182559.28841-3-aleksandar.qemu.devel@gmail.com>
 <20200701185530.GB1090525@aurel32.net>
In-Reply-To: <20200701185530.GB1090525@aurel32.net>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 1 Jul 2020 21:13:24 +0200
Message-ID: <CAHiYmc7mY_TA9Q=DTyktR8+azfOOM5h6WUYUcJLfV10kUZQvAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] MAINTAINERS: Adjust MIPS maintainership
To: Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 1, 2020 at 8:55 PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> NACK
>
> On 2020-07-01 20:25, Aleksandar Markovic wrote:
> > Paul Burton and Aurelien Jarno removed for not being present.
> > A polite email was sent to them with question whether they
> > intend to actively participate, but there was no response.
>
> I indeed received a polite email, but it was sent less than 12 hours ago
> (Peter Maydell was Cc:ed and can confirm). I didn't even got time to
> answer it, I am still processing my emails after coming back from paid
> work.
>
> I don't understand this sudden need to rush things in adjusting the
> MIPS maintainership.
>

Well, from time to time it happens - there is nor rush.

Good, I am glad. Welcome back! :)

> Regards,
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                 http://www.aurel32.net

