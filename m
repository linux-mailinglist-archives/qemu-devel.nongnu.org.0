Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8382A0680
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 14:33:37 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYUX9-0000HJ-TX
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 09:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kYUW8-0008GM-Nj
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 09:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kYUW2-0008SS-RT
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 09:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604064744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K/Ko0eWrk58HpQVnFoeRQs1gJmseOr9XCg9msoiUmHY=;
 b=Nd0JLGc/kuvgSrX7F4uDCRn/AKXVeS0RO76On/63lFmzUIkX+/r0AvjSCaft7/2si4Sfuw
 +FjzBb877+HP8hq3H6X0ZLU1FROCsZZvXpfTnjLf8n8hfJnJeUSnZEogtCiqO2pCe+/Ssa
 i9PO0C9D5YQ2sJEk2rXFMHlotM9n/xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-uROtbrbsOu-sVvAAcvTlfQ-1; Fri, 30 Oct 2020 09:32:22 -0400
X-MC-Unique: uROtbrbsOu-sVvAAcvTlfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C41A188C13A;
 Fri, 30 Oct 2020 13:32:20 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C10D51002C01;
 Fri, 30 Oct 2020 13:32:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Subject: QEMU release tagging script?
Message-ID: <e8b378a2-144c-e915-3e5e-c84c9e9a17b5@redhat.com>
Date: Fri, 30 Oct 2020 09:32:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Is there a script that's public that you use for tagging the QEMU 
release? I see make-release in scripts/, but that's for creating the 
tarballs after the tagging has been done.

I am looking into being able to cut releases for our Python QMP library, 
but due to constraints in the Python packaging ecosystem I have not yet 
been able to solve, it requires its own VERSION file.

It would be nice if when 5.2.0 is tagged that "0.5.2.0" could be written 
into ./python/VERSION as well.

(Effectively I am targeting using '0.' + VERSION. This is pending 
discussion on the python packaging series.)

Thanks,
--js


