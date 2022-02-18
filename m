Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4174BC269
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 23:01:04 +0100 (CET)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLBJG-000173-Kp
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 17:01:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nLBHM-0008Qe-Sl
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 16:59:04 -0500
Received: from [2a00:1450:4864:20::534] (port=46938
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nLBH9-00042C-69
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 16:59:04 -0500
Received: by mail-ed1-x534.google.com with SMTP id m17so17623856edc.13
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 13:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qpAPHo2VT5qwo6dGAfprWCZ83YgJnkYKnMF6KG2AJwE=;
 b=Xqf/n7S9R12kqSvXMYPGtLeW+aSKucKEAWa7K/5ev1XPjiBAQ7ZUAlF0iOI0H3ZUU3
 3ciAbSfo11ouO1yK3GeLzuhcyW87F2FYW/5z+b4Dz7APUQG+/vC5NLKMK8wB7+08BDWy
 WDOc1sF9mQC57lBu/Q6lo4kBqRuwegItGiR9ZEakJuNlY6j7fahklN9BDdjvxHhLiCTd
 6oUk2/3uIELP6DrKtbb1sTOTJQuCzz9mtQrPSemDAenwkX91OVV5ZXlnohbUHZolgb8J
 inRoBeiROK7S6ah8KOtOyOASgKwnFBNrVaCIMHAd/ufR4H2Z5N5zvl8Lj2X0eWo6Gj2f
 r8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qpAPHo2VT5qwo6dGAfprWCZ83YgJnkYKnMF6KG2AJwE=;
 b=HQIIT6z8Eb+2deUXzJs0DY/0NKi0WX4UgZZDJJjq82lntCdxT/pTBSkZU5ph6zUYEV
 NkwCzgMZFBZG2JU1Cd8PxIvoLLuBgKm54sBXH0qCJhW74YbcwljdqUX+QZyomKa2+fVS
 lXwRpD4Ns+2pUztDrQDEx4Die8C7ZYDumHDwxRfmPvO7HKtn/bhokAV93+K/BrdQ6fsm
 ihGb4JNyPZOt2waEsb6cw+GlP992DH2uOcLQ1YZP8flVIU88/wcVC1GJPT84qMFyzcS0
 DbmQJS1Zx2zqoX5IkhMEEEBKh8bgs/2wzFkIpMZZgxLaO+VG1NJyBXNpnN5DiO1Hb0qB
 v3Xg==
X-Gm-Message-State: AOAM531pSqWece1AVj6mi2JSEaVzi422BYvatvU+0Sm7DB3Q7iItr3Nz
 eMai00EIIQLMg+FigxnCQIgQDhWn7kJwwA4nBJYi5IYL/1uLrQ==
X-Google-Smtp-Source: ABdhPJwsddCcvMR/wxyHuQtzzpLVcOk1q6P+YNQGV6Iw8/axT/oE2aF6owRtOe1usm7hWAz6l2puRKIGe0GSzszhkPg=
X-Received: by 2002:a05:6402:5214:b0:412:996:9ffb with SMTP id
 s20-20020a056402521400b0041209969ffbmr10021130edd.238.1645221523803; Fri, 18
 Feb 2022 13:58:43 -0800 (PST)
MIME-Version: 1.0
From: Joshua Seaton <josh.a.seaton@gmail.com>
Date: Fri, 18 Feb 2022 13:58:32 -0800
Message-ID: <CAPbYy+_XEvLYuPa5jgMde7YAgk2Cx4wDi=QnJiLn9zT5ALjROA@mail.gmail.com>
Subject: configure: How to pass flags to the Objective-C compiler?
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=josh.a.seaton@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi all,

How does one pass Objective-C compilation flags (e.g., a sysroot
specification) when configuring/building? `configure` exposes
`--extra-cflags` and `--extra-cxxflags` for C/C++ compilation, but
there isn't an equivalent for Objective-C.

In my particular case, I'd like to specify a particular sysroot for a
macOS build.


Joshua.

