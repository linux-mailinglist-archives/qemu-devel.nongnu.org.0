Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C673955313C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:43:49 +0200 (CEST)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cIO-0007bu-DZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3cGJ-0006uE-Dt
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:41:39 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:34547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3cGH-0001Xn-BM
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:41:39 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-317803b61e5so102337217b3.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQy1JIWh4WPXb2aLzW6Ew09nHheJ1f2EfnQmZWItpgo=;
 b=aNkQd/zbPSQupLSImWbl6kcCEFJCd3/iHqIfcpokGzlroH01nuUWPpVSi37jHVm5xt
 7jVbHOK1mVdGS1ZRlKOUQBShN+v2U1zaDJ5z7wcPgCRlqT0o03MbYk2j0RRaQx0K6v6e
 bB/rEwBNoqfvyMn0v5rg0ibLlsq3tWSHbg6ySWKVbsG+PErCbcvQjrFd3JbIezcXS4Zt
 YnoI/NXTkn1gHFfA1sxmNAzx/6a1hkTcmWDYF5PhTDhiv+4544jVPDb5xbSYNFTQblNU
 Eon2DsT9yM4QPjdSK4H9Kcq1A0LWAZMjQ713PXa//SPk2P45tqXpX1AaMf92avUc/OWw
 jz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQy1JIWh4WPXb2aLzW6Ew09nHheJ1f2EfnQmZWItpgo=;
 b=JVoVoTIISYyBHLQ4jmWep1kN+vAZXsnVg4X0p29hAZIBzzwCzWErRjOGD3gzNQPpZm
 22+l89RKJ7RPtniiq1iKQEMAu/o3BAhmztLYdWhdS5AeUHHEAvZ7Z1BWx22urRu/5MJO
 4VhAvZ/nFZ5UgSlBo57BV54mu8hl8YZ30AN7Jh5iegsbJpTXVHPQd6I1kwGPOApF9uJ1
 YLK6y0P8WYRV7mDpPtzJbYnQTxl1HvQnN6eRWiAKxN4BWXLaaFwmG6nAUeG3lMMeX+j/
 lfdidy+m5P3bSwYY8yqwB3KWfd15C6W6Ay4OY2mSBBef09kykMhM5yCM2F+mP4CWWk1Q
 4dTg==
X-Gm-Message-State: AJIora/PQ6UvMzKzzY41fOH7nC0YLhneVA0qXBMEvUDmV7sGJ3YfzToE
 ieCnbOeuX0PlpWcvxyFvVubRgGpMwXkv7ApEUG+k7Q==
X-Google-Smtp-Source: AGRyM1s2GIIL5Zv5/RpL4oPTCtryBhrYK1c6WrR50x8loCd2AKS4m2i1PXnovGiXsBRU6Hk73tV7hkL/uTqbFOWFf0k=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr17649343ywb.10.1655811695996; Tue, 21
 Jun 2022 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220620192242.70573-1-agraf@csgraf.de>
 <20220620192242.70573-2-agraf@csgraf.de>
In-Reply-To: <20220620192242.70573-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 12:41:25 +0100
Message-ID: <CAFEAcA8=ThZ_texhcH2vqMicpAxOR9G1jtpCyBDbz9gbk5yg=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 20:22, Alexander Graf <agraf@csgraf.de> wrote:
>
> Some features such as running in EL3 or running M profile code are
> incompatible with virtualization as QEMU implements it today. To prevent
> users from picking invalid configurations on other virt solutions like
> Hvf, let's run the same checks there too.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
> Signed-off-by: Alexander Graf <agraf@csgraf.de>


> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>      }
>
> -    if (kvm_enabled()) {
> +    if (!tcg_enabled()) {

I'm a bit surprised we don't need to also have "&& !qtest_enabled()",
but I guess if "make check" works then we're fine :-)

-- PMM

