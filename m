Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BDF15CB4B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 20:41:14 +0100 (CET)
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2KML-0004iE-M9
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 14:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j2KKA-0003dv-Pd
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 14:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j2KK9-0002ns-SR
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 14:38:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27321
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j2KK9-0002lR-OG
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 14:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581622736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMv0ZJpshCdu012TrGb/C4AwbQ67CWaoUFp6xRyxfOA=;
 b=hfzDWyidSBm7MXDcx8KI2iqmhsjc5ZVxalnVNr7DbpZfj+rYQxiTxh2kOEMTnVpA81eCG6
 si+u0q64MJAYkdEPUBHPiapFYdGKrXuzyxQjGRGweEzn8y78Ik21RofIf9ARchcksUW7n5
 5+lHE3q/KRv1Dj4SsJEj7/6OW2g4rv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-DIkGocOvOaKoFIA_KmS08A-1; Thu, 13 Feb 2020 14:38:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792AB800E21
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 19:38:52 +0000 (UTC)
Received: from redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3923D1001DEF;
 Thu, 13 Feb 2020 19:38:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 2/8] migration: Add support for modules
In-Reply-To: <20200211105446.GE2751@work-vm> (David Alan Gilbert's message of
 "Tue, 11 Feb 2020 10:54:46 +0000")
References: <20200129115655.10414-1-quintela@redhat.com>
 <20200129115655.10414-3-quintela@redhat.com>
 <20200211105446.GE2751@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 13 Feb 2020 20:38:48 +0100
Message-ID: <87y2t6jn07.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: DIkGocOvOaKoFIA_KmS08A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> So we don't have to compile everything in, or have ifdefs
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> As far as I can tell this matches the way all the rest of the module
> stuff works, so:
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks

> (Although I wish it was documented somewhere).

I had to learn to use it with grep :-p


