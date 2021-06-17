Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BE3ABB27
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:03:25 +0200 (CEST)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwMO-0004jE-Px
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltwLe-00043U-UA
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:02:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltwLd-00044z-6B
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:02:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id e22so4171097wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Zav3iPuU4V/NVERiF8Yktz030PXimxI+8LZXqt5myL0=;
 b=jqzK0qgaIB+ScIqcorEvRq3r36oMIivweS0t1VLN3tzuOCmPFHPAuymyg3PwVeFeFg
 zZqz+uUehCtGPX5BW6LhUE0s/os/cGLIbZPqD5UwX9hcnwfBBfDbkVjmnPsFNajmAZhk
 rD3p/km23YXX5YCH538gG84l9UUhj8a8kMckwkxhm7af5ARCYkLgOTgIvbZlly727IWh
 0JLm1ywEwPphJPZH82DjmUp48mg9MEQ7ortouKMedR5HYoz8/4oVsAwi9h15C7j4wHH2
 8Z8WVBO7U/KAN1w8UZxlowX7xLZTLDyRWkqNvxKCVRhY/ZV5Ct1CLBxfaRK488Uyl+Ql
 DUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Zav3iPuU4V/NVERiF8Yktz030PXimxI+8LZXqt5myL0=;
 b=VGziy37/8l2DehNN5byvu1/HjHV3TY9sl78i3KDP2vFdpUyl9hp8UsBPBy+A/oWPux
 GCkoGkqE/0xVq8OW5AssNaUB5o7VOjImVZljhPS0KEm2F/yAvnPVGCDG2AgIkD182aFT
 MCJ3uZ93XrOpI8u2BNg6j8DzoIr8UIsxtKol7zzf1uqcbKvPbgj0pkV2fQAxliVjCh1i
 8KQBZPKmNH0kMvp/1VAsHSXiJbF1zp4knFPNPPydP+uF/VdW2ABUVdG08kH8/23fsoJ2
 nLaVKXhR5cNzxqfQzr/1wvm5DRZGHNc/sWyECmHBjIo5wSrOjQL96I71J27jREOCdnxq
 S71A==
X-Gm-Message-State: AOAM53236tkZf8y7iJG24aYS5lqlRTBU8svFe0gDCLsHMeXjFF5DfJbz
 s2T4I1gkVnloOA3Tdjy54VMEYw==
X-Google-Smtp-Source: ABdhPJyWaG2UtK+zO0QOjXDRZaZY3SEEFknGTOHvl/z6jM9WaFLVWvgsUUE/5OprNbV1OA3uN4q+Og==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr7296810wri.386.1623952955424; 
 Thu, 17 Jun 2021 11:02:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm5301204wmq.8.2021.06.17.11.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 11:02:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3AD01FF7E;
 Thu, 17 Jun 2021 19:02:31 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-44-alex.bennee@linaro.org>
 <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
Date: Thu, 17 Jun 2021 19:01:43 +0100
In-reply-to: <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org>
Message-ID: <87v96ce5e0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:52 AM, Alex Benn=C3=A9e wrote:
>> From: Claudio Fontana<cfontana@suse.de>
>> Cortex-A15 is the only ARM cpu class we need in KVM too.
>> We will be able to move it to tcg/ once the board code and
>> configurations
>> are fixed.
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   target/arm/cpu32.h   |  4 +++
>>   target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 67 ----------------------------------------
>>   3 files changed, 77 insertions(+), 67 deletions(-)
>
> I don't follow this one.  Why would kvm, which is 64-bit only, require
> a 32-bit only cpu?
>
> I guess I can accept that our board configurations are old and
> fragile, and I realize there are already 99 bottles of beer on^W^W^W^W
> patches here, but what needs to happen to fix this properly?

I'll drop this and fix whatever we need to. 32 bit ARM KVM is listed in
removed-features so I think we are good.

>
> I guess I can give it an
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>
> if it helps us move forward.
>
>
> r~


--=20
Alex Benn=C3=A9e

