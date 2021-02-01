Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A528B30AD84
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:14:43 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cmg-0006Lt-MX
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6cis-0004Rl-Kh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:10:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6cio-0005Nv-Mo
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:10:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id 6so17422519wri.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uc51KV1Uicp82jgNC73/pa7OUeOjHlnVfQCmC5M7wRM=;
 b=AxN1fu/MP4e8N+10JbV8io2tXAuQ0uwtPU+n/khscslUV+PzRiuoGomGh75465kPpn
 WO+OeXDiufWq2NZE4pqKZd+1Hk/RNorETOnYrgmUIVsFnTlsmDc+PBt0p8tpZaf2KEVn
 FMu/MlS7/Isv2XPSxTucCwyG70jqpAfZvpBjCXih0YKSNypBEcIP4F49Sdc8nBEbY2o1
 JIJ7G1ZuSlWTH8unbCeAp3UCi22o86V2FNzogwfYQR9MKVAV2P7jwKwp/tw1u49ADTM1
 cDJp8hkc8hp5c4cLV3AqIjhiAKukLVuzO9RhiIjPzmfd5Hl2UUqrSh95BuBi4LPXZPsm
 1HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uc51KV1Uicp82jgNC73/pa7OUeOjHlnVfQCmC5M7wRM=;
 b=CujGs12g/oOgjXgZx/hUSMhZ2zNCUsMWVXr0Y/eD4QkreSFS4s7e10u+gTu006n4me
 +pK7LuZftmOfE47GqFkpdoDuWVZAgMqXK4fhj6Y1e2XubeCLUzpEz7PxZPf1V3x8eg+D
 LlFF+WgEP3AAV6cxb5HASM5H3h58WgabSiDB/NRHRFNXZkQ6zmyJsfnP5MwZ2ale40ly
 jZgKfPhGjjNa1BOhkYs6NjUWB3s4Yh6n/6tbrY1IdAwyz/edypWzUuI5i+cfapmZ2ZL5
 +rr+PVhD8Q0wTh34OMlMhVp1tPkVTZ0nDpCWABNYbZYPVkrYCUoH7cySvtvTp80ursB1
 7qvQ==
X-Gm-Message-State: AOAM531vtZ3IaDl9t9aDUbjiz0F5xr7pFCl4G3P7rpUXU5wM9S+WDEzw
 lORUyL4atXhVuEOIdmx6yKY9YQ==
X-Google-Smtp-Source: ABdhPJzW0+5MPR4jZiFi/k5fj29Kk9W5ktozhM0fVqMoMlvDmbMHtFjP7vlFdt6lAq20MKY5goBEDA==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr19830466wri.105.1612199439664; 
 Mon, 01 Feb 2021 09:10:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a16sm27138510wrr.89.2021.02.01.09.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 09:10:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B4981FF7E;
 Mon,  1 Feb 2021 17:10:37 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-4-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Mon, 01 Feb 2021 17:10:30 +0000
In-reply-to: <20210131115022.242570-4-f4bug@amsat.org>
Message-ID: <87czxjvhma.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> Only enable the following ARMv4 CPUs when TCG is available:
>
>   - StrongARM (SA1100/1110)
>   - OMAP1510 (TI925T)
>
> The following machines are no more built when TCG is disabled:
>
>   - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
>   - sx1                  Siemens SX1 (OMAP310) V2
>   - sx1-v1               Siemens SX1 (OMAP310) V1
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

