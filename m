Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048248ED46
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:42:14 +0100 (CET)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OiT-0003VD-CZ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe1-00086t-Nz
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:38 -0500
Received: from [2a00:1450:4864:20::430] (port=42496
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe0-0000c6-7h
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id k30so16225660wrd.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zAAnYJDmSdDlcSXt+uikxFStig4JaHzhYe8nFOo17wo=;
 b=dbvKTiVwFCN+OjNonw4y2Q72JzPmBdhwZCWepKjuxlFcqTGJnCgHKRrZ4Y3tsXnnjJ
 KHgxgSX8I5TRFtJEYcx2xVwjaJWrQQ20xAfcVTGWlnlgkGEEOSbK6H5mSuEKv7kaZZEc
 lZqDLLWKmI+B26HqA5qkStpoSUppMuvpipO1bd4YLGDJAZjszCxaXSaSPXMvBJ4pIPyK
 LtFbm+oIrKJqErnG/N5L0ssO3YboJv8H7rxoBjbKosHi8nFlpYDECaYF/zs01fLtYgvd
 ddKuZqVNfGAGyG3UOaklFit99yY+sjAwnF3886a5+LUmcVRdTIOjP4sukJyoxbEGVy69
 v6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zAAnYJDmSdDlcSXt+uikxFStig4JaHzhYe8nFOo17wo=;
 b=oJwCgEigBfdY1QJBHMp8LOjDT4SdUo3CHQNjlt177thv5jfgjpq5yqyoetN/3NdTWp
 LTTgyxgg450DHZgj6JJcvtyZDR1n9MTynr9SjUCwG2WDbqujmH+9gtIt1z8KuclyeZGt
 exiHGglDZrZfVljBtq+8Iw0lL5Lmg1GP+XekMSvpXL9T5vgQaJ8lFPwz2D+Df//YsMR0
 5xu+LjLPZOSCm3BtA6pghkSxCpvMkW38BBKn81fAEOEslOTLLV20jaLPCcmqyHCDDphK
 X8Z6sVo4IKutB/Ar5KVSE8ko2OIGxw85Rx4gEHXlw1zMKz5/5dr53nYC9K+moC0C1s5T
 FuiA==
X-Gm-Message-State: AOAM532WY7F75PSfbn9DyHcqnTctM4h3tWw/dXq3fTdu4UDiVQWt+L8j
 2weIaeLzswRw3thbMEr3+4EQqhK3F4D5Eg==
X-Google-Smtp-Source: ABdhPJxlEKn7GqG9zGofArL9WRYj+cm4DH/5jO0IFZ5f2unVJxilIQeVTMbjSksFx/bJ6p/grP5LTg==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr7939719wrt.40.1642174654540; 
 Fri, 14 Jan 2022 07:37:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v13sm6464141wro.90.2022.01.14.07.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:37:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] linux-user: Fix some minor nits
Date: Fri, 14 Jan 2022 15:37:29 +0000
Message-Id: <20220114153732.3767229-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes up some minor nits in the linux-user code that I
noticed while I was reading code to assist with reviewing the
bsd-user signal handling.

thanks
-- PMM

Peter Maydell (3):
  linux-user: Remove unnecessary 'aligned' attribute from TaskState
  linux-user: Rename user_force_sig tracepoint to match function name
  linux-user: Return void from queue_signal()

 linux-user/qemu.h          | 6 +-----
 linux-user/signal-common.h | 4 ++--
 linux-user/signal.c        | 7 +++----
 linux-user/trace-events    | 2 +-
 4 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.25.1


