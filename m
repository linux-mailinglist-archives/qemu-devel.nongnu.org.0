Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F8482570
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:43:23 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Lw1-0005KV-9t
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3Lv0-0004JH-WA; Fri, 31 Dec 2021 12:42:19 -0500
Received: from [2a00:1450:4864:20::434] (port=44970
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3Luz-0002nY-7A; Fri, 31 Dec 2021 12:42:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id k18so20273964wrg.11;
 Fri, 31 Dec 2021 09:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=2if3R9DA+TOXAIr9zervaqdIqJ1B+6O2/bLr/Ji83iU=;
 b=iW8U6dMCahFwcnhk3d50RSC/8NjBwODizx+s2w5lBl/D7GpgMB78GsX/smkTKeghPj
 6idasYY9gDn/JTUMtZJ6TOEcKsAsqpUsOzH8Rs2IKgcFu9G4F55i/ga5DcIbLt2og/FT
 s1JBcH8SGd6U3Czqkmq1jRH/f8RKs0F03XZoGSFYwm8+tS2bVH1PoynOQIzNIY5dJl28
 Xwgn1R+mVIo9Vjx1/1BWCsfx2KbklYExZA62Bg5dKrbdaeK6AsZNShLx9KON5f9sSHOZ
 XX+tubJhNbA/YlQnsKdKSsxSo8x15rNkk9kGKlGKmnKIAH/wRFnvvSD4DSZS/s+r4smK
 7XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=2if3R9DA+TOXAIr9zervaqdIqJ1B+6O2/bLr/Ji83iU=;
 b=Ky5y9ZrEN/N9bRBDQOxnU0kKjgFhs4HAEAjDtLKFdCymifUe4D+9zQI0Loz4Hg9UG8
 DC8rX+Ib1LfsBxcsKWW16ZQnN4YWgx3aw1KhkoSUWqiBjcxwv5nuMeknWz3f8HieFYhw
 DfD9sWlWoDXqF6Yv/P8gmUBJKBM5M2QTAwwmCzUT4RbIx7PPg1uCngFZA3to4qSiQOLG
 hzqkVdKjPtL1hJ3HtlCb5ToK0pd3VmQSb2YOAbWMkcYWMMZJtggeaFtA7CmGQj3gdYEq
 FEp/geRxiB4pniV8NYXV2CRYVdAplMfv3PeyouHGza9DC6NcFgNMLruR2MYNsheCh0C0
 MxAg==
X-Gm-Message-State: AOAM530uHlU+VVQCBdtcquHs9aPy46cyPgwg6cZ9Pi0bEYchbQ8lWSPR
 NUVUrdClwH7GBIi+uJD1WeFqWsCsFeA=
X-Google-Smtp-Source: ABdhPJzcBLYnOxwFzQl7KQvYFeYMH0leFFwynI4q1voR69mee/kVOdHTjG+iZQ/V6mGq6KjcQP37SA==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr28416050wry.489.1640972535505; 
 Fri, 31 Dec 2021 09:42:15 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id p13sm19762149wrs.54.2021.12.31.09.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 09:42:15 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
Date: Fri, 31 Dec 2021 17:42:09 +0000
Message-Id: <20211231174210.82446-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies for all the spam on what should be a simple change. Still
getting the hang of all of this. :/

Please disregard my earlier submissions. After further testing I
realised that the calls to cursor hide/unhide weren't balanced which
broke the hide/unhide behaviour. I've added an additional static flag
to track the cursor state so the cursor state is only updated where this
would change the existing cursor state, ensuring the calls are now
balanced.

Having made the switch to an M1 Mac I needed to switch from VMware back
to QEMU in order to run some intel guests.

This patch addresses a couple of niggles with the cocoa UI, namely:

 - Using command-tab to switch between the guest OS and MacOS sends the
   command keypress to the guest which can be annoying e.g. on a
   windows guest this may trigger the start menu

 - Switching between the guest and MacOS sometimes leaves the MacOS
   mouse cursor visible with no way to hide it without switching
   windows again

To address these issues I've made the following changes

 - Added a new cocoa display option left-command-key which can be used
   to disable the left command key in the guest. Default is on.

 - Added a call to hideCursor on left and right mouse clicks so if the
   cursor is visible after switching back to the guest a mouse click
   will hide the cursor again.

 - Also updated the command line docs to reference the show-cursor
   option which is also respected by the cocoa UI code.

Carwyn Ellis (1):
  ui/cocoa: Add option to disable left command and hide cursor on click

 qapi/ui.json    | 17 +++++++++++++++++
 qemu-options.hx | 12 ++++++++++++
 ui/cocoa.m      | 33 +++++++++++++++++++++++++--------
 3 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.34.1


