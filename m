Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E460D10F10
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 00:40:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLxtm-0002kM-LC
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 18:40:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLxrw-0001vf-J9
	for qemu-devel@nongnu.org; Wed, 01 May 2019 18:38:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLxrs-0007vb-TV
	for qemu-devel@nongnu.org; Wed, 01 May 2019 18:38:27 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLxrq-0007u0-TN
	for qemu-devel@nongnu.org; Wed, 01 May 2019 18:38:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id 188so115533pfd.8
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 15:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=BFLrK/O/zqbdQlW/d94nBc1d6+W7nlPffVXpibLqewU=;
	b=p9dAlqsZ3kaa9xpDnHr+WUmYIhwi5PIyilj5SRIcASgQFNLy38vbwxuuO45MYpmRa/
	Glv45XHBkKErDOjcF2ravGkgR7LOPTWBb0ytaaB/jfFhn30HrRnJNAhC4J7Mh8jC9Aug
	6yrnaDxLTmoAAVs5mlFAZuJPRQ6yLbkSc8dyzvlzcJAgAv7OaxkcqKZZMqWhmOkl/BcC
	vOkoEzRO4koHyV6sKtji0gAIXjtBcB8ckBOqSKO6RDAcPPe3xlN8aEcmWYeakZ86thQC
	0FPeGbfJdz4luPOLIb0ABSi62Q32CVXKVQ0XFvLLHIkTapzPNx4JlbYApXbgMPzn4xTQ
	CITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BFLrK/O/zqbdQlW/d94nBc1d6+W7nlPffVXpibLqewU=;
	b=es7Iu4SuEEu2QLRSH0lBh6ZecbWMp55jUOt1OnzSwUU/imDvD1DGB+neFNpYrGMO1T
	3LD8ER/Z59F4xJAoRnMBnFwwyGVMCLL3GD1IR5t3MJOHJ2ia7HjNgXexkd5ixO1oqSes
	Fu/3q9L5MoQDpFwJJUS+azbvi+9/nAyNg3NRM87wIBN2RSJbhV29yoPmBRL6Ig31Ckhn
	sCNeJbpLKcmtfnfPKVTw9u4UwhhJLXGlVlLSqoyFmXxTYiTq3AevDBNB/v4s2tVCvE9D
	sljxLBllgayYCjnkYhinePWsShZwHjc5uG0mV3cWdGMkbtpXG3OMJ84cEtHFRrytPMqI
	d4rw==
X-Gm-Message-State: APjAAAWk2xVvWkiSsekJTkrZj3DdpHgdwvLE7thdMDiPgYoojFkIwvu3
	njMzJzbJP2ynUDL58hjn0bGdYsrrea0=
X-Google-Smtp-Source: APXvYqxPiIMSE0R5tsPxmfYGYCcb3MQ9x8PTiZf/LBNRd9IVFq+sjfSvMlRISusJbqJ/vJxEJGWmfw==
X-Received: by 2002:a63:1a42:: with SMTP id a2mr498791pgm.358.1556750301145;
	Wed, 01 May 2019 15:38:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	s85sm70603354pfa.23.2019.05.01.15.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 15:38:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 15:38:17 -0700
Message-Id: <20190501223819.8584-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::431
Subject: [Qemu-devel] [PATCH 0/2] configure: Fix make check-tcg for ppc64le
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
Cc: qemu-ppc@nongnu.org, mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present make check-tcg will produce errors like

  RUN     tests for ppc64
  TEST    test-mmap (default) on ppc64
test-mmap: Invalid ELF image for this architecture
make[2]: *** [run-test-mmap] Error 255
make[1]: *** [run-guest-tests] Error 2
make: *** [run-tcg-tests-ppc64-linux-user] Error 2

which is caused by the use of the host ppc64le compiler
in building guest ppc64(be) executables.


r~


Richard Henderson (2):
  configure: Distinguish ppc64 and ppc64le hosts
  configure: Use quotes around uses of $CPU_CFLAGS

 configure | 54 ++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

-- 
2.17.1


