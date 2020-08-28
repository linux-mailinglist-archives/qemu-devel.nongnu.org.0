Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D85256283
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 23:36:57 +0200 (CEST)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBm3N-0002U9-19
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 17:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kBm1x-0001gw-7w
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 17:35:30 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kBm1t-0002lp-7b
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 17:35:27 -0400
Received: by mail-ej1-x635.google.com with SMTP id a21so1030788ejp.0
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=aYXQLVT5nIkA6AwuikVD5bCzdM2jiuGuocvfScBdnGY=;
 b=XSh/cbj9y4ticzkTC2/PO60AjKOe5dnbAlzD2xg/gXlGAMj/EAwzezookb4hznIe36
 xfD4DaLI5ytExv5a8N2Tl2/UJjgYoJ6KdlinwRfAvTssyimjnnudbG+1Lc8z/aBlSoH3
 420w5pf1CxoGGNHgIsSow3zxnrdSOi356jwH8EwgJSN2/3Yu4ysOtcHVbfyRs2Y6q9Ei
 2yCb7N0UUeq19b/kEAUqAwkmN9dDQO7vrkFvOcwH5davZpJQJHJxXjdQeEaPRKu/3Y0M
 O1wCdGyfboHI6FZSK4zefIx/xoWs6Lk6U16TvB9BpsLcEdmGnRzApDcF3hkivAClxEXQ
 TWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=aYXQLVT5nIkA6AwuikVD5bCzdM2jiuGuocvfScBdnGY=;
 b=NGUbAsIUSDgznYV1KILMH9vMcXNMHttQRqQsLusM+m+YfQMM0PjAX0EBVN3KL8X6Tq
 baRroT7y25RTCfxgP0fKOW7RTjwfsKhsz+ZzUj6jXWaTFPJOKKoWfbJRGGdLagZt4u47
 6AA4DYjOIOb5uJiLvmq0HNtkmF8nLp0S/BiOogpsrkEgbS7896TZ57c/P4tCp/LGAPB6
 zoZqYC1GaMdJwnwllWKUAUEhWDXhRQx9NDaaSsqCbVXYFxx+XA+XHzPjK7UFw7oWRf+8
 UDbapIRCFj6WiK69+/PUyEe00K+0Icx3rnDHTVXXkRsqzF0PpsTG+VojZ9zIhW483B+j
 iTNg==
X-Gm-Message-State: AOAM532akQidI8pGS6AnqU5IdSLgFcDV6r/UKuKWUImnWHVhR67dDU/h
 wh3lkqsyqIHblgBiOE9gr5FcP3Tm0q9UyQ==
X-Google-Smtp-Source: ABdhPJzZ1VYybi0UTVlO2EmlLz3Smc2kkJXcam+NsW31x37Ape5BWKbiCnDLJOFE+8j7WqWglOzEZw==
X-Received: by 2002:a17:906:710b:: with SMTP id
 x11mr770696ejj.546.1598650523330; 
 Fri, 28 Aug 2020 14:35:23 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.77.158])
 by smtp.gmail.com with ESMTPSA id bt14sm373931ejb.2.2020.08.28.14.35.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 14:35:22 -0700 (PDT)
Message-ID: <5f49789a.1c69fb81.c12aa.0e95@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============3854100496081697164=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Aug 2020 23:35:21 +0200
Subject: [REPORT] Nightly Performance Tests - Friday, August 28, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-ej1-x635.google.com
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

--===============3854100496081697164==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-28 21:30:02
End Time (UTC)   : 2020-08-28 21:35:21
Execution Time   : 0:05:18.871569

Status           : FAILURE

--------------------------------------------------------
            SUMMARY REPORT - COMMIT a4e236b7

--------------------------------------------------------
                  ERROR LOGS
--------------------------------------------------------
2020-08-28T21:30:02.254226 - Verifying executables of 8 benchmarks for 17 targets
2020-08-28T21:30:02.258421 - Verifying results of reference version v5.1.0
2020-08-28T21:30:02.278698 - Checking out master
2020-08-28T21:30:02.703788 - Pulling the latest changes from QEMU master
From https://git.qemu.org/git/qemu
 * branch                  master     -> FETCH_HEAD
   ac8b279f13..a4e236b7d4  master     -> origin/master
2020-08-28T21:30:08.254973 - Running 'configure' for master
2020-08-28T21:30:24.336578 - Running 'make' for master
2020-08-28T21:32:14.504346 - Measuring instructions for master - dijkstra_double
==15118== Callgrind, a call-graph generating cache profiler
==15118== Copyright (C) 2002-2017, and GNU GPL'd, by Josef Weidendorfer et al.
==15118== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==15118== Command: /home/ahmedkrmn/Desktop/GSoC2020/tools/qemu-nightly-tests/qemu-nightly/build-gcc/m68k-linux-user/qemu-m68k /home/ahmedkrmn/Desktop/GSoC2020/tools/qemu-nightly-tests/benchmarks/executables/dijkstra_double/dijkstra_double-m68k
==15118== 
==15118== For interactive control, run 'callgrind_control -h'.
==15118== 
==15118== Events    : Ir
==15118== Collected : 4294020686
==15118== 
==15118== I   refs:      4,294,020,686



</pre></body></html>

--===============3854100496081697164==--

