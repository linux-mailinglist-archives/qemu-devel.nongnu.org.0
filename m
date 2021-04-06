Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A78355133
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:50:36 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTjI3-0003xg-Bn
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjGb-0003LM-St
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:49:05 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTjGM-0005wM-GT
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:49:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id n2so14904936ejy.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9l89O94e5XxYokmPTnjI3FGTeWRxmYILQ1nvY+3lCcc=;
 b=JZp2D851oaFUmOATi8RAltm8hHNjeNVT8yEkbjWhZxiWGCaRhl5re2SmWjgFUe7iSP
 PyIie/8ZCa7UCo/iqTP7pRcKoZ+RZjF0Y3mpTEjpPKTpZuo9vVHpgrkY5bYcJMoRsiBc
 T0wsC+/+gq3htY3yqDp1iwu+NJlej2cg+aDZ07dPG0s0D1QgPWSL9vlU6tZ9jAwGfuDz
 YgvDOws8SaCOcnisqwMTHfn+iew4/VGGUPWs8zBxPGIzCcYhtGAs+CcAeyFqt/eshZ5e
 aOlsjMOtHQrvO26TyUz9VooC4PpP6uDbCditRZygQ6yuUwtGPZ2qvb4tCWdWh/Ht6+SE
 dutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9l89O94e5XxYokmPTnjI3FGTeWRxmYILQ1nvY+3lCcc=;
 b=gjNgLqFT1QvBo8F9bcBj0SH6jdaeivopzOhqYmyMfwwExazI1O+Q/ulSFIJN0MoF7q
 2IYGxBtrY/HABk2HZ8/+Lw/hyYchXcHyrXoO/CfjKAwy5Of9oW7dUhh1tzMA8uYlgkTr
 I9iHN5XOR9EyeZ/9Kc3dAjGaru8qhdZup8qPw1nZBiVTzJBFtlRz6SdFT9d/6RAmlvvL
 mhx1SCv6AbDyT3xnaMrjKqOx0DHUoRPQVmuQ3DGm/8nchmpA7DSR2cFvGO4ZO1XMyM4H
 ve2HSH3thGfHBiPXAiKbjJ4a0qXsoP7nRQjKDMXPRFhgNo6CTO/t+KlCawUV2Tcc3nOA
 QTzg==
X-Gm-Message-State: AOAM530oM01tz5DGTzeyF+HTc9fuxBMGQy3nabt6DJjr61nQ/GWYNLrs
 nJmTusWuCnijqyKj6qI3zBDUn/9zKdGzAqWOlKVX+g==
X-Google-Smtp-Source: ABdhPJzCWCePjOJn6yaCgS294NFyFmgdnl8+3gJdajTE5GebNV5J4kt9XExuq/2GhYyqeMEVi/khxCgUJ/WuB9Hud/s=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr33046810ejh.4.1617706128139; 
 Tue, 06 Apr 2021 03:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <84v98zkb09.wl-Peter.Chubb@data61.csiro.au>
In-Reply-To: <84v98zkb09.wl-Peter.Chubb@data61.csiro.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 10:48:10 +0000
Message-ID: <CAFEAcA8OZy+mMnmQfYPkj-EYbt8_yodaKuOQGGYXDvOPmK5_Tw@mail.gmail.com>
Subject: Re: Remove myself as i.mx31 maintainer
To: "Chubb, Peter (Data61, Eveleigh)" <Peter.Chubb@data61.csiro.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 10:42, Chubb, Peter (Data61, Eveleigh)
<Peter.Chubb@data61.csiro.au> wrote:
>
>
> Remove Peter Chubb as i/MX31 maintainer.
>
> I'm leaving my current job and will no longer have access to the
> hardware to test or maintain this port.
>
> Signed-off-by: Peter Chubb <peter.chubb@data61.csiro.au>


Applied to target-arm.next. Thanks for your work on QEMU !

-- PMM

