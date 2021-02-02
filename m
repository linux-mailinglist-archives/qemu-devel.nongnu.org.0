Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7B30BE48
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:36:34 +0100 (CET)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uv2-0000j0-Ur
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6utZ-0008BM-RT
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:35:01 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6utW-0003MX-TK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:35:01 -0500
Received: by mail-ej1-x630.google.com with SMTP id rv9so29649661ejb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jS+9uPogYfKBjOSj/S/U85UiIl5J/YQsJqn8NmntfqI=;
 b=e/dUstsyp0eZH7hXeTrBSjf6YlOfpGMYr+xeSmEG/ZDTEh6SnYKLRBz35k1MmLE5x+
 UXIXaN/hUZ8YlMvZRRB63YCSmGt5ev7NeA7iyrIl5em4f1MBObQAwFO6m5l0FUfiCy5K
 qMq1ecYu/BLRxo7iOqUKBJK7wL1ETtPCy5UfXEzeYyTnBFiL6y8Wapd1dj8r5E1WtT1Q
 z2cZqGqgZeXuEwU38fts2881yWYgFPTmcw3uVRHUB0nBRXcmHQ05sx+OTKvqoXz5hXqJ
 Q/ortuEHxd4Ofom8ecrXET91z4Ayvp1q7oFaU+BXkhBlfe4kqolF7buaBkOVv2IDcq6z
 x//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jS+9uPogYfKBjOSj/S/U85UiIl5J/YQsJqn8NmntfqI=;
 b=W5Od3l4zQBNXqQkCibrqiJkFYh9sh3vwXhTes8davPw67wszEWa3KsjkJu2nb5729n
 ZJQJVNxv8thbaAafJyNc1wMUOyxoT/wGxYqP9kBZGTuqOOp6n18geJ2uAsOnA+CAlLCs
 kzGQ2qcluvNXwWv9U9Rlvoh807yXgSPObl/duTr0Rs4DHSUXZuLJr+smrQOa3l0w+xdH
 IdOXWpqu+ttMW7pObK3ryrnK3O6BmrVHtEUMHf+gx81aMjwkuMenjcDKQnOcZ9rMaVC8
 s3ta5kGfD+lKmNzZdzSEuXQamhd0dUtPeElzWsBQIKshEQ8ZGikAlTVfCBLwRTpN9e3i
 7pug==
X-Gm-Message-State: AOAM5314fqi40cD99rf3ZQBihHSeCTYR1QIgd23u6K9xD+TaiLv70+Hj
 3McPuLOeLtgQugyOH+zvnKy+JPjWx2tatG/8mqjyZA==
X-Google-Smtp-Source: ABdhPJwViypjzl13meKRyXY+uiWrWcVMZEKMt8eAm8UZBVWvj6ieedqft1Pt2aPIjh7bm/eNIrMeZ3Eat9M4wFAcxlQ=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr22272886ejc.482.1612269297014; 
 Tue, 02 Feb 2021 04:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20210201190720.245732-1-kwolf@redhat.com>
In-Reply-To: <20210201190720.245732-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:34:45 +0000
Message-ID: <CAFEAcA9j6RV+-Ps6fUL0JSGTQHkfCUFdy1pyDCzYOyX=PwC6CA@mail.gmail.com>
Subject: Re: [PULL 0/6] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 19:07, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 74208cd252c5da9d867270a178799abd802b9338:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-01-29 19:51:25 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 47c9af7f4c78d03986aecc9afb0aab9b19d77cb5:
>
>   iotests: Fix -makecheck output (2021-02-01 17:58:49 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - Fix double processing of nodes in bdrv_set_aio_context()
> - Fix potential hang in block export shutdown
> - iotests: Some more fixups for the 'check' rewrite
> - MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs
>
> ----------------------------------------------------------------
> Kevin Wolf (1):
>       iotests: Fix -makecheck output
>
> Sergio Lopez (2):
>       block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
>       block: move blk_exp_close_all() to qemu_cleanup()
>
> Vladimir Sementsov-Ogievskiy (3):
>       MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs
>       iotests/297: pylint: ignore too many statements
>       iotests: check: return 1 on failure

Fails iotest 267 on ppc64:

  TEST   iotest-qcow2: 267 [fail]
QEMU          --
"/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-system-ppc64"
-nodefaults -display none -accel q
test
QEMU_IMG      -- "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-io" --cache
writeback --aio threads -f qcow2
QEMU_NBD      -- "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/ppc64 gcc1-power7.osuosl.org 3.10.0-862.14.4.el7.ppc64
TEST_DIR      -- /home/pm215/qemu/build/all/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpvthy7ogi
SOCKET_SCM_HELPER --
/home/pm215/qemu/build/all/tests/qemu-iotests/socket_scm_helper
--- /home/pm215/qemu/tests/qemu-iotests/267.out
+++ 267.out.bad
@@ -34,7 +34,7 @@
 (qemu) info snapshots
 List of snapshots present on all disks:
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
---        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
+--        snap0                 SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
 (qemu) quit

@@ -45,7 +45,7 @@
 (qemu) info snapshots
 List of snapshots present on all disks:
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
---        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
+--        snap0                 SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
 (qemu) quit

@@ -70,7 +70,7 @@
 (qemu) info snapshots
 List of snapshots present on all disks:
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
---        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
+--        snap0                 SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
 (qemu) quit

(snip a bunch of other diffs which are all the same thing)

Also, I can't apply this until the NetBSD "iotests 030 040 041 127 256
fail almost all the time" issue is fixed, because it makes that test
run fail rather than succeed-despite-the-failures.

thanks
-- PMM

