Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43715567C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 12:15:31 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j01be-0003kl-Gn
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 06:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j01Za-0001Lf-UV
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j01Za-0007xx-48
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:13:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32235
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j01ZZ-0007wc-P7
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581073999;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIqiFBBb29fvujf0VfdhO/R+vZigMzqw250dNOV7/Tc=;
 b=UQmcSSjOocmkRY01KxqCwPJubByeyvZ38oohynsgRUk2sx6LSr1iv2U7ntHy9v5mBdOedO
 keAObna1P/jctr30l5hyDCqUQ19Nb21AMvvRuLJEx5/LmgrLwueXH71WTZRo/4yAB1mtwN
 +ksD75ss+ro3AZacDMOEWULoe2z51/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-QtLqsx7pNTmgXYyIWQKlOA-1; Fri, 07 Feb 2020 06:13:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21322802693
 for <qemu-devel@nongnu.org>; Fri,  7 Feb 2020 11:13:16 +0000 (UTC)
Received: from redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E3089A9C;
 Fri,  7 Feb 2020 11:13:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 2/2] virtiofsd: add it to the tools list
In-Reply-To: <20200207095412.794912-2-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 7 Feb 2020 10:54:12 +0100")
References: <20200207095412.794912-1-lvivier@redhat.com>
 <20200207095412.794912-2-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 07 Feb 2020 12:13:05 +0100
Message-ID: <87h8028xby.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: QtLqsx7pNTmgXYyIWQKlOA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Reply-To: quintela@redhat.com
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> it will be built only when tools are enabled (always enabled by default)
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


