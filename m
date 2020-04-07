Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D91A0E01
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 14:55:38 +0200 (CEST)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLnlR-0003jf-9f
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 08:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jLnjF-0002nb-Ve
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 08:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jLnjE-00013w-H3
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 08:53:21 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:37693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jLnjE-00012j-Ay
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 08:53:20 -0400
Received: by mail-ot1-x32f.google.com with SMTP id g23so2961379otq.4
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QZlbXpppAP8/6+KfEM/iKAUHOjwAyiMOZEmbkB2jxC0=;
 b=DGB6I+K90ttI4Gso762NSoOZlccfvLUxMotR7T/SJ/ZFNOjSK+Dw6ngV2Ik4VXQwRc
 9u0pnDbBJm6g42nAcubka7Jv+EfRhA8hDDJZrfEVb5TeyWQBfsI5tT7u8hUM+LdIAzCG
 nUAOVPOI4XShYQ3GI7HlTcC+6j50LTeWzGBi+A6TdoVqJKmWgOkbCIip6eENXXX0wymM
 MUpwZsSqgl0dRitXOoCWdxZTSptUVpQ1F/eyPTZCuDdF1kHhWtrb+xq2oIWRv145zYYp
 kvir/Xr+Agum7RaSmk7c3EdqRA2rIibR2OuAxZP2duM4iGGhoNRc8DkUEKi93H4QTo1U
 oXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QZlbXpppAP8/6+KfEM/iKAUHOjwAyiMOZEmbkB2jxC0=;
 b=jDCcWUsIQdaScPojTUFk3qN32SCx49pV6RJyVdETblplNeuuTbGEUXnMx8kAaH3qS9
 aP5nH0y0biz0eME8vTz1bO3azDVpmRKQUqwWlSEUkONiGvD28jjZySeiRVeQNNBQ6Dxg
 CLmngAh2LQ7Q++ms5iIdC7dVEs3vbYtB9hcurmVEJk9Fltzrqfrb8VXfR5/zpI0IxGI3
 RXZvgRBkIlr1qrLRGnTV2btD+dZJYpbIQMykmktuD/8RibGQlnhl3IY2SM18+LIlUqP8
 7X8ntO2cq4DLwdz1yCwMJbrEjt/syNdgJXCfJPZwfHNDSbrXh8fmwBkUjctENqNTN3X4
 j9vA==
X-Gm-Message-State: AGi0Pub4UerNvimLrx+G+4IOKHjWVFivxoCb/8sDiyQ7+zxy8AjjKZ04
 8zLD/DXPHu3vqqKyvez20t6VWNnux0og7/mYfEoHGQ==
X-Google-Smtp-Source: APiQypKDo/kvgu14i0sldiZQ0+rNLR+a8j6FhzFW+njZsdrIMAkAQwM3F8SnomJpImDlZEuduy/MmmyqGTEjjXT41r8=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr1417456oth.135.1586263998725; 
 Tue, 07 Apr 2020 05:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200406214125.18538-1-f4bug@amsat.org>
In-Reply-To: <20200406214125.18538-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Apr 2020 13:53:06 +0100
Message-ID: <CAFEAcA9bN_0AqR2E-cL0ymQ6LLPB3dQLE5QndTJCJRGDvnafsw@mail.gmail.com>
Subject: Re: [PATCH-for-5.0?] .github: Enable repo-lockdown bot to refuse
 GitHub pull requests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32f
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Apr 2020 at 22:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Some GitHub users try to open pull requests against the GitHub
> mirror. Unfortunate these get ignored until eventually someone
> notices and closes the request.
>
> Enable the 'Repo Lockdown' [*] 3rd party bot which can autorespond
> to pull requests with a friendly comment, close the request, and
> then lock it to prevent further comments.
>
> [*] https://github.com/dessant/repo-lockdown
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Repo Lockdown is enabled on https://github.com/qemu/qemu/
> ---
>  .github/lockdown.yml | 35 +++++++++++++++++++++++++++++++++++
>  MAINTAINERS          |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 .github/lockdown.yml
>
> diff --git a/.github/lockdown.yml b/.github/lockdown.yml
> new file mode 100644
> index 0000000000..94472d1256
> --- /dev/null
> +++ b/.github/lockdown.yml
> @@ -0,0 +1,35 @@
> +# Configuration for Repo Lockdown - https://github.com/dessant/repo-lock=
down
> +
> +# Close issues and pull requests
> +close: true
> +
> +# Lock issues and pull requests
> +lock: true
> +
> +issues:
> +  comment: |
> +    Thank you for your interest in the QEMU project.
> +
> +    This repository is a read-only mirror of the project's master
> +    repostories hosted on https://git.qemu.org/git/qemu.git.
> +    The project does not process issues filed on GitHub.
> +
> +    The project issues are tracked on Launchpad:
> +    https://bugs.launchpad.net/qemu
> +
> +    QEMU welcomes bug report contributions. You can fill new ones on:

"file"

> +    https://bugs.launchpad.net/qemu/+filebug
> +
> +pulls:
> +  comment: |
> +    Thank you for your interest in the QEMU project.
> +
> +    This repository is a read-only mirror of the project's master
> +    repostories hosted on https://git.qemu.org/git/qemu.git.
> +    The project does not process merge requests filed on GitHub.
> +
> +    QEMU welcomes contributions of code (either fixing bugs or adding ne=
w
> +    functionality). However, we get a lot of patches, and so we have som=
e
> +    guidelines about submitting patches described in our Wiki:
> +    https://wiki.qemu.org/Contribute/SubmitAPatch and
> +    https://wiki.qemu.org/Contribute/FAQ

Maybe include a reference to the mailing list here too?

thnaks
-- PMM

