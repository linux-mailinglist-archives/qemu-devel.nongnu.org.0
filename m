Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC3344D78
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:36:23 +0100 (CET)
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOTX-0001A9-0q
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOLu-000395-2g
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:28:30 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOLp-0006SH-Fo
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:28:29 -0400
Received: by mail-ej1-x62a.google.com with SMTP id e14so4405591ejz.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=L3fRTUtqKj1jA4qghGfOsDRdvNz6DVvcnbF4nlUs74g=;
 b=rU9o9rlPNuhjlzF4IshP+L7lfZY96B+65jaxe70YYCCqaR2mvb344HD7ykrhL3aKbU
 cIyAk6LYUK+DK4YUKXqnkr1wyGPRNrxP5N8f6Gae5MgPJWp/3dHOyKtXMyVFTwc6c9vF
 FGXmjA797fhW9O1/7oIhWsLkf9K1/TDuOT4Ucqxel6w1FSix3qntD5IrQ8Styck5aBbk
 l/wbTKSRQ/6rq3O/v5r6hZZzZ8pEJ5YUrAZIKnqBmxUsZVQFES0DiowTGWTABwvVW2lS
 Hg9h5c9t67i0pjskyDooZIMDQQF8/R/1frciAPXkNb3s3rh/YehRuMb+Ju3J8htOnXVL
 +lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=L3fRTUtqKj1jA4qghGfOsDRdvNz6DVvcnbF4nlUs74g=;
 b=FVfSKSckTEoB40XAmgH09JZWtngWrEtGedENnCukXQKmzFNujnTSKiYDtkVzAOqkC+
 Fgj/DlPsDP6gcfedLQR78dhUMULa2IkFgmkd4sLGqy8xQqteWJAbs2FKB3aOaKgP5Qzp
 J6+Ejqy661mHqMSn07uSzqz2rkhNP3gVq9OQNYHCUp1b3GVpZ4TsBEgSiP+Zv1IJqKwL
 /AbZaIrz9AkpJDpYkFOInya5OIIT5NTTN+uBriqljCnXkoq/cV+X9SZtdqI5Ec0K2edI
 VsCf7na6MdME6cEtl+B5/9T0hNebJqLYnCIuLt/W20gaOBDv1735qCihoUcItO4kQj5t
 /zJg==
X-Gm-Message-State: AOAM530tjnSrdQo9YwhX6IP0QdJwbDiERrZaKZ03wJ1BxUIZvpKxooL6
 Bn+Id//eoh6D39T3BFpfbiD/2w==
X-Google-Smtp-Source: ABdhPJwTsxdw30E6h2wfTWO5rvvXlyl/nPBAvsc07EeZIU/OunA+mppNosxfRpaSqCYxl+5yDBklSA==
X-Received: by 2002:a17:907:75c2:: with SMTP id
 jl2mr916947ejc.334.1616434103322; 
 Mon, 22 Mar 2021 10:28:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm11410475edp.81.2021.03.22.10.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:28:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73F661FF7E;
 Mon, 22 Mar 2021 17:28:21 +0000 (GMT)
References: <20210322144140.13505-1-alex.bennee@linaro.org>
 <CAFEAcA_jG9_ehYOe3RQ7OxazTLE1JHjZbuUTfu+b7wY7uV4pKg@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] gitlab: default to not building the documentation
Date: Mon, 22 Mar 2021 17:20:41 +0000
In-reply-to: <CAFEAcA_jG9_ehYOe3RQ7OxazTLE1JHjZbuUTfu+b7wY7uV4pKg@mail.gmail.com>
Message-ID: <87a6qvjdxm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 22 Mar 2021 at 15:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
>> Debian") we made sure we can build the documents on more than one
>> system. However we don't want to build documents all the time as it's
>> a waste of cycles (and energy). So lets reduce the total amount of
>> documentation we build while still keeping some coverage.
>
> We specifically do want to build the docs on every host OS version
> we support, because Sphinx is very prone to having docs constructs
> that work on one version but not on another, and this is how we
> maintain coverage of "do our docs build on every Sphinx version we
> claim to support".

With this applied we will build docs on:

  - Fedora
  - Ubuntu
  - Debian
  - Alpine

we just won't rebuild multiple times. We are currently missing:

 - OpenSuSE
 - CentOS (although "soon" it won't track to "current" RHEL)
 - SLES (not covered anyway)
 - RHEL (not covered anyway)

Also I should probably squash the crossbuilds because I'm not sure it
adds anything given they are all on Debian anyway.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

