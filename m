Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3F6ACCD1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:40:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFk7-0005mW-88; Mon, 06 Mar 2023 13:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZFk0-0005lJ-Mi
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:39:20 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZFjy-0004e1-O0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:39:20 -0500
Received: by mail-pl1-x62a.google.com with SMTP id n6so11462032plf.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678127957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHE8OSA96NTnS1+vVm6nDPEAJkOpcxoyztWzhKvS/pM=;
 b=rTxG4RLD72GddpM7WGznDYl+4xAUuBfItwqcZCI2E7MW7jDATWc1c3aFi/gbgX1oP+
 i831DX823tMUPoGsAEh54HMobbThp6FFimj7zyKb32BYZSMaVEmG7gu/N8MTH5bRq3vt
 qwjH8V17yiZkV2LmcRYbZeW84B/ndFOV0omL+KA3KmzSNif29x8LyPVAJf2gHdDKH4t6
 lo0C0M0mPtFeYuU560SKHJpDOfvxDhy3Hf2OK4sLH3Tsa+Jmxx36Vy3+udxunCBCMSZR
 wNL9jvIYceJ3WAoBOahKHnQCn9Do5wqGyJfjsSMigXcQiD2ls800UvyiGo6bkNL7XSrW
 ZZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHE8OSA96NTnS1+vVm6nDPEAJkOpcxoyztWzhKvS/pM=;
 b=GYPJx1qccmpIaFEzFg8R9bOENo13MkECL0b2ANl2383NnJgk4sCJyL2pYLkLUqHPEb
 SdhrDNkqf7WRvv7/zmHP1fqoic5gyLa70JTKGX3TPGptl5uHejXQd9OUs6I4atpZtvr1
 ZN6cdY+UTlJK2/hxZ7NqJKnzjrR8Knz2k84Wyiov7Qhca9l8i5gdGvy2KTCNRFRDG0d3
 Z2zh4Fay3au7Z6sD1jtjdo/JDDszievzRB6T6QOCkPaaLsaUAi1GzuhU5N/pXlgg1Fkq
 Hp5PNUF4NgC98w1NgXQVk7lJHgHfK4/SYaWZl33HJch/lrHqSDBDGp4AkvXGl7ob9Ggj
 IZow==
X-Gm-Message-State: AO0yUKXax3euwRQ8+0/BncJ2aTpbXcUn6B4uRxDnbOhE4/Ak8V6NNnQl
 v+oc/IUzo4WQocW4Woe16+uHU6UAO8bxeQPGK/e+aw==
X-Google-Smtp-Source: AK7set/bFEMH02ZKoY+13lsd8ssqQYdbsk1xr28eT/V2BcI69b1XttgiVndZKgG+u7NNSsJt4GuTCH25cio10KFTc/U=
X-Received: by 2002:a17:90a:a888:b0:236:a1f9:9a9d with SMTP id
 h8-20020a17090aa88800b00236a1f99a9dmr6501539pjq.2.1678127956957; Mon, 06 Mar
 2023 10:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-8-marcandre.lureau@redhat.com>
 <CAFEAcA9eFm6oT6SzDS6wCgVcCfyZb4kk4zBeqm8AE7ovGMW+1g@mail.gmail.com>
 <CAJ+F1CJYK5N1iH4d=6odmP59+m-P6UTLJ9hbpE47KLga5rufcQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CJYK5N1iH4d=6odmP59+m-P6UTLJ9hbpE47KLga5rufcQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 18:39:05 +0000
Message-ID: <CAFEAcA9ODuOc0i7_iMwCgk3_8hDruNGMbUADF6ymWhxfjuWrsw@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] qapi/gen: run C code through clang-format,
 if possible
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Mar 2023 at 18:29, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Mar 6, 2023 at 8:06 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >
> > On Mon, 6 Mar 2023 at 12:33, <marcandre.lureau@redhat.com> wrote:
> > >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Make the resulting code even prettier, if possible.
> >
> > This seems to be a bit short on rationale. This is generated
> > code, so in general nobody is going to be reading it, and
> > running clang-format on it every time we generate code feels
> > like it would be a bit of a waste of cycles...
>
> With this reasoning, why do we care about indentation of generated code a=
t all?
>
> I think it still makes sense, because you have many reasons to read
> through it eventually, and making it a bit more friendly helps.

Yeah, sometimes you have to read through it, so not printing
it all one one long line is helpful. But it's a tradeoff --
"make it basically kinda readable by tracking indent level" is
easy and quick; running the whole output through a pretty-printer
is more expensive and doesn't improve the output by very much
over what we already have. (If I'm wrong about that last part,
it would be useful for the commit message to give an example
of currently unreadable output that clang-format makes more usable.)

thanks
-- PMM

