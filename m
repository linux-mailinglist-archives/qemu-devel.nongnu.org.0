Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0860684A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 20:38:34 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZLD-00011C-PI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:28:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZL2-0001qn-6Z
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZKp-0007y9-D8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:27:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZKk-0002Xf-M8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:27:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so173716wmq.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDStZdp/vKgP6jgi+LdTNId2988k4X5Xq0rhhgxHNI8=;
 b=Rj5szBOLS58V+wgpuNsx8XmR/JQnPu8uyaJ20nwI0bYphzZrsnSDJwYVFqFF4ey26V
 GyCxJvg1NxwGZFV+J1fM3kwH5I1zqjDGs6+HelF5PQ+BdzyJK9TPRZfI4uZUZGFhvHtR
 6Q0ePh+nDccYU7NLeqOnCx875MxqXOuEscYRfZ2VoQ1tnablJgmID+o8tpI8Bc/DFm7B
 GRISJPI8KO/Kfx7rnN69eTeglwEMQsatQ3KRInOzPnd45PMLAghVEct0IWn0YkQc6+Y5
 wxEvJ+6jXyQOtlFO2LFsxeN1pDBo3Bn1sOflUa18WaQrM2xNWUn4MVtt6IPal8xR9MnS
 T/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VDStZdp/vKgP6jgi+LdTNId2988k4X5Xq0rhhgxHNI8=;
 b=UOJzF/WNcnMRJgfmvHT6JwnzFR4irciAlqQQeQwnNNwIwClSb7izXq1a+AYTjzchDy
 LvbHgZzlM1XQ/Mqt9ivvGZJAOnpl6HUUCvKcdWzBiHL2oqovUkfgDgKG8wfxs53SKJbF
 9PlXc7WXDx2W6OTaEkbloR1Ff7uoF+/EsDwmXHXGahrGY55B3Ay+lNSHzK5MRpw7WNjR
 20Z2ITDQ8wgHubYQ4mv2uLugAk5KQzmyY9pzmr/a8IL45KQpDqLKCHOkzT3y8MafY2LF
 6Pdg5kkdUqkPr10jGkbEnJBPWvB4QyvvgW3zPJAgTnSFnDdLDCGLygoXcBkElxcdAfUX
 X2Yg==
X-Gm-Message-State: ACrzQf11KiMLrYjgGOSpQTaqbgbANEVlvjcMLYquX/+Ezx018JyQZrK8
 yWsenpyNvlaFM3z0i5RYk4mEWQ==
X-Google-Smtp-Source: AMsMyM4rThkK5+3kBuGvjc+CXGCYHHJFGTzH2s0BLcerDYslZWZ8y1lpEjRk+NIkGpblL3/NuwfXLA==
X-Received: by 2002:a1c:4485:0:b0:3c6:75b3:f444 with SMTP id
 r127-20020a1c4485000000b003c675b3f444mr10355420wma.74.1666286873277; 
 Thu, 20 Oct 2022 10:27:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a5d4351000000b00231910fa71asm17007266wrr.57.2022.10.20.10.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:27:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79B4F1FFB7;
 Thu, 20 Oct 2022 18:27:52 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-4-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 03/10] acpi/tests/avocado/bits: disable acpi PSS
 tests that are failing in biosbits
Date: Thu, 20 Oct 2022 18:27:41 +0100
In-reply-to: <20221020123506.26363-4-ani@anisinha.ca>
Message-ID: <87a65q8kx3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


Ani Sinha <ani@anisinha.ca> writes:

> PSS tests in acpi test suite seems to be failing in biosbits. This is bec=
ause
> the test is unable to find PSS support in QEMU bios. Let us disable
> them for now so that make check does not fail. We can fix the tests and
> re-enable them later.
>
> Example failure:
>
> ---- ACPI _PSS (Pstate) table conformance tests ----
> [assert] _PSS must exist FAIL
>   \_SB_.CPUS.C000
>   No _PSS exists
> Summary: 1 passed, 1 failed
> ---- ACPI _PSS (Pstate) runtime tests ----
> [assert] _PSS must exist FAIL
>   \_SB_.CPUS.C000
>   No _PSS exists
> Summary: 0 passed, 1 failed
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

