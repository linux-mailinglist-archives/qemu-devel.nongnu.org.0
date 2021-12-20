Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B442E47B1C1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:01:46 +0100 (CET)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzM2j-0003NC-LU
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mzKj3-0003Vu-Ii
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mzKj1-0006aL-HF
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSidsIGK48yrsKemsJ+wP2KJn1rJOh7gVx2e1m5RRNI=;
 b=WUjfNATl/8/gpGyPeCQeyFlN7IZ7WGTo3W0l4r8Z5CRYf2rPPqqqm9kGGUhvhE4dBf6ym9
 adb4tOm+RxyBMpNuNyWiGCbNupVNGmIbHtvEl/p1QUkM4s8PNhZu1xtIUYhhwq8zamNmSS
 ejv10VPrPvFVejXZ1DgYfIxnct0ntOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-Xd307DJYM522haiBM9X0bA-1; Mon, 20 Dec 2021 06:16:21 -0500
X-MC-Unique: Xd307DJYM522haiBM9X0bA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDA66104ECFF;
 Mon, 20 Dec 2021 11:16:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A8D6E1EC;
 Mon, 20 Dec 2021 11:16:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw: m68k: Add virt compat machine type for 7.0
In-Reply-To: <cc6c564c-7faa-d95c-9bb8-ea84a54eabeb@vivier.eu>
Organization: Red Hat GmbH
References: <20211218114340.1856757-1-laurent@vivier.eu>
 <87a6gvr8p8.fsf@redhat.com>
 <cc6c564c-7faa-d95c-9bb8-ea84a54eabeb@vivier.eu>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 20 Dec 2021 12:16:13 +0100
Message-ID: <877dbzr0g2.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20 2021, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 20/12/2021 =C3=A0 09:17, Cornelia Huck a =C3=A9crit=C2=A0:
>> On Sat, Dec 18 2021, Laurent Vivier <laurent@vivier.eu> wrote:
>>=20
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>> Based-On: <20211217143948.289995-1-cohuck@redhat.com>
>>>
>>>   hw/m68k/virt.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>=20
>> Oh, I didn't realize we do it for m68k as well.
>
> virt-m68k is only a toy and is only used by debian for their m68k buildd.
>
> So there is no problem if you don't manage the update, I will.

Ok, let's just keep it as a separate patch for this round, and I'll try
to remember to add it when I'm sending machine type patches in the
future.


