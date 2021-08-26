Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923093F889E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:17:14 +0200 (CEST)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFFf-0003fB-LA
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFB2-00070N-3K
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:12:17 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFAu-0001M4-Jg
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:12:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id t19so6159058ejr.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nbPu9DGisTP+SE3Z4+DJsnrdm3p7G5ilXm8+zrRk0/s=;
 b=tu2xEYFRV1l6SliNxGF6Shp2+4yHwlz6a4KKJf44f0DzJELzxkdmDNkoP20k4+hZMd
 EoHbaQ2qjpU33EpNglyygjcWUIXSX1s2CKBZPCmaODpuSMqSDgUKKneWOyL/YRmEBp60
 jOml6ModU3POoUxasjzt/uJ9SkhioZHQ8cuF9lt+ghVCMt564fDo8tWW+64B8VfY0RwQ
 ijdUynBEbf2lACKxWOMgyGgeGgEOKaMNJpSMrlPqLjsCJZ22tXUPSbXEsR5xr07MV+bU
 wElmo1VgIIHZcO9bFUtxmKY20Q7h+mQ7Fs9wq1Bw8Kmd2+B/pGXYGF71p4KLxocNYHeS
 yrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nbPu9DGisTP+SE3Z4+DJsnrdm3p7G5ilXm8+zrRk0/s=;
 b=Ghb0LjnvEUXSXpPXhJSYZ1d6HvriRRha3UTjoX2Jkge2JU6pp9FghGrLtBdRfoRgzc
 dUQRHwDnIEJDdmMmfA8mOTjBkTJzCCFzxDPgYi98mMPKN/UddGswPrhcrg7EMZFFQq78
 Qdf8m4vuPhwVZsLcTEId5Clho3vzDcwCk/ddbTQ7vq0kBt5vEv/QnzDIBpEkgYy2ty8g
 Ikuv1Po2KUCELekNPm0taxA3ATHNEtGUt7kp++mbNvLtgm1w67NhuYG/fq5XClV7t0t7
 2QCw0VPSHtRXMHXkGR1zKa8aQUJGGpYpiCMc91YGOV6UcxHLtmLCN0mOhBLVwiQJ9062
 xtew==
X-Gm-Message-State: AOAM532rofDSrrMsozymwX8/Lq8I/nVmATY7ETblLMYFg5Rci5cWAlTi
 +5ttoebm5NTkltIFmMAy7k7HA2CIbz9uB7mAJYN3zw==
X-Google-Smtp-Source: ABdhPJwiyfgvtucjWLqtwMcYzn2NUw/55UyXczMrqcYNBq0Cqzmm7CODo+zDZxsjVfrm9UHna/t9fP6zpvmiDAUauXU=
X-Received: by 2002:a17:906:3497:: with SMTP id
 g23mr4256663ejb.85.1629983526910; 
 Thu, 26 Aug 2021 06:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
 <20210824201105.2303789-2-matheus.ferst@eldorado.org.br>
In-Reply-To: <20210824201105.2303789-2-matheus.ferst@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:11:19 +0100
Message-ID: <CAFEAcA-_=BYkEPpARFpieTUfEVVQq+yEQYDBvsjm5uGZUmVn7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] include/qemu/int128.h: define struct Int128 according
 to the host endianness
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 21:12, <matheus.ferst@eldorado.org.br> wrote:
>
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

