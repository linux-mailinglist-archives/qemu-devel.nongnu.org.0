Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F283A7B8C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:12:44 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt63n-0002XC-50
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt620-0000go-6i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:10:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt61y-0004K2-Jm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:10:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso1349309wmi.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=hcehG5WwmyGoes5NHR/mxyY5mIxKIKFaQbZcza/e9XE=;
 b=l7AjN1HQPV0V85QCZnXTLsCpR/lwHRHMln+iGPePOr4dGnYZ+9uqLAYVZ/U43du+PT
 stdchMrUwESe83BKD39srVe6rDdIMTwFhyoZY3k4ALoD2WwG3DLqYBbRdCKKPm99n/33
 FdfIHq+wMUjChYtOyUNOpR6mtBRXSJFqPatqQpPt90xC1lMhOsXAPJ+X5fh7qLvRh7Qz
 wQdxpJ5Qd8tB0RU5D17S5Mc5oMb1BrMerlxK632wmYrnMlWxKlTsUA9Qjt2TBncTECHZ
 ZlH0acfx6AV5VEvRrvpKrJIG9CdmjBZ8eKfWWEnkS5YqDOdD/+HkCFgVBgQMMOSHNwli
 hvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=hcehG5WwmyGoes5NHR/mxyY5mIxKIKFaQbZcza/e9XE=;
 b=Yg8oaeWlrNA5Kg/P111oMxZoiM0AO7sCO9uU5eHcaNiXlf69O3nVI0YGqdRqdlbEYD
 gRkUr9iPtnMDjT7QUw/eFkOvfI797uZ15/woOdo0haKD1bgqnTi8Cs9UGFB45RD0OngG
 RQCxB0F10BeRaQ32TRGVja8FU6hzFLQwOpBHFDPyHyRa79G1rbrKSbkcUD0owpdk4K3N
 9l+ebCo2S79EB+If8xXUvKkojkaKDv4W+chfghv7S0Z+cSpV8aNwQaRy6t6RF4ceqVEK
 oWyjbUEFp4r84h+4k7vUkz3VHFTS1FDos7PcZF4gXBkkUi4D1gP/q4y+C/q+a0diXMNA
 6+FA==
X-Gm-Message-State: AOAM5328BT222NuPIDQG5RaHjfexvTewRk/IbX6vDdn8rQ3ZmdMA5NPc
 IPOSsRTvdP2T4t4YwTmx+kGIhQ==
X-Google-Smtp-Source: ABdhPJz0l4lsGiGup96rF9Z12P03VZJ4grNtNTHUf4JXumcq6arB5pgA+CgquTIvZ8x/KDiV+EHSAw==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4315243wmk.3.1623751848705;
 Tue, 15 Jun 2021 03:10:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m126sm1809687wmm.17.2021.06.15.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:10:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74DA81FF7E;
 Tue, 15 Jun 2021 11:10:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/8] configure: Use -std=gnu11
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-2-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 11:10:46 +0100
In-Reply-To: <20210614233143.1221879-2-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:36 -0700")
Message-ID: <87k0mvigk9.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> Now that the minimum gcc version is 7.5, we can use C11.
> This will allow lots of cleanups to the code, currently
> hidden behind macros in include/qemu/compiler.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

