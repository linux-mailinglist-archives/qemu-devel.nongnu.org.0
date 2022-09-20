Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF05BECC2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:27:32 +0200 (CEST)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahxz-0007BY-PV
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeEZ-0006CG-Eu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:28:23 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeEX-00061a-Im
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:28:23 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so4082654ede.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=B3AHyNWscnobqmFFoD6C1ouVzEGOp3H0F8qEibjy7qQ=;
 b=HGOwGJDVhrbfNkbD4ga6uguXF2J38aQB3Js2qRuoOdcDy6qAu3t4e4d5FM3TBjb2n+
 4d5kA12YiXCvyHWTFH5P3o7V4TyvThNQACYrbAQy+mSTw1LxkYbopOyOAlKfs8QnELBA
 0cX/rMECt6nTrcVGI176HQ8x91jP6n5Dz9S8wSIllV+GFiPOMxeKJWB2y8rACbZ/SEgN
 fFlmt5eJXUZBiRghBak+A99+ja70GxdqOIOKehebZasmt8P7CUfkCpjOH/SbCNahbHKi
 3WUmlGDnI0or7MyY7FEcRVxl3J/+e4px7NPYlGS6wV4etxbKLRAi8G4nr/H+opaNv1eL
 F8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B3AHyNWscnobqmFFoD6C1ouVzEGOp3H0F8qEibjy7qQ=;
 b=VGJ5NMe21LhVBIZ94y8PxMhHSfrEJVMyoIel4Z8nlsfSOi6hp70ihJOWMWxVR7r8Oa
 UK7wjpa3KzzFi9VPtX3tVZfQynGYxKZOCe6dEr+FE4odk7PhPyFVmexfxdCcybj1CmJR
 yBwzds4RthEfhH5HaFWhMT2CfAZhU4JIu73WXkJsXyz9N9xe4afahBdqXPO0MJU1FAye
 DPvL14r7J3ktmzCpMlCsW5In9ZkwjfaTQQiqNpC5qFUBfTCxH8Vhfir1xUxH1sqccqsB
 2BDzRLpO8zqfrbt/ulWg4G6Da+XxuynxxRCxsJkL4kfF/KOmIvLBCyt3O38nSoIzKDCK
 rCAQ==
X-Gm-Message-State: ACrzQf1Px6zWi1lHUzk27h1pBNMOGX37XU2FYbuVGdmntmw7Su40KBMJ
 +mmEQLHtHyDhOxPXAFN7x8JwsAi+l9tLwj5GLYTTVQ==
X-Google-Smtp-Source: AMsMyM4A87S6HAZWTOE2PbzksqhHKzseJeWjsXFWmgdYOC6VPl4jSLnnW65u7XOu307L3YpPQLWcDvJywlmhPr4Wh/4=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20055453edq.140.1663684100175; Tue, 20
 Sep 2022 07:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-9-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:28:07 +0100
Message-ID: <CAFEAcA8ec=XrjGQMpA1NUDY=zxjo140BMiCMFCwqEFweH8vwcw@mail.gmail.com>
Subject: Re: [PATCH v2 08/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Mon, 22 Aug 2022 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

