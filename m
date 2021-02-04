Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E430EC4B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 07:05:01 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7XlE-0007dd-EC
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 01:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Xk5-0006vt-M0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Xk1-0005RI-Un
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612418623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paeziodS+8PBjOWuX3wYptWpLXBAcdEy2Q5dqXyfA3w=;
 b=bbtcLG75bvU860lv3oz6RNjvtGePKErWHSxfDCkS4bQUpCH7pZ/o/kVsrnUuv7HCwYvl9L
 qB2hUzGrKkmZGNU3LNosXsGIN63VYf1CLa9DeyU199uBm4N1ghNTF6qF6o7Ulit2t0N7hb
 T/s5j2SWvjcuQEcppTGzNELprbyA1BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-56GDTBLMMJ6T-DvIFvmw0Q-1; Thu, 04 Feb 2021 01:03:40 -0500
X-MC-Unique: 56GDTBLMMJ6T-DvIFvmw0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB79B801970;
 Thu,  4 Feb 2021 06:03:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF0B22C15A;
 Thu,  4 Feb 2021 06:03:37 +0000 (UTC)
Subject: Re: gitlab containers are broken
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
Date: Thu, 4 Feb 2021 07:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2021 00.04, Richard Henderson wrote:
> Something has gone wrong with the building of the containers
> in gitlab, because *all* off them are installing Alpine Linux.
> 
> https://gitlab.com/rth7680/qemu/-/jobs/1006336396#L155

I think that's ok ... the output about alpine that you see there is just the 
output from the container that builds the final container. Later you can see 
some "yum install" lines in that output, too, that's where the CentOS 
container gets build. And the final compilation job runs on CentOS, too:

  https://gitlab.com/rth7680/qemu/-/jobs/1006336699#L35

(look for the string "Red Hat" there)

> I presume that IMAGE is not actually being passed through, and alpine.docker is
> lexicographically first.
> 
> I have a strong suspicion that it's related to local "make docker" breakage, in
> that e.g.
> 
> $ make docker-test-build@fedora-i386-cross
> /usr/bin/python3 -B /home/rth/qemu/qemu/meson/meson.py introspect --targets
> --tests --benchmarks | /usr/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
> make: *** No rule to make target 'docker-test-build@fedora-i386-cross'.  Stop.
> 
> which certainly looks like the docker-TEST@IMAGE format documented.

No clue about that, local containers never really worked for me... Alex? 
Philippe? Any ideas?

  Thomas


