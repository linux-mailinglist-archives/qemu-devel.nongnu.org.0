Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C74543885
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:13:21 +0200 (CEST)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyJ6-0002J5-9q
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nyyDR-0005bQ-7d
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nyyDP-0001Nc-Cm
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654704446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePxysSndmriLyiFgZaX4qbpOyL7tFSuOFwiWxtsFWe0=;
 b=Xyv1ivUvfHTe+RmWSIaa2WTS0TudOV256nrqjihYeVXBZOc8vYqmsSO0WTAS81DoBvpDJi
 NatY0ZY+MoWGpZjHzx/BRwA7nBVOR9gSd8ovmYnmMSmRHSpatoNXYIcOji7G5xZS+FkkpJ
 AB+U7hRYe9UM8wYoCc5Wegmc6Y/kJ4Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-G-hhvdLZMiS8buoj5jaOEg-1; Wed, 08 Jun 2022 12:07:25 -0400
X-MC-Unique: G-hhvdLZMiS8buoj5jaOEg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1A5080B90D
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 16:07:24 +0000 (UTC)
Received: from [10.22.8.131] (unknown [10.22.8.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 851E6492C3B;
 Wed,  8 Jun 2022 16:07:24 +0000 (UTC)
Message-ID: <afabd863-d3d9-83c2-b867-7af27c53762a@redhat.com>
Date: Wed, 8 Jun 2022 12:07:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: dbus-display-test is flakey
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <d2847516-b923-5301-f20f-8d4704a41b2c@redhat.com>
 <CAMxuvaxs1Aa5Pxw39YB-QM7q5_FcL6_3Q6O=AZiXFefWf3rZbQ@mail.gmail.com>
From: Cole Robinson <crobinso@redhat.com>
In-Reply-To: <CAMxuvaxs1Aa5Pxw39YB-QM7q5_FcL6_3Q6O=AZiXFefWf3rZbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/22 4:57 PM, Marc-André Lureau wrote:
> Hi Cole,
> 
> 
> On Sun, Jun 5, 2022 at 6:46 PM Cole Robinson <crobinso@redhat.com> wrote:
>>
>> Hi Marc-André,
>>
>> dbus-display-test seems flakey. I'm occasionally seeing:
>>
>> ▶ 692/746
>> ERROR:../tests/qtest/dbus-display-test.c:68:test_dbus_display_vm:
>> assertion failed
>> (qemu_dbus_display1_vm_get_name(QEMU_DBUS_DISPLAY1_VM(vm)) ==
>> "dbus-test"): (NULL == "dbus-test") ERROR
>>
> 
> Quite an interesting error. The generated dbus proxy code is all
> gobject async init, but the proxy is created synchronously with
> qemu_dbus_display1_vm_proxy_new_sync(), and all cached properties must
> have been set at construction time.
> 
> And nobody else reported this issue so far, but I also noticed that it
> does not seem to be covered by the CI at this point (only centos has
> --enabled-modules, but is missing the glib 2.64 requirements)
> 

Interesting. redhat distro family and debian distro family are both
using --enable-modules for their packages, for a while now. Maybe qemu
CI should be using --enable-modules more. I have a patch on the list
that fixes a qemu-iotests failure that's indirectly caused --enable-modules

>> Examples:
>>
>> fedora rawhide x86_64:
>> https://kojipkgs.fedoraproject.org//work/tasks/4945/87834945/build.log
>> fedora rawhide aarch64:
>> https://kojipkgs.fedoraproject.org//work/tasks/4946/87834946/build.log
>> fedora 35 x86_64:
>> https://download.copr.fedorainfracloud.org/results/@virtmaint-sig/virt-preview/fedora-35-x86_64/04491978-qemu/builder-live.log.gz
>>
> 
> Are you able to reproduce outside koji? I have been running the test
> in a loop for a long while, not seeing any error.
> 

I tried a couple local qemu.git x86_64 builds but couldn't reproduce. If
environment is a factor my guess is its race/load dependent, maybe
exacerbated by 'mock' used used by both koji and copr.

>> This is qemu v7.0.0 with some unrelated patches on top. /usr/bin/make -O
>> -j5 V=1 VERBOSE=1 check
>>
>> Side question: I know I can patch meson.build to skip the test, or
>> similar patch changes, but is there a non-patch way to skip specific tests?
> 
> "meson test" currently supports specifying the tests or subproject to
> run, or using --suite / --no-suite SUITE.
> 
> (mtest2make.py creates convenience check-SUITE rules)
> 
> We could probably add a suite "dbus", and add the test(s) there, so
> you could run "meson test --no-suite dbus".
> 

Ah that's good to know. Looks like we can use `MTESTFLAGS='--no-suite
block' make check` to skip iotests which is flaky for other reasons
reported elsewhere.

Adding a suite just for this dbus case doesn't matter to me now. But IMO
it would be useful if there was a way to skip an individual test without
patching code. QEMU_TEST_SKIP="dbus-display-test.c:bar.c" or something.
Just a thought; maybe there's no simple way to wire that in.

Thanks,
Cole


