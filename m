Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56858229F50
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 20:35:43 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyJag-0006yg-D8
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 14:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jyJZV-0006W7-T4
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 14:34:29 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21372
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jyJZQ-0006wn-2L
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 14:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595442862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8los9sbsok4LaJ8BaUDpwowBgzJ4Ldn8f1WnJQvJ5Q=;
 b=Xdd8G6geMpNvXMxeXHBeqxkzQTgleO9A+l9Oj2a2GR+ly9FVmASGZejSEejTDaMSLadRk8
 iCjXUXOZ2Uq8xUtzdp2jkAd/H1dApT9flUllCr9esbGqc6X5xBzTdriP2RjGiJ0Fi5Chbf
 t2H0rgOuRlwvJZFtTdAD2LK1YOhlvnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Qvyy4jcpNrO5bE5nzdl4Tw-1; Wed, 22 Jul 2020 14:34:18 -0400
X-MC-Unique: Qvyy4jcpNrO5bE5nzdl4Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D2059;
 Wed, 22 Jul 2020 18:34:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-129.ams2.redhat.com
 [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E382B5D9CD;
 Wed, 22 Jul 2020 18:34:11 +0000 (UTC)
Subject: Re: https booting
To: Gerd Hoffmann <kraxel@redhat.com>, ipxe-devel@lists.ipxe.org,
 qemu-devel@nongnu.org
References: <20200722120827.dq72uabrk26nllra@sirius.home.kraxel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <3ae745cb-487e-c380-7899-5fa274cc3e4c@redhat.com>
Date: Wed, 22 Jul 2020 20:34:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200722120827.dq72uabrk26nllra@sirius.home.kraxel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 21:28:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/22/20 14:08, Gerd Hoffmann wrote:

> How does edk2 handle the root ca problem?

It has no builtin CA certificate. HTTPS boot will not work until at
least one trusted CA cert is imported.

The setup TUI offers an option to import CA cert(s) from local files
(which must be on such filesystems that edk2 can read).

The platform may set up CA certs without (guest-)user interaction, too.
That's what OVMF and ArmVirtQemu do. On the host side, the command

  p11-kit extract --format=edk2-cacerts --filter=ca-anchors \
    --overwrite --purpose=server-auth <certdb>

translates the host-side trusted CA cert list into a format that edk2
can consume.

This p11-kit command is usually invoked as part of the higher-level command

  update-ca-trust extract

When "p11-kit extract" is invoked like that, then the <certdb> pathname
is (for example)

  /etc/pki/ca-trust/extracted/edk2/cacerts.bin

Then QEMU is launched with the following option:

  -fw_cfg name=etc/edk2/https/cacerts,file=<certdb>

OVMF and ArmVirtQemu then fetch the CA cert list from fw_cfg, and make
the generic TLS code use it:

- 9c7d0d499296 ("OvmfPkg/TlsAuthConfigLib: configure trusted CA certs
for HTTPS boot", 2018-03-30)

- ffe048a0807b ("ArmVirtPkg: handle NETWORK_TLS_ENABLE in ArmVirtQemu*",
2019-06-28)

Thanks
Laszlo


