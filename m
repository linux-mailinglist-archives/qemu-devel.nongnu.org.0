Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2D242C52
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 17:48:27 +0200 (CEST)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5szK-0003jX-Rw
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 11:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1k5syc-0003J7-E4
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 11:47:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60299
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1k5syY-0005QJ-Qf
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 11:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597247257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YVkTfbwPTVfS5fKRuZk7Ey3PRGpjVGC1Kk3af8yUSg=;
 b=g+0RifzAGQN7xOc7JuhBMbqEZSgSPIEyGeTiQNTwr66tppy+4TAw+4PTZZnQ9ruwA3N0nZ
 Mcyap13Dk/ZK1xRGxncSlNpfFgXiLkxmEGuRzb1gQhtNk1okHQk0f37ZogZJaBoVhjuNEu
 5pCSS7s3z3CFD1n/zHVZnq5cQSvwiZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-A7d_G0hGPA2XNB_Ky_yr_g-1; Wed, 12 Aug 2020 11:46:26 -0400
X-MC-Unique: A7d_G0hGPA2XNB_Ky_yr_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A151C1005504;
 Wed, 12 Aug 2020 15:46:25 +0000 (UTC)
Received: from [10.10.117.41] (ovpn-117-41.rdu2.redhat.com [10.10.117.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3196F100AE50;
 Wed, 12 Aug 2020 15:46:22 +0000 (UTC)
Subject: Re: hw-display-qxl.so: undefined symbol: qemu_qxl_io_log_semaphore
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <3a19e8c0-215a-bc18-9817-450affec7f08@redhat.com>
 <20200729125034.GG37763@stefanha-x1.localdomain>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <3206f141-be6b-02e1-d1f3-5f56551ef1d5@redhat.com>
Date: Wed, 12 Aug 2020 11:46:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200729125034.GG37763@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=crobinso@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 10:32:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/20 8:50 AM, Stefan Hajnoczi wrote:
> On Thu, Jul 16, 2020 at 05:10:26PM -0400, Cole Robinson wrote:
>> I'm trying to build qemu 5.1.0-rc0 in Fedora. I'm hitting some issues.
> 
> For anyone else reading this email thread, this was fixed in QEMU
> 5.1.0-rc1:
> 
>   commit d97df4b84bc42613cf9a03619de453ebd0be30b7
>   Author: Gerd Hoffmann <kraxel@redhat.com>
>   Date:   Mon Jul 20 12:03:50 2020 +0200
> 
>       qxl: fix modular builds with dtrace
> 

FWIW I'm still hitting issues with qemu-5.1.0 GA but maybe it's
unrelated to that specific fix. Issues reproduce on fedora 33+, not
fedora 32.

Here's a build log for 5.1.0 GA on Fedora 33 x86_64:
https://kojipkgs.fedoraproject.org//work/tasks/6937/49136937/build.log

grep for 'undefined symbol' and you'll see qemu-iotest failures, for
example:

--- /builddir/build/BUILD/qemu-5.1.0-rc3/tests/qemu-iotests/127.out
2020-08-05 16:41:09.000000000 +0000
+++
/builddir/build/BUILD/qemu-5.1.0-rc3/build-dynamic/tests/qemu-iotests/127.out.bad
2020-08-11 19:50:39.245897057 +0000
@@ -1,4 +1,5 @@
 QA output created by 127
+Failed to open module:
/builddir/build/BUILD/qemu-5.1.0-rc3/build-dynamic/x86_64-softmmu/../hw-display-qxl.so:
undefined symbol: qemu_qxl_client_monitors_config_crc_semaphore


On s390x where spice+qxl aren't compiled, we see different symbol errors
in the logs here:
https://kojipkgs.fedoraproject.org//work/tasks/6091/49136091/build.log

--- /builddir/build/BUILD/qemu-5.1.0/tests/qemu-iotests/127.out
2020-08-11 19:17:15.000000000 +0000
+++
/builddir/build/BUILD/qemu-5.1.0/build-dynamic/tests/qemu-iotests/127.out.bad
2020-08-12 12:16:20.472179636 +0000
@@ -1,4 +1,5 @@
 QA output created by 127
+Failed to open module:
/builddir/build/BUILD/qemu-5.1.0/build-dynamic/s390x-softmmu/../hw-usb-smartcard.so:
undefined symbol: ccid_card_send_apdu_to_guest

So maybe there's a more general problem. FWIW Fedora 33 started using
LTO by default, but it was disabled for the qemu package.

- Cole


