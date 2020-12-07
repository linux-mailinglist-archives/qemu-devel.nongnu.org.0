Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6C2D12CC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:01:40 +0100 (CET)
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmH59-00080O-QH
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmH32-00078K-OP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:59:31 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmH30-00089X-DN
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:59:28 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so13734366wmb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lgYK4YpPL6wgCDds+VBrTxq0lMK9Vtq2GpKKgw2QlE0=;
 b=F0zaXJWR/v6DLScam1LCKU/kPHyzLZ8DRqSY2R6XqwUG17xk6kYpZGvBF3T55vp+rb
 CO9S5zCeLeK0Ou1uYQZx9KjqHkJVP2USg4I7gR1AGA+NgnTlY7w0K5jJuCAVBvkkBTFw
 /l1N+M9+R1oyU9QpZ8Oc2UqNtftC/wbODfI8DizckE/S+xeqh+cuoAeAR7FowV1m/yBg
 vmI7R7DJHYcqN+t5X6LHOUZX7m/P7tT3bFqSiYx9ofRPgxAa8k/u8VX82bFVFP4+UrHp
 RmAO8hnIAUFD77alUF6k1bBM+qrIaVKyY87er+J5WqG2t0FhZr2P9qBHUQvYkdCHtyIG
 sKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lgYK4YpPL6wgCDds+VBrTxq0lMK9Vtq2GpKKgw2QlE0=;
 b=nGgIDoYSixYmYDju21AtMUfKhuhlv2AA43p6sExedPlcQM+rFqFghZilQwBOHyCGgx
 d0PrrsMWWksQ+dOl+XSifANAooVNlko2Ri5x6eYkOd01WFSL+tvHdphEitsPHQeNia2J
 BjeyR4KFVOeniJDnjcjbj8XJNjLdWZjE98W611lTUUHZTrWlzwD+YJs4WmWy93gucvta
 xI7fCyL0pSplqyCLowepd1gmlY8k21jRK4e/XOqfWxn167aghVulCftl7zbP7inqUKrz
 VhLKp+AYTvwAooewq6K2nD2rnFaLOnVOn/k/N98DjkNIfn60GalaP4rx2XCBhwyMmqjp
 KI6w==
X-Gm-Message-State: AOAM533ScMV9qHpyMbv+bDvBo0TRPiLXGGQjiLorxsl1AwVXeDAWUr6d
 3bgrCq2kh67u+qDN4/anUzd3tg==
X-Google-Smtp-Source: ABdhPJzHCsDfzI6Z3dmQk6CZasCG0UuMwMJ3WglFUs+bB/RuIRIk82IqX/X2jEZr7Z1J0TUaW51a2w==
X-Received: by 2002:a1c:a583:: with SMTP id o125mr18210180wme.91.1607349563394; 
 Mon, 07 Dec 2020 05:59:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k6sm14349414wmf.25.2020.12.07.05.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:59:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85FC81FF7E;
 Mon,  7 Dec 2020 13:59:21 +0000 (GMT)
References: <20201207084042.7690-1-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Date: Mon, 07 Dec 2020 13:59:14 +0000
In-reply-to: <20201207084042.7690-1-cfontana@suse.de>
Message-ID: <87czzlhg3q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> cc->do_interrupt is a TCG callback used in accel/tcg only,
> call instead directly the arm_cpu_do_interrupt for the
> injection of exeptions from KVM, so that
>
> do_interrupt can be exported to TCG-only operations in the CPUClass.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

