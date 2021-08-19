Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF43F1981
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:35:15 +0200 (CEST)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhGL-0002Xw-RP
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhE0-0001Ys-Cp
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:32:48 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhDy-0003El-Od
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:32:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id d11so12552938eja.8
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PdEqVwiOUrR2OxTB7UVLjUUjHayH7DXX5FSPQbzbmk0=;
 b=Hqm5nt/Av0YMgRwQbj/nC3b/U3CwjvWgnJ621IxW03oUPt5gw14Q6o8Ou4wbwZcLHR
 zy3UN/GKxCn12ttOyInzrfFiUKN7Ltw2vdTRlRaTxkDAu53oSxxRUeZ3/RqysBfIiHYL
 Os51MWVbhAQU2yvzqGAZNkLKPVUpQozsh9RQtEJy2AwfVEh6fKXJOj9A9oMWWc++/ySJ
 hRpQfUBg1CXXd4ZclTSHgEUnFJ/NN+XC89defBGpTwXetF8G1koAq14KWhaqKSrXKI+K
 5iuQUWXqfb+m08u6M4jq9ejCrzsWjZREFWMfdnItd0JIYdnIpaNGOJeBEFNWpbn/7wSv
 5HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PdEqVwiOUrR2OxTB7UVLjUUjHayH7DXX5FSPQbzbmk0=;
 b=YGB7EpYJ4H4Sh+SbPralo3cjd2q0BTX7Jw8jUIxRvrgFJzycUrW+YsZiJfSNXYGUm5
 0FTuHj8tQAauZ43v+XyLdT9fo0PV1REJiM8bl/czrV0A9kyK1wfGEqDzJkOzknfRAVEM
 fnt1f3mqUbGW6QA9GRv9FRGg7RMkQHX35/3hCUv6IATUpWu8DjmOWCA0Vjm+1TUchiLp
 l/6YFl+juhaGPf392utt4l0rtuUbZmSkv1SjKtf6BYZIOzlEmu3uy293sCTINGtc8c8B
 465a8speL6BintoYDLi42yagjoyss4hKJgJeMxUhIuVxIOsXnaXgb6+31JS4JUIMb3l7
 4dbA==
X-Gm-Message-State: AOAM532SZZmAORr0MjIe19F8VQS/PaQUpm+7wWVuhKlYecGl3v50saVJ
 d6Gd/44I611MrSk5K6JE1mNrE7TzLDfd2348NJsF+Q==
X-Google-Smtp-Source: ABdhPJw8hZdWw22rX9D5fbfAy2jr5g7ix3cbpq4fL7SwFatbBnCf2cyldidnH/8WVIjn9k5So3JTX80rFrNSqie5wzA=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15420135ejy.407.1629376365013; 
 Thu, 19 Aug 2021 05:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 13:31:58 +0100
Message-ID: <CAFEAcA8pWb4v-ZhaY27k3vGmMnUZ_o1eEHpvQDSMBq=JUGZ0xQ@mail.gmail.com>
Subject: Re: [PATCH v5] hw/dma/pl330: Add memory region to replace default
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 11:17, Wen, Jianxian
<Jianxian.Wen@verisilicon.com> wrote:
>
> Add property memory region which can connect with IOMMU region to support SMMU translate.
>
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---



Applied to target-arm.next for 6.2, thanks.

-- PMM

