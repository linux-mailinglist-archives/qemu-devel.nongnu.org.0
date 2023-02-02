Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952886879DB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWXc-0008JP-Ac; Thu, 02 Feb 2023 05:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNWXa-0008It-9s
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:10:02 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNWXY-0000Na-KJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:10:01 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 ha3-20020a17090af3c300b00230222051a6so1338121pjb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WZApSu/0SRw6nQsfSo2XQ/Atgd4Vc7WX6/+tCFxfzRk=;
 b=r1xminmq8+hjMM+NoxQNvcHK07KSLyM+UXKT7PHrAcCjbl6NMD9ktdMTzDyHF9hUGH
 Q5s+5YkJS1fgPNCRVOqYEIh5Ts0yXIIDgaYVwCHNZI3PpfuLMNr6VgPqW3UcnSe+s9dB
 lAoKxwjbwaVa9u3tzAag17ITuLFt1u4K2fcINByTvs5dVmUeMs4Sbo+1TEOAF7qyISOy
 FVb+Q4ufOKFZZi1csQ1e9ZfF0yS78ikAKft1EcSkP4lm0Dd787hF9agqfmO1NEFRVrHE
 WZCCWAGzBbt8AxfWZIuaOxq5MbzmeYimCW50BzVmOKEWu+2VGRVyNeERxdM3GJq7CJu4
 b47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WZApSu/0SRw6nQsfSo2XQ/Atgd4Vc7WX6/+tCFxfzRk=;
 b=fPnV2off7SmqOzg0Q/Bz8pEpsEEtk2E9iL22jOS4Jk42T3/1tV/gNAU6tJE3yJ1FzO
 W6WIwuC3of7pChvlpGnrq+rE/5oylRtOs2OGCiob653DRsHzxonxPU+nzdU1Zfo+oDCl
 bw64qXOBuPh4Ijf6SO6W/vCuvoqU9ttMr+5uS2jpBgA+jVMwtpzjz8SbV2dpxX2s/mPZ
 njtBy6dxApHmvMGptgkTB8aHopdeAl3rhy/hFiu+jqYvUB1nIRVjyr4vJTUUvrVRrVlA
 1Ar3Na/JejKp9Lf87tHMmL3vQhEJLSd/7Y3dMIcJhFzcTDY8ZMDf5QsnkDgKMD69CBWh
 +L6w==
X-Gm-Message-State: AO0yUKXnN9jKGleeuz0T8rIA2Sjt5IQcQ6Scy6gFURgLm0dp/+ocBrTf
 mTJZW4Rp8kbGYB2JZW+p1R5kePZyzcLEqYybvnOZ9w==
X-Google-Smtp-Source: AK7set8kLAyN0wAmaViAw2cCxPnoZbuF+aFI4mkQfIfwY8E+0qA8YCDCr++oYhfj2Ez10TG/Lb75kKuLMGrcqTDNaHM=
X-Received: by 2002:a17:90a:43e5:b0:22c:baa:c2d5 with SMTP id
 r92-20020a17090a43e500b0022c0baac2d5mr474663pjg.53.1675332598594; Thu, 02 Feb
 2023 02:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20230125023445.3655253-1-jsnow@redhat.com>
In-Reply-To: <20230125023445.3655253-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 10:09:47 +0000
Message-ID: <CAFEAcA8_4TFwCer6e_hMau3v-1Ut=r+_JyJq4T0ZAnHHTnX6iw@mail.gmail.com>
Subject: Re: [PULL 0/7] Python patches
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Wed, 25 Jan 2023 at 02:34, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to bd4c0ef409140bd1be393407c04005ac077d4574:
>
>   python/qemu/machine: use socketpair() for QMP by default (2023-01-24 13:37:13 -0500)
>
> ----------------------------------------------------------------
> Python
>
> Bits and pieces, kibbles'n'bits
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

