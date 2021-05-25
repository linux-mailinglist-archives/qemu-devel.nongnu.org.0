Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6ED390678
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:18:50 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZlZ-0002nA-VB
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llYcu-0006mE-0A
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llYcr-0005aG-UK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z17so32614474wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IfeuVGx2OEsohx0C5M6qmNOuZzvQfUV10z5F1mL6u+M=;
 b=Jm8v6rNWMbmGj/dXY0w0OHv1HPXhMq9sNkXG2LSrrqJUf5O47B/VMOy4wHcennUTbf
 4y5RrncC9UE5PDnIi/nNgjnrJHjsg43TfvwK516AEJ4nxk/i7ANdnmUnEoCExxxYFXEk
 cjyD8eBtCjqOBdHXzVYcr4ygZr7OrovQGJlmYO2xJIAhtF934wDmUEmrBrLuzGulPHq2
 QjK9MGfTDA/wfwmkHDUNrNUcvtoJQ9VF93zeSenob8FCeyVNE/sDYeQ83SwXuteZmNEA
 RZtLY6oxkQbiGI16F8md5PyXWjRhh/rxXQKk/rziv6w/srz5EdbSRu7sWdo7usfh7r0K
 F4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IfeuVGx2OEsohx0C5M6qmNOuZzvQfUV10z5F1mL6u+M=;
 b=pEclWDglk+z8HHhTHSederyeRFv0QhrurEqkVE/d8Bgj1NE+9u4ayAIwTSlaDHbJ5e
 35kTbFEhlhZ00pu5AfgoXlvfLXL1a9ubN0A/UP9a0MAu1bAggYxPVwxdaTANSXE9mK6b
 aCPpBwOWyybK61WExma/DIZhlPzGWPDw8K21LuEavCHlVy09nakoIWI5TnAGorDFMj7L
 Bg8WNtSrZCZzzoTjPoLxucx6gz7YXsA6+1A+S8bX+A/ANLOYdtBvpvN02oevSMf4RnJs
 VwIigeNjtKDAL6sx87nvhp1CAbmMAF2XryZbMlA6KCxm23P6FO7Ebd+1+UlnUxEMjyQ7
 nIKg==
X-Gm-Message-State: AOAM5316u572BtwbqfZ1Fc7OaftPEhhZ5a3VGYVpsN7n7LKtGtsNw245
 dSacokfuORDqM+6KGo0QkNJUiA==
X-Google-Smtp-Source: ABdhPJwoObY4ngzqjyolqIhDFQtPTElOd2azMFBZACsShQcwmdKDpVfkL/jR/KLd4xexmfIujQFICg==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr28003248wry.364.1621955144540; 
 Tue, 25 May 2021 08:05:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i12sm15937491wrn.94.2021.05.25.08.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:05:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74B2F1FF7E;
 Tue, 25 May 2021 16:05:42 +0100 (BST)
References: <20210525112431.22005-1-alex.bennee@linaro.org>
 <7ef6ac9e-27a6-451c-a511-38cd67a2bcd0@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 0/7] testing, gdbstub and plugin updates
Date: Tue, 25 May 2021 16:05:08 +0100
In-reply-to: <7ef6ac9e-27a6-451c-a511-38cd67a2bcd0@amsat.org>
Message-ID: <87lf823lbt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 5/25/21 1:24 PM, Alex Benn=C3=A9e wrote:
>> The gprof/gcov passed on retry. I'll continue to look at it but didn't w=
ant
>> to hold up the PR because of it. - Alex
>>=20
>> The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a63=
049:
>>=20
>>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-=
request' into staging (2021-05-24 15:48:08 +0100)
>>=20
>> are available in the Git repository at:
>>=20
>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates=
-250521-1
>>=20
>> for you to fetch changes up to bb84bcf61495e9c2907b0659a60beacd2e92e34e:
>>=20
>>   plugins/syscall: Added a table-like summary output (2021-05-25 09:24:2=
1 +0100)
>>=20
>> ----------------------------------------------------------------
>> Testing, gdbstub and plugin updates
>>=20
>>   - ensure gitlab references master registry
>>   - add special rule for hexagon image
>>   - clean-up gdbstub's argument handling
>>   - fix replay HMP commands to accept long icount
>>   - minor re-factor of gdbstub replay handling
>>   - update syscall plugin to be more useful
>>=20
>> ----------------------------------------------------------------
>> Alex Benn=C3=A9e (5):
>>       gitlab: explicitly reference the upstream registry
>>       gitlab: add special rule for the hexagon container
>
> FYI there is still an issue with this patch:
>
>   'build-user-hexagon' job needs 'hexagon-cross-container' job,
>   but it was not added to the pipeline

It doesn't need to be added to the pipeline for the main project as it's
always there. The change was to ensure users building their pipelines
have a copy in their personal registry.

--=20
Alex Benn=C3=A9e

