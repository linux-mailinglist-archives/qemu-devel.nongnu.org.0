Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B13E58DB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:08:37 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDPca-0008U5-Jq
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDPbd-0007hY-3S
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:07:37 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDPbb-0007bv-Cf
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:07:36 -0400
Received: by mail-ej1-x630.google.com with SMTP id o23so1491471ejc.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TfRagywLtR0NNG1p8fNBZDi4CZ/tSHrEDTM+WwvaucQ=;
 b=ZvoMtarQccpsu0kqUQQroWQMxgi4VtW9oIY5ib+pw0JLDK0iUgIw2rb8EyFQ2WjMse
 DIlU2jJtJQXSL9/lVa+lcq9EHk7b4mzB8Q/6Z0LX3IRRkdbC4n+yK2qV0rXZf3XbRgvG
 JBo8/CSruXebrMdoGtZrj+65LeRMW7vr6Ha4ApuiRkXJf3xYyh1F84byn+QVQkVoMIS4
 ff1hd1OyB7NW2JkRSTrjAB67/RubGx0yDzdPInR+H4rVraNxSjVZtO85FwAOeEOzg5zG
 LD+MoFFHQe2c1G+DiH6xDozBEb9qiEeoa0y1Wzu9GrYn3uNUumcJXzndKJxWMZ9F1Sut
 seHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TfRagywLtR0NNG1p8fNBZDi4CZ/tSHrEDTM+WwvaucQ=;
 b=c0pcgFa4o0uURjQDl3fokG4r8xBSNfSWgwgUxlA43pjTgIgfCcjW0gtUcsdu4azKqG
 HhXjyEkyRJuqstzjnORxlJuGfD24WoTcA+b8U2qCqNDhtYTFtj46/X7cJLed1vLU/aUf
 mxZa68/fjabxorIYIXHRKbk+aURUkQvRJ1ciiypVxDAlvvu17Eov10hlyitMm2qKQrn2
 22Tks0LbeTcNrAxDeKIi4h3P7QzE14ftzvf82ok2+qDLRjqSy218+GLO3QQaXe0dLicM
 kVd/dH1e2Xhv8DuW14tIuYxzvgYv8YA5zG2dMuR/ZXIKHDb4bqOPhF7iwqNokMnivfET
 qayA==
X-Gm-Message-State: AOAM532DnVZA5WtD4+sscXB6AmfgIk59VaWl2MNRoTuRnNFu9zaSy+Q2
 7vBMYA0Kh0CpCylT124wrU+VwQddKxByTMR2eTSbSA==
X-Google-Smtp-Source: ABdhPJz0H9ogvMhTI+baO4UbUI3LXpwj2akSc4YmFxdF3pnhwUgx+bkYywHn3YMX7HZAB7Z9/jJc9o81vO1XWxOqz9U=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr26766494ejb.382.1628593652887; 
 Tue, 10 Aug 2021 04:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210810110023.3923155-1-berrange@redhat.com>
In-Reply-To: <20210810110023.3923155-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 12:06:47 +0100
Message-ID: <CAFEAcA_J2T92Gr6-koxofLw5cFEad4evLkSXS9L9gef1OV1yLQ@mail.gmail.com>
Subject: Re: [PATCH] docs: make sphinx-build be quiet by default
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 12:01, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The sphinx-build is fairly verbose spitting out pages of output to the
> console, which causes errors from other build commands to be scrolled
> off the top of the terminal. This can leave the mistaken impression that
> the build passed, when in fact there was a failure.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index 300b134329..29e119a3cc 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -21,7 +21,7 @@ if sphinx_build.found()
>    run_command('mkdir', ['-p', tmpdir / 'sphinx'])
>    run_command('touch', [tmpdir / 'sphinx/index.rst'])
>    sphinx_build_test_out =3D run_command(SPHINX_ARGS + [
> -    '-c', meson.current_source_dir(),
> +    '-q', '-c', meson.current_source_dir(),
>      '-b', 'html', tmpdir / 'sphinx',
>      tmpdir / 'sphinx/out'])
>    build_docs =3D (sphinx_build_test_out.returncode() =3D=3D 0)
> @@ -98,8 +98,9 @@ if build_docs
>                                input: this_manual,
>                                install: build_docs,
>                                install_dir: install_dirs,
> -                              command: [SPHINX_ARGS, '-b', 'man', '-d', =
private_dir,
> -                                        input_dir, meson.current_build_d=
ir()])
> +                              command: [SPHINX_ARGS, '-q', '-b', 'man',
> +                                        '-d', private_dir, input_dir
> +                                        meson.current_build_dir()])
>
>    alias_target('sphinxdocs', sphinxdocs)
>    alias_target('html', sphinxdocs)

Can we make meson pass '-q' only for non-verbose builds, so that
if you pass make 'V=3D1' you still get the verbose sphinx output ?

thanks
-- PMM

