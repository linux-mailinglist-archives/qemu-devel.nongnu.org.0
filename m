Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0520A1B7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:17:31 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTd4-0007SI-CT
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joTZs-0003ox-Hz
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:14:12 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56392
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joTZp-0005NK-HH
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ajmwRvokm0ZQiHFQBkbakBAvZEz97+mdB+U7N7RqWlk=;
 b=EL9k5BpK1GVKoLnUp3laolJ3oi5W92HMYCAecC+plenozALuddqdBJk05HeE28tJ9GOJwq
 +mfBSI1ouVIS6Yx6sPkl9TJhpxJZvEymJNERxvvtMpwDaaRPWcR/OJWJE0Dd8/Qt/RnHNS
 IRKTIhNyEUiz82Dg0mAnq8oZnfT6ldo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-wW0KUlhGOA-e_1DPD54LDw-1; Thu, 25 Jun 2020 11:14:05 -0400
X-MC-Unique: wW0KUlhGOA-e_1DPD54LDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2761005512;
 Thu, 25 Jun 2020 15:14:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9738B1A913;
 Thu, 25 Jun 2020 15:14:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2162011384D4; Thu, 25 Jun 2020 17:14:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 36/46] qom: Put name parameter before value / visitor
 parameter
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-37-armbru@redhat.com>
 <c0d8ea3d-440a-4e4e-f77a-c31448aecb3b@redhat.com>
Date: Thu, 25 Jun 2020 17:14:01 +0200
In-Reply-To: <c0d8ea3d-440a-4e4e-f77a-c31448aecb3b@redhat.com> (Eric Blake's
 message of "Wed, 24 Jun 2020 16:27:36 -0500")
Message-ID: <878sgbxjnq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 6/24/20 11:43 AM, Markus Armbruster wrote:
>> The object_property_set_FOO() setters take property name and value in
>> an unusual order:
>>
>>      void object_property_set_FOO(Object *obj, FOO_TYPE value,
>>                                   const char *name, Error **errp)
>>
>> Having to pass value before name feels grating.  Swap them.
>>
>> Same for object_property_set(), object_property_get(), and
>> object_property_parse().
>>
>> Convert callers with this Coccinelle script:
>>
>>      @@
>>      identifier fun = {object_property_get, object_property_parse, object_property_set_str, object_property_set_link, object_property_set_bool, object_property_set_int, object_property_set_uint, object_property_set, object_property_set_qobject};
>>      expression obj, v, name, errp;
>>      @@
>>      -    fun(obj, v, name, errp)
>>      +    fun(obj, name, v, errp)
>>
>> Chokes on hw/arm/musicpal.c's lcd_refresh() with the unhelpful error
>> message "no position information".  Convert that one manually.
>>
>> Fails to convert hw/arm/armsse.c, because Coccinelle gets confused by
>> ARMSSE being used both as typedef and function-like macro there.
>> Convert manually.
>>
>> Fails to convert hw/rx/rx-gdbsim.c, because Coccinelle gets confused
>> by RXCPU being used both as typedef and function-like macro there.
>> Convert manually.  Convert that one manually.  The other files using
>> RXCPU that way don't need conversion.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>>   136 files changed, 702 insertions(+), 729 deletions(-)
>
> Big but mechanical.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> This one might be a semantic conflict magnet with patches written in
> the meantime;

You bet!

>               I guess the trick is to check that 'git grep' finds as
> many calls to any of the functions listed as conversions.

I throw away the old patch and rerun Coccinelle.  Works except when I
rebase onto changes to the files containing the functions that change,
because my Coccinelle script only updates calls, not definitions.
Hasn't been an issue so far.


