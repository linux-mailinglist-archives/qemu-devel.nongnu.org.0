Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2EE25C2BD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 16:34:26 +0200 (CEST)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDqJl-00011E-2B
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 10:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDqIn-0000Ki-66
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 10:33:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25421
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDqIl-0000Eh-5g
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 10:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599143600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eCQmgECSF3gcmegeFsFWp9mSQM6Z0qE781fjUjS5Ns=;
 b=H/EUBsW1d8uctPltm+TQKEMMqp8C0FKVHHA0zKG3PDcbHbgQ5IDNhN5SZ/CVokWZo5PrDM
 f5kAUNvSqq7n9kRQBUBT0jZbjHR6A8OTyfhI9pKIT1fcZwupWQqIckPUAg+wCwd6GJVUry
 taBgXyp7BA9Jj6i0dn+eRUYbaqOqxG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-47zjtk2IPrekNYNd9HcXSA-1; Thu, 03 Sep 2020 10:33:19 -0400
X-MC-Unique: 47zjtk2IPrekNYNd9HcXSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26DE3109106D;
 Thu,  3 Sep 2020 14:33:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-10.ams2.redhat.com [10.36.114.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8A02D07D;
 Thu,  3 Sep 2020 14:33:16 +0000 (UTC)
Subject: Re: make -i check resut for msys2
To: luoyonggang@gmail.com, qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE_TJ2T2eN82km0pYqDiqOpsd=waH4EmCe==0k=GYpj3Xg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3d2db346-2517-f6e3-748d-79a8ae993e06@redhat.com>
Date: Thu, 3 Sep 2020 16:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_TJ2T2eN82km0pYqDiqOpsd=waH4EmCe==0k=GYpj3Xg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Xie Changlong <xiechanglong.d@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2020 11.18, 罗勇刚(Yonggang Luo) wrote:
[...]
>   TEST    check-unit: tests/test-replication.exe
> **
> ERROR:C:/work/xemu/qemu/tests/test-replication.c:136:make_temp:
> assertion failed: (fd >= 0)
> ERROR test-replication.exe - Bail out!
> ERROR:C:/work/xemu/qemu/tests/test-replication.c:136:make_temp:
> assertion failed: (fd >= 0)

At least this one should be easy to fix: The test uses /tmp as
hard-coded directory for temporary files. I think it should use
g_get_tmp_dir() from glib to get that directory instead.

 Thomas


