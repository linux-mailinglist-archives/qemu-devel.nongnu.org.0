Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70B134479
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 15:02:22 +0100 (CET)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipBuf-0007ib-Oj
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 09:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ipBt6-0007B6-AA
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 09:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ipBt5-0000P5-2g
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 09:00:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38701
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ipBt4-0000MS-FC
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 09:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578492041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=xUt1XPA9/9G6YIqzkx2RTyiEfZMFSMOXauZcCbZZ47g=;
 b=Cm5WcoOWJlC7qdO79UCa374E0tFitpsAE3VCczAiUPOKssTmlDD0YOvCOtdAqLUFulHS9W
 vI7ow5dCJiOoDeg1iSt3wMMbRaw7wtgtkjZqayYfbZXPPoVGI/QQNKIOmQg+jZEcIWGqRC
 jeWnSlI/DVgb6dqo/nl9WJsrSsa1kXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-4_WqclAQMoev1ywFQkmu_Q-1; Wed, 08 Jan 2020 09:00:39 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368E1801E7E;
 Wed,  8 Jan 2020 14:00:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-114.ams2.redhat.com [10.36.117.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C71085DA2C;
 Wed,  8 Jan 2020 14:00:30 +0000 (UTC)
Subject: Re: Priority of -accel
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
 <c493e693-13a7-7dc4-eb2d-5dbc7b3053f1@redhat.com>
 <12334054-4ae7-e580-9727-2d322bfa2bda@redhat.com>
 <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
 <656169fc-1abe-b521-20a3-e7041739b914@redhat.com>
 <20200107125451.GL3368802@redhat.com>
 <3241dff4-6223-404f-55d4-846991763046@redhat.com> <87d0bujkpe.fsf@linaro.org>
 <da2111ee-0644-1d7c-a111-e4209025a1d8@redhat.com>
 <60ecc0ec-d8db-2cf6-b21a-799f4cb9ab71@redhat.com>
 <20200108131015.GF3386452@redhat.com>
 <1f454912-5127-d2f3-fbba-0d341947e030@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <59d695fe-c44c-c94d-f38d-daa80b7bccfb@redhat.com>
Date: Wed, 8 Jan 2020 15:00:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1f454912-5127-d2f3-fbba-0d341947e030@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 4_WqclAQMoev1ywFQkmu_Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2020 14.24, Paolo Bonzini wrote:
> On 08/01/20 14:10, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Jan 08, 2020 at 01:41:59PM +0100, Paolo Bonzini wrote:
>>> On 08/01/20 11:58, Thomas Huth wrote:
>>>>> "-accel default" could be considered to have vibes of Do The Right
>>>>> Thing (tm) and could in time actually become so!
>>>>
>>>> "-accel default" sounds like the default behavior that you'd also get =
if
>>>> you don't use this option at all ... what about "-accel auto" to say
>>>> that QEMU should pick an accelerator automatically?
>>>
>>> Questions to answer before thinking about the name: how would it
>>> co-operate with other "-accel" options?  how would you pass sub-options
>>> to the accelerators?
>>
>> If people don't have a preference for a specific accelerator, just need
>> "a working accelerator", then I think it is reasonable to assume they
>> won't want/need to pass options to the accelerators either.
>>
>> "-accel default" is targetting the simple "do the right thing" use
>> case, so IMHO doesn't need to support per-accelerator options.
>=20
> So basically the idea is to add an option that means "ignore every other
> -accel option and act as if we had "-accel kvm -accel tcg"?  That seems
> like a hack to me, especially since you can achieve the same effect with
> a binary named qemu-kvm and no -accel options at all.

But we could disallow multiple "-accel" options in that case (or just
always use the last in the list), so we don't have to deal with
priorities of the options here at all... Well, not sure whether that's
really really better than what we currently have, so maybe we should
just keep it in the current shape...

 Thomas



