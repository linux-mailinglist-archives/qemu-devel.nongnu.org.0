Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4752DE6C4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:38:57 +0100 (CET)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHqK-0006ZX-Ua
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqHY3-0001V6-HY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:20:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:32823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqHXr-0007mD-6b
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:20:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id t30so2591004wrb.0
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eTuXgdMCulV01v/gsDrhyQQkUbi5ZVVo7dg6VCYLgJI=;
 b=kuvwR8FhITTYPtVamjXta4R8ArE1f7Fdx4ZbHewe64GE9VI4u05DaWyswA+9b1Jyww
 TKv0esMMHu2qsXE0kxIC2k7pu134SOwc5FupfkItr021I+LtPc8G8JIGQPBEPOfXuLWK
 p9t4N5QfsTic61kyq4G+7yWU9jb3ahh0icNRxPY37bOfYCsKQ63dqi3SGUb88q2KUvW/
 WYto5Kr9i+yhFh7C/L08pCv2P4TKMTT1TL1vFjSaNb7zmtCM3D9NYzd2EKHXxdVvTlQs
 Dvi9cZIhDSz5LzJD5hQt+aLDKK3vjTY9PNypl6uERgD7ADXai3pt+vOgvoJzt88v1hdD
 mwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eTuXgdMCulV01v/gsDrhyQQkUbi5ZVVo7dg6VCYLgJI=;
 b=g7UW1Jd4rrMvn4T3ZX/TX8ukR7KETaudVlAnK9H3HKJtA39Im7um7MUc9ras5Iuygu
 l8Ld08c4ro5vXtd2Omsy1agrH+66HDxJV5JUNVeY5jE39A0uiKWg79H/fYcfTD9f+ZM7
 j81h9bP6PARtEJECTLs3JoDXKuC5tCFf1JovB5ggMvAMItNQTi8mGs9a43e0m/Kd9Xrq
 xzSV20XIorKpAGjbp3kZxZwTLuncSW77Q1a4FYHK8JLvZo/0U2SX5xNLXHzs/C6KiGgk
 ZY+2JBxzIQhKSHGqC3C9BNCIgfBFrqFO2IznYfbWW1sc4l0H54i80xmbAfSVqwB43j07
 jSKw==
X-Gm-Message-State: AOAM533a0HlZ4oKlCEQmgCFdYi+WBBMCAKKA5PvmshcJBZ1JFyu90OvZ
 mGZqcEKDdWyi5dLaDvOduxsp2Q==
X-Google-Smtp-Source: ABdhPJwnZ/xn/Dunmditv7zcrw5FW5xjjpuR5keWb1Hz7em5oSQYdzNAwxUfDA3yi1yepsqoqrlafA==
X-Received: by 2002:adf:c589:: with SMTP id m9mr5039946wrg.370.1608304789267; 
 Fri, 18 Dec 2020 07:19:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d191sm11790680wmd.24.2020.12.18.07.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 07:19:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E9CE1FF7E;
 Fri, 18 Dec 2020 15:19:47 +0000 (GMT)
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-10-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v2 9/9] target/arm: use official
 org.gnu.gdb.aarch64.sve layout for registers
Date: Fri, 18 Dec 2020 15:17:26 +0000
In-reply-to: <20201218112707.28348-10-alex.bennee@linaro.org>
Message-ID: <87k0tfqgz0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> While GDB can work with any XML description given to it there is
> special handling for SVE registers on the GDB side which makes the
> users life a little better. The changes aren't that major and all the
> registers save the $vg reported the same. All that changes is:
>
>   - report org.gnu.gdb.aarch64.sve
>   - use gdb nomenclature for names and types
>   - minor re-ordering of the types to match reference
>   - re-enable ieee_half (as we know gdb supports it now)
>   - $vg is now a 64 bit int
>   - check $vN and $zN aliasing in test
>
> [NOTE: there seems a limitation on the indexing of the pseudo $vN
> registers which I'm not sure if it's intentional]

It is (v registers are the aliased vector registers, not an alternative
to the z register).
>=20=20
> +        # check the v pseudo regs - I'm not sure if them capping out
> +        # at [15] is intentional though.

I'm going to change this comment to:

  Check the aliased V registers are set and GDB has correctly
  created them for us having recognised and handled SVE.

> +        try:
> +            for i in range(0, 16):
> +                val_z =3D gdb.parse_and_eval("$z0.b.u[%d]" % i)
> +                val_v =3D gdb.parse_and_eval("$v0.b.u[%d]" % i)
> +                report(int(val_z) =3D=3D int(val_v),
> +                       "v0.b.u[%d] =3D=3D z0.b.u[%d]" % (i, i))
> +        except gdb.error:
> +            report(False, "checking vregs (out of range)")
> +
>=20=20
>  def run_test():
>      "Run through the tests one by one"


--=20
Alex Benn=C3=A9e

