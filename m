Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24777344C00
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:44:40 +0100 (CET)
Received: from localhost ([::1]:56582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONfT-0005AI-5b
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONdd-00048g-8e
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:42:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONdb-0006B3-Sg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:42:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id l18so11964913edc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X5MlLLJmPc8qH+lyuJsaS6mGhIJ7ZupxW6nNuVd0vAU=;
 b=LRPuz7LreogXOVZHwGrJWGwfQWulJ/Jtv5Af+iVDOZVxvtf/lbUHOd4NxbDsWPv621
 681rTp8SqS5TctahDI87g4xDul/Z0geDy1x9mQovDMjlme7+hfNyAgCEWoUls5mFy5Xj
 Q5oTa2dkgLpJqOMdDhEoYCO+4jVsNxQqM2dKgdcR0rpkjOKGEZFQLc0OkHqoqArBCaJc
 gbNoRekkxqioTLWO8Bc0mUifJVDv+PIlVGOfOAvtLXi96xzORvzJeKdSTfMB8LqkNJCJ
 HvRkeGIvqC8Gz9OjtqwP2f+QzpU4pWeLakDCkRgPp0COB7iNPoI7/ZpdpT3TGxBkx/Nm
 v85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X5MlLLJmPc8qH+lyuJsaS6mGhIJ7ZupxW6nNuVd0vAU=;
 b=r+sNFWEixIYlol9Jd4ZTTRDC6ud70VIj8joCZ15cAiWW+18ZX5yXWPb2QfVnkKwmfQ
 u33WoiYAkn7ki12FJhRPYOx1w+0d8qHXS//rdtUss7h/03F/q41hApF7tGwRyY6u3RgO
 o+LNvScqHlKaXB/QqRH+shIUV/VqjcgVFA0CzV+6r4gRwrBH0SsucEFoPhp1d5jhCtzO
 Qz4VsfSgbE41SME064arqPhwMJvbVGFYYPOBUl0JdOFSyugbm43s9ajol1hJAolqlnvX
 AKpsyUFqI13tZUtNuVF34EwHA/YA9TJC5mvm3yPPhIC+4dGJotIZtb9fxUERHXopP68O
 525A==
X-Gm-Message-State: AOAM532tBa86jNtQh3XTs9za0qKp0sQq/WfVoaJQqAE74ZZdfYQhkuNu
 AF6dSNtTJqzKaGrdSJk1ev07y6zb931vH0NK7mCrdA==
X-Google-Smtp-Source: ABdhPJxI12HBWJoHjQM1YcI/LjdQB4nyoog9uDHNJQuGO9xPacoqi9B3rEO6qu8yegIARfAFetR7d+pyucKt76Dr3X8=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr524924edv.44.1616431361404; 
 Mon, 22 Mar 2021 09:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144140.13505-1-alex.bennee@linaro.org>
In-Reply-To: <20210322144140.13505-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 16:42:13 +0000
Message-ID: <CAFEAcA_jG9_ehYOe3RQ7OxazTLE1JHjZbuUTfu+b7wY7uV4pKg@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: default to not building the documentation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 15:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
> Debian") we made sure we can build the documents on more than one
> system. However we don't want to build documents all the time as it's
> a waste of cycles (and energy). So lets reduce the total amount of
> documentation we build while still keeping some coverage.

We specifically do want to build the docs on every host OS version
we support, because Sphinx is very prone to having docs constructs
that work on one version but not on another, and this is how we
maintain coverage of "do our docs build on every Sphinx version we
claim to support".

thanks
-- PMM

