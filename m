Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B096589518
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 02:51:32 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwyYd-0002YX-F6
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 20:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hwyYA-00028v-42
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 20:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hwyY8-0008T1-Rm
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 20:51:02 -0400
Received: from mga07.intel.com ([134.134.136.100]:41771)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hwyY8-0007kc-Jr
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 20:51:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Aug 2019 17:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,375,1559545200"; d="scan'208";a="259632606"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 11 Aug 2019 17:49:28 -0700
Date: Mon, 12 Aug 2019 08:49:05 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190812004905.GA1937@richard>
References: <20190808020723.GB26938@richard> <20190808080229.GA2534@redhat.com>
 <20190808084653.GB32524@richard> <20190808092213.GB2534@redhat.com>
 <20190809000609.GA4201@richard> <20190809091214.GD13660@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190809091214.GD13660@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [Fail] tests/test-util-filemonitor fails
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: marcandre.lureau@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 09, 2019 at 10:12:14AM +0100, Daniel P. Berrangé wrote:
>On Fri, Aug 09, 2019 at 08:06:09AM +0800, Wei Yang wrote:
>> On Thu, Aug 08, 2019 at 10:22:13AM +0100, Daniel P. Berrangé wrote:
>> >On Thu, Aug 08, 2019 at 04:46:53PM +0800, Wei Yang wrote:
>> >> On Thu, Aug 08, 2019 at 09:02:29AM +0100, Daniel P. Berrangé wrote:
>> >> >On Thu, Aug 08, 2019 at 10:07:23AM +0800, Wei Yang wrote:
>> >> >> Current qemu fails tests/test-util-filemonitor.
>> >> >
>> >> >You'll need to provide more info. The test works for me and passes in all
>> >> >the QEMU CI environments.
>> >> >
>> >> 
>> >> The error message from my side is:
>> >> 
>> >> /util/filemonitor: Expected watch id 200000000 but got 100000000
>> >> **
>> >> ERROR:tests/test-util-filemonitor.c:665:test_file_monitor_events: assertion failed: (err == 0)
>> >> 
>> >> What else you'd prefer to have?
>> >
>> >Can you set the  "FILEMONITOR_DEBUG=1" env variable before running
>> >the test - it will print out lots more info
>> >
>> 
>> Here is the output with more info.
>> 
>>     $ FILEMONITOR_DEBUG=1 QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 tests/test-util-filemonitor
>
>>     Rmdir /tmp/test-util-filemonitor-151B6Z/fish
>>     Event id=200000000 event=4 file=
>>     Expected watch id 200000000 but got 100000000
>>     **
>
>Ok, so the kernel is sending the events in an unexpected order
>
>>     ERROR:tests/test-util-filemonitor.c:665:test_file_monitor_events: assertion failed: (err == 0)
>>     Aborted (core dumped)
>> 
>> 
>> >Also what operating system are you using, and what kernel version
>> >
>> 
>> OS: Ubuntu 18.04.2 LTS
>> Kernel: I built the kernel whose last commit is bed38c3e2dca.
>
>Does it work if you use the normal LTS kernel package instead.
>

It looks good on LTS kernel.

$ uname -a
Linux richard 4.15.0-55-generic #60-Ubuntu SMP Tue Jul 2 18:22:20 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

$ QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 tests/test-util-filemonitor
/util/filemonitor: OK


>
>Regards,
>Daniel
>-- 
>|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

-- 
Wei Yang
Help you, Help me

