Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCB6ACC8F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:30:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFat-00063Z-Ml; Mon, 06 Mar 2023 13:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZFas-00063L-22
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:29:54 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZFaq-00015x-IO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:29:53 -0500
Received: by mail-lj1-x22c.google.com with SMTP id a32so10652277ljr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678127391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yImRgHbDSBiddTRk6H7n1oJIfCHjAiNshL64pophJlE=;
 b=NCDaq/EQc/LgXEzOUpPZpjs+6iPdj3+fh32mB/r2jvqBna8z/c/pBNq7m0u5NHF0NB
 WpGxLc8M/AjnHsQhEzgLWkH7RhxFGm++H1DkOuRIaGWqLlSLV26uSHEmejUi7NDz9u2h
 2/+351dpFDN+cuhyHTQisEFgx8S/wTxMSHMigQWgbbvOHGE57bKJEOGP9B+kqy0H3meU
 ezldH+YFIwJs7erA9CUhTjiWUC9Wxcmd12TumnHe2IJcEj8sC0AMsu/MhTBKI8HWEOKY
 BoxJVdLANF/XIP5wIqf+lmEd0L//vCCY0sEX6oSJV3USPM02/0OfOJFwH81aFOOrCWDp
 XRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yImRgHbDSBiddTRk6H7n1oJIfCHjAiNshL64pophJlE=;
 b=k51scc9ciu1At2099eogRgJmbiL1Og62DX+Nal2J/utva6eeEzyfCi9WTmiD9GWoq3
 744yVAbk+pLvXVut8UCicHqVtqoMUXhQdTh8cCJZQlGEzR/F0wOm+3bN9Lu3iLyDUUdB
 KTBi7iO7FUU5DrSvYJBOPvVE7FfsqalNEQDmVTGMj8cemP/4lfXIU6+oq/zdKE7EKRvi
 XDlvxX4rthhvJpS4g+jExoZS15rrr1fk9pvfRV9eJEpIAMj7tpk7vCNOdd4HhV6CPSIJ
 EZS9qDXU8X4OTB+N9hXa/R4Qo3gX0HZyLmPYVYIo3sV/5zKH0c8GBFTv9l5PGf7/8+98
 ofvw==
X-Gm-Message-State: AO0yUKXxzeELvBCXYJLy1ykowD/mh+8P8qUKjZohXmstEn+EiMkkFm4f
 eiC1UGFq/Re17M2rLy2wN7mV7CZNAoKlEaBLpSqx8x3WCLtTkw==
X-Google-Smtp-Source: AK7set+i8mKdCkvqdV6GPhuC7f94Jv8P0lxspZ+qG2hTbWwBFCD1GMkshMFG9GKtRhv+2Ee79QCDQbP6LK4ifvPe3HM=
X-Received: by 2002:a2e:a4b7:0:b0:295:a8c7:4b3b with SMTP id
 g23-20020a2ea4b7000000b00295a8c74b3bmr3541352ljm.4.1678127390702; Mon, 06 Mar
 2023 10:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-8-marcandre.lureau@redhat.com>
 <CAFEAcA9eFm6oT6SzDS6wCgVcCfyZb4kk4zBeqm8AE7ovGMW+1g@mail.gmail.com>
In-Reply-To: <CAFEAcA9eFm6oT6SzDS6wCgVcCfyZb4kk4zBeqm8AE7ovGMW+1g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Mar 2023 22:29:39 +0400
Message-ID: <CAJ+F1CJYK5N1iH4d=6odmP59+m-P6UTLJ9hbpE47KLga5rufcQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] qapi/gen: run C code through clang-format,
 if possible
To: Peter Maydell <peter.maydell@linaro.org>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Mon, Mar 6, 2023 at 8:06 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Mon, 6 Mar 2023 at 12:33, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Make the resulting code even prettier, if possible.
>
> This seems to be a bit short on rationale. This is generated
> code, so in general nobody is going to be reading it, and
> running clang-format on it every time we generate code feels
> like it would be a bit of a waste of cycles...

With this reasoning, why do we care about indentation of generated code at =
all?

I think it still makes sense, because you have many reasons to read
through it eventually, and making it a bit more friendly helps.

Whether it is a waste of time or not, hmm. Indeed, my experience with
clang-format has teached me that it is not the most CPU-friendly
sometimes...

Perhaps the solution is only to enable formatting when debugging is
enabled, for example?

--=20
Marc-Andr=C3=A9 Lureau

