Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78342AE362
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 23:30:42 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcc9w-0001Wq-ES
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 17:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcc8a-00016D-CJ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 17:29:16 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcc8W-0006K8-NC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 17:29:15 -0500
Received: by mail-ed1-x52f.google.com with SMTP id t9so151283edq.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 14:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7pglfvj1+wi95YaZMLXQhxuY0LIcd+tDryr9hg4PVQ=;
 b=xN+n6LjRNAvbL57JQbuJ9QGAtcVqMek9ZBWXRtd1e46Aq/ymOAd7Oxml83BIGRao4Y
 D37mkEkUvdmG5srDimf0Y1npVTUtURBrr/h+g1OUJ1EVeInhYgU1dtfwwah2AE9JEwjv
 OAvEdtjztf+xmeP58WtP9H433fM/qZX7PTFDht3jvm6iYmizFbjjGmLJeXL9BcpHBFu2
 ExO/d4ZzUNOlHBzqE1c+CNCY79zPAIWkUtc4WS6oJqZG8hLPhycxZPxB085M5FCznhah
 TxueUTxdOicMDvkOjk1hqIKxF2ypcsXRBOyXrbcxxZWkeQlazMmAn3Arog9xt25m66v5
 ddbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7pglfvj1+wi95YaZMLXQhxuY0LIcd+tDryr9hg4PVQ=;
 b=XuvulFyJt7I9yNBTFzupo6ogIT2lqtpI5Lx65miDvGzEANgB7p7tbFjf88k/2ETGeT
 sRxzW+3PjSnMRUiHd1zDW2Th4FY55FLBi+aIPZxtiODv9UZXlKrCeyVkxbIf7+y+LNG1
 oDmwKgJ3fdjq63GiX6A4Bto+cHO2Pj2OP18Ugoz0bP0LAS5oW5vB3IUZi6xfWkavqzFA
 kN1Y8KhNi2KExSgXJBKOSYR1tPShHQJp2P8pXsu+lM04RCrFby7IQM+j7thxLvbUrEM0
 eXpgnPUStEuHIFajbB6M4eoxkc4jv6pEVt9pi85UIB5nNnApWnaABTusaR9CqQJp9GmD
 2c0A==
X-Gm-Message-State: AOAM533tYnKouIkbMl33mYZwNVo92RHdi5eiNLyb0Jiql3bMTulzzLaL
 8YFFrkd3Kq7jrrZPrLhtgOAgRe6RFCwnOXyUNOg6Dw==
X-Google-Smtp-Source: ABdhPJxBxEwwDU1fJ0Lf5WIr3SSo38W4wc9DyJ8SSiJccgS03nNN2sohWvu/5Zgo81U7fvLFw+GmZmQcMehrvyt4mUo=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr1758669edr.36.1605047350821; 
 Tue, 10 Nov 2020 14:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20201110112909.1103518-1-pbonzini@redhat.com>
In-Reply-To: <20201110112909.1103518-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 22:28:59 +0000
Message-ID: <CAFEAcA_uqc8mdRaj2T7399LcYPPzYNR2p_cU-kP-odDz6LMihg@mail.gmail.com>
Subject: Re: [PULL 0/6] Misc fixes for QEMU 5.2-rc2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 at 11:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 3493c36f0371777c62d1d72b205b0eb6117e2156:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201106' into staging (2020-11-06 13:43:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 6e853291036573c8831f486fc7d76b779b0ac567:
>
>   pvpanic: Advertise the PVPANIC_CRASHLOADED event support (2020-11-10 06:27:17 -0500)
>
> ----------------------------------------------------------------
> Bug fixes
>
> ----------------------------------------------------------------

Fails "make check" on all platforms:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/home/petmay
01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386 tests/qtest/pvpanic-test --tap
 -k
**
ERROR:../../tests/qtest/pvpanic-test.c:23:test_panic: assertion failed
(val == 1): (3 == 1)
ERROR qtest-i386/pvpanic-test - Bail out!
ERROR:../../tests/qtest/pvpanic-test.c:23:test_panic: assertion failed
(val == 1): (3 == 1)

thanks
-- PMM

