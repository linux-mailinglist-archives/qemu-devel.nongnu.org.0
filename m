Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B058FAA9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:24:15 +0200 (CEST)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM5MM-0003a1-Cq
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM5L4-0001Be-VH
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 06:22:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM5L2-0006ZC-UY
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 06:22:54 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-32a09b909f6so64107957b3.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=V0JSjYCH5SK3fauL3WT7d181YMDyhIMIFwMZ3oJvChQ=;
 b=YacPTkG1JJoHK9klHaNXld/hl57r1SnHhl6IoVxqa/VpgHge9TCfq7Ub0ZKP14uSe1
 5xBgIpZhuIvnEWmoG007eVPegrZsMMzI4c2YKp4h5JTL0XsVU5iFRzs5C47jb/ONRyjK
 xBfPxrLD5QSv8PNVwff/swB3ReunU2a51uZTnV3kHuwT2NkvoLoOTs8CACegt0iUDWOZ
 w3upYhxaC40tyG+BXGTlJKXadhchx79ocOCNobGcasPxJ0lGRC3sQIhuuyu40wL8XqLo
 QiK/qVajQNqP4Al27GW96KFPC9aqSJo60wNjO817It6h//jgVrPn0H821B5yZQKxB2ba
 0a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=V0JSjYCH5SK3fauL3WT7d181YMDyhIMIFwMZ3oJvChQ=;
 b=Dy6xwFfHrdc/B1hlQm9PHgrtz5Vr1Bpa02nBfL1/YUtL5y5NJFVEm/87zkvDN7zToH
 cH/wVJ456m2wHJ8vcX7TN8chy7EY0t5XhZrT89XNSblm7YdN3gQIpLhsWWOTavzDU4cQ
 eZsCqghEGw9q3L6UPTa/m1s3LL5DzT7OtU5UZFijhC0SGoxGTJli2eyW+dMF5m9yjYC4
 YIctY5YF4E7OmD/mqs5H5JvdgcVhlEKX4GY72JBfbLID5vvS9mH58SVrZMp6Dw55mkeM
 kiOxIcqQGQUDjLRfQU+IVdkOefy58CihiDwb2XW2KTTv3ESrbc3dpgul6MBOa/y/m6cG
 Zxrg==
X-Gm-Message-State: ACgBeo2dhCsicUFqYclaSEnWZXiRSg5T6M72JxbF5BrPd9RBZ2pRJYpY
 ExuROzUJcVqIPSEHqf4jsqaNOBjE6hDgQwAZeBejcA==
X-Google-Smtp-Source: AA6agR7ae7s9/m8d9JUihZFKZ+ywTfyAeDnmhhdbAWVESJjIrDuCGnuwdM9Bvz9bMLq3b+FA1d9/r4Im76p9/mXxOP4=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr30606696ywf.455.1660213371645; Thu, 11
 Aug 2022 03:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 <87o7wr5ew9.fsf@pond.sub.org>
 <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 11:22:40 +0100
Message-ID: <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, John Snow <jsnow@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Aug 2022 at 11:09, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> On Thu, Aug 11, 2022 at 1:05 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>> Your moves tear closely related code apart.  This is going to be a drag
>> for developers in general and maintainers in particular.
>>
>> Ergonomics suffer when related code is in multiple places.  Having to
>> switch between directories and remember where is what will a constant
>> low-level pain.  Things that used to be simple & quick, like git-grep
>> qapi/*.c, become more involved.
>>
>
> It's inevitable when a project grows. QEMU is already a very large projec=
t. Over the years, we have structured the project, by moving things and spl=
itting in subdirectories. Imho, this is actually helpful in many ways, and =
we got used to it easily hopefully.

I agree with this. But generally we've tried to do that by
having the subdirectory splitting and naming match the
structure of the codebase. The exception, which I strongly
dislike, is that contrib/ is a grabbag of random stuff.
subprojects/ is starting to feel like it is also turning
into "place where random stuff ends up"...

> Do you see fundamental reasons why qemu-ga or (qemu-img, qemu-nbd, storag=
e-daemon, virtiofsd, vhost-user-*, *helper, ivshmem* etc) need to be tight =
to qemu code, release and management process? I am not saying it's time to =
move them out of qemu project, but I believe it's helpful to have code that=
 is structured and can be compiled indepently.
>
> And by having "standalone" subprojects, we can more easily evolve in new =
directions, without touching the rest of the projects.

As Markus says, your branch ends up moving most of qobject into
qemu-common/. We are never going to let that out of QEMU proper,
because we are never going to allow ourselves to be tied to API
compatibility with it as an external library. So anything that
needs qobject is never going to leave the QEMU codebase. Which
means that there's not much gain from shoving it into subproject/
IMHO.

If there's stuff that is reasonably independent then it may be
worth disentangling from our build process, but it has to be
actually independent, or made that way, first, I think. And,
as with libslirp, there needs to be a clear beneficiary who
would want to take that independent-sub-thingy and use it
entirely distinctly from QEMU.

thanks
-- PMM

