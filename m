Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4538F2D71BD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 09:31:48 +0100 (CET)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kndq6-0007eR-0b
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 03:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndom-0006xx-Nz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndoj-0001LQ-2w
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607675419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giZcTNC2eZnF71QeYlzJ8Zny6MwW28xXVJureHbF9do=;
 b=HY1DhdWDiSq9yRhCbkjvZTcDwY1Dj6uSu66nq11H58R4ekEh05zM1BNjL1p8gqPlfN3TZf
 xAUkEWF/b+7/gOpmckR0EfT0d1xxKFkHX96pjlNNGzcB4c2LFRpr6jtI9BZrCtlIaXWYPP
 WM405miC3lePLs5Qrg8RO6BS7UTvaiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-paY8CdvSOLS6v9PcABUomw-1; Fri, 11 Dec 2020 03:30:15 -0500
X-MC-Unique: paY8CdvSOLS6v9PcABUomw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B77107ACE3;
 Fri, 11 Dec 2020 08:30:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19D619725;
 Fri, 11 Dec 2020 08:30:11 +0000 (UTC)
Subject: Re: [PATCH v3 0/7] silence the compiler warnings
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83BAEA98B@dggemm531-mbx.china.huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5d78cb34-82fd-0bce-4006-316af4781ab6@redhat.com>
Date: Fri, 11 Dec 2020 09:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83BAEA98B@dggemm531-mbx.china.huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 ganqixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 03.22, Chenqun (kuhn) wrote:
> Kindly ping!
> 
> Hi all,
>   Patch 1 to Patch 5 are not in the queue.  Could someone pick them up？

 Hi,

yes, I'm currently preparing another patch series that includes your
patches, which will finally turn on -Wimplicit-fallthrough for everybody.
I'll send it out once David's ppc pull request has been merged, so that I
don't have to include the ppc patches again.

 Thomas


