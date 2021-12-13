Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6C6472E83
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:07:12 +0100 (CET)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlyw-0006ca-RO
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlYV-0001u1-7Z
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:39:52 -0500
Received: from [2a00:1450:4864:20::52f] (port=43792
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlYT-0002jw-U6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:39:50 -0500
Received: by mail-ed1-x52f.google.com with SMTP id o20so52585449eds.10
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9qMqow2nPcGDmntoh3V9VSRKbetWfaffAEBoZuIpAc8=;
 b=W+MSt/iXu5lNiTQi3YsLBrQXMC25nqMy+9K1/a9ZFp8prVwHgDG+jiS1IvJq/9M3iq
 p1pzNm0tKQkWN4dAIpujn5/zT0hLWOJzIq9yU0U06I1990Lpygx2vGIUXKjNQAdPY9Re
 XYOf9dhJ1XbebeyxaOiFXqhRDTrSuBAtvrSOX1l3pLD86EJjCRXCQtRcY7zmjeNje7po
 kFVCuNc9qANECkaxTRrKpbrhQpFRcgt2fXuOv/21BpvWVAszodXUWAE39skvQvXsFUV4
 qDGzPxWduJb9FWm1sC0r8DDWNpTr3Vhk8zcBqPyc/kCEQL0dFmh08hnmm2dsXTSDxPTs
 oesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9qMqow2nPcGDmntoh3V9VSRKbetWfaffAEBoZuIpAc8=;
 b=WUpKVxcoSm1hum+1PjdpgFFUr6UaNGnneqXhsGyOC6pRXF+5LwVeUMFA9c+L1UZ25Z
 M6GHgP+7Ep5fE1cuC8/1hJiVFWg71IO8vJ62iwfxKB6VvQ0N53BtPl1fnHXKv3sleK4l
 43COJqOKLjbcUifiQfvPa3DM0C7rcfEBIqX7fMCD2Mgp9zjA5dGYhfGrUKCDxaMyMNbI
 fx2fmVVn+qSgBJ/wQJkWrOOJQ1aWBcAZm6Z7yy66vgaenChOWxl7gas9jCUOqkAskluD
 kk048IMvBqFo4c3irpSGVWXGidU5Na/IgbhsyDbiYREG14Ag1+IenJ2KGfzE/0v5OM5G
 sr6w==
X-Gm-Message-State: AOAM530JqZD21rMpsKvSWpliFFg39p95XEZZNe/blabIHWk8uuerLgad
 HvlIHu4WyLoMLSqL4wPmnEnDtA==
X-Google-Smtp-Source: ABdhPJzkxZIAtLVNbBPyb4T6Qruj/RLwinNH0F9mvpv6TKBKzBUtL6tiqgtnxMr82CzZ46UK41yecQ==
X-Received: by 2002:a50:e611:: with SMTP id y17mr65457100edm.270.1639402788610; 
 Mon, 13 Dec 2021 05:39:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ds1sm6375878edb.91.2021.12.13.05.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:39:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08B0A1FF96;
 Mon, 13 Dec 2021 13:39:47 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-18-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 17/26] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
Date: Mon, 13 Dec 2021 13:39:42 +0000
In-reply-to: <20211211191135.1764649-18-peter.maydell@linaro.org>
Message-ID: <874k7clj31.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The bounds check on the number of interrupt IDs is correct, but
> doesn't match our convention; change the variable name, initialize it
> to the 2^n value rather than (2^n)-1, and use >=3D instead of > in the
> comparison.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

