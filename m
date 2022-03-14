Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7459E4D8B7C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:14:44 +0100 (CET)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpDP-0002NF-6p
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:14:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpAP-00080X-FE
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:11:40 -0400
Received: from [2607:f8b0:4864:20::b31] (port=39534
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpAN-0005Az-RI
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:11:37 -0400
Received: by mail-yb1-xb31.google.com with SMTP id t11so713062ybi.6
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A7ehdCtMc4Dokh7yKMrIrXBT1wjJ61O3UlnfDjSKP7o=;
 b=ssqiaPapizyVEUt95H2tbT1mZ8SmXmmHA1lySb+ykYWwG9pu5YRN4jaNxX97LYcWHs
 EHEsa1ZWW4jCsk2Urabaaq+yYqt0O/3klPrsfWr965MMcUArNGtMKKBxHlQEx1pQfIDK
 rcLCU34+gRNqNA86lcvim94yhPKCZHqubj1BCVaW0ILMJMkYTbt50+dQlG6OGD3C/bCK
 27aC6RMBWrZBrFmzIKJOuN0/4A2PHVAR/f+wuloSEZbN4DGqVWArfS/oE1AFHqS64b0T
 Y+VnlUkigNHGYhPbphnw0FbRDrAg5Z6nhXMp85rIekqnmgvaNI60FS4Hs9MQZWWd/GpG
 Y8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A7ehdCtMc4Dokh7yKMrIrXBT1wjJ61O3UlnfDjSKP7o=;
 b=NFyR0Vr8tn+V/WPiVKYDJh0ZpA6BE39N95DyV91hdKsYXgxz2J38ir++T3osw2ubWt
 Hsct2jJwefn3DuBO1Qu1AkXZPhO9aOooe5g9ObIcojRQEVccHkqEoD7IHfncsx6s0Y25
 r/cM+9OpMBSAWe/mXkVYOV9nT1KCb+v9xno/Ggam0FJyC2dNANCX7CUBG2sE3bKW9xlS
 6l3yNCgUhMmtYjM6gIhDgsM9qPoqBakMi2+Pe77zdp3KsqYKYuLflxCW5OHYzwdks2P0
 Z8LtRIa5dbc1fPVOO+L/UZoufqpy6bMvNDkQ1U+e01GapyntC1HiaZqzDp89Gi52p/g2
 Au2g==
X-Gm-Message-State: AOAM531MVqd12M9dPzdfHz4J/3iMT0ICP0vCdR7rXDQwbtTM5qUuEvKj
 90PeDzmWaKN2UYRxyAjPFnbWanxF88UrhEzmJh3bsA==
X-Google-Smtp-Source: ABdhPJxi7Re63i0BiQqRe+sEg3zPx30neOGH8kZG45E+wyzwbybqS2R/AanN4u+k0MN6eG4Kkxm7/rzHFi7VmUY3Czk=
X-Received: by 2002:a05:6902:510:b0:630:b29f:ce2e with SMTP id
 x16-20020a056902051000b00630b29fce2emr13849570ybs.67.1647281494787; Mon, 14
 Mar 2022 11:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220314135054.25261-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314135054.25261-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:11:23 +0000
Message-ID: <CAFEAcA9srGUm+YNitk7aR6hwzbrjadq_GrxcSX0RycrsoA9K0A@mail.gmail.com>
Subject: Re: [PULL 0/1] I2C patches for 2022-03-14
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 14:11, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit 15df33ceb73cb6bb3c6736cf4d2cff51129ed4=
b4:
>
>   Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20220312-1' in=
to staging (2022-03-13 17:29:18 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/i2c-20220314
>
> for you to fetch changes up to 1cbab82e9d1bdb2c7b9ef46a396fdc03ea3fa04c:
>
>   hw/nvram: at24 return 0xff if 1 byte address (2022-03-14 14:48:35 +0100=
)
>
> ----------------------------------------------------------------
> I2C patch queue
>
> - Fix AT24 EEPROM partial write (Patrick Venture)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

