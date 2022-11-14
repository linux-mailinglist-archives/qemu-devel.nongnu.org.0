Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14569628F6A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijn-0004JR-Qv; Mon, 14 Nov 2022 18:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouiek-000389-SZ
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:23 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouctV-00004w-6T
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 12:05:14 -0500
Received: by mail-pf1-x435.google.com with SMTP id b29so11551725pfp.13
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 09:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xu8CgGI9akiUZzN8tF2fCR+h3eiN7WdREbzfqaDwGKg=;
 b=I6538fHcvXwQmfZqtrvzwAH0XinzX+/2gQMnSMQh9r355FAJcq8AoLEJHfyGpIrQTx
 pkusj+maNRtdrEeQOG2qpxUtLssp06eHQh6z9ju+wY/qWNELSvXTT0+Tazjr4VXNipkc
 91Qvc54SpzUsL99qxgLHZzgm2lK19heGwhZwBhrai3sG6LCIbO7B3d4s6JGwFpu97Z7q
 qJ9ZSt2hDOHggCEdilv2eIayZjJWRccggV0nY+QOuaWXuE3E8iJm1R+qopxmlLIZwTMB
 NSnb2rVpxhoxpt7+hufSg5TQyscZf6bSp8vGZMB3vqKU9bsKFXtwXy8wPgzkTu/B8hyW
 4edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xu8CgGI9akiUZzN8tF2fCR+h3eiN7WdREbzfqaDwGKg=;
 b=A6iXHKuS1W+S7erEKUr0jTmc3zPMcZTI/gB4Xtbs7mslMdiBUJlkulsZ1aXO1KajNp
 xfIAAG9CbLKc15aPVtZhHFkjE4WlPxF4WjIfyClEKKGJjEQtXI8cebfqspbB7yslJCO1
 YwFUXHdrsdIHxduPlyCkTuPx5UvwGtHIIuCRej5IO4dsAVsH5v7ALnHK9mKvAIr6XMhz
 UTK0+QoEHHza1wfK6P968J80O6r+bfqwC96yuh3GbV06mCKqzkxrdraJHl33bWZK/CW6
 P1/5Hj6LQvu7cPD+Pkhh1+JCza5wDK0ufQIVZa9WMQGlg7BdGcEU3RdCUy4AZTr48gWK
 M68A==
X-Gm-Message-State: ANoB5plJ0v08SXYuoVY3X+Yiz9TcpvxuR4a3bOb2UqTY44i1iN5nlLHR
 AjLge4w0rJzg0ssOeeQeiN7ARPk2le6D2esqdWvTVw==
X-Google-Smtp-Source: AA0mqf4vrL/OPoPPqCEb5FoPSniXfe5dqaeDp2+g/gEavodm9U2aqJetR3TckmHaEuGuF/l3OOpzTJOIzJTXXdz/Hkc=
X-Received: by 2002:a65:63c2:0:b0:46b:2753:2a60 with SMTP id
 n2-20020a6563c2000000b0046b27532a60mr12419195pgv.192.1668445511378; Mon, 14
 Nov 2022 09:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-3-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-3-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 17:04:59 +0000
Message-ID: <CAFEAcA8+7yNaq7VdRZd-GoY9UrKx1Ph4J1sdAZW0zhOD3d8YCA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/arm: Make RVBAR available for all ARMv8 CPUs
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> RVBAR shadows RVBAR_ELx where x is the highest exception
> level if the highest EL is not EL3. This patch also allows
> ARMv8 CPUs to change the reset address with
> the rvbar property.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3c517356e1..2e9e420d4e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7768,8 +7768,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          if (!arm_feature(env, ARM_FEATURE_EL3) &&
>              !arm_feature(env, ARM_FEATURE_EL2)) {
>              ARMCPRegInfo rvbar =3D {
> -                .name =3D "RVBAR_EL1", .state =3D ARM_CP_STATE_AA64,
> -                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 12, .crm =3D 0, .opc2=
 =3D 1,
> +                .name =3D "RVBAR_EL1", .state =3D ARM_CP_STATE_BOTH,
> +                .opc0 =3D 3, .cp =3D 15, .opc1 =3D 0, .crn =3D 12, .crm =
=3D 0, .opc2 =3D 1,

You don't need to specify .cp for a STATE_BOTH register: 15
is the default.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

