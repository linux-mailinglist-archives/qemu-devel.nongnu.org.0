Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176EFE83
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 19:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLWHL-0007v2-5U
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 13:10:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLW2I-00048d-M2
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLVzi-0000fS-Hg
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:52:39 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38048)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hLVzi-0000av-Bq
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:52:38 -0400
Received: by mail-wr1-x443.google.com with SMTP id k16so21859542wrn.5
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mJ7CZS0sQcbUsk/Tw/L7H0J0hSgoFo0m9c7Q9J4OMKs=;
	b=NKkCAJseGgE2vMf99XfEnFs7R9WvNhqFD+MNuzdLWVzB3mD8KzRvpGObX224cxHj59
	r66CD91h0XWhgVMjrtCwAW8FsLBCTWlh9vrPOs7Zsuqwb923qWPmo3IGeobujgjC4SZh
	rHSmJVgjTL491Vr1gy87mTI9i+6424BJkvmEx494QCxcmwuwd/IEXwyRaOZ0pDzk0t6J
	nXjfqjTCeuBEOOF7QrzpEtWGs6bk9q5ZLoKw2PCmzOxGjbtxu5FWgttRnXOjFuEeTi9h
	nr16pEPHKo2kJZAZUg2CCMCopDDm6ZzLXQpTuMKFZ0h0Wwj9QVtSWWapAVHN+cL37wcK
	zIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mJ7CZS0sQcbUsk/Tw/L7H0J0hSgoFo0m9c7Q9J4OMKs=;
	b=P9tqg0U8mYfEDicexfVcLhOKK8U8IPCLxLujCgDkMYhVpquxFv+6QjwwWlqlEF8aLe
	ld3Q+dTNIR+fplHeX9ZvYhSqNgVuJg1/w6IxSsWIuhgLjVeOqaF9X+wHqlQ/Xp73AjQy
	s+2vp+1868fhjgQLC/B7BV0Cg69hYvIk8hiLSOR+8/K0xRWBvxASUD3uoYmmd9yxpMDx
	36B/ED1lqdUnTVmU7oZaGZMF3fG91xKbcBo+VbOMA96ypZDMepzBXH8mSLL/cq7ntBks
	XjMVVfreHRpeZEmnL1j3fl5xgsi3BNka8Mo/xNfPt+DNTjgIriJ8fSBMakSirRB6CaPB
	Jzpw==
X-Gm-Message-State: APjAAAU98NTb0pOVKNKwqp5/v+a+lT4iw1r+lZNGKbkbTq0PZxvpuxXw
	MM4tf9YgVLqYhNf+nLrRui5fJg==
X-Google-Smtp-Source: APXvYqzbSvp2qXjncQ4ndzNqW35/ofarQ1m8u9mcj1AecFZ2DGhYAJvFWw5oUvtEtsdMqfAqwIpD9A==
X-Received: by 2002:adf:f749:: with SMTP id z9mr30021665wrp.218.1556643157282; 
	Tue, 30 Apr 2019 09:52:37 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id u17sm2063472wmj.1.2019.04.30.09.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 09:52:35 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AFE0E1FF91;
	Tue, 30 Apr 2019 17:52:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 17:52:23 +0100
Message-Id: <20190430165234.32272-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v5 04/15] tests/tcg/multiarch: move the system
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing inherently architecture specific about the memory
test although we may have to manage different restrictions of
unaligned access across architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/{i386 => multiarch}/system/memory.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tests/tcg/{i386 => multiarch}/system/memory.c (100%)

diff --git a/tests/tcg/i386/system/memory.c b/tests/tcg/multiarch/system/memory.c
similarity index 100%
rename from tests/tcg/i386/system/memory.c
rename to tests/tcg/multiarch/system/memory.c
-- 
2.20.1


