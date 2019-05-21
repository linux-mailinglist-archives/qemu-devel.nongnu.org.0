Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD525B00
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 02:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTEji-0003d9-1u
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 20:04:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hTEcZ-0005oR-Qk
	for qemu-devel@nongnu.org; Tue, 21 May 2019 19:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hTEYe-0001ba-AJ
	for qemu-devel@nongnu.org; Tue, 21 May 2019 19:52:37 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1hTEYe-0001az-52; Tue, 21 May 2019 19:52:36 -0400
Received: by mail-pg1-x544.google.com with SMTP id n27so311543pgm.4;
	Tue, 21 May 2019 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q+Kzz8YvgmccQoubOgUbAFtVK8kRATQnmKwd+TXQuz4=;
	b=MhGUjGjl8RHNjBLycf3ZmHZzYcMobB711qKUAwC1k60LCuS2IuvcIxejJ1SlxJCnGT
	tdrfZsGBmUlR93hdsqHytG3eJIL+mL9YnInLIJdfKddEiHeXVgFPA/B+GUqllTG5Gb7v
	/q1b9lQnuEwYlMjP8vfC17zN6zhegfNUve3rK0z2H6BfGVNp5e0a8WL5rcHSdEYqZnqi
	GgiPLd0+//Im49o9J+Vc8mSwctr5w8fe2Y3PBaAFnesXQ3R21RHP/iVylv0+OQEIkEq4
	x2nqbMtiZRnH49s0XJAIDuhfVBuy2BTuX0VKYmk4PqDtL12ZbRsM2r/hrvCLSkwHWZW6
	MEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q+Kzz8YvgmccQoubOgUbAFtVK8kRATQnmKwd+TXQuz4=;
	b=S5IZScAuzUPBSKsXotoXEtkOjn9ivw8GmI1se/KexIAxiKB16I84gm2llWz/yofeE1
	nRL8LO6FZTH6jXTCabgwYqLWPPs5pHsNau33o1vAIjsH17504OvvwsPHEWDitt3YvNyH
	qJk9M8l6QtoOyVxylqfjUbED36ulkQrNy6c+jBfnlxPiOt6DdB383ZijPPWiMvOTW9K4
	BNDCJ3OUjlYIFP+5Xc8sEr17xnu2+OLpp32RDn/t9hj4NGSNakv7jZCS71TqVR5d3GVd
	7L38vBZL+ofNj6EdQ8USFuBvzpbxUOpNh42rhOrFSzzwZP61hDShGG0y+xiwWzDMOVWR
	Z3aQ==
X-Gm-Message-State: APjAAAVHrso52KGMg/DPim6Ewb4k4OlpH632YSsiQBO5Dn3elke0w9gC
	l63ixamD51RZOAI78DTv3qgInwGHHELtJw==
X-Google-Smtp-Source: APXvYqxY2Zeiq0+y9ddZskZfS3muhFWgR8gZjsLgifKPMczF8maiAQmDh3CamNxioaxHP7DESdh80Q==
X-Received: by 2002:a62:4ed8:: with SMTP id
	c207mr92654835pfb.241.1558482754777; 
	Tue, 21 May 2019 16:52:34 -0700 (PDT)
Received: from localhost.localdomain ([120.57.118.207])
	by smtp.gmail.com with ESMTPSA id
	e5sm51571752pgh.35.2019.05.21.16.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 16:52:34 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 05:22:07 +0530
Message-Id: <20190521235215.31341-2-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521235215.31341-1-mehta.aaru20@gmail.com>
References: <20190521235215.31341-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [RFC PATCH 1/9] qapi/block-core: add option for
 io_uring
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
Cc: saket.sinha89@gmail.com, Julia Suvorova <jusual@mail.ru>,
	qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 qapi/block-core.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ccbfff9d0..116995810a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2776,11 +2776,12 @@
 #
 # @threads:     Use qemu's thread pool
 # @native:      Use native AIO backend (only Linux and Windows)
+# @io_uring:    Use linux io_uring
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevAioOptions',
-  'data': [ 'threads', 'native' ] }
+  'data': [ 'threads', 'native','io_uring' ] }

 ##
 # @BlockdevCacheOptions:
--
2.17.1

