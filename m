Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D331FD29
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:34:32 +0100 (CET)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8jf-000510-Ag
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD8cB-000077-Cl
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:26:49 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD8c7-0003fE-Rm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:26:47 -0500
Received: by mail-ej1-x635.google.com with SMTP id g5so14559123ejt.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 08:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=oKDnn+jLeg24sDP8O+PhOvBn4odIv6Y3WuoG7+heXKc=;
 b=PVANsthaRKrkVDyQKBEnIVDkWGndhR0p/0z83zNh94BqIi/1ej8ezfps7/FhH771NZ
 dUxuMVGmvdXV8MIPstvkpFk+/juxBprl/5BljEBgC0lrB2Tb1Vp+X8FFoBnESa5+jiCx
 EISO7jbGVJpOrFpFN+AYwqSdEhkVJQWOhdudcyIcID6GYqTwZzq2dbkL3IoeHzBTcS1/
 cxSbcvo7cgYscPdwh+7k9TuVmeWlhdOnHYodM/kEQG7zXWtVlq4MxL6rnmshiZhjDfrA
 glJeUxqg6bX04zf3dF6l/mNaK4UBexutD5p5XOUf02Ao5yklOenbo9ctR8kjugv7RFzv
 gYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oKDnn+jLeg24sDP8O+PhOvBn4odIv6Y3WuoG7+heXKc=;
 b=KlGLyVO+9PchnqX96AQxj+48jwnHfMbbx5ZXc5pyCTVDX8AHgZ7AZ1Wh3YE2FlNfYY
 LathY9b8FAj8e9IkkJW8i3ukUJUOvel+iLiEILDQRzcWgEQRHKRbFGoAyj54BD++kPNQ
 eN9vkXXFwHZZbPzVbNwQhWPK+aqrrmGsOI0XxkR5FIWjPPaIIrTnxiLQ6h17mrTCxbp7
 fHobIXN9xdG519/5fZMLs7lCAn5SkmwRbrI1UqumQ+om+Ju/3oUE4NMcOolF/SBB1sv3
 N92xjTkl8fKqPHRHu6gYjUnDsm8P4kv0QX26ouaHwAskPEUa35FvDypqtJ0EBcAtpbHF
 avrA==
X-Gm-Message-State: AOAM533Mt76ZLS1KtWBQi/qMgx637n+QF5F0AGbybuEMS7EDyGTkbsop
 m+Xk3J7qO7FOPYihYzdKZhx+igdmO1g9+rSvJdm2srSlVaUoGg==
X-Google-Smtp-Source: ABdhPJzcoe1JYmQTEvRMzj+vsWa8TsT1+1tLmH0H/YMCfngUYlfletbLEyR7Lh2eHqbSrbrPiBnRImdPOiYqxflu1qY=
X-Received: by 2002:a17:906:71c7:: with SMTP id
 i7mr1373822ejk.401.1613752001659; 
 Fri, 19 Feb 2021 08:26:41 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 16:26:30 +0000
Message-ID: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
Subject: who's using the ozlabs patchwork install for QEMU patches ?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does anybody use the ozlabs patchwork install for QEMU patches,
either occasionally or on a regular basis ?
http://patchwork.ozlabs.org/project/qemu-devel/list/
The admins for that system are trying to identify which of
the various projects are really using their patchwork instances,
so I figured I'd do a quick survey here. We don't use it
as an official project tool but it's certainly possible to
use it as an individual developer in one way or another.

(Personally I am in the "occasionally it's useful for finding
a patch which didn't get archived by patchew or the 'patches'
tool for some reason" camp at the moment.)

thanks
-- PMM

