Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C238B1A39C9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 20:27:07 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMbtK-0002zS-Sw
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 14:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1jMbs3-0001uw-Gv
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1jMbs2-0006iO-HQ
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:25:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54020
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1jMbs2-0006i6-DZ
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586456745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JrzLeO6WItvJnpS3exRuR+P3BABCx4bW5PMF0DrPk1s=;
 b=NHyzpkLdcQbdF+G9QYf/rfOlmbFIEjQvPT9fl/WPlJRpydRkBXeW7SIo44l25DTt+VGYtL
 UH68rzRYGJAhwKEmKNXQvXq6tMR+YLPxNBFDbK3fiKc2Sdg7b52nqHKzpDQiHCnHtDE4D+
 zuaqWGf2jUf/zlqqPzIa2FDfW24UH6o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-lookyZFfMeirze-u15-oOg-1; Thu, 09 Apr 2020 14:25:44 -0400
X-MC-Unique: lookyZFfMeirze-u15-oOg-1
Received: by mail-wr1-f72.google.com with SMTP id r17so1374427wrg.19
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 11:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pLJlYWETjR9Tdh/GLhGNq5hqtFpAsNkAE8HcpCTuXiE=;
 b=I3TdqNOnP5JNSAYqdNghFgbwe6g3qr1sgptvV1Qu+IJRwoWRL/Np/CQ5tojgBDPJXA
 pUazl1AlFQeF7Lks1ry8Tr0fgvzSLPxq78an4mLf9cPTQDnBds7e1zuVHSabjtiwCS0q
 YktCTxrrkJEqxV5jHT9rxjYVT4es+8vMxAl8fzeeZp/HGIl9iXVPE0ZtVtSnV9NhYt8/
 INiNAbpF/KuLyj76kS65UlcNbREzJ4nl6e5LE5PgTjeMpUEXxuRyFg2WsiW096XqOn1W
 J4RKDX7zEwvE4Ok7yeLhYc/w935pZ7OhXVnUkhgs9mUb9TjsTHfMTUcKbzrFJpKNHvmG
 gxyA==
X-Gm-Message-State: AGi0PuZCjtvZwb2kwNyIq4NSvTcxJ7YmGMmgH8e7HTLoSpBv45m8nTnV
 lraaKnbiKTcVf9cWA09lhK/E6nLkUXzkEz+euYRbFh0geNUSyO2SRY8EJbcG9D5Ryo8HfANAapf
 IsSU8D/PP8y+UMQE=
X-Received: by 2002:adf:f790:: with SMTP id q16mr456968wrp.94.1586456742556;
 Thu, 09 Apr 2020 11:25:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypKnxysbWL6n1eXfiPWc7A/+2to/b9Rq/wFoo9Ae5HonHfNUh2P5SFm7QApfuPOHf/uXZO2i6w==
X-Received: by 2002:adf:f790:: with SMTP id q16mr456954wrp.94.1586456742408;
 Thu, 09 Apr 2020 11:25:42 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id 138sm4867204wmb.14.2020.04.09.11.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 11:25:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] gdbstub: Unbreak i386 with gdb remote
Date: Thu,  9 Apr 2020 14:25:36 -0400
Message-Id: <20200409182538.40816-1-peterx@redhat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- use "goto" in patch 1 [Phil]
- pick some tags

Thanks,

Peter Xu (2):
  gdbstub: Assert len read from each register
  gdbstub: i386: Fix gdb_get_reg16() parameter to unbreak gdb

 gdbstub.c             | 12 +++++++++---
 target/i386/gdbstub.c |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

--=20
2.24.1


