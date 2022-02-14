Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B42E4B52C0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:07:00 +0100 (CET)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJc0H-0001hY-KP
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:06:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJb5Z-0005Wu-4S
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:08:27 -0500
Received: from [2a00:1450:4864:20::334] (port=38586
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJb5V-00015l-Qt
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:08:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so11585606wme.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c5YAEh2m11XKHOXygyK1+krcATdq5RI4lwKoS7pIx8E=;
 b=lPTcLDuC9+kh1YEoDpSJjFndvYj5VF+QajS/89rYGfmDqxPYmqBEn1OXT4CruAGRtN
 XGOXTA44E2AK3JmQfOFdztzcMY2Rl1gLuNjIaK6AHCyGTZVXJtRut2/TZy04oebQ6GMa
 2SjzqllSDkuhd9YURHjZPr6IMAglnELHvaBv7dhJGuf5McaPKWzugorwJnwWp955Beqw
 bUnTHz88j7biDzYXJddJAxPyfSxI6wOghzbleaPYVLiEoU63WCpBibIamjjcmEOsZWfU
 yvpgSXBr7/5k0rEJQ+AAdXe7llJUvTkuSneRQ6lVptS+6ln+5vQAcEJf5BN/t48zfGYa
 OO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c5YAEh2m11XKHOXygyK1+krcATdq5RI4lwKoS7pIx8E=;
 b=TdSnwZzbAliqvaRpM69lnQao5Ytjs9pGRNP8wpsmDQDP4SLuE2w8rTHyqVi6VmilCr
 N0Z0x1TvOfs5AM7Z2zPILuXpoKCc4ZWzfEuOqSOxXyZSCTP+HNTcZkPTu+hP09EtrlyE
 /BAmKhG5etNqPj7klgJ2NlYb+Up2CWzx+jWnxTQOd6C5/j6vqDmedXibF03zyJP/ogA9
 q10eamb8YnTK/huoUp/oChXtZHRR9xKNbGq+jCiL10aq2y6E1t62gMG7HERdRz6LM1JP
 C7+e/9iOmxw5r4+kbYdkscAxhLk9Cg4oXKrn1TNfD+1VvacrIW084EfnVisjucuUTV+P
 2jzg==
X-Gm-Message-State: AOAM530XhZpm//BlBdk6DbRvArb9jt4Ok79qRy5lRa3eWBz2mfog4PVU
 YPJJSTxfSbedO0+MTzUPNkNDrYGaaJyKYyueHeuxdg==
X-Google-Smtp-Source: ABdhPJzoFpOb4+RLuDRu47LQ3zZYTu50CawNrRPcqaFz54TwJRb0eS3OIgn//a/ur/6jihbLrvBaCkZF2htPEANj9jc=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr11158348wmi.37.1644844095472; 
 Mon, 14 Feb 2022 05:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
 <CAFEAcA9YxQFug5vuHwi5koHUDZiBfMVHUr8yfby9r5D0b6hM=Q@mail.gmail.com>
 <08631A61-4E68-4A3A-99DC-56C3FDD5A780@livius.net>
 <YgpLAAztd6qNTwmm@redhat.com>
 <B37774A8-1751-4449-B84E-86FF31504B8C@livius.net>
In-Reply-To: <B37774A8-1751-4449-B84E-86FF31504B8C@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 13:08:04 +0000
Message-ID: <CAFEAcA-vMKzL+CQhhf_OskjHxvoYANbjcmTd1FuRennV1M5ahw@mail.gmail.com>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 13:06, Liviu Ionescu <ilg@livius.net> wrote:
>
>
>
> > On 14 Feb 2022, at 14:28, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> >
> > In a .git checkout, pkgversion defaults to "git describe --match 'v*' -=
-dirty"
> > See scripts/qemu-version.sh
>
> I see. I would say that this is a different use case.

It's just a handy default for git checkouts. The primary use case
of pkgversion is exactly "this is a downstream packaging of QEMU
that wants to indicate that in the version string".

-- PMM

