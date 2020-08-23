Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B624F004
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 00:03:20 +0200 (CEST)
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9y59-0004Qx-JB
	for lists+qemu-devel@lfdr.de; Sun, 23 Aug 2020 18:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k9y4G-0003tl-HN
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 18:02:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k9y4E-0003J5-PU
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 18:02:24 -0400
Received: by mail-wm1-x32e.google.com with SMTP id s20so1542053wmj.1
 for <qemu-devel@nongnu.org>; Sun, 23 Aug 2020 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=EZmyqYw/qy2S6hzK17HVXUf8IP+GEqjAPhQzL4RiHkA=;
 b=nvN09JSocDUndyEMmM9Xa5D8Z+PCtsVLUY+wJsXs6SSC635U8tTmrWvGCRoLCr1pVF
 o2uwVSaQP4gy1C7XqxBqCebd34igrGgAYnJf658XWH5ZGjrCLPYSXKflKdcGYB+XWNjj
 IIWb/ty1Aue0/46j9f3PQmbltrxuIH1UT2ygmt5/I70UnI8xpk6Z1GOcJZB3qaR7QGkA
 WQ84aZhVruPxisv8SB0tdA/p6SSUyrnJHFgaRI4/WNTh7cUQfxlQ8Qgw3ayT4g3sB20p
 72OjQZ/AFY8ha1/0VY/xLVJRWk7aBALIYDEdsp9hRc6kww4epkwwuWw2IB2x07mgBT4X
 h+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=EZmyqYw/qy2S6hzK17HVXUf8IP+GEqjAPhQzL4RiHkA=;
 b=lSpXJplhvfyp2nM2pEUMidxvDCKpEmHwFPFCGJ4OWSzQnioH6wXmSnWyTeliih72I5
 SOLe9901OVVI3vwGY/bw6ZEsTGng5v0Y//nrf3ZROhSmL1Gazzszs6rzuUFNgaKanh22
 r4wVz71dScuDS8a09BrKGhM/MdIkxEegF/2dLjktXkNVhGrcbgNQP0mSUAYBcGCL68mK
 cu4aU9PTr1yv4XdaXlgqsRRU49R2n0laioyJNl2IEkxqxKga150qIL1W1StuXWb0jTU1
 9MuvMxmPI2bNcpBILCjEZw3RChpNduCkS7p/2A+k/cOHOB5MOQqwfrSjVWdrUPSkl7Aj
 +k7g==
X-Gm-Message-State: AOAM532wzhXyZuCJxCOPazUwwki9yY++S8XQxLihzuxFkvKUrwMEU/Yc
 g9LEumUbbOLk9CvfdplDIWB+bmDIid0JFQ==
X-Google-Smtp-Source: ABdhPJxX2nhBqEAq5t6VNQGF+Dt81+p/DF+0Kkw84xHAc3CLWnZUUzjQGEvenAG/oO7bAdXokC5GGw==
X-Received: by 2002:a1c:f207:: with SMTP id s7mr2789292wmc.22.1598220140255;
 Sun, 23 Aug 2020 15:02:20 -0700 (PDT)
Received: from [127.0.1.1] ([41.40.228.169])
 by smtp.gmail.com with ESMTPSA id o2sm18859859wrj.21.2020.08.23.15.02.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 15:02:19 -0700 (PDT)
Message-ID: <5f42e76b.1c69fb81.c5c4f.9a40@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============1268039215053859817=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Aug 2020 00:02:16 +0200
Subject: [REPORT] Nightly Performance Tests - Sunday, August 23, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, MIME_HTML_ONLY_MULTI=0.001,
 MPART_ALT_DIFF=0.79, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--===============1268039215053859817==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-23 21:30:02
End Time (UTC)   : 2020-08-23 22:02:16
Execution Time   : 0:32:14.028460

Status           : FAILURE


--------------------------------------------------------
                  ERROR LOGS
--------------------------------------------------------
2020-08-23T21:30:03.149828 - Verifying executables of 8 benchmarks for 17 targets
2020-08-23T21:30:03.256787 - Verifying results of reference version v5.1.0
2020-08-23T21:30:03.522675 - Checking out master
2020-08-23T21:30:07.340980 - Pulling the latest changes from QEMU master
error: RPC failed; curl 56 GnuTLS recv error (-54): Error in the pull function.
fatal: The remote end hung up unexpectedly
fatal: protocol error: bad pack header
2020-08-23T21:43:32.047625 - Trial 1/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:44:52.183570 - Trial 2/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:46:12.285963 - Trial 3/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:47:32.368841 - Trial 4/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:48:52.473741 - Trial 5/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:50:12.584987 - Trial 6/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:51:32.688082 - Trial 7/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': GnuTLS recv error (-110): The TLS connection was non-properly terminated.
2020-08-23T21:53:03.538585 - Trial 8/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
2020-08-23T21:54:23.661134 - Trial 9/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': GnuTLS recv error (-54): Error in the pull function.
2020-08-23T22:02:16.671699 - Trial 10/10: Failed to pull QEMU



</pre></body></html>

--===============1268039215053859817==--

