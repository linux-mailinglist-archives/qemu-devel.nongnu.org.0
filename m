Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6591579E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 04:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNprx-0008Ih-Tt
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 22:30:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgh8183@gmail.com>) id 1hNpr3-0007zp-1E
	for qemu-devel@nongnu.org; Mon, 06 May 2019 22:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgh8183@gmail.com>) id 1hNpr2-000602-5b
	for qemu-devel@nongnu.org; Mon, 06 May 2019 22:29:17 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:36839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgh8183@gmail.com>) id 1hNpr1-0005zg-Tv
	for qemu-devel@nongnu.org; Mon, 06 May 2019 22:29:16 -0400
Received: by mail-ua1-x934.google.com with SMTP id z17so5450876uar.3
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 19:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=9W+pa9XYqTKOzskvXkwvfx0Urv0bMigNWXPHp6/rsm0=;
	b=ckvGRAbj02Uq5DJevtu6qMG8+//+V3vp7HAUrGymLbVA9uCl3tsBotdwkOTRdqIeWj
	7H+ABDfwf+fOVY+FsjH6xlZl1NMoTu5udtw3Z8IbO8SPRLswvt9NE8sng23KcoQcaQhG
	fclhdXfU1OgelZpWrwbn/jFLxNyfa8Se2eB/wsTM2aT/adSZGUOqF0NOa6tLh3GHTxwx
	QFn9aHITCqNAMzpu89nEfNMdiupfBEMdGJn3vitb4g1JdwDbSdQup6BnnjrjEW0Ogj/C
	+XPHU+2DohQIlItysaL/LZUi9UYMk2NSN6uxbkUtN4UruBL8gixwTuaeAt+TVt/GJmF9
	BDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9W+pa9XYqTKOzskvXkwvfx0Urv0bMigNWXPHp6/rsm0=;
	b=jErekwtESy5ae7yr5P1GZcQKAUwpKsoHx2WK1BdLmzwMPw4CFDTKQDxjK8jHuC9Krm
	m35JPLPB3xzM2VRyA2A3PNWHFMDNwq+BISDsLUSTj0dk4Km6QG2FusoKYaiCNQnJVV2V
	BKiPvGboEvA8VmV6ljCnapYM77b364fIwrluoSwc+wFbAw2Z5AunAZX6N+VPZuMgb1JO
	5rGj/7dbwfUGe5ocNrdRVNiCZIa4b4FxYx1t8QiTs1lVO7L1VSV+ysveClQwJca5kYCJ
	E5BMq1/mXKlgeNV1BLIDFUKu2Peii945L0T1OyF4v0SWRAXGc8xGzfwbyrNyCABCkeR7
	uH5w==
X-Gm-Message-State: APjAAAV3cIYtDWhjUwmhSbNiJmGwTuNt9yb2eYQ8zF9myyelzRzZZ5Gu
	UKgEJXZkFLAqX01NCaaBnDFp/uPqTprJVn1fQSvk2HFalN8=
X-Google-Smtp-Source: APXvYqwuzrxQYIaqfTTo+k9AVclqxFdkfPrUqZPkPTWjf7dtdV9qkuyt6FjHUlNjTfnXSbc3+CwqhXHYgqcSzfqWI1U=
X-Received: by 2002:ab0:20d7:: with SMTP id z23mr15250539ual.51.1557196154084; 
	Mon, 06 May 2019 19:29:14 -0700 (PDT)
MIME-Version: 1.0
From: S KH <sgh8183@gmail.com>
Date: Tue, 7 May 2019 11:29:03 +0900
Message-ID: <CAE519-nz3KE2GcQCj_4Ufs+ZR_jKwoMDpdrZS43bbZ_SxSjHeg@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::934
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] Question on QEMU : How to record debug log in VM of
 QEMU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a question I have encountered while using QEMU.

I want to compile the source directly rather than through apt or yum and
install QEMU and input the output statement to the source to check the
output value.

When I compiled QEMU using dpkg-buildpackage in Ubuntu, I verified that
when QEMU's VM is executed by inputting and compiling the output statement,
the output value is recorded in the log file(ex.
/var/log/libvirt/qemu/win7.log) of that VM.

In Centos, I tried to use rpmbuild to input the output to QEMU source,
compile and check the output value. I confirmed that the log file is not
written, but I have confirmed that the output value is rare from the
terminal during the compilation process.

What I want to do is to get the output to be written to the log file like
in Ubuntu.

Thank you
