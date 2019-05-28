Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE12C3DB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 12:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVYx2-00006p-3y
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 06:03:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtf-0006LA-1l
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtd-0005V0-61
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:54 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVYtb-0005R3-Ie
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:52 -0400
Received: by mail-wm1-x341.google.com with SMTP id v22so2129128wml.1
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Vg1FaPoEUTj/0i8EpZDow0jYp/5GZ3VG8fBtm+U9lz4=;
	b=VmReKqa8dO02Z2M/344DTVUUXJj6q88jTR188S0jLGEf8LdjWcaD3seB6lQfqFqSZu
	8s3Ap03C1b437hXUDKrKlNxSiQbNkExC3vLEcG/LkVtfZi4FD0jv6z0nJgsCTxsPr8ur
	RiDeHVPROkf9CDIprmLM5qKpZIBOtAyKIYQQ78sGX59gnGifc3VAOcoHCI/I5uBctDBL
	OhZoSGNKVNvi69OOvig6j6f/Mzzsn3FegVwtY/1dBNCO0oqYrSSY4LqUr1/34IOqmMwG
	YOX11l8NjcOVtuLNBzJhF53K4KF6ulovqOfCFrvt4oDLe8BX2CtPAKChtP9rboZuMimM
	Bfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vg1FaPoEUTj/0i8EpZDow0jYp/5GZ3VG8fBtm+U9lz4=;
	b=umw5kRLbviABk9hExUQ4OviRs1OqPJXSBfuSg2/THRP3saEjedQiYj1QTbyhNKWmw6
	1GaEzlka5azZb72Qo4s0vcrYlLnz4CpSnYnFKoS7vUL5UPmp4TN+4TFTdxhpmHZrcoED
	9FFYCL7VhcXU/qmeclxOe1Ypy52ECwdjVUr5AINlWiiux6BHT2YKIPgaJNGyhgNmPkiY
	RggIi/9E8/HbLSKjT0rmiH1zHKNbEz7Jzl2dHxU7zdHd4WKuUKXiBFzYi5DSXy4AVOPO
	nGwTKWuAFmKahxaRhWl9V8FvmoR0gTmHrJ8GULdvwGfcexfAOCTPX4hHyfaq+YkkEI6M
	iY4A==
X-Gm-Message-State: APjAAAWjahceBbG/G3d+S/Nx9E+JDydsefPeuVJMqiMHTrfmxzNsE89T
	KGRnG64T1g92eOqnBXyWSh7KQg==
X-Google-Smtp-Source: APXvYqw43reAYZjAzZ90aQ9zkQyH0qSlyQ/H8fH05+EDL+2F8Y5mS5jZFH1ZRgi+G7W7cw7qH7phKQ==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr2610407wma.145.1559037589790; 
	Tue, 28 May 2019 02:59:49 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id g5sm6257035wrp.29.2019.05.28.02.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 02:59:47 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0CF431FFA3;
	Tue, 28 May 2019 10:49:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 28 May 2019 10:49:43 +0100
Message-Id: <20190528094953.14898-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528094953.14898-1-alex.bennee@linaro.org>
References: <20190528094953.14898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PULL 18/28] tests/tcg/multiarch: move the system
 memory test
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing inherently architecture specific about the memory
test although we may have to manage different restrictions of
unaligned access across architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/tests/tcg/i386/system/memory.c b/tests/tcg/multiarch/system/memory.c
similarity index 100%
rename from tests/tcg/i386/system/memory.c
rename to tests/tcg/multiarch/system/memory.c
-- 
2.20.1


