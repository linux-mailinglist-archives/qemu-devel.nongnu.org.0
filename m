Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739C6EA9B9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:55:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppLu-00070y-I8; Fri, 21 Apr 2023 07:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pppLl-0006wU-V3
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:54:51 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pppLk-00041T-Dc
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:54:49 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5066ce4f725so2240469a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 04:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682078086; x=1684670086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yepHUzTuFqL58fI/+c8zlcPcCWo9u4xZkRuZuyr7G3Y=;
 b=CEXKcL4vrom830eDp1Q5NdtEa7kzhYJhHvxwXVfI3t3KnW0j/Dng/ARrN2YtBWwT+x
 kDuCIrDNavKGcbZwuYlcOXyJwbjuIdJD/fSn7j8BAn90gH8DCN+s3pZg7Ni1Lq+fpFDV
 EwbI/wbL9CzPGKusxfNZlHMCiwDx9ypZGRE/8OavEj+nVaReWNUqDAO2/ZOUsaPkCe0b
 mPNXeSBm73flxWjLORV9j5iydtyNLc9cPjwi8nPAGmEIPu6EzUipvk38fCcaevrHxVX5
 EHD/d5vdmUACqJ1qulwwOXzZ+9i6JJQ9wMUJwZsIiL0HgUhRaLLxr0PFLD/DQ+I8o2qx
 htHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682078086; x=1684670086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yepHUzTuFqL58fI/+c8zlcPcCWo9u4xZkRuZuyr7G3Y=;
 b=Pcw38+PGms/09GfiiVj1H8MSWA592MarvVnbLu0Yqk/OwyI5vkBGEkcoX7J7PfMZDa
 SUQzc0RkZLPSbDCLhy5vCxVO3N2oNaLoGB/L6ObrVfRGk2YRcQAJhEWb1cYy8CvJk+Ah
 FwMrxG1WoBgw2Gr+iDaldqz6h+iOleQTyJrPzbPZlEUx6ez11Idat15I1HN+EJ7B5nf2
 jsFdIlJ2HIwqixpgcjesy632RfW2WnwbKaQr/A67IpuFXFKh2MHPCPItF89zsfY0BwUe
 F7snDeHd1U04uZHcCppTxsfu4PMpvQTqRi7HTbQbzWJ25MzSZooy3p+QcHy+2mvgQ7OM
 tbOQ==
X-Gm-Message-State: AAQBX9dzmZcNGyJhs9VnHH2HjDezwwZNzySkZsMy285yWrmaYwqVmpFM
 56LofP7qvLRixGSCSjT62/RguLry69DuvmABH74c3w==
X-Google-Smtp-Source: AKy350ajo9ABC6toJRiCJsxSuwVnTOszx8IQqu6uETdmZ8f7qEafKdNFiTeOg02LBuWUImIm4Zrue7fPVhODj4ne+b0=
X-Received: by 2002:a05:6402:1849:b0:506:7d34:51d1 with SMTP id
 v9-20020a056402184900b005067d3451d1mr4942327edy.29.1682078086430; Fri, 21 Apr
 2023 04:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100456.944969-1-peter.maydell@linaro.org>
 <6d9eaf4c-43ce-ebad-f504-8736247bca03@linaro.org>
In-Reply-To: <6d9eaf4c-43ce-ebad-f504-8736247bca03@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2023 12:54:35 +0100
Message-ID: <CAFEAcA-n5d0tyESWDSzDk2Lnzx2cT5zbWFY1Uvqx5NH=eBp96w@mail.gmail.com>
Subject: Re: [PULL 00/21] target-arm queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 21 Apr 2023 at 11:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.

8.1 :-)  (I created the 8.1 page yesterday.)

-- PMM

