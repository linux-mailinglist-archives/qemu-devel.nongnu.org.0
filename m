Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB400109D2F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 12:43:38 +0100 (CET)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZZFp-0003vE-Bl
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 06:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <randrianasulu@gmail.com>) id 1iZZF1-0003TV-Lf
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 06:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <randrianasulu@gmail.com>) id 1iZZF0-0005D0-GZ
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 06:42:47 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38230)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <randrianasulu@gmail.com>)
 id 1iZZF0-0005CI-Ab
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 06:42:46 -0500
Received: by mail-pj1-x1031.google.com with SMTP id f7so8178977pjw.5
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=YdZgW7R0bacaZayioL2ld1HXqecO4nU9BeEeU9TrxbQ=;
 b=uM0UoVNJdWsGlD8O4Z3EG293m2CDXhoKfnMxpGYOAHsbBmb++C3SupTCLIJq0J/XiD
 rl7H/y8Mlz8J08MzLNES3589cJvnsm0J05b8X8jmQSxknWot3Sg6ROA4DmTYmsGTB680
 SsnJuWg1MIqeBebyEuVyk2I3GUZR5N65jr99lI76Jd1kCdPyioxUtUh4mj/dSpY4ykOt
 zdCi1p1oR5CAfNpcIlSy705OvoKRufH4WnHtkZ5tyfmFOlWy4E042S8a0/FcPWbLiqgx
 UNstTvA14yz+1PJhOMDdADPgJuZGQD+1fE8sb/MDGoTF3PBQnsFJUc405Qvf0IDKmgMm
 xlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=YdZgW7R0bacaZayioL2ld1HXqecO4nU9BeEeU9TrxbQ=;
 b=uiURZCiXVt1+IQQua1gFjuc/YnTHzmnkazeGTB2cPVyHEtI3SAbkvemYr9m6GH4o5x
 o5dSHNO/TTr7/i/UlBtK5lTTMEuaatLVKW69mYDqOmfxZGhvXHK4TSNfekxTb1Q1ZdH1
 RyCN5hhVp2l+QJoGkIExcUl/XvaDrrampHTXeQNfp3/X5aXyKedqhtffyj5/LuhIfzZ1
 8LUnxclcgybYdcgEpTpRINf6W+NetQHOL34TN4an6P8a7HSP4go+O/xz3rnXiEWJtGsd
 ToUl7EntRHHOWzYY64SWdsKTbhXfDcK638+VvycDF7fyQD2jzfEepT1xqQdvQazpLavK
 oidQ==
X-Gm-Message-State: APjAAAXTvztBt0ENHeFmH5DJpItm0tjw69HfQLLejsLUYeFmsP44N3HW
 8CggS5iAJaqY7r+bGpPR8kk=
X-Google-Smtp-Source: APXvYqwQ6DD5GEhzrSJGm0yEWPFG8qFm2b+EX1y4bBDtHl7tJeFrUvZeaT1aaOvIudEGbwnHnFq3AQ==
X-Received: by 2002:a17:902:7406:: with SMTP id
 g6mr15833003pll.103.1574768564406; 
 Tue, 26 Nov 2019 03:42:44 -0800 (PST)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id g191sm1884313pfb.19.2019.11.26.03.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 03:42:43 -0800 (PST)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: aaron.zakhrov@gmail.com, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-devel@nongnu.org
Subject: Re: [RFC 0/8] ATI R300 emulated graphics card
Date: Tue, 26 Nov 2019 14:33:07 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201911261433.07401.randrianasulu@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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

Hello, Aaron!

While I can't help with coding (or even answering questions!)
I recall mr. Zoltan worked on emulating earlier ATI cards (r128/rv100)
and pointed me at this project:

https://github.com/xenia-project/xenia/tree/master/src/xenia/gpu
this basically about xbox 360, but GPU inside it supposed to be R500 alike.

