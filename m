Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE248964C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:25:36 +0100 (CET)
Received: from localhost ([::1]:54336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rrr-0004OY-PM
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:25:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6roz-0002IZ-JT
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:22:38 -0500
Received: from [2a00:1450:4864:20::533] (port=43882
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6roy-0004hV-0k
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:22:37 -0500
Received: by mail-ed1-x533.google.com with SMTP id m4so10024098edb.10
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4ScVEqezi9OQfiJtwFLg75fkJ/eLZnnujQRUb8eZr6Q=;
 b=wB2tyybz/qPUaA/wKxZhNpBHobgHN4GXSY6ARJE1z42/h+Mges/uLVWgXxGtMO2Yxb
 knJAyr755UXwZlN6fNsgNaYH5P5OPTUe0EMzctn0L503oEwsyXKNVkeqklzqs/zlQTvK
 GNM/x2vTuzn7M+cNjoNHDIpWUf98hnV50IF0LXacdQ8tI6Ed/c4vrbNSp57Gxp8R4QSC
 LKZ6Vw/c5MRWWFrcNXdckZvbcKpdYRihw3zlYbRm5qgG0MpgmnOwdIdEG8BE8ZqH/2NK
 7Feq0TYUp1NDALYhHFtAKp+gWrhJwdzhh1RuK1FvRX857zodWuIp6WxPEQ0XrHkrZnw5
 nFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4ScVEqezi9OQfiJtwFLg75fkJ/eLZnnujQRUb8eZr6Q=;
 b=Y3xrEA05ECSBkoP7+48uF3yXtxx2ZqFGM+Rowek0CUVB1NpD+eMX7bXeJCA5rGEaXJ
 ZcNgNX5YEVRyt5j0qGzqbRbYkBUHYKa67GwDKdGt7jT2cLE0nTOVDvUsqBvdfCw1HcFN
 Omx5jYmR/635DP9lOif68Q5zpNDJaAzV4tnhodvcbSl7l7xRPfU90DUARsjDi2h4MlKc
 3i0Q9aja9UiYcpTBiy7lkbN3l8T9Ot6rHHVCLapJ+TV1ZxxJJFxn4J9cKqBMqVFgcSun
 NBQDN+KRdklHARCPX1J9+U+23oAOcxb3GB2EeNGOtqtQqxeCdyCVnDvvywRhR92TJ4N7
 mjAg==
X-Gm-Message-State: AOAM531R9HONnJXnQm2utWjPl4PLZg8R2wkou+5R9w2EZ0SNhtluccZZ
 00t8SjapfhHbWc1Am4H/fguPnA==
X-Google-Smtp-Source: ABdhPJy6+VJyvo3RtsbeMfXMhuhhC24/pQpO9VBx8GaecyWFBTaCPnugQaAl/yLVOL2oBYwQ3g1wew==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr59747812ejc.337.1641810154615; 
 Mon, 10 Jan 2022 02:22:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id eb14sm3351439edb.16.2022.01.10.02.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 02:22:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D5131FFB7;
 Mon, 10 Jan 2022 10:22:33 +0000 (GMT)
References: <20220108150952.1483911-1-ardb@kernel.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
Date: Mon, 10 Jan 2022 10:22:28 +0000
In-reply-to: <20220108150952.1483911-1-ardb@kernel.org>
Message-ID: <87lezndh5i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ard Biesheuvel <ardb@kernel.org> writes:

> When running under KVM, we may decide to run the CPU in 32-bit mode, by
> setting the 'aarch64=3Doff' CPU option. In this case, we need to switch to
> the 32-bit version of the GDB stub too, so that GDB has the correct view
> of the CPU state. Without this, GDB debugging does not work at all, and
> errors out upon connecting to the target with a mysterious 'g' packet
> length error.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Bennee <alex.bennee@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

