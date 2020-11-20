Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242F2BA311
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 08:23:59 +0100 (CET)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0ly-0003qj-7k
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 02:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cavinnarsinghani@gmail.com>)
 id 1kfzCZ-0004BP-Ht
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 00:43:19 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cavinnarsinghani@gmail.com>)
 id 1kfzCX-0003oB-KT
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 00:43:19 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y7so6774939pfq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 21:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=pTcaabNhKsxt9/yc7GPVO6UU4izvnNQSy0SFNxg5MgA=;
 b=bvBgvm4KRLlq1GlGeY9l9uVjc4JUxM20qab8/k6psS6DF9ZsGA7UZkFSQEt+1uCuLl
 nj51LEz9IszSngX2693afVcr48+kXYA14vcTGZI+FTCEAhtTMK4XFByPQJASncXJxpdq
 usDmsY+9Vz9O4qWE9qLnezPLFDNV6xVHxycRdkWLAjsMjrn2cNfUbIDbZBsWu0FixsBP
 jJsUI/Y4DshKI1xxyHtX9zNMDIJK4DaG1aB3Dd3pQaIUSa5ocqDvtcERpRHtwKGUWMqO
 CBUxVTwE0o3C+npHipb4c4WJHK0CqpkRHutmKTUWkyeVwDloVKUmmwWs2+LXKVZXgBtw
 5AbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=pTcaabNhKsxt9/yc7GPVO6UU4izvnNQSy0SFNxg5MgA=;
 b=PDN+rquTrO5sc0Nc5MMfcf4qm9snhQwsCqRplg5Y3BXER6YGU06WC0fq/s7Lcn0CIQ
 nzxUAF9XqvcTqa/uIenQbicSkBrBYCOE165KThS90B8nw/u5kM2cu9DvU3Gaepnzgth7
 8+NPox+wDA+ATyoV7ORI2Ng0yBdVOo8uhHzXcnnvIZGil6UFqkJZe7dRwiapzUcWRKn8
 3LHj/i60463UnoIUQpfdguANOPTy+9sDRfVe38DFOOG2F7kUdDs+5iboPIzRA0roHvI1
 5Uvei4hbLNSOqL7/XaY+37DohzFiVcy8jDQLnPk2wAM/6XFOk0bsWl8oJNL2AQCeoErt
 7+TA==
X-Gm-Message-State: AOAM532AwJciQcCW+vVHy3SXQLpMgkRTYOfDuVBj1qu8BUCSK05vsxHF
 7s9qKEWDgof0Iy2algS9lYR6I8vooaM=
X-Google-Smtp-Source: ABdhPJzhR6LPZYAeH3X/58ro4qTy/7AoMGHeUDlKsV7AYWnyLdeikNYBTsK5awejsRbmgqtqqiuMyg==
X-Received: by 2002:a17:90b:1888:: with SMTP id
 mn8mr912857pjb.158.1605850994991; 
 Thu, 19 Nov 2020 21:43:14 -0800 (PST)
Received: from ?IPv6:2409:4042:2e14:63e1:781c:f507:809e:24d0?
 ([2409:4042:2e14:63e1:781c:f507:809e:24d0])
 by smtp.gmail.com with ESMTPSA id y1sm1928120pfe.80.2020.11.19.21.43.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 21:43:14 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: cavinnarsinghani@gmail.com
Mime-Version: 1.0 (1.0)
Date: Fri, 20 Nov 2020 11:13:10 +0530
Subject: Peter Maydell
Message-Id: <5A06DC2D-E6A3-4249-B05F-A424D684BD26@gmail.com>
To: qemu-devel@nongnu.org
X-Mailer: iPhone Mail (18B92)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=cavinnarsinghani@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Nov 2020 02:15:22 -0500
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

This issue is about the Qemu 
Will the Qemu work on the new m1 macbook pro? 
And if yes, when will the arm version of Qemu be available for public


