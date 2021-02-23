Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DC322954
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:14:52 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVeV-0002D1-8l
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVdW-0001Mk-HC
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:13:52 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVdT-00079j-IR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:13:50 -0500
Received: by mail-ed1-x52a.google.com with SMTP id n1so25441791edv.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zXTjiTteogESwnKeMUd7fFJgdtVKqyBat7nsIBpAgVk=;
 b=QYkaW6uRuXxMxlIdlxJJ+Gpvjy+r61kMKl0vTwQ/WKOhi4cqD7O8FifcAQyPUnoC6u
 KxPKm2SAiMjhzJvTwNswAoWr92hiTR9a5vll0I52C+YcjZF3Bb+JOjmuoRntgYj8li5Q
 Z5ULyVDoMNP4omgJuCMvj3bayAndZiqvsp10KU9D4UHMlLmXFUkOqn3DsM/75Yy9XffX
 ke0uGBe8eZ4g/dG1sGw/WV1USTa7IjdGPv97fG46lS26CmSSmIxYMWZaIph3W99Uu9L1
 ATYvqXqzi8E9Rok2Kr93aCqfG7mmJj+MutazWTs72oW7OEPAfi3GvIbZer1dTfQBbbu9
 BlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zXTjiTteogESwnKeMUd7fFJgdtVKqyBat7nsIBpAgVk=;
 b=W3YRTP0l0AP4meTvW/AC9PCuw7eyJ6kY/o32EQ1czILtY6WAc7eeaMs8dV70B6x0SW
 UKjSQxHF4DPksg373Ds95KQ8fV0XaFDyhmquqWvhfgnY5JKBTy7fT2SIY/0G3zXT36GN
 BhUbOKG5LiZE9tkaBITHGhMTlK/pySmAYQFvYmWrmbPLjwB/8qBd2+4p6JxbxCz/h3TD
 SXsk5g6AW8ZhBUg3GvHMuQsL0n7r0Lr7SHRpkZjzHAzK2ak8MslHFoUjJYm4RUvpXAcP
 vae56IaQ+HifO7hbw0yQnGXl5J9ma0zy7xWb2gJgdaJuuqi3Xuvldoid85LFYS2CXVWv
 +OtA==
X-Gm-Message-State: AOAM532MqNNgN9TnHTNCSV+XioqRUvhAiRc+Y9WuEzHFOmuoBbpOAu6E
 xpGFDVjDTj/mCZnIdkBQXqFN5qIA5r1VDxIdTlurvA==
X-Google-Smtp-Source: ABdhPJx2pWK7xT9zZuE0KgPE47Z16oaTc5tsh4XnXBe+4nezy7rIDkrHqkgVA2k2aJAiLCkdB+Ss+u5TjvEtBLE6xa8=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr28095365edc.146.1614078825839; 
 Tue, 23 Feb 2021 03:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20210223105146.6695-1-alex.bennee@linaro.org>
In-Reply-To: <20210223105146.6695-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 11:13:34 +0000
Message-ID: <CAFEAcA91cQfekw4ue1hknYcpPNPJ-_5dZvTtKDacqoyx1wcFBA@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/devel: re-organise the developers guide into
 sections
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 10:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The list of sub-sections was getting a bit long and sporadically
> organised. Let's try and impose some order on this hairball of
> documentation.

Yeah, the 'devel' section has always been just a grab-bag
of whatever docs we had to hand. On the other hand, to my
mind it is the area of the documentation that is least in
need of much effort, because it's only for developers, not
for the much wider group of end-users.

Anyways, a bit more structure certainly doesn't hurt.

> [AJB: RFC because I wonder if we should make a more concerted effort
> to move bits of the wiki into a canonical maintained document. There
> is also probably a need for a quickbuild or tldr section of the
> build-system for users who just want to build something.]

'How to build' is in README.rst. We don't want that in the devel/
section, because we describe 'devel' as "You only need to read it
if you are interested in reading or modifying QEMU=E2=80=99s source code".

> diff --git a/docs/devel/section-apis.rst b/docs/devel/section-apis.rst
> new file mode 100644
> index 0000000000..ab1f6bed60
> --- /dev/null
> +++ b/docs/devel/section-apis.rst
> @@ -0,0 +1,16 @@
> +*********
> +QEMU APIs
> +*********
> +
> +There are a number of APIs in QEMU and the following sections document
> +some of the most important ones. For tose that aren't documented here
> +you can also find notes on usage in the header definitions.

"those"

-- PMM

