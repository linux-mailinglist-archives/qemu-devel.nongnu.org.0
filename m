Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52372132963
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:54:26 +0100 (CET)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqFV-0007mB-C1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iopIK-00006h-53
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:53:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iopIJ-0002Fq-2c
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:53:16 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45540)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iopII-0002FO-Td
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:53:15 -0500
Received: by mail-wr1-x444.google.com with SMTP id j42so53981351wrj.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JbIF6jq85tSSclAUoLQpO8ixEYiFXnjjbBfr9rsFDdg=;
 b=NtlpDI2w9C6NTLiFfFsW6nrIbTLBtqWB4tKk8Qhu6dH4hb9mJHoYUQp7a4kvcLD2U5
 85aYYl9plw8qXWZciqJBE7jV8EGCiqGW4CdbJ8oTpDV9oLF/PzehRgQe1xOJn1EFsTvD
 +nKQfiscSieJfM1SBRcnwX+XoFxHnlQLZRHxsp7cMrK7+C0tE2maHGbbadHaEGtPpPWu
 ia5Mt7S9G4J2yfnEdEn+tA7EpLGnQoNfzNn7jWLHFG2JE8hylIMoupd+fiIlG92sj43g
 yC7FYynzasqxBTSX1+7LMCSUt6MvZZviZ+KDesZX+Za371tAyNd6/c5XNPH5KG0wTfVu
 unKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JbIF6jq85tSSclAUoLQpO8ixEYiFXnjjbBfr9rsFDdg=;
 b=UP/iEnAiZdrNl1vgA/iXGgeFXhXMY7eXlgzLFkeSDz9Pqrb7xkBQItvummKQVlDh7W
 BrJYboAAMlyxM0fUpfpmkbuCWWsQjf0LCN3IBZW9sl0iRoJ1WHi2i1obqrly3uDeNQ/0
 NC815DlWTd1V+FAOX2G3unbnwBOkQz07cX7E5cfASPboCaY9u2XY5H4djfHP+UuqqJvL
 /VFLYb4mH+hMYCUM0vIpuPTPuRha74qyALA3ErtzKzyjnRQOvEZ2NHalY0V/4YlhRreQ
 gHXzkyLjtpScaPuPwATJDZ+WBaIXKhrIpQxmL83dsNH8Z3WsH3Y5Lto/Ec5sS1L5sBlH
 uUqA==
X-Gm-Message-State: APjAAAVvs9q2S/8sN3sASdSDjhBjIeWJv9XRQKC8nmZ/254I2Dc/iEi1
 xjArkPE9TcqdRUCK+NUo3FPFQg==
X-Google-Smtp-Source: APXvYqwWeKxzqqCJDbhvw7rpySL4eTrbNwGlvcqRU0Fvrz7/FLMieQgU0+whWP0dJ4gziTXl5kP3zg==
X-Received: by 2002:a5d:4692:: with SMTP id
 u18mr108939846wrq.206.1578405193874; 
 Tue, 07 Jan 2020 05:53:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u18sm75862767wrt.26.2020.01.07.05.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 05:53:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 182C31FF87;
 Tue,  7 Jan 2020 13:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/6] current testing/next (python and other fixes)
Date: Tue,  7 Jan 2020 13:53:05 +0000
Message-Id: <20200107135311.5215-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is my current testing/next queue. It contains one patch which
should get merged through another tree shortly. Alongside some better
debugging output for acceptance tests the other fixes are mostly
python related fallout.

The following patches need review
   01 - hw i386 x86 iommu Add missing stubs
   06 - travis install homebrew python for OS X

Alex Bennée (1):
  travis: install homebrew python for OS X

Gerd Hoffmann (2):
  tests/vm: update openbsd to release 6.6
  freebsd: use python37

Philippe Mathieu-Daudé (1):
  hw/i386/x86-iommu: Add missing stubs

Wainer dos Santos Moschetta (2):
  travis.yml: avocado: Print logs of non-pass tests only
  travis.yml: Detach build and test steps

 hw/i386/x86-iommu-stub.c | 9 +++++++++
 .travis.yml              | 8 +++++---
 tests/vm/freebsd         | 3 ++-
 tests/vm/openbsd         | 4 ++--
 4 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.20.1


