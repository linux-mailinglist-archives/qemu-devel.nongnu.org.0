Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF3F3691
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 19:05:27 +0100 (CET)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSm9t-0006Cs-MR
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 13:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iSm7O-0004PX-Ut
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 13:02:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iSm7K-0006hS-32
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 13:02:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48796
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iSm7J-0006gL-Vt
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 13:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573149764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqiH9OupaUAU+PKnnvjBGiCzildto8LlFj7HcVQ45zw=;
 b=OX0LBw8aS8rXDKweWEIu20DGCZOpJ1uNzXb8bQJuh20ej3tKeAGoz/uD/d+sz5qkeyzJ0b
 2itcoWXqYJ0nHnMsRx9cnpxWZ1nRm1Wv1pg/2Smjse+5IBv8dmVyD7jKPNYPGRjwZQRxmz
 d/NLKrUOgTTn2h5qmQ4AZPYhqGDVTlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-3qVm--jfNkmiJjG2F6HPvQ-1; Thu, 07 Nov 2019 13:02:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 079831800D6B;
 Thu,  7 Nov 2019 18:02:41 +0000 (UTC)
Received: from [10.3.117.38] (ovpn-117-38.phx2.redhat.com [10.3.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B085DA7C;
 Thu,  7 Nov 2019 18:02:38 +0000 (UTC)
Subject: Re: [PATCH v3 01/22] iotests: s/qocw2/qcow2/
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191107163708.833192-1-mreitz@redhat.com>
 <20191107163708.833192-2-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9f43f7b6-1773-96a3-7cb9-2bff4faa9e0e@redhat.com>
Date: Thu, 7 Nov 2019 12:02:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107163708.833192-2-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 3qVm--jfNkmiJjG2F6HPvQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/7/19 10:36 AM, Max Reitz wrote:
> Probably due to blind copy-pasting, we have several instances of "qocw2"
> in our iotests.  Fix them.
>=20
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/060 | 2 +-

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


