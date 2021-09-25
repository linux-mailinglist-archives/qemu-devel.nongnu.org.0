Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F7417FCA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 07:03:24 +0200 (CEST)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTzqM-0008Eg-Mh
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 01:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTzp8-0007XE-Rx
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 01:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTzp4-00035f-V9
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 01:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632546121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVubZdxCRCdeC8RN/3jw9S4GSnUJ3JPNSj5Sf3oOY4M=;
 b=Tj3Uv++I7w7hhOv1E89Q1Ofhrk5dbccBKXoZtcjEMlSKTKOfx3DmMAsXJtsSj9OVvUrWE/
 FSNvKINXuq72kEWHqA71nsj+luGFYvS6jXFM37FGiIozobbxIEPD9lkgjXuf+zrTGq6Xeg
 MCmad4FPNVyVfJAVgnC5+BA6Ti/xu1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-0yThD02wMAiQAjoRrCg23w-1; Sat, 25 Sep 2021 01:01:59 -0400
X-MC-Unique: 0yThD02wMAiQAjoRrCg23w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484B28145E6;
 Sat, 25 Sep 2021 05:01:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 786396A900;
 Sat, 25 Sep 2021 05:01:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 159AD113865F; Sat, 25 Sep 2021 07:01:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 23/23] test-clone-visitor: Correct an accidental rename
References: <20210917143134.412106-1-armbru@redhat.com>
 <20210917143134.412106-24-armbru@redhat.com>
 <f5d29087-9952-6782-d19b-331d95bd0f11@redhat.com>
Date: Sat, 25 Sep 2021 07:01:54 +0200
In-Reply-To: <f5d29087-9952-6782-d19b-331d95bd0f11@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 21 Sep 2021 07:17:53
 +0200")
Message-ID: <87mto1nt8d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, Markus Armbruster <armbru@redhat.com>,
 eblake@redhat.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 9/17/21 16:31, Markus Armbruster wrote:
>> Commit b359f4b203 "tests: Rename UserDefNativeListUnion to
>> UserDefListUnion" renamed test_clone_native_list() to
>> test_clone_list_union().  The function has nothing to do with unions.
>> Rename it to test_clone_list().
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>  tests/unit/test-clone-visitor.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Maybe nitpicking, while this patch is related to the series,
> although I understand you noticed the mistake while working
> on this series, I'd move this cleanup as 1/23.

Not worth a respin.  Next time!

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!


