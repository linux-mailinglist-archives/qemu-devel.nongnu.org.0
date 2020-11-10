Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFC2AE3B2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 23:52:23 +0100 (CET)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kccUw-0001yU-Cd
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 17:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kccTa-0001RW-JW
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 17:50:59 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kccTY-0000Ry-J6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 17:50:58 -0500
Received: by mail-wm1-x342.google.com with SMTP id a65so4837872wme.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 14:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=x/V9naTMtWfdSNgCJaU/TEu58LtRnWAvWaoawgFSnuc=;
 b=flZR2ZtYNRtMQm1lqGLwO5HHPElcZeANqqW1hVYGISPdWHKYoP61qkXCxYSBuAw9GY
 FVIEIH7dCBN2SkLuFy1vBPsXjQvyGnyS1iG84NbtrbX1JW/kSsyMhxSLbQbLoCU3ysxY
 yxSmBIgein5f/pLwqQ89/tIt+fhc348SnQhPNUO8gfqt9NOw58ooo7tBm30nMQY1cpQ7
 zTdUSHh1OzpVwx2k2WpQJdt16H6pcQYuAMgE75m6HKuvSltYLOmUJt1VD0QA3wVYZd1N
 GSC3xjkJuskHr5XOjfCZHuahlbV1ePNJyBdx5fYq9G3HbXvhmYjQTRdyqYFKN4I9AYFY
 2uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=x/V9naTMtWfdSNgCJaU/TEu58LtRnWAvWaoawgFSnuc=;
 b=LCq2IbfHufHTXUJvIYHhH4q3jnaISLHryege1E2TuFVsjcPajwV/nvC/zZmf034wW0
 atrWyEcxZBUJYfBxCSrEXyQXC6ygqtz2NxUhQuIy3+WJ3jHT9/jKIEhwPhQP9pdiWisT
 HL0wPVOzqutcJTspvM7+45N6YHBBTPyy4laJ05t9m3jr0CQqIr/HRWxAWqyqeSq5GVec
 S3SYyONtx9eXZXr3huiAmMOO6x85vPDFggz/jXHpHXOs4I4WfB1FUZfKJ0TUFAIYBFrw
 znYNmSlqh6albkH880KNtw3fSBFPxvCxqdRtuDhvILLXYqRjxnSuOcM/7WSkr8GBeiXJ
 VL0w==
X-Gm-Message-State: AOAM533+WQV3rGkRK9ThalFEEe00WUcAQIU1vTxrEynub7XTXHFkZE7G
 YKV7+S6hRcqBNQfCusbZlx2hlQ==
X-Google-Smtp-Source: ABdhPJztMuNeukgs9gyeMNUd/EhTQCCMFfsOJyYha/NzGditvv6zXq4OO0JlRbkEzv1/bbYwO2apqw==
X-Received: by 2002:a7b:c2ef:: with SMTP id e15mr408747wmk.180.1605048654686; 
 Tue, 10 Nov 2020 14:50:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w21sm268944wmi.29.2020.11.10.14.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 14:50:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 119401FF7E;
 Tue, 10 Nov 2020 22:50:53 +0000 (GMT)
References: <20201110192316.26397-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v1 for 5.1 00/10] various fixes (CI, Xen, plugins)
In-reply-to: <20201110192316.26397-1-alex.bennee@linaro.org>
Date: Tue, 10 Nov 2020 22:50:53 +0000
Message-ID: <87r1p07rn6.fsf@linaro.org>
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
Cc: peter.maydell@linaro.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> This collects together a bunch of fixes for 5.2:

Doh, subject did not match body, I of course mean for the current
release candidate.

>   - a few resource leak fixes for plugins
>   - Xen on arm64 build fixes (from my larger Xen series)
>   - a couple of build and CI fixes
>   - a tweak to the gitlab status script
<snip>

--=20
Alex Benn=C3=A9e

