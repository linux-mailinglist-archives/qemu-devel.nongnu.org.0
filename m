Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71D2B1374
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 01:47:03 +0100 (CET)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNF0-0003GW-4O
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 19:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kdNCr-0001rm-JK
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 19:44:49 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:43412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kdNCp-00084M-SY
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 19:44:49 -0500
Received: by mail-io1-xd41.google.com with SMTP id m9so8060871iox.10
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 16:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UUNlrYXkGH5ef0dsWB+F2ZMUFSohgx2XQy9dFr7kLP0=;
 b=lgOXHW6HeoH1/9Bpjie0DbNW7IDSRtCMbWn+7KutDk8c74c7NocU4LoVprwPd5bFfM
 0H9LkfMgxHbhbx5oWul6C2nOjj5zbsLEf6RBRuV9M0exVgJqz0fT5pUSu6JyLtqJ35CD
 Y4GUSL3sndlj9GhFw53itYqqlvMrNufhZ51NqBweGYrLmXaYMbX2yfenBcW26rRXaFvA
 ecVlTHsifToON92IElBVVV3jvuitC9oqk1daDA0s3/rJxLULGSFONWB3lI7wCk55ctJ/
 dN6nXseDak3vGKZXiIbaUIYJgrS+Th+mX5zIx+WOcB4PhOswRolEzUGUVeJxJs/4EbYj
 AfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUNlrYXkGH5ef0dsWB+F2ZMUFSohgx2XQy9dFr7kLP0=;
 b=LqDv9Rq1BrOkLjsYXEXcR/57J4o1nWQd8cQ5VnEjDmnFal1HWGtqm0lbs/7LACN9Qw
 qks21+PqycadrveQU5i6Uz4wNqOkEq2cJKM2pEDjNNMC75wCviyYKFxVuOgM6Jl6d91t
 bzBQ2KA+K5MV8AJFISFG0U+TiTbZ/NXaYJtdXj6XVq4hKWqhuKGlEd7YvF5bYwdkfCm9
 rH7pu9trX35dcRzUxR7pFzCodI5zI7NLOBNyM+EQj2owkawYgUZ9v766Va0MKw64DyaN
 xChLBtAYxx+Dfdx7NLRCO35901+5W6+f3xM39KA4O5vX7kzGg3H7pNanar5E+9EZB9j2
 bGvQ==
X-Gm-Message-State: AOAM530PqKxwbg/bGmMSmWOikw9UyTP5wld8RIZZaCl+QcijLTHGx6vZ
 TMR27+SiqRH5yjDQhvN5pGDj2yb1en7B3E87ers=
X-Google-Smtp-Source: ABdhPJxurRlT7N42OlnZQkNKkRpPdZBEjzTT/xpdObnFHqzdc6Cc+m4c0ozoIhsxIIYWXpIARXrNveDbkZhuWIpX0LY=
X-Received: by 2002:a02:7c4:: with SMTP id f187mr1895887jaf.91.1605228286332; 
 Thu, 12 Nov 2020 16:44:46 -0800 (PST)
MIME-Version: 1.0
References: <2d8747944b70d105c7ce320be0151c4c4ec78d24.1601653938.git.alistair.francis@wdc.com>
 <CAFEAcA90cD8+NY-dGKzk9-yDKVRCR1d74OW+hNUHrZWXTgWqXA@mail.gmail.com>
In-Reply-To: <CAFEAcA90cD8+NY-dGKzk9-yDKVRCR1d74OW+hNUHrZWXTgWqXA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Nov 2020 16:32:42 -0800
Message-ID: <CAKmqyKNVoR_RYzbrKSmk=sJs9TRU4nr5DncSVX4tHq2UYVwKNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] register: Remove unnecessary NULL check
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 7:51 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 2 Oct 2020 at 17:04, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > This patch fixes CID 1432800 by removing an unnecessary check.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/core/register.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/hw/core/register.c b/hw/core/register.c
> > index 31038bd7cc..3600ef5bde 100644
> > --- a/hw/core/register.c
> > +++ b/hw/core/register.c
> > @@ -258,10 +258,6 @@ static RegisterInfoArray *register_init_block(DeviceState *owner,
> >          int index = rae[i].addr / data_size;
> >          RegisterInfo *r = &ri[index];
> >
> > -        if (data + data_size * index == 0 || !&rae[i]) {
> > -            continue;
> > -        }
> > -
> >          /* Init the register, this will zero it. */
> >          object_initialize((void *)r, sizeof(*r), TYPE_REGISTER);
> >
> > --
> > 2.28.0
>
> Applied to target-arm.next, thanks.

Thanks Peter

Alistair

>
> -- PMM

