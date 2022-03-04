Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115104CD934
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:38:00 +0100 (CET)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAwI-00050R-Ka
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQAup-0003d1-PH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQAul-0005Nz-Pp
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646411782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g2ze6bxGC0pG/BZmy2e44H/bVjGoTH2jNMWgBR8cbY=;
 b=CXW9d2ExQI0RpYPW6dhzf85RrzBTYmWLsbMAyaWgA6d6cej+w0Ng5rEI06+CXV8BxuNbJg
 s/iAG56yFu47u0zuL24C/YioYON1igTkO9vvKX3jle8FdyEJvdbcPZDweN8mO23XWAlJmw
 l1VOlUHFbbt8T6M1374+Ck67Ky0Jzmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-iGec6p8SMRmWDq2dG2o4ug-1; Fri, 04 Mar 2022 11:36:19 -0500
X-MC-Unique: iGec6p8SMRmWDq2dG2o4ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36EBE1006AA5;
 Fri,  4 Mar 2022 16:36:18 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6237C022;
 Fri,  4 Mar 2022 16:36:16 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:36:14 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 06/12] tests/qemu-iotests: add QEMU_IOTESTS_REGEN=1 to
 update reference file
Message-ID: <20220304163614.u5fvi23dchjj7bvi@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-7-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303160330.2979753-7-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 04:03:24PM +0000, Daniel P. Berrangé wrote:
> When developing an I/O test it is typical to add some logic to the
> test script, run it to view the output diff, and then apply the
> output diff to the reference file. This can be drastically simplified
> by letting the test runner update the reference file in place.
> 
> By setting 'QEMU_IOTESTS_REGEN=1', the test runner will report the
> failure and show the diff, but at the same time update the reference
> file. So next time the I/O test is run it will succeed.
> 
> Continuing to display the diff when updating the reference gives the
> developer a chance to review what was changed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qemu-iotests/testrunner.py | 6 ++++++
>  1 file changed, 6 insertions(+)

I like it - I've wished for similar when writing a test.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


