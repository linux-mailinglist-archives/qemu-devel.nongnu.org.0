Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB402689A3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 12:55:01 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHm8S-0008KH-JQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 06:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHm7Y-0007D9-Mt
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHm7X-00049S-3R
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600080842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rxO1qGL93W1kCEnAuMMsaQDOZOxQ81DG8Y4SRK85+Q=;
 b=Gp1gVstPzqyHL4TgbZuciFbth7qhyuBoTuDQ/G6iscWIuc75OuhioqpmtkNfBLwSWPrHio
 JMBBI6ZjwlxfqiVbxKi8sYvAOOnmRfF/F0whhHPtCzRKYs911hC5ViqLV+ieEZlalk4P9j
 8scef0P7pQimnITKzRvbSRdAiB50p/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-Wkru81uyMiiCyfrprMbucQ-1; Mon, 14 Sep 2020 06:54:00 -0400
X-MC-Unique: Wkru81uyMiiCyfrprMbucQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D608030A1;
 Mon, 14 Sep 2020 10:53:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57B8D5DA60;
 Mon, 14 Sep 2020 10:53:54 +0000 (UTC)
Subject: Re: [qemu-web PATCH] Add QEMU storage overview blog post
To: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20200907150421.8106-1-stefanha@redhat.com>
 <20200914103507.GG579094@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <226a454f-3d8d-749b-ca25-b3f3f1912d0b@redhat.com>
Date: Mon, 14 Sep 2020 12:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200914103507.GG579094@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, afrosi@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2020 12.35, Stefan Hajnoczi wrote:
> On Mon, Sep 07, 2020 at 04:04:21PM +0100, Stefan Hajnoczi wrote:
>> I want to kick of a series of posts about storage. The first post covers
>> high-level concepts, features, and utilities in QEMU. Later posts will
>> discuss configuration details, architecture, and performance.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  _posts/2020-09-07-qemu-storage-overview.md | 122 +++++++
>>  screenshots/2020-09-07-block-device-io.svg | 366 +++++++++++++++++++++
>>  screenshots/2020-09-07-lifecycle.svg       | 328 ++++++++++++++++++
>>  3 files changed, 816 insertions(+)
>>  create mode 100644 _posts/2020-09-07-qemu-storage-overview.md
>>  create mode 100644 screenshots/2020-09-07-block-device-io.svg
>>  create mode 100644 screenshots/2020-09-07-lifecycle.svg
> 
> Ping? Thomas, you would you be able to merge this?

Sorry, your mail successfully hid in my overcrowded inbox :-( ... thanks
to Paolo for pushing it!

 Thomas


