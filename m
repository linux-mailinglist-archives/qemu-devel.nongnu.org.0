Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1F303ECD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:34:18 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OU5-0008Ca-Vo
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4OPz-0006IX-4j
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4OPw-0005Py-Vx
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611667800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iAJMET0Hdm9++50GWZ4VT40afCS+f+ItO9uq2Hx0b2k=;
 b=iePvK/NOBVo87pg79U/uILLIL3EIZHkGC+NoBxnKzEX6wGTLFlqfsmmd3S+123Rax7OXxQ
 OZMq2llitp883YmNRbDex8jDSt+eGAwplhq7cmE9hQnvmjNSpSBLkmpfaEW7Wwd+2PuLZZ
 9+9x6dovZ87sF8134m272X/BLUxvp4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-lxx2puOuPcqB1EWGXjjaaA-1; Tue, 26 Jan 2021 08:29:57 -0500
X-MC-Unique: lxx2puOuPcqB1EWGXjjaaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 965EA804756;
 Tue, 26 Jan 2021 13:29:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF9410016FF;
 Tue, 26 Jan 2021 13:29:54 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:29:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 0/6] Rework iotests/check
Message-ID: <20210126132953.GF4385@merkur.fritz.box>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 26.01.2021 um 14:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 26.01.2021 15:53, Kevin Wolf wrote:
> > Am 25.01.2021 um 19:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > v9:
> > > 01: new, one more whitespace-fixing patch
> > > testenv: allow case when we don't have system-arch emulator, but have several for another architectures
> > >           change direct os.access(..., os.X_OK) calls to new helper function which also check that path is a file
> > > testrunner: s/fail/not run/ for 'No qualified output'
> > >              drop elapsed time arg for one of 'not run' results (now no elapsed time for any 'not run' result)
> > 
> > More CI fun:
> > 
> > Traceback (most recent call last):
> >    File "./check", line 117, in <module>
> >      testfinder = TestFinder(test_dir=env.source_iotests)
> >    File "/builds/.../qemu/tests/qemu-iotests/findtests.py", line 53, in __init__
> >      for line in f:
> >    File "/usr/lib64/python3.6/encodings/ascii.py", line 26, in decode
> >      return codecs.ascii_decode(input, self.errors)[0]
> > UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 1591: ordinal not in range(128)
> 
> Can be solved by adding encoding='utf8' to the open().. But.. Adding
> it everywhere is not fun.
> 
> So, what about just define PYTHONUTF8=1 for running check in
> check-block.sh?

Ah, I didn't know this one. Yes, that's probably nicer than my attempt
of adding an explicit encoding everywhere.

> > Traceback (most recent call last):
> >    File "./check", line 112, in <module>
> >      env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
> >    File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 216, in __init__
> >      self.qemu_default_machine = get_default_machine(self.qemu_prog)
> >    File "/builds/.../qemu/tests/qemu-iotests/testenv.py", line 41, in get_default_machine
> >      default_machine = next(m for m in machines if m.endswith(' (default)'))
> 
> Looking at original check, default_machine should be empty string in this case.
> 
> so we need
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 8b80425670..222395caef 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -38,7 +38,11 @@ def get_default_machine(qemu_prog: str) -> str:
>                            stdout=subprocess.PIPE).stdout
>      machines = outp.split('\n')
> -    default_machine = next(m for m in machines if m.endswith(' (default)'))
> +    try:
> +        default_machine = next(m for m in machines if m.endswith(' (default)'))
> +    except StopIteration:
> +        return ''
> +
>      default_machine = default_machine.split(' ', 1)[0]
>      alias_suf = ' (alias of {})'.format(default_machine)

This one looks a bit nicer than mine (using None instead of an
exception), too, so I'll apply this one as well for the next test cycle.

Kevin


