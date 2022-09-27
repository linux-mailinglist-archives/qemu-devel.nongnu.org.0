Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C85EC466
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:27:29 +0200 (CEST)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAcS-00043U-MS
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8nX-0003Q5-Nm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:30:55 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8nO-0002Lu-KI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:30:41 -0400
Received: by mail-ej1-x631.google.com with SMTP id sb3so19982335ejb.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=p5xB8UromlejGrqdx5oSXIOZz4Pw0Ay2LHwSmOVYuuo=;
 b=xLp/NC5TWD1cxArYsggRc4sSaJd2IxhdORIavQjEBwLaP9uwwTskscoRc7Tnw/X42R
 21yxK0PQzsxYbIQwn5HUB9KEqOPrA6STr1fnooOt3e3CCs6pI40Ny3NSxFwUSmXIvA4u
 y7jbRCT24VXsA5Z6KDwGXqsVYr8roIMLIOPkvS8JH8+cI/JTatOAAjn5oABIXJSnABx0
 OT7R2jf3b8FCh73gXph4lyN5GX1Uc+krZuU6dE7kK292bC5CInQi+PLYU/M58woO3RWO
 OAnAkuadYOmxxFaGUWdQWh0GOESjGaUDkGerJ9DTu3MWTAj5CpFglmTmwCa273wORtHj
 Ymrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p5xB8UromlejGrqdx5oSXIOZz4Pw0Ay2LHwSmOVYuuo=;
 b=mR+FJb/NDMW0vb/5B2dCOJf9ugYovrnvUpXawXF1VPOF2rn+v5F3kPGLqA5B8vKgl6
 blfmUWeLiroWNjGktp2Rnr1PLlvIjTr7g0uudrjlmSrUDLWB3LonLKAnLiqg+Z9Goh2Q
 ZjBu+l66cLv+ScQweJFDCV+vySuuT3sOCHHFUTjGNjbFWsbAcL4BK7bqKDDq4noft+t4
 0+7U15E2ukeku5LxiOdL7mK2CXMnJWbG0k1bs2woKRWEoilcFe00LbBrM5bKXTwR4NXL
 cfM7o09d36CN++Xmptj0SN8nt9+9RWvYMyYxZZhlFzMXkLcV7Rl2YRzuYHt6J6NBAjIT
 Z5Dg==
X-Gm-Message-State: ACrzQf1ZUyjau+hiSLjfWH8+IZMNpAUF/D0JFlxSs/xe1NdXdzB1ahzz
 u6f0aBmeN7Q/kiTTGNZZLMMYzvNCJL9ssMxanLR9Iz+zpHc=
X-Google-Smtp-Source: AMsMyM5xwOVlIX2TzkSgJxPA7Stm3X3oX1gPDHj3IWnvWIg08fDepADhcukbeuN7SrdQp91GWXFeqwzRQ/ChXuROVY4=
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr14095024ejc.555.1664278225196; Tue, 27
 Sep 2022 04:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-2-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:30:14 +0100
Message-ID: <CAFEAcA9e_5jO-HMgy3XbTEW3jG1WRJyb+OmPR4V=R6b=2knCXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/arm/virt: Fix devicetree warning about the root
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The devicetree specification requires a 'model' property in the root
> node. Fix the corresponding dt-validate warning:
>
>   /: 'model' is a required property
>   From schema: dtschema/schemas/root-node.yaml
>
> Use the same name for model as for compatible. The specification
> recommends that 'compatible' follows the format 'manufacturer,model' and
> 'model' follows the format 'manufacturer,model-number'. Since our
> 'compatible' doesn't observe this, 'model' doesn't really need to
> either.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

