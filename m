Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720C031F8B9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:00:01 +0100 (CET)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4S0-0001ve-E9
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4QW-00009l-Jo
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:58:28 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4QT-0008AD-0N
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:58:28 -0500
Received: by mail-ed1-x530.google.com with SMTP id c6so9535889ede.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xHaDW7wT168LocZWMMhdbYT9YI6SMJn2It6tA9XuCxA=;
 b=z52qYzaCUFH/xrItP18F+r1k8sC1CpGa7/ZwFw1TD742qzvBahNB/nyyobJenrN3bZ
 GMoCxkwJUZc6nXEjydfusV3CctVpBzlpa5O8P08p4gQmNbdABCM5Jy0d3t+0lnWTx4Pg
 975ai7PbaXvoscM3YoCe8dwUeOV5e9Uj/RYYFqNu/JEzwomS2iyccQJ7S3EDdK7ZWlLP
 az6QsHEASTUBXxw10aLrezlSG+VWjRXYrkEwR0CtFTIyRjs1UkGQNJlAtrQqYhydoLP4
 UAW8enZiNAozktdmHKM6aE7fdl+XZqWbavJB204xM/vZDe7zbTQkgZTXhwpt+/uf/h/r
 T7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xHaDW7wT168LocZWMMhdbYT9YI6SMJn2It6tA9XuCxA=;
 b=h3tZ2OhY7bxbv5E2JzYh6DfJW63WPpPgc9EakEobLiJ6MTYvq9HwszDf8kDBU4rFpo
 xwm+Cvx+8ZTneiAxa2FiImme+o7F8v2XPTL2WY+585Vcf9fBvtwAAY5iTsdi0DihiX+D
 zWZnQtrAY1U9zazVunONaMlHSMRCBFp6DFBKK+uvMfj/Ugllh3AXx2+800S2PtBcxhQC
 SAOVzP+qSkhTb10gurU9OKvk5sply4aNO80KeAQqZ5COC9fLkqKVLnuNqd8SmV8n1v5i
 A6exgeepm2lv16TagrDux3lvkYj5RauW3/azKa3Zpxs+gISPIsv3TgfDtAu2+PdneY1j
 Al3Q==
X-Gm-Message-State: AOAM531wGwFKxtah6NNoyWdNA4+dojydrCx6vL3v9i5PEbc2YMgSgFSv
 EHzEzWgN1YvYZcVlDDMOIwNTo4wQl0tsBELRlr44/A==
X-Google-Smtp-Source: ABdhPJz+hHaCLzLORhz2bMxSjQPynCZybPlAf31zD7NikTneJCwl06706WhBnBhGqXXiDJrDLZPjBwYeAF0QXkUQGFc=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr8586919edd.100.1613735903486; 
 Fri, 19 Feb 2021 03:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20210219115123.1938686-1-f4bug@amsat.org>
In-Reply-To: <20210219115123.1938686-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 11:58:12 +0000
Message-ID: <CAFEAcA_9nuCvVrhDZo=RQoFngpY=ZrJCOw9NQx9A9GF_BmgN+w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 11:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We hint the 'has_rpu' property is no longer required since commit
> 6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
> option") which was released in QEMU v2.11.0.
>
> 3 years later we feel safe enough to remove it without using the
> usual deprecation policy.

This device is marked user_creatable =3D false, so the only thing
that could be setting the property is the board code that creates
the device. So the property is not user-facing and we can remove it
without going through the deprecation process.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(maybe noting the above in the commit message).

thanks
-- PMM

