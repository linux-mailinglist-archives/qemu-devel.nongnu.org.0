Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221324DA600
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 00:08:57 +0100 (CET)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUGHf-0003yP-LE
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 19:08:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUGG9-0002tB-WF
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:07:22 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=46041
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUGG8-000545-AW
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:07:21 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id w16so1319693ybi.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W2IXTqWVKOOsBwhG3xPB+3mFVuu6gjW5a34pXrMNRTM=;
 b=kumSXhnJCosQYyui0e1GfB4U30E99S092Sxi8YH5Qj2yegZ7A0DArMnRlD/AlHzv+G
 JkrtBgwtJ4yeBQ1jUh8GfnLg6xUVMNPsiGqXt46xNrF8O4BQF5RNR8jBcQJD8+tyBr2F
 Q0TXN7PASHt+b5P0iN+H3ne2fY24qTuNFGVHrh4qq6rWui6t+tczZS0QXOYTN0W+YOvg
 jHl4DqOaQvSFgGrE5XQqW1I9kljAWNp+iKiD5WxROT26+MIlDE8m1ROMvxKAUdDzVCGg
 lIKjvR2cgE52JmX2j4zDgZIDv9XB8CdawyQGuwgqxH6lHjFFmOqT5xtW/uFWhGNmVO+t
 1VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W2IXTqWVKOOsBwhG3xPB+3mFVuu6gjW5a34pXrMNRTM=;
 b=fZWYyxIWguU3Qr1/DWowb1uEDWZILnMF92TR6oRJQwQYzzpq4DKOTnE0w4TnFu7l+P
 FIQP8HP8/HLErd7PblW/VOIqzAsGY+MDg+VoFWbR0O9efxxckLNFM+NM8RLgfrdnzf1J
 XDATpDB3711J+07DiAXaZ58FWqg3U10sYj1dZHjCvrt3RhocIBaF8xgqV9Ioxk3QPlSg
 ICoHcswgHjCXcD7vS6C3go+wk4kB42yUnNWfB34t+I/FJQnjz9JhhNzHN4sZvxzlndqU
 sXqpJcb6pdt2PR+KWtfVZUy2FA+uRGkzDCbsrGCDan3E6Fo6EkSHAvynoJcquNGD+4Ci
 1WTA==
X-Gm-Message-State: AOAM530Nu3+PPerMSRELWNtuJzq9TzobcU46Bh7oCjri4zvFYz+RXl/t
 vaH4YbQI/N9YO/W7uHb2h5pqu5PfPchdoyO3ebXM7Q==
X-Google-Smtp-Source: ABdhPJwlpRMgN32gjUcTbZQ1M55CGKDdXSlMH2kUNudxwubEqVhy3ReSbX589kGMCG0Rw/noC/LN2Mln1pp3G/LKxoA=
X-Received: by 2002:a25:2d27:0:b0:633:7521:4794 with SMTP id
 t39-20020a252d27000000b0063375214794mr5586677ybt.193.1647385638927; Tue, 15
 Mar 2022 16:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 23:07:07 +0000
Message-ID: <CAFEAcA_0f1pYSuUnGHkhpotET8iCRwCW9OtHyDStk_eqSm5w+g@mail.gmail.com>
Subject: Re: [PULL 00/21] Darwin patches for 2022-03-15
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 13:02, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit a72ada1662ee3105c5d66ddc8930d98e9cab62=
be:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into s=
taging (2022-03-15 09:53:13 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/darwin-20220315
>
> for you to fetch changes up to c82b7ef16f3efa59e28f821f25a9c084ef84ea9d:
>
>   MAINTAINERS: Volunteer to maintain Darwin-based hosts support (2022-03-=
15 13:36:33 +0100)
>
> ----------------------------------------------------------------
> Darwin-based host patches
>
> - Remove various build warnings
> - Fix building with modules on macOS
> - Fix mouse/keyboard GUI interactions
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

