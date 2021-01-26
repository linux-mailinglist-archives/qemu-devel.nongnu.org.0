Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B78303DBD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:54:27 +0100 (CET)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NrW-0007NN-GE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4NqP-0006vp-2G
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4NqN-0007oB-D6
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611665594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFyh5CccXY372qrnoqxU6inZXrXnMupMLbvSjqg/Uu4=;
 b=fs5O6R1M8q6OXUkkxhGPz1aA+dCANNqVhLvJFxhGQ7FxAEEXNHNOJbwqCtKAb3SahP8bZg
 BFlUToiKEeu6H8enNsMAqlYX1UDCrCZHB+1NQVjtvc05mThKdYxHT7hQVbfzH5ek/OV7xI
 JqtSmDwumFXLMfLUG+UfRvJWcjd6YOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-Tndbpa02Mi6AC_MoR8MrTg-1; Tue, 26 Jan 2021 07:53:12 -0500
X-MC-Unique: Tndbpa02Mi6AC_MoR8MrTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACB5B8042AA;
 Tue, 26 Jan 2021 12:53:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30CB3E146;
 Tue, 26 Jan 2021 12:53:03 +0000 (UTC)
Date: Tue, 26 Jan 2021 13:53:01 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 0/6] Rework iotests/check
Message-ID: <20210126125301.GE4385@merkur.fritz.box>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210125185056.129513-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.2021 um 19:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> v9:
> 01: new, one more whitespace-fixing patch
> testenv: allow case when we don't have system-arch emulator, but have several for another architectures
>          change direct os.access(..., os.X_OK) calls to new helper function which also check that path is a file
> testrunner: s/fail/not run/ for 'No qualified output'
>             drop elapsed time arg for one of 'not run' results (now no elapsed time for any 'not run' result)

More CI fun:

Traceback (most recent call last):
  File "./check", line 117, in <module>
    testfinder = TestFinder(test_dir=env.source_iotests)
  File "/builds/.../qemu/tests/qemu-iotests/findtests.py", line 53, in __init__
    for line in f:
  File "/usr/lib64/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 1591: ordinal not in range(128)

Traceback (most recent call last):
  File "./check", line 112, in <module>
    env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
  File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 216, in __init__
    self.qemu_default_machine = get_default_machine(self.qemu_prog)
  File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 41, in get_default_machine
    default_machine = next(m for m in machines if m.endswith(' (default)'))
StopIteration

Kevin


