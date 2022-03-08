Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A161B4D1840
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:50:49 +0100 (CET)
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRZIe-00020E-6j
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:50:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRZ6I-0004Ij-TD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:38:02 -0500
Received: from [2607:f8b0:4864:20::b32] (port=43669
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRZ6H-0000Vl-0G
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:38:02 -0500
Received: by mail-yb1-xb32.google.com with SMTP id g26so37411353ybj.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWk70KvfemKI08Tla2PZZOVXK+UCWpp0/xx7Q1qN3uY=;
 b=S5RkdWEpD+vsX/g0vDFqoPh5+AieFNIoqlu5KNZpaX1np4i12ZAwuWlnME6BSXJ2jJ
 U3G0BMKWzArXAp/5ZiX7y+6IT69qK7mwWUgv8AU63mYvt1lWat2fyXy2v3C8Z2ZsYYjD
 leusbPZt4h6tt0jT99KwKAj6T5hTnj7VqCQ37UPr11DmgpT+X0ooiNqsGUViKHW1pf6E
 fiNaxpjwf/ogvPw9/3mwuzUXq0qvonKkbXy7uc+4hjsWj6/eASBghaejyTb/r2kvew4m
 CHiXDRkE1hNhGAqRrMR6NsOgmbR04tFN/KG/5g8rEab0SaDszOlM5nkjlKJA6ehTKEqS
 MNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWk70KvfemKI08Tla2PZZOVXK+UCWpp0/xx7Q1qN3uY=;
 b=frGA8yb61dmWkF1ZJRc98BFRXBz6XmSM9uw0vG2xGhU+mjwxsYwghysnc3Hocnf8ad
 mysc4SntUt+P/nfwP5yvxMW3b66OiYm2eRjH/YnjUU07vOqRqyQf/U6e6wQ29mSyTzBK
 +MXaX+NAL/OxfJo45Cjbv3fbQmAkExMwSvfZVqB+P1abDkanLYOC14vdmTg9lU6hpWHc
 JiXwL0MODg96qFrVgZTv0NpSjgdaAGYtf6sppUmAayjIuZ9f+R0jGwqlLEPFZDghK9zh
 SzM8I5a9MEx/qFYrLTvEH5m7WPDC0egHqXy860f6pLnZucO34lYihSNJ2dSrcR6eba2R
 Mf4Q==
X-Gm-Message-State: AOAM532HK1u0jO+7nN0nGU+gC+nVO+XzoXKKenSVopAVKiMzndQwmwCk
 WOkzLeIigIiFYb+qIX+Xj0qTwVc7174xPtOENPSDXA==
X-Google-Smtp-Source: ABdhPJwnSSMaSJ/27gI/yVmGjkatp9v5WtqcKBNcbMeHFjXDz+KHH6vUMEg4bjuW1GlOfYAsCgWUOwKTuu0vttJ1mgc=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11689341yby.193.1646743079533; Tue, 08
 Mar 2022 04:37:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 12:37:48 +0000
Message-ID: <CAFEAcA8D2TdZ+Rc4qKiUwGoOL28Y8ZXxERpMGJKe7K_uQ864xQ@mail.gmail.com>
Subject: Re: [PULL v2 00/19] 9p queue 2022-03-07 (previous 2022-03-04)
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: Fabian Franz <fabianfranz.oss@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 11:23, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220307
>
> for you to fetch changes up to 35b6466459f9234b9cb30296f243a70b6f1b44b7:
>
>   fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-07 11:49:31 +0100)
>
> ----------------------------------------------------------------
> 9pfs: introduce macOS host support and cleanup
>
> * Add support for Darwin (a.k.a. macOS) hosts.
>
> * Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).
>
> * API doc cleanup (convert Doxygen -> kerneldoc format).
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

