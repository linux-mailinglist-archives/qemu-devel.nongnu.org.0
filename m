Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C573A5DDB8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 07:19:42 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiXgD-0006Pg-LD
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 01:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hiXf0-0005pC-Fl
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:18:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hiXey-0004db-Ab
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:18:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hiXew-0004bF-G0
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:18:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 007E33083391;
 Wed,  3 Jul 2019 05:18:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-102.ams2.redhat.com
 [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79EF37BE6A;
 Wed,  3 Jul 2019 05:18:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 097F71132ABF; Wed,  3 Jul 2019 07:18:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190702113414.6896-1-armbru@redhat.com>
 <CAFEAcA9oPS2FbBgm+SQYqMbwzg+Dwmm0W9U8Vc-2LX7TmzAADg@mail.gmail.com>
Date: Wed, 03 Jul 2019 07:18:18 +0200
In-Reply-To: <CAFEAcA9oPS2FbBgm+SQYqMbwzg+Dwmm0W9U8Vc-2LX7TmzAADg@mail.gmail.com>
 (Peter Maydell's message of "Wed, 3 Jul 2019 00:14:57 +0100")
Message-ID: <87v9wjy9ut.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 03 Jul 2019 05:18:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 0/4] Build system patches for 2019-07-02
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 2 Jul 2019 at 12:38, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit ab200dafc0e8a9925bb0ad0be478621f5f117c95:
>>
>>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2019-07-02 10:17:54 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://repo.or.cz/qemu/armbru.git tags/pull-build-2019-07-02
>>
>> for you to fetch changes up to b7f9b1b7fc9a00ab6e5f46555e87166533292576:
>>
>>   Makefile: Reuse all's recursion machinery for clean and install (2019-07-02 12:48:40 +0200)
>>
>> ----------------------------------------------------------------
>> Build system patches for 2019-07-02
>
> This seems to break the incremental builds (most hosts):
>
> make: Entering directory '/home/petmay01/qemu-for-merges/build/w64'
> make: *** No rule to make target 'subdir-slirp', needed by
> 'config-host.h'.  Stop.
> make: *** Waiting for unfinished jobs....
> config-host.mak is out-of-date, running configure
> Install prefix    c:/Program Files/QEMU
> [rest of configure output snipped; no other output]

PATCH 3 changes the dependency configure writes to config-host.h like
this:

     if [ "$slirp" = "git" -o "$slirp" = "internal" ]; then
    -    echo "config-host.h: subdir-slirp" >> $config_host_mak
    +    echo "config-host.h: slirp/all" >> $config_host_mak
     fi

For me, make complains, reruns configure (which adjusts the dependency),
then happily makes everything.

Hmm, I see.  Without -k, make stops after rerunning configure.

Is that a problem?

