Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF344601BC
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 22:45:37 +0100 (CET)
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr5Vn-0006dS-Le
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 16:45:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1mr5UZ-0005xW-I0
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 16:44:19 -0500
Received: from [2a00:1450:4864:20::42b] (port=33356
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1mr5UX-0006Uy-5n
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 16:44:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d24so27169984wra.0
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 13:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:mime-version:from:to:date:subject;
 bh=BwV+1K9KLNajRlmXdnWWSF8L4yvCeijv58dGP1iZ2gI=;
 b=aFydaIc2F7Szen0CUbmwKu58cO7MMJR8DugrykBgorl07NsX9T868cY2naYMB5caKx
 HgOrAcbfyL1+HP+en0+ZXootgaMiJQaY73A8YhlUYji6ttfIqj6vjdjoGdYmCxDWgGT/
 4nIzf17SHcMTQmCKSyqJb+RmgZE5h68AQyc4uPqGSBWwvlhouHijOp3L1JihYbQheD68
 vuPj7Ii6t3YdS9iIqAAOc0KoDNiIIYMAfumreMyw9iuQwHl7/2kEUamB9m8tR7oBtT9W
 wNeXLxb9x0a4UL0MkOK9QrB8dpk60uSk1f/dSsx+Rpinx9dOrXWdaRGMygwggOf+PYOv
 TDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=BwV+1K9KLNajRlmXdnWWSF8L4yvCeijv58dGP1iZ2gI=;
 b=dczzeHvhnsHiVh3EDeTSSEJXQJsP5Px+du7b+/gFsuUIGoZ404CdOthFxF08iX6YVu
 brJURSsgtNuxmZyw59ifSroM//rz6oD0rMDGGh4HOXvNuJXa4jrXaCse3vh48xD8S7rc
 kDszDpftmfEvLne1ypRCacN1i8sXT7c5nvexZyAWFlAm2IspcKpl72BlCfNpylHc4+C8
 dpI/C0qU/gUNxTN5hdEsTxpmtPMCUAvDYJAbGaZXG7usH8XdnVwJ8ku2iY47CQhY6yoF
 c2XN2+DVYu3tRo0dN7/G287ULg6uVVUbSwwU5h1GCmrUcVzKO+mjqL+AeQDgqoZHMwYf
 zL1w==
X-Gm-Message-State: AOAM530f0yfuH9IOrnTVh3QYXpnmdO5WdYh3c4Xto6gulYQBFrU2+5pJ
 N5Qu2lfijbo7l3Iq2z0JXzrkmttAHWY=
X-Google-Smtp-Source: ABdhPJx1NXVwbxZjxYh9KXQPC+fUkIgS+eI4sRIrGAkg/MHZPR5weW9uULYz4dKJdmiAt+i69JcUZw==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr23592539wrr.58.1638049454100; 
 Sat, 27 Nov 2021 13:44:14 -0800 (PST)
Received: from [127.0.1.1] ([197.58.98.42])
 by smtp.gmail.com with ESMTPSA id y15sm11667393wry.72.2021.11.27.13.44.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 13:44:13 -0800 (PST)
Message-ID: <61a2a6ad.1c69fb81.d9a4c.da98@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============9178170447988282068=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 27 Nov 2021 23:44:11 +0200
Subject: [REPORT] Nightly Performance Tests - Saturday, November 27, 2021
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, MIME_HTML_ONLY_MULTI=0.001,
 MPART_ALT_DIFF=0.79, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--===============9178170447988282068==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2021-11-27 21:35:01
End Time (UTC)   : 2021-11-27 21:44:11
Execution Time   : 0:09:09.679515

Status           : FAILURE


--------------------------------------------------------
                  ERROR LOGS
--------------------------------------------------------
2021-11-27T21:35:02.042294 - Verifying executables of 8 benchmarks for 17 targets
2021-11-27T21:35:02.044552 - Verifying results of reference version v5.1.0
2021-11-27T21:35:02.060658 - Checking out master
2021-11-27T21:35:02.445242 - Pulling the latest changes from QEMU master
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:35:03.576900 - Trial 1/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:36:05.421731 - Trial 2/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:37:06.150805 - Trial 3/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:38:06.984661 - Trial 4/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:39:07.714521 - Trial 5/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:40:08.341699 - Trial 6/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:41:09.066812 - Trial 7/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:42:09.799084 - Trial 8/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:43:10.933260 - Trial 9/10: Failed to pull QEMU ... retrying again in a minute!
fatal: unable to access 'https://git.qemu.org/git/qemu.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
2021-11-27T21:44:11.661151 - Trial 10/10: Failed to pull QEMU



</pre></body></html>

--===============9178170447988282068==--

