Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F410AB23
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 08:24:43 +0100 (CET)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZrgo-0006FG-Gl
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 02:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iZrfG-0005L4-CW
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 02:23:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iZrfE-00058g-1t
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 02:23:05 -0500
Received: from mga02.intel.com ([134.134.136.20]:3008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iZrfD-00056z-O6
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 02:23:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 23:22:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="217330725"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.197.13])
 ([10.239.197.13])
 by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2019 23:22:57 -0800
Subject: Re: [PATCH v17 01/14] util/cutils: Add Add qemu_strtold and
 qemu_strtold_finite
To: Markus Armbruster <armbru@redhat.com>
References: <20191122074826.1373-1-tao3.xu@intel.com>
 <20191122074826.1373-2-tao3.xu@intel.com>
 <8088b091-8f7c-a637-6333-e7c40935974f@intel.com>
 <87a78ispyc.fsf@dusky.pond.sub.org>
 <aaac6a06-0484-ceb7-7230-77b8362744b0@intel.com>
 <874kyplsy0.fsf@dusky.pond.sub.org>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <a96d3d0b-bcb1-937b-419c-89201213a94d@intel.com>
Date: Wed, 27 Nov 2019 15:22:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <874kyplsy0.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "sw@weilnetz.de" <sw@weilnetz.de>, "Du, Fan" <fan.du@intel.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/2019 2:44 PM, Markus Armbruster wrote:
> Tao Xu <tao3.xu@intel.com> writes:
> 
>> On 11/26/2019 9:54 PM, Markus Armbruster wrote:
>>> Tao Xu <tao3.xu@intel.com> writes:
>>>
>>>> Hi Markus,
>>>>
>>>> Do you have any comments on this patch and 02/14 05/14 06/14.
>>>> Thank you!
>>>
>>> These provide a new QAPI built-in type 'time'.  It's like 'uint64' with
>>> an implied nanoseconds unit, and additional convenience syntax in the
>>> opts visitor and the keyval qobject input visitor.  Patterned after
>>> 'size'.
>>>
>>> The only use of 'time' so far is member @latency of NumaOptions member
>>> @hmap-lb.  Uses of that:
>>>
>>> * QMP command set-numa-node
>>>
>>>     The convenience syntax does not apply, as QMP uses the regular qobject
>>>     input visitor, not the keyval one.
>>>
>>> * CLI option -numa
>>>
>>>     We first parse the option argument with QemuOpts, then convert it to
>>>     NumaOptions with the opts visitor.
>>>
>>>     The new built-in type 'time' gets used in -numa hmat-lb,...,latency=T
>>>
>>> Questions / observations:
>>>
>>> * The keyval qobject input visitor's support for 'time' appears to be
>>>     unused for now.
>>>
>>> * What's the anticipated range of values for -numa
>>>     hmat-lb,...,latency=T?  I'm asking because I wonder whether we really
>>>     need convenience syntax there.
>>>
>>> * Sure you want fractions?
>>>
>>>     Supporting fractions for byte counts (e.g.  1.5G) has been a mixed
>>>     blessing, to put it charitably.
>>>
>>>     Use of fractions that aren't representable as double is not advisable.
>>>     For instance, 1.1G is 1181116006 bytes rounded from
>>>     1181116006.4000001.  Why would anybody want that?
>>>
>>>     Use of "nice" fractions is unproblematic, but the additional
>>>     convenience is rather minor.  Is being able to write 1536M as 1.5G
>>>     worth the trouble?  Meh.
>>>
>>>     With "metric" rather than "binary" suffixes, fractions provide even
>>>     less convenience: 1.5ms vs. 1500us.
>>>
>>>     The implementation is limited to 53 bits of precision, which has been
>>>     a source of confusion.  Even that has arguably taken far more patches
>>>     than it's worth.  We're now talking about more patches to lift the
>>>     restriction.  Meh.
>>>
>>>     What exactly are we trying to achieve by supporting fractions?
>>>
>>> * What about all the other time-valued things in the QAPI schema?
>>>
>>>     There are many more, and some of them are also visible in CLI or HMP.
>>>     By providing convenience syntax for just -numa hmat-lb,...,latency=T,
>>>     we create inconsistency.
>>>
>>>     To avoid it, we'd have to hunt down all the others.  But some of them
>>>     aren't in nanoseconds.  Your new built-in type 'time' is only
>>>     applicable to the ones in nanoseconds.  Do we need more built-in
>>>     types?
>>>
>>> This series is at v17.  I really, really want to tell you it's ready for
>>> merging.  But as you see, I can't.
>>>
>>> Maybe the convenience syntax is a good idea, maybe it's a bad idea.  But
>>> it's definitely not a must-have idea.
>>>
>>> If you want to pursue the idea, I recommend to split this series in two:
>>> one part without the convenience, and a second part adding it.
>>> Hopefully, we can then merge the first part without too much fuss.  The
>>> second part will have to deal with the questions above.
>>>
>>> You can also shelve the idea, i.e. do just the first part now.  It's
>>> what I'd do.
>>>
>> Thank you for your suggestion and support! Considering ACPI HMAT can
>> only store unsigned integer data, and for the memory latency
>> nanoseconds is enough. So we can use integer for latency data. I am
>> wondering if we can use this solution:
>>
>> * Still add builtin type time, but use qemu_strtou64() to parse.
>> * Still refactor do_strtosz() to support suffixes list, but add a
>> extra parameter to decide use qemu_strtou64() or qemu_strtod_finite(),
>> so time use qemu_strtou64() and qemu_strtod_finite()
> 
> We'd still have to grapple with "What about all the other time-valued
> things in the QAPI schema?"
> 
>> * Second part dealing with the questions.
>>
>> Then the only influence on HMAT patch is we need add a comments to
>> tell user to input integer.
> 
> Considerung we're already at v17, I recommend to keep the first part as
> focused as possible.  Since plain integer types are good enough for time
> values elsewhere in our external interfaces, they'll do for HMAT
> latency, too.
> 
> Once the first part is accepted, you're free to tackle the wider problem
> of providing convenience syntax for time values.  Fair warning: I
> consider this a swamp.
> 

Thank you! I will use integer for HMAT latency and submit the first part 
in next version.

