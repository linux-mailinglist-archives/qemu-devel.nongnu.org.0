Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1A2C039A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:48:31 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9OY-0001W6-4b
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kh9Nf-00015I-FL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kh9Nd-0007SC-JL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606128452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6bGmWIfYUnm/7WXsCGBzRATuKHqPO/lVqVplsOcTT4=;
 b=NQRPQWWhGJiKDrwr32P8+L2aHZroU7pu0tugy9P7CRBvHVpUQg3miB+Df3OBs6ufDRmtOH
 5OQE/acufhDjdTipZIgjGAhJ6galq5Nt67M0on0M8R72AGocnPuiLucXlMZr3UYhm1RcpR
 hmr/H45H6huT9wg/S5FYUuDRVNM92GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-rXw2EoRmMZC34TiPG8tEiA-1; Mon, 23 Nov 2020 05:47:28 -0500
X-MC-Unique: rXw2EoRmMZC34TiPG8tEiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FF0879512;
 Mon, 23 Nov 2020 10:47:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE035C1BD;
 Mon, 23 Nov 2020 10:47:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 63413113864E; Mon, 23 Nov 2020 11:47:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
References: <20201118090344.243117-1-thuth@redhat.com>
 <800135fc-4552-b872-0117-4d9194393094@redhat.com>
 <873616kan8.fsf@dusky.pond.sub.org>
 <CAFEAcA9gg_cxcG59BHKosJmTeyyJ_7_Uofcyb9kMXSRAFnYebg@mail.gmail.com>
 <8a91ad94-9a18-1f8b-b73d-92872495fdc3@redhat.com>
Date: Mon, 23 Nov 2020 11:47:25 +0100
In-Reply-To: <8a91ad94-9a18-1f8b-b73d-92872495fdc3@redhat.com> (Thomas Huth's
 message of "Mon, 23 Nov 2020 09:16:46 +0100")
Message-ID: <874klgtkn6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 18/11/2020 15.30, Peter Maydell wrote:
>> On Wed, 18 Nov 2020 at 14:24, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>>
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>
>>>> On 11/18/20 10:03 AM, Thomas Huth wrote:
>>>>> Both headers, sysbus.h and module.h, are not required to compile this=
 file.
>>>
>>> module.h is: it defines type_init().
>>=20
>>>>>  #include "qemu/timer.h"
>>>>>  #include "hw/watchdog/wdt_diag288.h"
>>>>>  #include "migration/vmstate.h"
>>>>>  #include "qemu/log.h"
>>>>> -#include "qemu/module.h"
>>>>
>>>> Cc'ing Markus because of:
>>=20
>>>>     Include qemu/module.h where needed, drop it from qemu-common.h
>>>
>>> If it still compiles and links, it must get it via some other header.
>>=20
>> Yes: wdt_diag288.c -> include/hw/watchdog/wdt_diag288.h ->
>>  include/qom/object.h -> include/qemu/module.h
>
> So what's now our expectation here? Should every file that uses type_init=
()
> also include module.h ? That's IMHO not very intuitive...
> Or are we fine that type_init() is provided by qom/object.h which needs t=
o
> be pulled in by every device sooner or later anyway?

I think it's okay to rely on indirect inclusion.


