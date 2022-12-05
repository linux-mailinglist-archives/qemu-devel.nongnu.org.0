Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3549642A9F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:46:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Cj7-0005zl-F6; Mon, 05 Dec 2022 09:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CiT-0005wj-FX
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:45:11 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CiQ-0000yu-71
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:45:08 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i131-20020a1c3b89000000b003d1cb516ce0so2484994wma.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KKWEJBqv86j6wLbXow1G1PMBdr+r7OSuVBbsOaaXmc=;
 b=ZpyL9XC/x7dJJK/p650TIRGp2C6kmdY1H1TsPgt9tOM8gtOaYTNXnQwGTDERmeFKFC
 VfqWrbHhEQUvB4ads3gIeRH1K9avD+L5Nrkuqnt03y7HYfVWX0wz1/fG7EhWJHhva/lb
 uvHAgcAD87Ec8WNgBfxAksTMAIaBySVkdM31hP+VBxmHGNgmOzcfcd7QMkqFA3B7NhdZ
 scNadCWaPbBHIipYzG3fnISZKDJk90nXNimHjFGq/GH8FUn0DAnEEKtT+0ixJUWGlQyS
 q5IlsUuEKOA3/8OuZCbSOom53/8Qt8ivI4pSo0L4bKpptGbQEtSxozEzGjAMKJvZJpvl
 eafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KKWEJBqv86j6wLbXow1G1PMBdr+r7OSuVBbsOaaXmc=;
 b=mEjslHLIKIPPCeQF22sW1A9XJWHnRSPpd48z4j9a6lApuN21eetZvKF0Nec/fQfS1Z
 wqVNeBeyjbkYWsJr9EnwHRMncaSJkkf9ICbve2kUWFanf+drSKaWOT80snXx77eImKpk
 7cdEqy+jefjlXYJ2PFHP8+szvg+ibG69e733X85t8rk79N881i9P72HcOH/T3srW+4Jq
 o47XAjwQtotPXotUrPWUbNkcPyusEkx6baz0nDv4GygFVV0/G7CAHfsA58vPDuSwX10Q
 OpG8Dy1wn44MHwVMSW7h8JVatBmrtzwfe5Lml9CMtHtcQxeufjSj42/y2MdGNBzQUC0+
 f8Ig==
X-Gm-Message-State: ANoB5pmCZcNIK3BGdwGawdlX1LGcBxnO/fT/ufdKJ39KndtbBC6hfq9g
 0YX1jcRQ83KjZMJpjzE3vLk8sQediGUJTeFGu83gvA==
X-Google-Smtp-Source: AA0mqf6wdvdqez7EoWFOhvPXi7Z+Kg2iT8WlI6DTn8oriVqM9uWsitMrUVKfV3B25m2cC+nALOpfaxs372tqB0Vc3Q0=
X-Received: by 2002:a05:600c:213:b0:3d0:869a:4e59 with SMTP id
 19-20020a05600c021300b003d0869a4e59mr10328700wmi.169.1670251504261; Mon, 05
 Dec 2022 06:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-2-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-2-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 14:44:51 +0000
Message-ID: <CAFEAcA_BAnHXgNnW=UCY8rDuwFY0-qxvjb+i0dkEatv8E2hrMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] target/arm: Don't add all MIDR aliases for cores
 that implement PMSA
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Cores with PMSA have the MPUIR register which has the
> same encoding as the MIDR alias with opc2=3D4. So we only
> add that alias if we are not realizing a core that
> implements PMSA.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

