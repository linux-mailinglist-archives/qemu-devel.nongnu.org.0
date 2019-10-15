Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E858DD7E25
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 19:53:17 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKR0W-0005tr-G3
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 13:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKQyy-0004vv-4N
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 13:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKQyw-0003Pe-ME
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 13:51:39 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41319)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKQyv-0003Ou-Fz
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 13:51:38 -0400
Received: by mail-pg1-x542.google.com with SMTP id t3so12578660pga.8
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZm1ZsAusgM2frHCYlMIA66EoSELmv6PfGCmmnUJUY4=;
 b=Hl0JVyqVkc6ajKwv/1OGmE4kOLFwr3pDupUnQexyyvSYES47UBhRF7uYQAym0nfjLh
 2/VURwYTkcqHuiDp/lZH9LVhEFfTt1wAGa8FY78a9Tm6UuggoiEJy9bpYEOhEU5cVoQm
 DjRHXWvGJ7rHMt7MGgyhEzGygh0DPdNWQY46tcF3lXhJSJWCtw0EXPzuOA8sJOY2nGCb
 6o8gjBRB5mu0Oy/2BlFL3wKpRG49sWf4VIESswByTh7nFye3gxrZwuFMxzK+D8SRppmH
 DaHqV1jB+8CrHzLwNQu4flbn+ZJWlsAxbaXGNSvgj+gPP5pJ2jKcj5BIdYP/hKNQdJi3
 QxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZm1ZsAusgM2frHCYlMIA66EoSELmv6PfGCmmnUJUY4=;
 b=RPzL0e0KmxH5MWKgspIGK3POxal9iMpXY792NNEtzugdxprzcN0LbAMR12st99B6Ni
 wfGzC0X8eDx95l1HABuEgtLRzhQZgKP0mDin+1gFXUNfzef38zrruEL7rmmxJw7yy0hU
 PunDTKNRDePhrLa1eIKTNCuDFwp4yhwxqisNjjOvWWo/adgVjLbAoOVF/GkZdjBF1aHr
 Yv7oYnbC5gad8SPJjCVgyj9Zz/j+5BgxSvogZXnZ0pzX5y7UrssoRXAjheX4+LPgtNDe
 s2DsNF48v6CMoNAsgaMWctnLmXt+9UPxiEwoKWhWB+oGKGeBttJC7waFJIUESmstxAcY
 lzsg==
X-Gm-Message-State: APjAAAURm4TsIlueoX5oyKKW9ZUVqU8MBCz/frB3EboQgbM993jkbwl9
 VWYfwirUpmIU9SlT3q7x8C2igraANgw=
X-Google-Smtp-Source: APXvYqy8cCizepWlMlihNZa5puEwoxPZev0oAp2iG2XCj3yvRbUbiGtPkkTctT+ZZajArkrDV7oyRg==
X-Received: by 2002:a17:90a:868c:: with SMTP id
 p12mr45056672pjn.45.1571161895632; 
 Tue, 15 Oct 2019 10:51:35 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t68sm20867845pgt.61.2019.10.15.10.51.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:51:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] Update capstone module
Date: Tue, 15 Oct 2019 10:51:30 -0700
Message-Id: <20191015175133.16598-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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

Tested vs centos7, fedora30, and bionic (with and without
system capstone installed).

Changes for v3:
  * Work around the various include directory nonsense.
  * Re-add the s390 skipdata callback, as a separate patch.

Changes for v2:
  * Drop the installed directory change.  This does force a
    different include change when building from git.
  * Drop the s390 skipdata callback for now.


r~


Richard Henderson (3):
  capstone: Update to master
  capstone: Enable disassembly for s390x
  capstone: Fix s390x skipdata

 Makefile           |  2 ++
 disas.c            | 40 ++++++++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c |  4 ++++
 capstone           |  2 +-
 configure          |  2 +-
 5 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.17.1


