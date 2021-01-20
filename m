Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE62F2FD5CE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:38:26 +0100 (CET)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GV0-0008Oh-2Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2GRc-0005dV-HE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2GRa-0001R4-UG
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611160494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KeXFtTbK3LtG9120tGnj+oTsPFzON+PCe9XmmcGrxnI=;
 b=Z4GvBKfnnzQa3LW+prHmJtbvjEF7yIyZhITxIMbQN4cB9s6R8C8xInRYeod/QjLnJ0NYN0
 DLDtJPboUGXzgZa+X2NrzPsJXJG4XpwmA+1CLPN2PGZT0MEHkMSFvQOwNvyMsHFWnccY3t
 XAqpFm8egV4LmaUyTCZoIRcQVS6sMmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-2p9oaVJvMGSLx5kagyT5ZA-1; Wed, 20 Jan 2021 11:34:52 -0500
X-MC-Unique: 2p9oaVJvMGSLx5kagyT5ZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7769580DDE0;
 Wed, 20 Jan 2021 16:34:51 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E862519C81;
 Wed, 20 Jan 2021 16:34:50 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Subject: Revisiting VERSION for Python subpackage
Message-ID: <1360c01c-6e90-c3e7-ffc8-88adbc560ffc@redhat.com>
Date: Wed, 20 Jan 2021 11:34:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter: In the past, you expressed hesitation over adding another 
VERSION file to ./python/, preferring we single-source it somehow.

For now, I believe I will be pursuing a version of 0.6.0.0a1 to indicate 
the subpackage is in a beta state, but otherwise tied/related to the 
QEMU 6.0 release. I plan to change this to '0.6.0' during the release 
candidate phase.

(It also leaves open the door to begin independent versioning schemes 
later if we want to fork useful parts of the library out.)

Due to the way python packaging works, there is currently no way to 
refer to files *above* the python package root because files are copied 
out to a temporary, isolated environment. I do not believe there is any 
way for me to avoid creating a second file.

I wanted to check and make sure this wasn't going to be a no-go.

--js


