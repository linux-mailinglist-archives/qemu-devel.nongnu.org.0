Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103569AF51
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:26:01 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i18dj-0003MB-5W
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Yn-0008Iq-W5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Ym-0002i8-Qs
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:53 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Ym-0002hj-MI
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:52 -0400
Received: by mail-oi1-x242.google.com with SMTP id v12so6829198oic.12
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n86ZofvjgI2NDBcghYkDY3qrSwtaARKFLxtVkXzUqfM=;
 b=Wj6cH2ks8YKPuJAfZurdYQGB1q9GDNq7QCUazQLKh0wfQwHLNa3lAx5LSxdbsbW9tA
 CM8FUVX8e4Mqmb1hc1CXRMJwZHwiGENst8/VX9d4Ga+0yMLFAXZoP5ZJqkv0jxGjnWoe
 ZyAir9wqGW0eGS+fN75xGdetcHNQk9+DgOrcFI0bg2mxTz7PoJqJ5Z9D+ES9bmeaqyW4
 cRBbC61OqiWtdUuCrepeQJfRvI6o86gDJ1vzhEqL+WrCwP1e1cKq3J9k07vTe5KGtAqi
 jgj1+OEie3/sDdE5voArqneC27XeEh8n0n2GLILgad/x0NScFkLMX7Vc+yJi7Xt+z8tk
 sdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n86ZofvjgI2NDBcghYkDY3qrSwtaARKFLxtVkXzUqfM=;
 b=SfZMroePMqcXWAOO6EfwXAtGU4zqZ3lMNd9+5t67qFh2X85EeTeeMe3dAEDQuIrJDB
 q5UJD2okje+tEa/WsWXv41UgUJdBSmkp7OIET1OR3JcNPqOj4hjUwLXOrQ3jzWqCQ3r5
 B6nA1csKoPsnNujpuRVoTW+wMpKGs3k619+LCRAvBOak/gfBdPNPrBnCceLXBKjtJG2G
 T47D1Igto+eQ28lKSFjcqV0Bb1utzYZweNztg1ehqBMMPfGnagVaoledld1K2cMUg4w4
 a4zAHJiSzUmusplISlRQL7bd0zvvlzQZRea3pLacQX2ZPCv1evpAzpvPz5NLwvrYaTFS
 kY3Q==
X-Gm-Message-State: APjAAAXBJudLgCQUdZgN5ZOz+WC4g9Iey6BIlOI+BMuNV/zF0C2bxKIV
 uI2tmUkb91rZJtOX437Ee+ytZj42JuKl0Z/F0a1tlQ==
X-Google-Smtp-Source: APXvYqziCuDhvmrHZ+iWN/t75OPEHkogN4xPeMlOvVGExouEnfzQ+Y52fpKff+6CEq5s63yTfDpUDGyWj7DLV1knRQ4=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr2758395oib.48.1566562852096; 
 Fri, 23 Aug 2019 05:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-10-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:20:41 +0100
Message-ID: <CAFEAcA-2G7yeHh18cmxkOf8mhxFu4C_XUPy5H6hTnvg9Xq4A1w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v2 09/68] target/arm: Convert Halfword
 multiply and multiply accumulate
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 218 +++++++++++++++++++++++------------------
>  target/arm/a32.decode  |  20 ++++
>  target/arm/t32.decode  |  29 ++++++
>  3 files changed, 170 insertions(+), 97 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

