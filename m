Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B582549B8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 17:43:02 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBK3J-0006Do-ET
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 11:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBJyG-0007Ic-9g
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:37:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32411
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBJyE-00088E-Ok
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598542665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vIcj6f86mNf1/zS+zr7uq2KN67HtdMZ7lT+sx5QuPhU=;
 b=A/CsEFquSKAMtzUBlzp03daYLZidph19YpSbeWPQCYP+e2PiZ9onHOWoKMIW9lsFOBIW1J
 jttGziBOhBa6+xbBd8NmJXcQLRbbEkYFLqY1znUol6mjXrl1aJZrnBntY2C8ybRyAe+MEg
 mN70zcAfA3Ka2Bo/uasrTp4W9l/mHZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-Ld5n-anXN5uL2VMFR2LdBA-1; Thu, 27 Aug 2020 11:37:43 -0400
X-MC-Unique: Ld5n-anXN5uL2VMFR2LdBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5C2A425D3;
 Thu, 27 Aug 2020 15:37:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C10410429DC;
 Thu, 27 Aug 2020 15:37:41 +0000 (UTC)
To: Anthony Green <green@moxielogic.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Is qemu-system-moxie still used?
Message-ID: <cf05720c-103d-c46a-0197-bfc3c1f069f4@redhat.com>
Date: Thu, 27 Aug 2020 17:37:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:56:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


 Hi Anthony,

we are currently considering to deprecate and finally remove some of the
targets in QEMU that did not get much attention during the past years.
qemu-system-moxie is one the targets where the status is not quite clear
... are you or anybody else still using it? If so, how do you test that
the current version of QEMU is still running fine? Are there any moxie
binaries publicly available somewhere in the internet that could be used
for regression testing?

 Thanks,
  Thomas


