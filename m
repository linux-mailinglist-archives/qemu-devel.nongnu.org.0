Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42764C242B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 07:45:35 +0100 (CET)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN7sc-0004UA-CJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 01:45:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nN7mi-0002zF-Rw
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 01:39:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nN7me-0005QY-CK
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 01:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645684762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puAtHLAIrJvaUCUgfbpNpgMbBN6FF65wn94Jv5sNEec=;
 b=ctG8ckaANe4Engry1Ksnck/ZdfgMw0I+LHfIOHHGOCDe47ImO8QsB4mnTSBu5T/ZnR17O4
 VN3Oe9n+zLP/HjabX3Qq3lSNMVtYEltQtstmt3j8pQUjS5kTENVKlQDzaywxe8B1VpESrG
 D7Dz+221FEFe/J0uV2hjU2d/HPofk34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-C7Juj-xHPIGqGTbSoD7zHw-1; Thu, 24 Feb 2022 01:39:21 -0500
X-MC-Unique: C7Juj-xHPIGqGTbSoD7zHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB0721091DA0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:39:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2FC519B9;
 Thu, 24 Feb 2022 06:39:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE2E021E6A00; Thu, 24 Feb 2022 07:39:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] qapi: fix mistake in example command illustration
References: <20220223180418.2098303-1-berrange@redhat.com>
 <YhZ+562Zrz5NNgiK@work-vm>
Date: Thu, 24 Feb 2022 07:39:16 +0100
In-Reply-To: <YhZ+562Zrz5NNgiK@work-vm> (David Alan Gilbert's message of "Wed, 
 23 Feb 2022 18:37:27 +0000")
Message-ID: <8735k8zs2z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
>> The snapshot-load/save/delete commands illustrated their usage, but
>> mistakenly used 'data' rather than 'arguments' as the field name.
>>=20
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> Fabian Holler's patch from yesterday beat you to it slightly;
> I think Markus has it queued.

Correct.  Thanks anyway!

> (20220222170116.63105-1-fabian.holler@simplesurance.de )


