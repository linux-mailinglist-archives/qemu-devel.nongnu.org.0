Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89E23BF73
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 20:47:09 +0200 (CEST)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k31xr-00021k-L7
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 14:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k31wx-0001Zm-C8
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 14:46:11 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:38240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k31wv-00024F-FV
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 14:46:10 -0400
Received: by mail-ot1-x335.google.com with SMTP id q9so15695422oth.5
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=R5+FiZJSyVnatRGNzlmk/8rLD1RDmfx1UXpYRxfe9d4=;
 b=k/QcU+wibfzxrpAmqRDCx9OVAz9+B6M7bk1Sh6zQYwDDir+oyZuztyXh8Ka85JdFbd
 E7snghccahwd3qO8Rwmc8axtFJYFkSfLiW25jy24tH2CNhlcfZXokbDB+IpUBiv+kgtt
 ZlQ6t31c2RgBT/u2HLrJ7TlmkJZ6kGXz0WjUCLft9yoYJ3L1/+YtRIfP0j0Q11dv3WAl
 u7cS+T5mzqAXuzbDiR0mLcAlice9rIWje+lQwpxGa5I/uLkC7TEet7//gzlDp981n494
 jucNRgF0mvnNPqmxUTwUuRW37v1bcTJtLAOV+chwUbH01BV0dDD6l54U7oxgp1dPwvME
 Ox/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=R5+FiZJSyVnatRGNzlmk/8rLD1RDmfx1UXpYRxfe9d4=;
 b=dRPkG7Vd0o92HDCbxH5199hjJ2/VjqihGfQOeM3HSjI2BWUh34EtFxOdqasBUEb0Hy
 QiC4bIi5cXmHj2aPX3agv8HHBBh5nTkcbU7q3prUY0F3tRDyR/OMQU7FPQNIBfCQ67C2
 KRk5wPfranexhstXygpaFdfxIQxaM3fjd+p+PRyBCMzOSm8U1W6SU0bW/o+oNYcIQPaw
 WNqRBCfZtb4sANS2a1sqG0wNqMf9G4IJMoHeDSqseJ0iqAYlcJhgej44Ro3k0sp1w3HH
 bI2fEnhi+AYL2497AXHMH4e8/0/o/pBGlfKRDNmQAcdSADJdMQe8i4TetIy3whRsChz/
 PlkQ==
X-Gm-Message-State: AOAM532wQE7xUil5WgXpN045GrZEicz0GzKuXuyuR3K5Mbh1d5NcYT4C
 7BUSYQpZvtUqNmbkL9ySsM4UOVAmRnbTbXz02rs14zu3HpI=
X-Google-Smtp-Source: ABdhPJymn0hDpsMNYp3PnJGcGIxyAQjkTOD1H63YbP6blzKo7S5/F+uNm8/tpxTBAiaL0hbNeCh9YD/Z714F8ofCJ7U=
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr19592226otb.135.1596566767969; 
 Tue, 04 Aug 2020 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200804160843.30245-1-peter.maydell@linaro.org>
In-Reply-To: <20200804160843.30245-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2020 19:45:56 +0100
Message-ID: <CAFEAcA_WXsTDs3n_H9L-fY4jE6iqUbMgOZqnDQcjP61azuFxzA@mail.gmail.com>
Subject: Re: [PULL 0/2] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Aug 2020 at 17:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Couple of last-minute things for rc3...
>
> -- PMM
>
> The following changes since commit d15532d91be177e7528310e0110e39f915779a99:
>
>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20200804' into staging (2020-08-04 11:53:20 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200804
>
> for you to fetch changes up to d250bb19ced3b702c7c37731855f6876d0cc7995:
>
>   target/arm: Fix decode of LDRA[AB] instructions (2020-08-04 16:40:19 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Fix decode of LDRA[AB] instructions
>  * docs/devel: Document decodetree no-overlap groups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

