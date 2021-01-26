Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E9304AF0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:04:47 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4VW1-0001sp-KI
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4VSq-0000n7-JQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4VSo-0000Xf-2X
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611694884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMCq1dPwv6TCybV3lQcNV+Vrl4o5LyHiTguTaqUYScw=;
 b=Qlz4jfeiSKlr0eWqILb/GrC5Ya5679FtJntICYSLE4KqPB4JbI/AV90GuqGNUszEJhes+S
 f7CgaXxFG1+vtyL8+4UqmYiqjkBnoOdi4JS+LGDp1IiXzDik5aGZo6RW1dOmN1Lk4UysA6
 k7HsKK+xuato2pvyKcs7gkzdFdDUSIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-xRZr8oGUPNqxy8XtJhbKEQ-1; Tue, 26 Jan 2021 16:01:21 -0500
X-MC-Unique: xRZr8oGUPNqxy8XtJhbKEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88E151006CB6;
 Tue, 26 Jan 2021 21:00:56 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C84E11F0;
 Tue, 26 Jan 2021 21:00:55 +0000 (UTC)
Subject: Re: [PATCH v5 01/10] iotests.py: Assume a couple of variables as given
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210118105720.14824-1-mreitz@redhat.com>
 <20210118105720.14824-2-mreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ff064b2a-9013-2811-5787-3b7bc45f297c@redhat.com>
Date: Tue, 26 Jan 2021 16:00:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118105720.14824-2-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 5:57 AM, Max Reitz wrote:
> There are a couple of environment variables that we fetch with
> os.environ.get() without supplying a default.  Clearly they are required
> and expected to be set by the ./check script (as evidenced by
> execute_setup_common(), which checks for test_dir and
> qemu_default_machine to be set, and aborts if they are not).
> 
> Using .get() this way has the disadvantage of returning an Optional[str]
> type, which mypy will complain about when tests just assume these values
> to be str.
> 
> Use [] instead, which raises a KeyError for environment variables that
> are not set.  When this exception is raised, catch it and move the abort
> code from execute_setup_common() there.
> 

Good idea.

> Drop the 'assert iotests.sock_dir is not None' from iotest 300, because
> that sort of thing is precisely what this patch wants to prevent.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>


