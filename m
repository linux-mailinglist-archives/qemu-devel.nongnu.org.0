Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381D5BEC9F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:14:56 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahlm-0007TR-Uz
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeH2-0000K2-FU
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:30:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeH1-0006Zk-0z
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:30:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y17so6637629ejo.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=AUmvu7vrC9ryCBmL/ivn9kK7tghWXrI7/qQgwoyYW+4=;
 b=hq9b3ZOdv2IobvBGdmQfpCooB4dMqVATmpi4c0JFXF7hzqRu5Q2yljB9ajFwR1MkNt
 EFUOVX0VD7Yz3LlUDPbuuBbp1sEq4cA9O+B54tih8HvBqgXfJCek49PAzk/Uu5DGxzdy
 Q3nazI8CHvKntQswhN3zX4fMS++3CwD1XThK2drBx+iPaCC8TyXki7O9Bh2HcCaNFKKa
 3Ht7nI5o3MLS1c865gfZrTZYClQNcPwCSKno7TFv8okZ9rYHHxWge3c9oV8AmAQyAD8G
 p65apSn2XeXK8h0agDUpnqKJZbWDaoi70CBshuHnZ47C9KTnKBiVIEaqC7oMRrDxrtL0
 SiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AUmvu7vrC9ryCBmL/ivn9kK7tghWXrI7/qQgwoyYW+4=;
 b=4kFk1r+SzXHMll2xCDN/CRtgJadEzaCXmu5dSYWnLm1DhTfg0OCpVPM6Zd98D5W5pL
 gqcxPMfHTPRJ+QNXFCepdw598eEuq3gSTAGo5YQShhO9FPwWvd9gYbjHGBnykbdCHPm2
 8RwoZuB5PeW8RxpDwcIP/RszLvH+J6C4YUzWu1b9cWQlfTBt6ayX5ZdQJ2dZXNFvrjFk
 3pkAAP7n5bJAGwAOaKsrXU8vL46r1XHX4RF+a1kFRRiSbIcXEU3RHLPgzVHs0O9CPYZB
 GHTGEDVfYKdbrYtobl8QpRQK7slRrdZQkx5c91YYuIthWGrFo2iNHVQu0CeHbgX0ykJU
 J94w==
X-Gm-Message-State: ACrzQf09XHsu+rU9kHamyzxv+lypz2ITEPFiiDDwOs8pz+ewRWJFthla
 jGxMKicuJMFDMnfbiozFrnHm5UHxt7H0wb5/y8fW1Q==
X-Google-Smtp-Source: AMsMyM4op3tl8si2YWF4SxWucZ5DfGFi0Tji99P13wo1d2+T++5AOvh5wsOcMuXEd0J3bp2FGmZRgJjkEoauUZSah/o=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr16499608ejb.609.1663684252075; Tue, 20
 Sep 2022 07:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-10-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:30:38 +0100
Message-ID: <CAFEAcA-LSq1TC2OuLnDdR1+Md81hiuR6gF7MQEc5hCAO3jScSw@mail.gmail.com>
Subject: Re: [PATCH v2 09/66] target/arm: Use GetPhysAddrResult in
 pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 16:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

