Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60A18732B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 20:16:17 +0100 (CET)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDvDk-0002Iw-LS
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 15:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDupn-00016g-57
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDupm-0007xj-5w
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:51:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:51561)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDupm-0007vu-25
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiaNZR/YFUXbUQr2CW30itYe2jJLit5uoKbrlDDb9zo=;
 b=SQoGRtMsrJ0g7O4DZFLQ0PvxUXlmgKsJ4lx9Rk3hUikQXje0mMKfd6AN7PFkS+eQRDwbQn
 MPqKFaIrjMDeCAspRCESJPRURhFFfczloRDM3nxOYr5mVApC/A9ufT/rMSLsNeukDMnhah
 VJMPpZFUP1HFN06ksPe025kFt2JH8Xw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-kan1FIFhP5OOSycRvFGzqg-1; Mon, 16 Mar 2020 14:51:27 -0400
X-MC-Unique: kan1FIFhP5OOSycRvFGzqg-1
Received: by mail-wr1-f72.google.com with SMTP id p2so6924560wrw.8
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 11:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fr7tR+uE5gurF7jZCvxXMmjEzQ0XGdfWsIrKdvCDUxM=;
 b=GtYKxgrOgbNqLUYR6cvXPCAUfoi7f37T60SlbngBb22bFZRVHored9gSQt5jC/OT3Z
 PNFb8Jx91TReS7PkKsLHgxbAxJLciWEhqbDdPRRw9wN9PFfi0VZ+Sn9skKXhhsegM5u9
 VA7wKLLHGtlPc0Y7HI+QbKkzOcZcIKkqX/1vooLV4KTGiCsEBCYFe3YGvLgDVaO8ltSB
 pfZKggjGmT0DzkrK5jaT9yc+nhbGV34q1r6Y5wvreD83exRexofjZppTiupBlQy3ZmhK
 OHrescqbt9I+qxJjcuiYRX10vFt05+Yoq6oSpr0qzTKnnvgtez6jbqYPkXLcWyEFeEeH
 p07Q==
X-Gm-Message-State: ANhLgQ2OsiiYi3EQqAffUOYmNfHEit/abcvsvhJYLZmPlV9IoDdfgPYE
 9SASMb0ugNdm0dB5ko/orxGlKmziGgDL+kZ9PljbemUe1xxfyYo+dJRuGF24YeQj4yy0eoTz0pv
 GqcuwLwIYTdUsSSY=
X-Received: by 2002:adf:82f7:: with SMTP id 110mr709004wrc.373.1584384686655; 
 Mon, 16 Mar 2020 11:51:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs//rpAiK+xC5iYw0T7Oh1sadDsQ7K/U2GlCCkhy1nMZWCWbX1KSDGH9bvtWb4oYVJO/F2Vcw==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr708995wrc.373.1584384686494; 
 Mon, 16 Mar 2020 11:51:26 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id r28sm1158066wra.16.2020.03.16.11.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:51:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 15/25] scripts/cocci: Patch to remove unnecessary
 memory_region_set_readonly()
Date: Mon, 16 Mar 2020 19:49:56 +0100
Message-Id: <20200316185006.576-16-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316185006.576-1-philmd@redhat.com>
References: <20200316185006.576-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a semantic patch to remove memory_region_set_readonly() calls
on ROM memory regions.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../coccinelle/memory-region-housekeeping.cocci   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/=
coccinelle/memory-region-housekeeping.cocci
index 9cdde71bb1..5e6b31d8ba 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -48,6 +48,21 @@ p << possible_memory_region_init_rom.p;
 cocci.print_main("potential use of memory_region_init_rom*() in ", p)
=20
=20
+// Do not call memory_region_set_readonly() on ROM alias
+@@
+expression ROM, E1, E2, E3, E4;
+expression ALIAS, E5, E6, E7, E8;
+@@
+(
+  memory_region_init_rom(ROM, E1, E2, E3, E4);
+|
+  memory_region_init_rom_nomigrate(ROM, E1, E2, E3, E4);
+)
+  ...
+   memory_region_init_alias(ALIAS, E5, E6, ROM, E7, E8);
+-  memory_region_set_readonly(ALIAS, true);
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
--=20
2.21.1


