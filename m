Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD4344701
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:22:15 +0100 (CET)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLRe-0000NK-MB
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOL6D-0002VP-67
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:00:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOL69-0003Zm-6z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:00:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id e9so16971706wrw.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2KNSWpDv0trVIIjRwbq4Dhd+9F9sz4wThNGQGIPtbqg=;
 b=CDOk0qetVETE4qvGB/qY6dInsJvk3vIWGPrC8AldpXHwqdTQtuMp49o3kTTuqYj5+x
 Nf/UoCT/DQdOIbU8+s7HP6HczU/9y++Eo5sEJwJvUZDXFM+pLF1it9/AjPniJswYXgyA
 mhLFfbgB7DwfHeOtyJKVnNSmuzfxKn9cIxUNUh2Wb73yerhneuWYpZ3LGGLyhUyBHnT8
 lMpU4jspEFyi9UawEbJmANBizRJr7f7bxn4+Wj9XiGsmWtxJTY5WDypp2G5Mj2sp+UnK
 0Cg6pBp60oUavVFcAfd0pnj77QuWkIZSDN/COQQ3sjYKVyTRLTsEidkL5nAo5kHDgJ5f
 bBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2KNSWpDv0trVIIjRwbq4Dhd+9F9sz4wThNGQGIPtbqg=;
 b=rW98B4YpJPa+uUGkv8i5iT6gocR9sKfA7QGx6Szbi+xQ8gEWDX1uXjlGsrS4tjPaPE
 jg6IxhF/zrJ/98gnrgFB2rnk2eJfq3JP2ymGEno4qyOUvEjByxdEIYga1gCztArZP8HQ
 VdKoHZHc6rsf49nCN7H+UjIj8YoMc8lIfhIVhc6dZyMK3YHqSY7FOYn1T6M2svec5A1a
 4ZHI/sPv8AF/vERDMQeD38OMdBZFOmt2m03V0MuE/p+akxCNOGZnjws86gxMhGWykWYx
 OyLN0WeMxQy4P5ZMVpIPkcKVxndV4xyQZrEuFunhm6Dh0M1zVzEbjUdv7+uZ6GZNttOk
 RKYw==
X-Gm-Message-State: AOAM532CfSQUoBdH8P2yqP5PNZGrCpzLUVt505Pv6I+9AMRZFMN6Sqky
 oyVbPPj68HTGljXqMjGy6/O0rI0ePBgbLw==
X-Google-Smtp-Source: ABdhPJz1yRn6YJWQ+G6UYYpoNEvZE6Fr8C5TlYlDi9agikEv677jVN1t+3OCZXb0F5iiQ0lj4TzgXQ==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr18924806wrr.140.1616421599114; 
 Mon, 22 Mar 2021 06:59:59 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b17sm19546287wrt.17.2021.03.22.06.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:59:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] MIPS patches for 2021-03-22
Date: Mon, 22 Mar 2021 14:59:55 +0100
Message-Id: <20210322135957.4108728-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: libvir-list@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-03-19 18:01:17 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-fixes-20210322=0D
=0D
for you to fetch changes up to 83bbc537a151730741c04e40d23711067330dab9:=0D
=0D
  target/mips: Deprecate Trap-and-Emul KVM support (2021-03-22 11:28:04 +01=
00)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Fix array overrun (Coverity CID 1450831)=0D
- Deprecate KVM TE (Trap-and-Emul)=0D
----------------------------------------------------------------=0D
=0D
Jiaxun Yang (1):=0D
  target/mips: Deprecate Trap-and-Emul KVM support=0D
=0D
Peter Maydell (1):=0D
  target/mips/mxu_translate.c: Fix array overrun for D16MIN/D16MAX=0D
=0D
 docs/system/deprecated.rst  | 9 +++++++++=0D
 target/mips/mxu_translate.c | 8 ++++----=0D
 2 files changed, 13 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

