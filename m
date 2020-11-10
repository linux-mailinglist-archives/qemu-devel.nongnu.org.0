Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F022AD5B0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:56:14 +0100 (CET)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSFx-0000yG-9H
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcSE2-000852-P4
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:54:14 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcSE1-0001az-0r
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:54:14 -0500
Received: by mail-wm1-x342.google.com with SMTP id w24so2736772wmi.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=SA2picTxqXRs0VmLTE327IpcgBXPXJDWmX2rj1b4D0M=;
 b=TUmxnulx1nb8/yF6o4wVD/gdXCGRnQo9AqdoHKSCKs+yN20SpsXB2+WgNipzUuLymW
 nNZh5taJSR0jomOoFIXOX0wDWk6T34qwIwWkEnNy5WwuUbBlttg25kgMu+XIQu752d6P
 X9vQVlEqJss90VwZq9Q9qLb5kPhPmn81yhnRGgkUnPyDi+EAkeZNOBsUjxtM/8TcF7V9
 PmkKPoGkzeQ672a8mR8eZreUhyD64Y+deHY1V12E3zseUIwDckDOj2AlxdadaytGodjn
 H33pmYCv+ykGBYrIvyxqM1sRUxbsP33ZhCYbYR2C3PMgbMFYvGCOe8C/6dfHvbDC1e66
 vdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=SA2picTxqXRs0VmLTE327IpcgBXPXJDWmX2rj1b4D0M=;
 b=hZ6AjzY4539SjJ+5S0+QiFZUGAjv8F/e1qOkyWs8PXL83dSommwS+ZMxfPeP4o442z
 //w+vN6F2NUBwrfpn1NjYUwJQuZnWrUTs98MDCBIynAn8Zedup5bbkJyF8U0pi81+w5t
 6S5+uzc5/e6cGdq54KdvHT811sk5F9rs+T5pyRGuTTxeoaTdebxnDEBHW0xunPCXspbE
 MI39bS2+g4LvMNM+6Uq5bDRW0DtILcFIIK8jDQ/2n6F9oaWDDPM7NMIC2FJmvI4JUfeW
 GlIJeN4OcksUwtllnO4PSw+cdWls8bLsPmrkl2bIYMvNPm8diuE2+cimWde3lXDh1DyR
 acaw==
X-Gm-Message-State: AOAM53157H/FgruUK9YiO2hQGBh8DsTReO9LyZMozbTUek26qu+fvaYZ
 LLLliW79wY7fAI2uWIZHoubTmQ==
X-Google-Smtp-Source: ABdhPJzkU+egW2qAB/eRlMc1p05ezAWy3MCjcGQejsdmrXlDfvyuP6EtAUZE/23gXtyULTWF0SolAw==
X-Received: by 2002:a1c:6405:: with SMTP id y5mr4427373wmb.150.1605009250916; 
 Tue, 10 Nov 2020 03:54:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm2711905wmh.10.2020.11.10.03.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:54:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 254901FF7E;
 Tue, 10 Nov 2020 11:54:09 +0000 (GMT)
References: <20201109082829.87496-1-alex.chen@huawei.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex Chen <alex.chen@huawei.com>
Subject: Re: [PATCH v3 0/2] plugins: Fix some resource leaks
In-reply-to: <20201109082829.87496-1-alex.chen@huawei.com>
Date: Tue, 10 Nov 2020 11:54:09 +0000
Message-ID: <87ft5h8m1q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 laurent@vivier.eu, qemu-devel@nongnu.org, zhengchuan@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Chen <alex.chen@huawei.com> writes:

> There are 3 resource leaks in contrib/plugins/lockstep.c, fix it.

Queued to for-5.2/various-fixes, thanks.

>
> v2->v3:
> - change the "From" line to "Alex Chen"
>
> v1->v2:
> - add the cover letter
> - modify the subject of the patch[2/2]
>
> Alex Chen (2):
>   plugins: Fix resource leak in connect_socket()
>   plugins: Fix two resource leaks in setup_socket()
>
>  contrib/plugins/lockstep.c | 3 +++
>  1 file changed, 3 insertions(+)


--=20
Alex Benn=C3=A9e

