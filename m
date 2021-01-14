Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798F2F5F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 11:50:37 +0100 (CET)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00D6-0001RR-4k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 05:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l00BY-0000ny-FY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l00BW-0005T5-8S
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610621336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fFyZ36t0C447CmX0uw34/nepDpQ54J0OrjqXCtKomzo=;
 b=IVEuGx514WjiSKaCV49eYIpz2ZuA4saZMw4PuQuvVbbyxVPdwK9xHDqSiiEc4653KphwT4
 yEzMZ8IyFBvk4BT3L3tBSZBzl8puwAEMBz9hhRIbpziVZBVK/9QR+qUWPHGViuSWNws7Tb
 Vnl87uFhWP9kGoubw9Z44iIh69N8CwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-6pKymdRwNzuRV7RqUWaE-A-1; Thu, 14 Jan 2021 05:48:53 -0500
X-MC-Unique: 6pKymdRwNzuRV7RqUWaE-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45508018A1;
 Thu, 14 Jan 2021 10:48:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EADDB10016FB;
 Thu, 14 Jan 2021 10:48:50 +0000 (UTC)
Date: Thu, 14 Jan 2021 11:48:49 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 07/11] iotests: add findtests.py
Message-ID: <20210114104849.GB6058@merkur.fritz.box>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-8-vsementsov@virtuozzo.com>
 <20210112164211.GB6075@merkur.fritz.box>
 <4709b4e4-6fe6-86c1-ac7a-b3933b04dd30@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <4709b4e4-6fe6-86c1-ac7a-b3933b04dd30@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.2021 um 08:38 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 12.01.2021 19:42, Kevin Wolf wrote:
> > > +    def find_tests(self, groups: Optional[List[str]] = None,
> > > +                   exclude_groups: Optional[List[str]] = None,
> > > +                   tests: Optional[List[str]] = None,
> > group and tests seem to be read-only, so this can be simplified to
> > 'groups: Sequence[str] = ()' etc. without the explicit handling of None
> > below.
> 
> None comes when cmdline argument is not set, will sequence as you propose I get
> 
> Traceback (most recent call last):
>   File "/work/src/qemu/up-refactor-iotests/build/tests/qemu-iotests/./check", line 37, in <module>
>     tests, remaining_argv = find_tests(env.remaining_argv,
>   File "/work/src/qemu/up-refactor-iotests/tests/qemu-iotests/findtests.py", line 208, in find_tests
>     return tf.find_tests_argv(argv)
>   File "/work/src/qemu/up-refactor-iotests/tests/qemu-iotests/findtests.py", line 193, in find_tests_argv
>     return self.find_tests(**vars(args)), remaining
>   File "/work/src/qemu/up-refactor-iotests/tests/qemu-iotests/findtests.py", line 165, in find_tests
>     if 'disabled' not in groups and 'disabled' not in exclude_groups:
> TypeError: argument of type 'NoneType' is not iterable
> 
> So, seems simpler to keep all as is than modifying find_tests_argv to not pass None arguments.

Ah, I wasn't aware that you would get explicit None. Fair enough.

Kevin


