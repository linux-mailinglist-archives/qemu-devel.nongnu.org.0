Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E578248FD5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 23:03:12 +0200 (CEST)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k88lC-0007AY-Nr
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 17:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k88ju-0006OU-7O
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 17:01:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k88js-0008Dk-9h
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 17:01:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id c15so19488280wrs.11
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=rM/ojdPyl5aZ9SsG0TIvRRvPi1FCTExRuSOwEBO+DY0=;
 b=Rr+F23WPqMpwPH7layZhNNY/KFmwOID6Fvgnam5LmcHNjToXfIXJ+5srcuUhglhTQa
 U5YXeTTC2PXCp1iRvdfM/izqwObD6CAs/HBmOsiuUKuCBtUz+ogJACu75MGS6gSdS/im
 Mjk0fnvwnk0VV6qHZWv/JPP8pTNb1MuLjURz9fbxlk5MheBfPnVZOW5x46CG+o2/9K/G
 81BzALBPl5a5DA0zHx0wxASRo4aubbkaWKSrvaBG/DR4DhM8uC7N7wVjbM6DrBZEyCHT
 teb+m36bYEMrPc050H0uDW0R+IHdkhT2dglIHLHOi1RyXEJ08f9jH9ws6purqlx4F5Kf
 4jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=rM/ojdPyl5aZ9SsG0TIvRRvPi1FCTExRuSOwEBO+DY0=;
 b=Bjkx7i3aZw4OZImiFhLjfrHMWPXb98+NPpy9kc1dZPA7yjCvuIFNdfRLsyXNRLcNjB
 N0jrVRkJjyRcxz1YRIzi5jukTVFNSD7Q74Vk9LBf8GqqXFewYomimwrHgfAIjl6Qt7pz
 rRCpgjieSdqWqLBTZ7knTS42yqiLvIoD+KZ9sSINmRrL7o4Ufa28AZiWN23WnfOxXGmc
 YwdsPwIoEOROHPMKOUVqc3N/18BLHrZ9t2cQQGYo7J0ExCEdf3Pc5eULds+tRDufRoiZ
 zguU354Tj3uYt3803uMunfPoi+rDVbOekIA21LhSbGlZ14jZF1OUh3aymLq5NIEojhPm
 19Tw==
X-Gm-Message-State: AOAM531VjsBf6Hj2IinxAEeaMFseW1GSFvEpGUWE7z9bEqZUVGybYkBX
 gZU9LX2DV6Q+G6Qqa2NHu5ElBqXX//s=
X-Google-Smtp-Source: ABdhPJzOzoEbxo5rKeBkLy1T7hd2UBoKi2I9l0l8VaIMYnNGFPXIDP8deDROeUGF36Js+/MLNVHRvw==
X-Received: by 2002:adf:ba10:: with SMTP id o16mr17093018wrg.100.1597784505783; 
 Tue, 18 Aug 2020 14:01:45 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.166.30])
 by smtp.gmail.com with ESMTPSA id h189sm1745680wme.17.2020.08.18.14.01.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:01:44 -0700 (PDT)
Message-ID: <5f3c41b8.1c69fb81.392c2.572a@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5605975711626623310=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Aug 2020 23:01:21 +0200
Subject: [REPORT] Nightly Performance Tests - Tuesday, August 18, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x429.google.com
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

--===============5605975711626623310==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-18 21:00:01
End Time (UTC)   : 2020-08-18 21:00:11
Execution Time   : 0:00:10.419271

Status           : FAILURE


--------------------------------------------------------
                  ERROR LOGS
--------------------------------------------------------
2020-08-18T21:00:01.542176 - Verifying executables of 8 benchmarks for 17 targets
2020-08-18T21:00:01.545389 - Verifying results of reference version v5.1.0
2020-08-18T21:00:01.552203 - Checking out master
2020-08-18T21:00:01.876017 - Pulling the latest changes from QEMU master
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': Could not resolve host: git.qemu.org
Failed to pull latest changes in QEMU master.


</pre></body></html>

--===============5605975711626623310==--

