Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F044633D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 13:18:26 +0100 (CET)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miyAr-00050C-37
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 08:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miy7z-0003Zr-Mr
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miy7w-0000Y6-Uj
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636114523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=FDaKFQZPUDxU9O0/VcccIUNnDb13jCiRs0TD47EQG1Y=;
 b=G/lBy3kwINHFSPcjDdzyAb8uLp5jz1GS05Hy9UxlDZcbOuM1uTQUE+c2zY6FHt8NL5brOU
 vZYvNforeThPKP84samKbP9k/f9Y5RY8ze6y7pO5L/Sf08J7GGpvGajQ/0uo13K0GGxtBX
 ut1mteLZH35ungut88uSOV7f8glmYlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-U1--pRmLPS-QxgYjBaH9rQ-1; Fri, 05 Nov 2021 08:15:21 -0400
X-MC-Unique: U1--pRmLPS-QxgYjBaH9rQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 087D98030AF
 for <qemu-devel@nongnu.org>; Fri,  5 Nov 2021 12:15:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE4CB19739;
 Fri,  5 Nov 2021 12:15:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A43E11380A7; Fri,  5 Nov 2021 13:15:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Please update build-system.rst for commit 859aef026e5
Date: Fri, 05 Nov 2021 13:15:19 +0100
Message-ID: <87sfwaztm0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

docs/devel/build-system.rst claims

    ``config-host.h``, ``$TARGET-NAME/config-target.h``, ``$TARGET-NAME/config-devices.h``
      These files are used by source code to determine what features
      are enabled.  They are generated from the contents of the corresponding
      ``*.h`` files using the scripts/create_config program. This extracts
      relevant variables and formats them as C preprocessor macros.

scripts/create_config went away in your commit 859aef026e "meson:
replace create-config with meson configure_file", 2020-08-21.  Please
update build-system.rst.


