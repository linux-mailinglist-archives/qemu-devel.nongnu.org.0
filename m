Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F31DD2D3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:09:51 +0200 (CEST)
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbnlW-0000I1-O0
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnkL-00074m-A2
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:08:37 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnkJ-0006c1-Fq
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:08:37 -0400
Received: by mail-oi1-x241.google.com with SMTP id r25so6659165oij.4
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IOLhARJ1tgt+Qu6q4i7HRkc7EUqe7jOLcBJP52QCNTE=;
 b=fnbbSfyalB8AL4UEc9tN2OhQPNYiYnSOqp4IdTddT/GPQdxycKD/wBlDq8dQj15l1c
 HgvG9d9a+zb9nm5tirQhEZctGAZyBpNcbYud4CmZq8iVyo0cjUBA9SXVeZRl8dQY/WN8
 SYKJ0Hg24jVIYIs0ag9ssIx3BD7eiHw6A6VKKUeyr8oj7UgQrCy5QVqwq4lIwPES93eG
 NJ3Zmmj9Jsw9XYCrw0OHrk/h7VgB9NMRBRB9IXJwTbjMsoM/YrG9UtIJGTdbzNbpwqi9
 3vZQQk7mpdX1ypyDuqWErwT6VXv1VDrJcvc9lB8lZgZc3SA/an7eOyfqhjGcgEZh68JF
 vf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IOLhARJ1tgt+Qu6q4i7HRkc7EUqe7jOLcBJP52QCNTE=;
 b=AndD8fey3vpIeAkp9PijVai0Xp8eNUKskze+TRj6ST7pE4/jw2T9ySh8vdU2COQPQi
 VPQA8soYGrNofke4NVbq65VJU/NQA2gb41xkslmr9T2ofY4wwVAkbSmzDwAPEAXTfdUD
 GjFDstaWUayxXH83qBt8F/v/6e1nBRPkL3lvd4HqFTFuLNgyK5RB4qVUNgCV+W29HBSv
 +WHA3uA+fTNfT6b49CL18NKNNIjwxQsFRc0o8NtHKWlNLs7qqx5fBEv+StqhVdmRG8i1
 1akQeT+BPuX3rhq0ZQYJDGA4uZHFAxWydsxZPPxxxykczPIo/uxa2Xy2CXEcET4O2qNd
 33eA==
X-Gm-Message-State: AOAM532/zBSGH8wOO02ZxjDy3CovLIuRhBzdEIp4GNxjrjHBrO/kk/Sa
 gqgcsq4iJAiuAZkEAK3ySVv8P1JkwMPYpjgdvveY1g==
X-Google-Smtp-Source: ABdhPJyTiIkkl11m6LFZrzAa+d2w45fJfTClLk0nyLB12E6MaaP7Ue6mzcg4dFiGXBRiXy2dSuHLk7kU0wZ7jca9XYc=
X-Received: by 2002:aca:eb96:: with SMTP id j144mr6697722oih.48.1590077314309; 
 Thu, 21 May 2020 09:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200519085143.1376-1-geert+renesas@glider.be>
In-Reply-To: <20200519085143.1376-1-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:08:23 +0100
Message-ID: <CAFEAcA-BR=jHHLfvsy2CbUA1v+P1_5sOrkHnms_CCyMscppPVg@mail.gmail.com>
Subject: Re: [PATCH] ARM: PL061: Introduce N_GPIOS
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 May 2020 at 09:51, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add a definition for the number of GPIO lines controlled by a PL061
> instance, and use it instead of the hardcoded magic value 8.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  hw/gpio/pl061.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

