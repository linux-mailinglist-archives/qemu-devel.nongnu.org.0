Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F0D132989
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:03:28 +0100 (CET)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqOF-0003c9-R7
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iopdT-0005vq-Jz
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:15:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iopdQ-0005Y7-SM
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:15:06 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21287
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iopdQ-0005WI-Ox
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578406503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=GFbLhi/Pi9Z/Cu9v4voeJirStOKbqbHhiGEMgy4LL4s=;
 b=HvQYS/wYBq1ECLuxgkFZvdV8HrxrHfDHACPCKP5h6oVfNuXbaqBwayOzacVTIvOf5bXT15
 jI8Hvw/5U8wcXdWGmSdLeL/9nBhUFa2cVoSpmrkEBIid9JcMnlhJlMbp9YUhYQ+Z6ju2nc
 suf3UpCVKEn1nrsT9/10hXqzoOz/sHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-OwPEp1ewP8WBlNoIToGB9Q-1; Tue, 07 Jan 2020 09:15:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D675800D41;
 Tue,  7 Jan 2020 14:15:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2617C5D9CA;
 Tue,  7 Jan 2020 14:14:53 +0000 (UTC)
Subject: Re: Priority of -accel (was: [PATCH] tests/qemu-iotests: Update tests
 to recent desugarized -accel option)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
 <c493e693-13a7-7dc4-eb2d-5dbc7b3053f1@redhat.com>
 <12334054-4ae7-e580-9727-2d322bfa2bda@redhat.com>
 <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
 <656169fc-1abe-b521-20a3-e7041739b914@redhat.com>
 <20200107125451.GL3368802@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3241dff4-6223-404f-55d4-846991763046@redhat.com>
Date: Tue, 7 Jan 2020 15:14:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107125451.GL3368802@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: OwPEp1ewP8WBlNoIToGB9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2020 13.54, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Jan 07, 2020 at 01:23:18PM +0100, Paolo Bonzini wrote:
>> On 07/01/20 13:18, Thomas Huth wrote:
>>> I don't think we need a separate priority parameter here. But IMHO it's
>>>  really rather common practice to prioritize the last option. So while
>>> it might be more "self-explanatory" to a CLI newbie if the first
>>> occurrence got the highest priority, it might be rather confusing
>>> instead for a CLI veteran...?
>>
>> Prioritising the last certainly makes sense for a choose-one-only
>> option, but I'm not sure it's the same for a choose-best option.  After
>> all it was -machine accel=3Dkvm:tcg, not -machine accel=3Dtcg:kvm...
>=20
> IIUC, the main use case for specifying multiple accelerators is
> so that lazy invokations can ask for a hardware virt, but then get
> fallback to TCG if not available. For things that should be platform
> portabile, there's more than just kvm to consider though, as we have
> many accelerators.  Listing all possible accelerators is kind of
> crazy though no matter what the syntax is.
>=20
> How about taking a completely different approach, inspired by the
> -cpu arg and implement:
>=20
>     -machine accel=3Dbest

Something like that sounds like the best solution to me, but I'd maybe
rather not call it "best", since the definition of "best" might depend
on your use-case (e.g. do you want to use a CPU close to the host or
something different which might be better emulated by TCG?).

What about "-accel any" or "-accel fastest" or something similar?

 Thomas


