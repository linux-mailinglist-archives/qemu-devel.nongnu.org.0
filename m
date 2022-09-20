Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD7F5BECE8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:37:40 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oai7m-0004jh-8t
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeSn-00048H-8o
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:43:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeSl-0000Lj-NA
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:43:04 -0400
Received: by mail-ed1-x52c.google.com with SMTP id e17so4180066edc.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Ngt79zf5xbmNIbScywJt3+l5xJho6+RqjbbqkB16kZ4=;
 b=lYtj2Lfm2+cLphMf+3PNPCmKlD1zEnuqKkFgbd9QZLFVLDuuPirYH1qTwvi4MZn1nJ
 3FMPI4M+FXFfRlxbKNxLyUYinle6ZSlBtRaNSxlQ9eoa8qDkkYCtp0KCqbo6kJiLNo3s
 DZmnIAuM5E/lziqhN/O/mj2abG2/T1T/r/abDV81fgwni1T3Fkkunv5b8o1XzyDB5vCF
 qKD7zds+MAFbj4FYP8sRBGWgvtr3PqTdAvuL9DBnuS37SpHJEQayiY5Fs09SSb8REzAs
 khDuggp4HMTMK9KXoW1bpqOYz56H2DepXa1zzHuA+1xzIT0zcPx4WbavakFWxDiwPdCB
 L3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ngt79zf5xbmNIbScywJt3+l5xJho6+RqjbbqkB16kZ4=;
 b=eQ5+2I6amFZAcLxq41rAkt6In+kypPUdiNZ885Ze3te1JJK0JS1bxHolreUb6eWPgc
 ZE9k63oNZOsahQBQHzapK3gx2NmIWUXZ1N4jufRKPks0mnVqpPsYHuRYO/Asw9eeUG9N
 m/Afj7ENbu9qrh81bMgAv7tS6ZnISeWj+QyPDv1UhHSdatXPKm/FojQso4IsV3i8Dgl/
 obvP6VFEUXJ0CKAkGjpm+KksTZQdr+YUE339U0mAKO+L76Wdsj5eOLgOEGdUtc2F7fhI
 4NDHHNBrwnDEDzLe1URCThSGRfDl4Z4Ew3EIEP+AfEzdHrOZQLQUFDqZUEHtd+uInbB7
 XLcA==
X-Gm-Message-State: ACrzQf0y9MYRVcZ/4jZnb6z6qtgVfGjqtx/IykOqolYBTAOGJR/0IqMc
 LAERsXGwmYJ96APoJ0zytZhWY3OnCZIcAy/XaTuMBA==
X-Google-Smtp-Source: AMsMyM7q12pKv82CtpbPE1v5fG7j15281KBbAhNdoK7NsVQupkepQgd2A7855ZknyEfGCrB87LchbEK6FxzFUN1zMG0=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20113573edq.140.1663684981480; Tue, 20
 Sep 2022 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-12-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:42:49 +0100
Message-ID: <CAFEAcA9oJyDmN2KR2d4MSOZG_1WCaziYWJX6LhXXuV=dEGB1pA@mail.gmail.com>
Subject: Re: [PATCH v2 11/66] target/arm: Add is_secure parameter to
 v8m_security_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
> Remove the use of regime_is_secure from v8m_security_lookup,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

