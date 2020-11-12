Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5632B0C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:11:01 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH3k-0005ai-V8
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdH1q-0004BB-5C
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:09:02 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdH1c-0003sL-A0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:09:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id d12so6957497wrr.13
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=l/SCvrc/uaS1T56OQ9qRHmYda83k3s5oA5ClepQguiQ=;
 b=LPpZ8qZY3G2LVXp/lARTPmGCFjay+uPpbsRjhOx6mB5LRZ1kOEELhkWkinsOc4UJv7
 k/6sl/BL+UBpl9fFxQ2mBXn6tSFdGz1I1eWUGQIdrsJ5efoxGqwLFZEm54vgKUDh7r/u
 qJc5wHredgC8ZSe0hhyyRkY6zhU/GkzgEypYSuKhgSawXYHglK5VFXh1ihCDvN6Lr1lB
 AekJsPrUgfLBTw7AqHoelDnTUX26kM84F1CfJY9JTzhDtKGBmQEd+L2iTL/SB046gmbl
 /8sYC7NqD8XLSEq2sGmWNUWYla5QSJIUXt8ZQcVhFUOPVrYIV66Ha83DjB9OLRat2CuX
 U/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=l/SCvrc/uaS1T56OQ9qRHmYda83k3s5oA5ClepQguiQ=;
 b=ubZVjTow/naq1/O+UIIaRHwQM56/lSIIHjkedYJK505rTmtLFe7AP9gFAHubeieoDT
 HBhVMQU69VVB10NMMENMLnFmx3TR7h32IEwRwdfQ7KeKex9H85ZSlLLJbr/jr7VWsGjv
 NEV6Yr7m8SjNtzjpR291HBMAs4WQdUzHaMCq7zc4UVGHyj8EeUXnJDdM3cm8EGporkYQ
 y8flSt5sKQWxkJ+aExKx9G7M1ZGjNjXKklIcoEF4FNF0C4FHN0gyTYGMlWiuMNY5KCwF
 W4YdGSvxYX08AhcArNzyA0qWIXm1mhPGltWPIPYxETf/fuDaPDD7ouxlUV9BufjOKXdx
 ZXBA==
X-Gm-Message-State: AOAM5329g4byh91WOCTetX4m/Gap9PEQC7PiDAXDhiMoxPtQyWB/gH8E
 8qU+bBJoRUaYQI3IgSu/0c0bDQ==
X-Google-Smtp-Source: ABdhPJxVKvzJnDEfx/kZFEz31YgNG/08AbnPhH/zc3njQAoaZ0MSAGIhDe3R0654ODBDChjXrcyQ8A==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr887055wrv.120.1605204521515;
 Thu, 12 Nov 2020 10:08:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm8258449wrv.57.2020.11.12.10.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:08:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E16D1FF7E;
 Thu, 12 Nov 2020 18:08:39 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-2-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 1/9] docs: Move virtio-net-failover.rst into the
 system manual
In-reply-to: <20201112144041.32278-2-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:08:39 +0000
Message-ID: <877dqq78ig.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The virtio-net-failover documentation is currently orphan and
> not included in any manual; move it into the system manual,
> immediately following the general network emulation section.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

