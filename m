Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75906CBB8F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 11:55:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph622-0006Bo-Hx; Tue, 28 Mar 2023 05:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph61z-00065U-O4
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:54:19 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph61x-0003q6-VB
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:54:19 -0400
Received: by mail-ed1-x531.google.com with SMTP id h8so47112345ede.8
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679997256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5W6XbogdsrnH50TgZwRnKlQeZUo5dHnNr3koSPp9Phg=;
 b=NxE4WE7ogBHSd30j5G6G4w44rA/V8xOl+XqjkRxqQbsmaDThF02jAT2/OwNl0zqUl7
 03DEMVGgBzitGnEk+bztLAP2J/jCnuZ+wAOL5Ikd1AGccn0tSajFXlOxwtBVdrwgmrsC
 1B7mrJrD5R7aA8vEewEBk45NS6Kd2qsEJ0+RYzy+/ACm/KjNshMgI4Yyu7p0f6Y8tKS6
 utjpVUIiqW16vRQQsaYaHrRNy1Brs4pO6CCCQBziDA7gTQsETVZbBT+7r5UC4PRYecKN
 Os3HsMKJ4rj7D1EMoK/EM/upBrSkg7EJWizeKMryk4yA9JmW7GslwgZNsvrH4IYuuHAZ
 MNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679997256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5W6XbogdsrnH50TgZwRnKlQeZUo5dHnNr3koSPp9Phg=;
 b=Z35aYQfKVJMCf36Y2F1OD6RlWYsspVl6/JPhHL01I2UqEFgAEIHeni0a9mpbyKC7ZJ
 ns2wRoUUky6MnT9LdrbhGCL69ln33wQPl0jCOVnq3hf8Cb13T2Bx/PX1JmfwhkZSI55t
 MdWkatbPyD/1YbQBOWrsCxk5+H61TgmkoVwRAIHxzG3CatBbX4H38lZHshw33Z0aeL9W
 4lgyPeuRoUbRpPGbqhWka/NwiQeRsp5JcfuMtbsJbKjZAWxHjem+BrJ1zrkgmRcoJ0Ds
 7rcQKrhGOBoO+GHWQScV7abglgrP1K7+dl0GvX9r/+0PR3QNkPoj7Bjc7PqMt8rZaw6l
 KuMQ==
X-Gm-Message-State: AAQBX9edYvwicusrlXQuo7dzhyrZbZcsuFT/hQbQmcjbsWqPage/3rv1
 HBiXpjUZS5KegViu6SKgYumL1jJhNeuUkpYrPBHxhg==
X-Google-Smtp-Source: AKy350Z9/bU8h2Jxkqq0rsxND6WERqNeno3rROnTfjHCEBDRQ8PEKkrbwUGqoTunRpTvPWzIURzZ1xfjxpjLCvtjtoU=
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr7510267ejc.6.1679997256367; Tue, 28 Mar
 2023 02:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230322142902.69511-1-philmd@linaro.org>
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 10:54:06 +0100
Message-ID: <CAFEAcA9-+bfGxN3+3sCpA3XB8T8f=RKPC7LUwdK8-pPj-h8xig@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Wed, 22 Mar 2023 at 14:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix when building QEMU configured with --disable-tcg:
>
>   Undefined symbols for architecture arm64:
>     "_arm_v7m_get_sp_ptr", referenced from:
>         _m_sysreg_get in target_arm_gdbstub.c.o
>     "_arm_v7m_mrs_control", referenced from:
>         _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>     "_pauth_ptr_mask", referenced from:
>         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   target/arm/gdbstub: Restrict aarch64_gdb_get_pauth_reg() to CONFIG_TCG
>   target/arm/gdbstub: Only advertise M-profile features if TCG available

I've applied patch 2 to target-arm.next; thanks.

-- PMM

