Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01F2525C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 16:42:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT5y3-00032b-Od
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 10:42:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hT5vl-0001vx-Nt
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hT5vk-0006I4-S5
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:39:53 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:44217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hT5vk-0006Hr-Nl
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:39:52 -0400
Received: by mail-ot1-x32d.google.com with SMTP id g18so16511406otj.11
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=mIL5CoSdVY04gTZUvWIBRXx7sGjv2YWRnPgNlRhPUlE=;
	b=G7Bnmb2VBaC7bX8HWa2hnPGV6qsXvagOmd9TKvPmq4xyHOXly0bkfRZExcq2QYNdSH
	VabCRc/kIouBwm3T/jW/ef+qNqoyhpf0CJSMgM+Y0eTM2UjltuX0E+yNmtfhHyxykuu/
	WBNTH2s04NSOZYXn35dTZ2TLr6KBmh7+0qHYs0ZjlPEVz77dmWp/NhvoTqlGLKYtZimf
	uQRmVsDF1g0O4225sG32dREXciueURlHNpO5v4I4TYfvTIbe1HNiCn5rgvmux1lkdfao
	bMrDhCfeFig9O9wEihVQlcUy208xg5PQr+HOsKH+NjvU4qStAnm4ZbFuC22Ax+b8gwoO
	zExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=mIL5CoSdVY04gTZUvWIBRXx7sGjv2YWRnPgNlRhPUlE=;
	b=kFXZ2QD1KG5CVl6OvPFYzIWcWe19gYNFdJ9gOK3+MLw9bPpHdC3w0dZg3lHWhXEDo4
	nDY8OX8CcmFvL2rImn6V8PbFX7VEhpHUsFKPk80m8WDR3MqimQvhivUBMkZHfMXjXwil
	XJyZ5JgRdVrYzk5/492woFQnygfDiogtVQvvpvwKgHV9qvGYq2MEK3KcJg5+RM+6U9uA
	FM+3PQ0INWZCM3MbzT5EmH87r1inpYWi0OXqcEua7Vvr4dfySNvH0GXefqRYWWZbqJuM
	xU+t+T4EReBPu/AU8NNQMBks933j1tDrvx5JXKAVNw/WODoODCVSX+bXBLcYUMRpJep0
	BaGQ==
X-Gm-Message-State: APjAAAVCR+wz9Il/W6f3E8ELy3x4f8sq7r6y29NT3WunnK7K0aKMcgEG
	9oOB4CrGoe8R+sEjdTvaIZpiYzp+w8AgSre55mtEJbgeG1c=
X-Google-Smtp-Source: APXvYqyjEJ9R8DzrfQ/WEoX1kYmILkHxZF1nHFuM4PhYtNwvmxoOEmsd+wdPG+l/zu6FfTtT/AhyoKSAEZ7CjtXeWP4=
X-Received: by 2002:a9d:5608:: with SMTP id e8mr18041217oti.135.1558449591780; 
	Tue, 21 May 2019 07:39:51 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2019 15:39:40 +0100
Message-ID: <CAFEAcA-vSebWjhbFTdfOSGHJtr8-a+DKG22JU3tS-1OoGR=VXQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32d
Subject: [Qemu-devel] is anybody experimenting with the idea of rust code in
 QEMU?
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I have on my todo list the idea of some experimentation/prototyping
of whether being able to write some components of QEMU in Rust would
be (a) feasible (b) beneficial (c) fun to play around with even if
it is likely that it doesn't go anywhere :-)

I know Paolo has had a look at how you might write some makefiles
to integrate rust into a C program (https://github.com/bonzini/rust-and-c/).
Has anybody else been doing anything in this general area ?

(I went to two good talks locally recently about rust-vmm and Amazon's
'firecracker' VMM by Andreea Florescu and Diana Popa -- I
definitely plan to look at rust-vmm as part of this.)

thanks
-- PMM

