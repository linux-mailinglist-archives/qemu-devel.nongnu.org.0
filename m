Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173325D114
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 08:05:16 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE4qZ-00073A-O6
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 02:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kE4ow-0006Xh-T6
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 02:03:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31023
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kE4ou-0004Jp-9E
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 02:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599199410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2RJF5VUCGqQ/4qklZ8eqRwh4QhIzbpsdovBKaqGaH0=;
 b=AmO1xnRH0PyTvW8xXkXDb2hJQERNCf6wVBZZKu06tnGzp23gusTYZYGa1NEXhuhJT4Nug5
 xOeyRQC8OzQRyB5K0vvdeNvxGDsGSDU+jyfueoEKeb60O3jXeexyoe92UsszWwrHGX9LMH
 cwppLotV4P9T0ZM48VtslEsYH1792LE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-6ruqAz0TPJmLpFAllG6BTA-1; Fri, 04 Sep 2020 02:03:25 -0400
X-MC-Unique: 6ruqAz0TPJmLpFAllG6BTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5600E800683;
 Fri,  4 Sep 2020 06:03:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B49FF5D9CC;
 Fri,  4 Sep 2020 06:03:18 +0000 (UTC)
Subject: Re: make -i check resut for msys2
To: luoyonggang@gmail.com
References: <CAE2XoE_TJ2T2eN82km0pYqDiqOpsd=waH4EmCe==0k=GYpj3Xg@mail.gmail.com>
 <3d2db346-2517-f6e3-748d-79a8ae993e06@redhat.com>
 <CAE2XoE_3Kjjk+tRz1y7rk94+vre2FSfmCGQVWNgjNW14vSNSdw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <48c60a95-c30b-433a-7955-3845074776d8@redhat.com>
Date: Fri, 4 Sep 2020 08:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_3Kjjk+tRz1y7rk94+vre2FSfmCGQVWNgjNW14vSNSdw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/09/2020 00.53, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Thu, Sep 3, 2020 at 10:33 PM Thomas Huth <thuth@redhat.com
> <mailto:thuth@redhat.com>> wrote:
> 
>     On 03/09/2020 11.18, 罗勇刚(Yonggang Luo) wrote:
>     [...]
>     >   TEST    check-unit: tests/test-replication.exe
>     > **
>     > ERROR:C:/work/xemu/qemu/tests/test-replication.c:136:make_temp:
>     > assertion failed: (fd >= 0)
>     > ERROR test-replication.exe - Bail out!
>     > ERROR:C:/work/xemu/qemu/tests/test-replication.c:136:make_temp:
>     > assertion failed: (fd >= 0)
> 
>     At least this one should be easy to fix: The test uses /tmp as
>     hard-coded directory for temporary files. I think it should use
>     g_get_tmp_dir() from glib to get that directory instead.
> 
>      Thomas
> 
> After fixes tmp path, how to fixes following error:
> $ tests/test-replication.exe                                            
>                                                                        
>                                                                        
>          
> # random seed: R02Sdf2e4ffc0e6fbe96624598386b538927
> 1..13
> # Start of replication tests
> # Start of primary tests
> Unexpected error in bdrv_open_inherit() at ../block.c:3456:
> Block protocol 'file' doesn't support the option 'locking' 

Not sure ... as a temporary test, try to remove the "locking=off"
strings from the test. If it then works, it might be worth discussing
with the block layer folks how to handle this test on Windows in the
best way. If it still does not work, it's maybe simply not worth the
effort to try to get this test running on Windows - and thus mark it
with CONFIG_POSIX in the Makefile / meson.build.

 Thomas


