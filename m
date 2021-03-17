Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528E33EF94
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:30:03 +0100 (CET)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUNF-0007JD-V4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMUM7-0006bF-AE
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMUM4-00048S-TN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615980527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABTvA01KtKJ8d/MABI2rlQqRnCmJV7sjX3J6uFjI3dw=;
 b=RTDN58552pIuqhvHG/rsJzMpzMPR2/20uUAXxxeJU/R+ogkIebxMmyxNcagS3b4H6trfZ8
 tpKQr6Gv/SHwvsBV5AntNe9qNGe+GSMFWXE12ZMFVqNhF+Dhv/TEQ05GVy0CP5bwLZuOXz
 VNQ/XV2UPMGqb69/RArEIEYTH7IPbUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-jO1O7KALNJe9KL5zlIPe_w-1; Wed, 17 Mar 2021 07:28:43 -0400
X-MC-Unique: jO1O7KALNJe9KL5zlIPe_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DCAE10168F3;
 Wed, 17 Mar 2021 11:28:34 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFABF60853;
 Wed, 17 Mar 2021 11:28:33 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210309155202.1312571-1-eblake@redhat.com>
 <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
 <c6036170-b943-1a60-90b3-668ac1637d6d@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PULL 00/17] NBD patches through 2021-03-09
Message-ID: <60832e5c-8bea-7797-6054-d83777305033@redhat.com>
Date: Wed, 17 Mar 2021 06:28:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c6036170-b943-1a60-90b3-668ac1637d6d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 6:17 AM, Thomas Huth wrote:

>> ERROR:../tests/test-cutils.c:2290:test_qemu_strtosz_metric: assertion
>> failed (res == 12345000): (12344999 == 12345000)
> 
> A different failure shows up in the MSYS2 builds now, too:
> 
> https://cirrus-ci.com/task/5180846782021632?command=test#L543

A bug in mingw's libc for strtoull() that parses "0x" incorrectly (the
correct parse is "0" with the endptr pointing to 'x', and NOT pointing
beyond x).  Also a weakness in our testsuite - many of the tests are not
asserting sane values of err, or whether res is left unchanged on error.

I'm working on a patch now that I have more awareness of what's going on...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


