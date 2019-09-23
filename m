Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913BBBB31A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 13:49:00 +0200 (CEST)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCMpv-0005ZZ-Hb
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 07:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCMmx-0003yp-9y
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 07:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCMmw-0005PB-A9
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 07:45:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCMmv-0005O9-Te
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 07:45:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EBC59300DA78;
 Mon, 23 Sep 2019 11:45:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ACED60852;
 Mon, 23 Sep 2019 11:45:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE73C113864E; Mon, 23 Sep 2019 13:45:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 15/16] docs/devel/qapi-code-gen: Improve
 QAPI schema language doc
References: <20190910063724.28470-1-armbru@redhat.com>
 <20190910063724.28470-16-armbru@redhat.com>
 <1b10e16d-9377-38ae-08ce-3bc0f8fc39d2@redhat.com>
 <8736h08asx.fsf@dusky.pond.sub.org>
 <a354d2d6-7633-f95c-eb86-45a60d28e43e@redhat.com>
Date: Mon, 23 Sep 2019 13:45:46 +0200
In-Reply-To: <a354d2d6-7633-f95c-eb86-45a60d28e43e@redhat.com> (Eric Blake's
 message of "Tue, 17 Sep 2019 11:14:50 -0500")
Message-ID: <87ef07p76d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 23 Sep 2019 11:45:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 9/13/19 10:39 AM, Markus Armbruster wrote:
>
>>>> +  expression A; expression A, ... likewise, but separated by ,
>>>
>>> worth calling out that trailing , are not allowed?
>> 
>> Doesn't "separated by" imply that?
>> 
>>> Is the 'expression A;' a copy-paste from RFC text, irrelevant to our
>>> usage here?
>> 
>> What about
>> 
>>     * Repetition: Expression A... matches zero or more occurences of
>>       expression A
>>     * Repetition: Expression A, ... matches zero or more occurences of
>>       expression A separated by ,
>
> With the spelling of 'occurrences' fixed, that works.

Repeat offender...

Will fix, thanks!

[...]

