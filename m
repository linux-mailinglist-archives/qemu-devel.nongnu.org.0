Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250AF4E47B8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 21:47:00 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWlP8-0006j8-Nl
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 16:46:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWlNe-0005H8-EP
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 16:45:29 -0400
Received: from [2607:f8b0:4864:20::1135] (port=36990
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWlNc-0005CJ-K3
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 16:45:25 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5757b57caso204974997b3.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7aZmZWqgYGkmSy2+CkjMvSUxFJBeifLhK88ayhYZcrE=;
 b=HXL6zB+KBRKClBOKZEH3kNC+5O1dmRQa2QT1ddzfSNETkrLDEEhszh1nAm7+bYfNT7
 +dg1JZzw6qKctYN6GwdXzosQR2E1u/azRHq1mGWaZNrN4HrZ/Ib9Dx5riWC3p9ad/Apl
 YPJcEAZsulvRA+ere3wpVXtYAIIn9NDHuurjN55YDj5Q1uFrY3D7tYMDgKbVsguZx+MO
 qEmbP0dgF49Rmw3dpTIUxthq1M/Bec4E4NkXIdlgUYes2vc9BnUvyUEoomVRsDjxLU4w
 ejOVzRaj9MrhjjTq/te4lhsrpsgersICIPFmscjENNabkzzqqp65sb4aNHciLsnerO23
 /jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7aZmZWqgYGkmSy2+CkjMvSUxFJBeifLhK88ayhYZcrE=;
 b=olbTaEb3GTAM+04g074fnn24DOXYthHbabeXvi1pR1X/K4wcFfXiPr/FrkgjBlA/ir
 HbCBI19z0CdYD8PN2enTvAtlHtSHKAx/AS7nOeERVjTeYt1hs1m9lPdbJvLfQCj+uDJV
 7L2LNaGuqT8dfVRpM7rGX913rfXtwq7kKEgC16fu4zpNwSuaXivUuDCXBIlJbgE8Rscj
 KC6/zDwDe5ZQcBKN0dcUdo3EilLf4X40V2XrCRZ+hfThDLDd6iwEsBVouMiAt48aVC/S
 piO1Ae6tSDjv5Fg0TlkVyyFZIROzxlEkrEsB0KlxPTU+fBV4Wa7w87V59VZXMENwyOkv
 VS2Q==
X-Gm-Message-State: AOAM533TKV/cflB6etxDhSc4sPRa5GQ+gXaKXydYRHHh7ifpWEVSdKbN
 +le+tHv8ZBHWnNj8SNNuw9C0D0y86uoJZkmJhLh6iw==
X-Google-Smtp-Source: ABdhPJzq0QxqQ09XQAO++Nyywq7/KsgIgv0qm3kiJXzGfU0m7xEuiUhJavP79B1IO6hT5DrTpov/RHqqNDVERtP7eAQ=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr30589440ywr.64.1647981923484; Tue, 22
 Mar 2022 13:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 20:45:10 +0000
Message-ID: <CAFEAcA9NHeORX7pTttzcsg02SKQeZOoE5C-K-Ddzm8xjYHPjCg@mail.gmail.com>
Subject: Re: [PULL 00/21] Fixes patches
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 at 12:26, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 48fb0a826eea2e7b0135f49e7fa63e7efe2b76=
77:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2022-03-21 21:27:14 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/fixes-pull-request
>
> for you to fetch changes up to 4ea4bec6f459ff1af6af01677d5bfac240db0201:
>
>   qapi: remove needless include (2022-03-22 14:46:18 +0400)
>
> ----------------------------------------------------------------
> Fixes and cleanups for 7.0
>
> Hi,
>
> A collection of fixes & cleanup patches that should be safe for 7.0 inclu=
sion.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

