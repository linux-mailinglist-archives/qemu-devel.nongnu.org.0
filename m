Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A297D3C6BCE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:57:50 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3DIa-00063K-Ia
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3DHU-0004ur-66
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:56:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3DHS-0000KU-DU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:56:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id l1so10148159edr.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uqA9yD6mqgaSCjVIClvHKPuQ7/otlm+gzbKwq4E/6J4=;
 b=U3XhJxlCTwfDLcvqbScH/apv2P5N+fGKvIuqf+vVp3IdMhHhXkG+VXiC0h5S6NHGRA
 GLb0BLS+UnaHKEtALCSDfndtGb/MaaoBEE0vB1rnjDAIbUTArAFYFAtaep7xqqz9tQfK
 S4rExSxdOYuGorWRjO9kLBeE9NGuk8hrCLCBO1saV3vsEltYkdagoqQQ22DtHaRE/VFa
 52FSNu/Cleqx5T6HlU82qf04214r2uCGbIIilOoXxgzrDv+ohjfpjcTHtXq0evKniA+p
 ++NVTDLehNZr7iMbbsYmFYsHZnyLAb8hpNnZ/NEONPJUJYWTR4vWLOm1H3Pl5TQgXqXT
 LByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uqA9yD6mqgaSCjVIClvHKPuQ7/otlm+gzbKwq4E/6J4=;
 b=jeF6r4Zpi7H04SIsLSB7C8DNKhW84yCch28qqc7YxTrba+GdxpFucCHEBWqdirJx7D
 nbUEa8HiKxWIU23mGMvBMVbSGkhPqp1Jk9g40ijOb3Xtca/WG0buN8WwBWwIPtlX3UOB
 guwJg12k2Nh0KXFdH37vlTeR0bIo1i1nVGx4E7FWIQUP6rStVEVHhvjt1dgd/rfjTCWB
 Nn+KmCaUrODhQG/rl8QzpPHsxU/3TOCZyCCq6Nna51PM4VtCKj0YdztuS+R8lF2JBpvu
 Zdq4024LKQx6l83vK3LMFy9c47UqvV5+rBWgp02+Jllwlq0bn5NbALYm5yYlWMBFUcMd
 ZD6Q==
X-Gm-Message-State: AOAM5308Jd/RxZrnRwt7wxw2X6XLtZAnJcZQujqnTN/QvYv1/PNm2X5H
 pxgPbfjz0HGIleGArdwlw2Gp/1Cobz4TxKC3o8lQVQ==
X-Google-Smtp-Source: ABdhPJx51u33uJ+SgaPQ5lZ82a0ZuNQdKh4hif5D0yhYlq99yEzCK7fpFohvpSn3XgLniJBJ4JssY36iJfNYBnZd7Ig=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr4003833eds.204.1626162995752; 
 Tue, 13 Jul 2021 00:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210712102846.2783382-1-f4bug@amsat.org>
In-Reply-To: <20210712102846.2783382-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 08:55:56 +0100
Message-ID: <CAFEAcA8noPkByvvKFfX_-RBZTK_xtZ19OqW7RQ1sRMvXYqB1+w@mail.gmail.com>
Subject: Re: [PULL 0/3] SD/MMC patches for 2021-07-12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 11:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit d1987c8114921eb30859854de664f879b5626d=
a7:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-07-11 22:20:51 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/sdmmc-20210712
>
> for you to fetch changes up to 59b63d78be1f67c87b79331dcc825e485efd3bcf:
>
>   hw/sd/sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30) =
(2021-07-12 12:27:38 +0200)
>
> ----------------------------------------------------------------
> SD/MMC patches queue
>
> - sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

