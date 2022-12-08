Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D3647474
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 17:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Jto-0005p7-Oe; Thu, 08 Dec 2022 11:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3Jtm-0005oi-Tp
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:37:26 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3Jtk-0001ao-63
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:37:26 -0500
Received: by mail-pl1-x633.google.com with SMTP id w23so1992922ply.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 08:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXcE76ICUqhqhzKyohZ9h8giOFBqg/8aTbB5SlwfUW4=;
 b=Q2o/wRvJq1Q5RMbesH5EKSPkkn1sfOeSm7dYagT6KPDAdemUlUkQ0dk5GjcQv9Lcss
 tmRFZVjPxEt4ejpHm2OOwzFko+WNZi2MGEpsqD+sH1hnIikX306GN3Db9d8gbOSEyZuh
 42GlmDe8lYep4HXw3hy2kGo3jcfM/fbkfcbaL/oxBMBwhkcndkRN+q9fIWYCvIHwAP6o
 3EdA+MVTDknnX8u0Qv0uHlFjgqpbnwdJix+CFtGC93PdCCSimDR3Gi+nDsbAEs19YHY4
 OWW3pMhHub9ZmekNA1+V9viQSxrgNN751jzOcQFs6RcPu2ikG9pXQcKlx9bfJw+Jifhl
 i9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXcE76ICUqhqhzKyohZ9h8giOFBqg/8aTbB5SlwfUW4=;
 b=wY4n/ux5XUEbFezjFhpVyNVy9H8SyMmVF4rFvRZemcYpifyx5wkHv8aTQ5u2ucgOe7
 c6opIbPRM6qPx+k/rrZ/kQgf0RVDkT/4F6bwm+sQFtRC2Nz8bp9TvCxQkzlNU8z1fITa
 zDcZMoSIgaAqUv8sqOBDeDJCYIit0z/G0E4BXuNhtJ0dth3PDy22CM3Q5uGjbqp1cxxb
 LyDImiCaoA+poLLb37Fb0r1+2e3pg/5uEgKGonPobpvKbnXofCifMHj85rZhBvSKKZKq
 tFX8gZ1lVvwTBqLaWWM0RYb1zwTaarS8Hx52GxNIURfudSnoEKFEjhtukcun9mJiJVKv
 NprA==
X-Gm-Message-State: ANoB5pn2fPVelS640d6SPIvbOtz2Q0Txku3Tr3S/pCkNoomYMbOoqt2R
 lXi1BExDiYp1FrMRyGJMoF59je7FEOcIlwFU3jMR5A==
X-Google-Smtp-Source: AA0mqf4vZTqn7nWmhrvnLvSADQfsCP0pahS64uCRTbakOJeBdquCA7Qeq1GLFuQAw9p06zz24pfwvgfxj20yJghL2z8=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr35029492plt.60.1670517428956; Thu, 08
 Dec 2022 08:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20221208162051.29509-1-philmd@linaro.org>
In-Reply-To: <20221208162051.29509-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Dec 2022 16:36:57 +0000
Message-ID: <CAFEAcA9eanPZi=62xhAod_9VK5S_RzCwY5-DjkrnMgn7V_heQw@mail.gmail.com>
Subject: Re: [PATCH] scripts/archive-source: Use more portable argument with
 tar command
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-trivial@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 8 Dec 2022 at 16:21, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When using the archive-source.sh script on Darwin we get:
>
>   tar: Option --concatenate is not supported
>   Usage:
>     List:    tar -tf <archive-filename>
>     Extract: tar -xf <archive-filename>
>     Create:  tar -cf <archive-filename> [filenames...]
>     Help:    tar --help
>
> Replace the long argument added by commit 8fc76176f6 ("scripts: use
> git-archive in archive-source") by their short form to keep this
> script functional.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  scripts/archive-source.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
> index 23e042dacd..6a710a212e 100755
> --- a/scripts/archive-source.sh
> +++ b/scripts/archive-source.sh
> @@ -67,7 +67,7 @@ for sm in $submodules; do
>      esac
>      (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$s=
ub_file"
>      test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
> -    tar --concatenate --file "$tar_file" "$sub_file"
> +    tar -c -f "$tar_file" "$sub_file"

'-c' is not the short-form option of '--concatenate': that would
be '-A'. The problem is not long vs short options, but that
BSD-style tar does not support the --concatenate functionality at all.

>      test $? -ne 0 && error "failed append submodule $sm to $tar_file"
>  done
>  exit 0

thanks
-- PMM

