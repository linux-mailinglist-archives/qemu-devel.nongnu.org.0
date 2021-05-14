Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C081E3805E0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 11:06:18 +0200 (CEST)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhTlx-000699-Dj
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 05:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhTkw-0005TN-Bq
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:05:14 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhTks-0008TS-DU
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:05:14 -0400
Received: by mail-ej1-x635.google.com with SMTP id c22so15576746ejd.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQz0T2IN/pV+nc6p6eqT0q/E5H38IVMJ+65f+VnlCc8=;
 b=a9V1qzgSV8frTL7o+naFVg62IRL19jFvJPIN1d5HqjUiWDUNd4V+9KtR26ODmmBd/2
 GEqIzhPr3I7tH/eTDgGYEQop45AXYRD/UwSJ0oMnAAR9+66zA1u7ZfYnhsIsow4NLEXF
 d9BNG8h8tpp5yRdm+I9s6y8rEkVv2U+pB7hJcuNNUTwX02l0sbLKxVoEvC/DL+RYEgcq
 H85HYTzgamrRp4EXR20kh/oET+woG07N5UWTbFlHQ1QeWo+8QmCxmh8n1C357HQHDdtP
 3B562jqEU6yX4k1XDjmXkv1Lba/OQdZvcT1NNlyhakDW1kDSq4zkykVk1nFrW49BwTQb
 HsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQz0T2IN/pV+nc6p6eqT0q/E5H38IVMJ+65f+VnlCc8=;
 b=GuMrzTvED8ILoQh6XlyBGFfjThO1L8SboSk6S6f5l5AwJVslryDaGnkM7ClGHpFy9q
 ej9lulQ+JCZWkoQ4KGV3RYzSie+SYRL2hNC59KZGjYEEVATjy56mPHG6NYPVJYv69iib
 /w4tVLgk/iQFpjiEZqWrgkglFTg5W236zbSqA3pU00zERT2218ac9tV5fjE7LxPkyX5n
 S6M+1FcQyYMDoy4Ey6QTodHUgH1mIUa9tBMaE9ChmnjX8NfbytS+TlWEqBwAigYgbOGB
 scnKHeOmaXHHtOXoy9jR/75W7qTCqFw6UQtHJrFT2ECA65m1w+cQaIL8PDvAVVaPE469
 s6eA==
X-Gm-Message-State: AOAM530qwB2CTVbeTBaRB31qrsiGRkK/KTj7omdAn8z+Fo9jMNVRZwKL
 NSCxyqOEGt8spK44BEJm2Q9UlyddmU3Yz7Gaiz5ZTA==
X-Google-Smtp-Source: ABdhPJzGKW4lg6rk20w3EN349UlX2JHETIIATYChZHu2nhbA8M5tek85Jdo0qJ7ubIw6Ydztwd38kWlAIjgmuHZTiZs=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr17243331ejb.4.1620983107316; 
 Fri, 14 May 2021 02:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210512162412.338120-1-armbru@redhat.com>
In-Reply-To: <20210512162412.338120-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 10:04:54 +0100
Message-ID: <CAFEAcA8c5TmGpSrj-SJ8k5_Y0U6F3eBMKXtbyive8EF=6gCktg@mail.gmail.com>
Subject: Re: [PULL 0/5] Miscellaneous patches for 2021-05-12
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Wed, 12 May 2021 at 17:24, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a5ccdccc97d6e0d75282ede5b866cf694e9602b0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210510-pull-request' into staging (2021-05-12 14:45:21 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2021-05-12
>
> for you to fetch changes up to 4369223902a79b7fc56ca076d99b88ff14964ddd:
>
>   Drop the deprecated unicore32 target (2021-05-12 18:20:52 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2021-05-12
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

