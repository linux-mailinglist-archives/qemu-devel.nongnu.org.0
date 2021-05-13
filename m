Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715737F48C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:58:24 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7Al-0000p3-AZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh78x-00088S-2R
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:56:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh78u-0003F6-Jw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:56:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e7so7653410wrc.11
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=mlWHyadK4qHAoWFDt65RCBQIV2MhUBgxtHSO7O80YIsXBDDCutJFiKsZxwKcT7N3YZ
 Lplc8yDItBqSHmCQ1MdmDCCM1uZM8oKRuK/YrxCYDiYcQJs+f7aVXBoEpaWQk4ZQWb45
 F+9ohMvehBX4LLT71WWpwllVT3tfLQULJhZJ/oaOGMp5WyESRlCp7A9bkMKD6PmQoQg0
 WMx7b4ryQgt7j5vBXYpZARTcL8CNwOIYIumVS+HvSlPPrUP/W8cYsUv2AsQmsKujrsZV
 0lIaBDs0h0ATupM7Lyl2lG9h0G4GFc/offIKLVwiK7tztZMIjEk3Vq/zqjPsTF3oY+Ca
 TwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=lG3tNt43Y0yhkcfxBf7AHWw0X7o6r1jkyE8h5Ib9qzP1VOg5wkuzjtyIQ7A8X8Cw+z
 uVLsrjKzUXtH6YxNTvGVds9N3D31Lb9Dz3AbzXMvZ383twt95x3iCM/1jBcIm226JpAM
 PbDLg7Bm+lvOnfs0xhLZmZ922IsbZkoXsewNXUnv1SleV7TizFtJfbhuBvxq11FhQPj0
 YijNd01momHBigdbDB+6dMBAEJFDqwS3G42K27Ouf/2ZVTUsM97JrZU56vEKHF5g9jqZ
 NVV8OhIyH/QRYY78B68utigMbi6WnsOdST7Y6WjageoIKAb7q5+SuHDLzssmYlohKGLU
 Si7Q==
X-Gm-Message-State: AOAM533NOTavwfhFgqBhiq+t41hrG60Yuax2RPZuW4q2P74tpXQZhq8t
 c9FkZyB+LZCTOzLsbk+pNxKTdA==
X-Google-Smtp-Source: ABdhPJyEFlHaVRvEDKiERdeocsGwlJHfCErKnc95HRAoTzAy5OdRpLiK5W36iPuDfRViTXOsgGz/4w==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr50576658wrs.194.1620896186959; 
 Thu, 13 May 2021 01:56:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm1697372wmq.33.2021.05.13.01.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 01:56:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45AE41FF7E;
 Thu, 13 May 2021 09:56:25 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-28-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 27/72] softfloat: Convert float128_default_nan to parts
Date: Thu, 13 May 2021 09:56:19 +0100
In-reply-to: <20210508014802.892561-28-richard.henderson@linaro.org>
Message-ID: <87zgwzdnba.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

