Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A308C4C94C6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:46:53 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8SS-0005tO-MX
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP8PE-00038r-Vw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:43:33 -0500
Received: from [2607:f8b0:4864:20::b31] (port=38686
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP8PD-0001Yd-D2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:43:32 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u3so29365578ybh.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 11:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QY+1iTTgDHIvzQq2DN6TOBzuFUXRQPNYzvKTrnY7F3Y=;
 b=VcrdhZ0eUpCYDwWHA4grOLHfmTfO96B0xf3+7ithV0/qgkuTH82Gc2gD3yBCPhASKs
 yahuR6QYf2wZu+1VW2Eh2jzlED35JNNeTVFJI3yFvwyYrXML4mbTe3Glofnhi4OB24Cs
 Ul9j+gMgVwSWECT01V0BvKx+QnzDUQP5OpPTUMRgTd4HCST3O4bYTIhQFou8Rgy1Km3C
 saBHCYs0hRDV8c2HsgZspzpbUGnyyULkfSGtfJkvrkHjopAZwS6DG/sOqqBx1pzNWqax
 4iVeLj5n3GyXQi+0DEcEcTzmQ4YqqVESOpds5sVXycb+0jPbKokad6UBpSdXuomogwhn
 Ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QY+1iTTgDHIvzQq2DN6TOBzuFUXRQPNYzvKTrnY7F3Y=;
 b=nKRLXlX8AdeNxWpXJ5ra/Zj1atY/veVuARoFv2Fbj48nS1FtcxmpVAEZrIuS6eFclS
 Z7xOMJTAdrceZjYHA1zYp4NQOiBsSfLt9GhwqdX9pxR2/OaxDvwd78DbZz/jL5hlRdId
 /kDdu9RXC2NdT53mZV8zqeLK0gofU8hDRCl2Xu/jmANAhis5p44IxKFl5PngaqaXObaM
 rgsnwpRIx2XG90L7f3XxQfvTVXzwJYqt08mYZSP8doI8R9+RKGvR0xIpTXZUv9A5wZzi
 9HkYP+/X+57zFIFOGATA9HDCknDuBJQK8CVkqB4lo9FE0Vpodi34n5hSiVQoloCoQQxN
 PcSA==
X-Gm-Message-State: AOAM533Sz5zNFMmzZWTrxnp+mnnG1BjD3Y5Xehm5RuY/5K03Z3UQmji1
 JOVI5wMGms+fZV6Fx2tE2+QsR1bWA/+5X+6ZoZCwhg==
X-Google-Smtp-Source: ABdhPJwWLnK450EqZYLR06taVJYapcrF7vtUFLV5tf5Wbrre9Iym0wg0T/klfxezNQ5BI6HS1eGnYcRzXgPRyJOs4dY=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr2943902ybp.39.1646163810231; Tue, 01
 Mar 2022 11:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20220228180918.38188-1-richard.henderson@linaro.org>
In-Reply-To: <20220228180918.38188-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 19:43:19 +0000
Message-ID: <CAFEAcA_vAEwKTvY3Q4WwoH0PYvK_XbSi1yAzG4M_Bs7seFpxww@mail.gmail.com>
Subject: Re: [PULL 0/3] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 18:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 00483d386901173e84c7965f9f0d678791a75e01:
>
>   Merge remote-tracking branch 'remotes/shorne/tags/or1k-pull-request' into staging (2022-02-28 11:27:16 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220228
>
> for you to fetch changes up to 2ccf40f00e3f29d85d4ff48a9a98870059002290:
>
>   tcg/tci: Use tcg_out_ldst in tcg_out_st (2022-02-28 08:04:10 -1000)
>
> ----------------------------------------------------------------
> Fix typecode generation for tcg helpers
> Fix single stepping into interrupt handlers
> Fix out-of-range offsets for stores in TCI
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

