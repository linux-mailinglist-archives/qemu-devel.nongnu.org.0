Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B8E1F175F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 13:15:52 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiFkt-000072-3Y
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 07:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jiFjh-000888-ME
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 07:14:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:40052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jiFjg-0007xN-Dl
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 07:14:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69301AD39;
 Mon,  8 Jun 2020 11:14:36 +0000 (UTC)
Subject: Re: [PATCH v5 0/2] Makefile: libfdt: build only the strict necessary
To: David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>
References: <20200518160319.18861-1-cfontana@suse.de>
 <1f70e2fb-a1f4-29af-c9e6-38b178fa26ca@suse.de>
 <9f1d9711-c87d-f554-2718-f69b3babbf54@redhat.com>
 <20200608095200.GC494336@umbus.fritz.box>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <39261b0b-e256-0e47-3394-1a3c7838f650@suse.de>
Date: Mon, 8 Jun 2020 13:14:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200608095200.GC494336@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:21:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe Mathieu-Daude <philmd@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>, David Gibson <dgibson@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/20 11:52 AM, David Gibson wrote:
> On Sun, Jun 07, 2020 at 08:53:52AM +0200, Thomas Huth wrote:
>>  Hi David,
>>
>> could you maybe take this through your ppc tree?
> 
> Sounds reasonable, but this version doesn't seem to apply any more.

Hi David,

which problem are you experiencing?

I have applied the series to latest master without encountering problems and pushed to:

https://github.com/hw-claudio/qemu.git "v5-Makefile-build-necessary"

Thanks,

Claudio

> 
>>
>>  Thanks,
>>   Thomas
>>
>>
>> On 01/06/2020 13.28, Claudio Fontana wrote:
>>> Hello all,
>>>
>>> is this queued somewhere?
>>>
>>> Thanks,
>>>
>>> Claudio
>>>
>>> On 5/18/20 6:03 PM, Claudio Fontana wrote:
>>>> v4 -> v5:
>>>>
>>>> * include the dtc submodule update commit in the 1/2 patch
>>>>
>>>> v3 -> v4: NB! only useful when updating to latest dtc (not in QEMU yet)
>>>>
>>>> * changed the approach to leverage new upstream dtc Makefile,
>>>>   needs dtc submodule update to include upstream dtc commit
>>>>   85e5d839847af54efab170f2b1331b2a6421e647.
>>>>
>>>> * LIBFDT_srcdir does not exist anymore in upstream dtc: it is also
>>>>   not used anymore.
>>>>
>>>> * LIBFDT_lib: need to avoid building libfdt.so at least for now, so pass as
>>>>   empty to avoid building the .so. This is to avoid breaking existing
>>>>   trees with objects already compiled without -fPIC.
>>>>
>>>> * clean: no need to make dtc clean target, every artifact is captured by
>>>>   global clean rule
>>>>
>>>> v2 -> v3:
>>>>
>>>> * changed into a 2 patch series; in the second patch we remove the old
>>>>   compatibility gunks that were meant for removal some time after 4.1.
>>>>
>>>> * renamed the libfdt PHONY rule to dtc/all, with the intent to make
>>>>   existing working trees forward and backward compatible across the change.
>>>>
>>>> v1 -> v2:
>>>>
>>>> * fix error generated when running UNCHECKED_GOALS without prior configure,
>>>>   for example during make docker-image-fedora. Without configure, DSOSUF is
>>>>   empty, and the module pattern rule in rules.mak that uses this variable
>>>>   can match too much; provide a default in the Makefile to avoid it.
>>>>
>>>> * only attempt to build the archive when there is a non-empty list of objects.
>>>>   This could be done in general for the %.a: pattern in rules.mak, but maybe
>>>>   there are valid reasons to build an empty .a?
>>>>
>>>> * removed some intermediate variables that did not add much value
>>>>   (LIBFDT_srcdir, LIBFDT_archive)
>>>>
>>>> Tested locally with 3 VPATH configurations (no-, VPATH, VPATH in src subdir),
>>>> and with docker-image-fedora, docker-test-debug@fedora that failed before.
>>>>
>>>> Claudio Fontana (2):
>>>>   Makefile: libfdt: build only the strict necessary
>>>>   Makefile: remove old compatibility gunks
>>>>
>>>>  Makefile  | 32 ++++++++++++++++----------------
>>>>  configure |  6 +-----
>>>>  rules.mak |  2 ++
>>>>  3 files changed, 19 insertions(+), 21 deletions(-)
>>>>
>>>
>>>
>>
> 


