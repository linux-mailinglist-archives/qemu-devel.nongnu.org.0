Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA011864D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 12:29:45 +0100 (CET)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iedi4-0000aa-1Y
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 06:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iedhC-0000Av-IT
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 06:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iedhB-0006ED-3L
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 06:28:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54747
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iedhB-0006E1-0C
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 06:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575977327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=6EIZoat+/9RBBcSVJuDLigcVdLqpFkFuFGvpxaAe8XA=;
 b=N5zDbU5Iqou+tkXuCqPDLl5xWbJ4tZ7qB8H+FaiVvpUFXI08oqqWRZWA7A9FP+kaePk4+F
 HoUlPur2HnfsMCbIlC7AXa6cZ75zmeN7YLPaS+B49fZXNa6WE5f0kn7iLD3WhUVT7kcTjn
 LDoxT4Hk7vVDvrsP6rVLAzcUh7D3OS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423--IhzuC20MsaEdPLMquSu2A-1; Tue, 10 Dec 2019 06:28:46 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC081883522
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 11:28:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-158.ams2.redhat.com [10.36.116.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B1FC5D9D6;
 Tue, 10 Dec 2019 11:28:41 +0000 (UTC)
Subject: Re: [PATCH 1/2] net: Drop the legacy "name" parameter from the -net
 option
To: Markus Armbruster <armbru@redhat.com>
References: <20191206053640.29368-1-thuth@redhat.com>
 <20191206053640.29368-2-thuth@redhat.com> <878snk30eh.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2858a710-913a-389a-443a-4051b4b018cd@redhat.com>
Date: Tue, 10 Dec 2019 12:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <878snk30eh.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: -IhzuC20MsaEdPLMquSu2A-1
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
Cc: libvir-list@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2019 12.06, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
>=20
>> It's been deprecated since QEMU v3.1, so it's time to finally
>> remove it. The "id" parameter can simply be used instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> [...]
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 335295be50..ff280ccd16 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -488,18 +488,16 @@
>>  #
>>  # @id: identifier for monitor commands
>>  #
>> -# @name: identifier for monitor commands, ignored if @id is present
>> -#
>>  # @opts: device type specific properties (legacy)
>>  #
>>  # Since: 1.2
>>  #
>>  # 'vlan': dropped in 3.0
>> +# 'name': dropped in 5.0
>>  ##
>=20
> Uh, when did we start to add "dropped in" to our doc comments?
>=20
> We should either do this systematically, or not at all.  If the former,
> we have quite a few "dropped in" to add belatedly.

IIRC this has been suggested by Eric, see e.g.:

 https://patchwork.kernel.org/patch/10227335/#21501161

Anyway, it should not matter much for this patch here, since the line
gets removed again in the 2nd patch anyway.

 Thomas


