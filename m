Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A6143EE7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:06:24 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituAh-0007fJ-IE
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ittxs-0002Dz-Ak
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:53:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ittxo-0001hP-J0
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:53:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48782
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ittxo-0001h7-EZ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579614783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5TpN+Qc+FtvApbEYrJbCTF5+CFEz1LtSV4Do/2wUEo=;
 b=ai8ncjZtstaAaMOKIPkqNG5iwvGAQcQpp/gR5FTJwcIt5exDcBD7D0+0ZwjoiStz4aD/Hg
 GqUCDjcC6c52SEMmzRwypqBTC9krG9WHj3HQl8ivqqRpWL+y873ttcSmjHGoG4g+RdLPTg
 mlDTk1+hvwo4TJ9b9s0OJLAvA8PZypU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408--CJ5YUX5PhqESYvqlXw5Bg-1; Tue, 21 Jan 2020 08:53:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 772F4108442E;
 Tue, 21 Jan 2020 13:53:01 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D6E75DA76;
 Tue, 21 Jan 2020 13:52:53 +0000 (UTC)
Date: Tue, 21 Jan 2020 14:52:51 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 05/10] target/s390x: Remove duplicated ifdef macro
Message-ID: <20200121145251.39ceabe2.cohuck@redhat.com>
In-Reply-To: <20200121110349.25842-6-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
 <20200121110349.25842-6-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: -CJ5YUX5PhqESYvqlXw5Bg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jan 2020 12:03:44 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Commit ae71ed8610 replaced the use of global max_cpus variable
> with a machine property, but introduced a unnecessary ifdef, as
> this block is already in the 'not CONFIG_USER_ONLY' branch part:
>=20
>    86 #if defined(CONFIG_USER_ONLY)
>    87
>   ...
>   106 #else /* !CONFIG_USER_ONLY */
>   107
>   ...
>   292 static void do_ext_interrupt(CPUS390XState *env)
>   293 {
>   ...
>   313 #ifndef CONFIG_USER_ONLY
>   314         MachineState *ms =3D MACHINE(qdev_get_machine());
>   315         unsigned int max_cpus =3D ms->smp.max_cpus;
>   316 #endif
>=20
> To ease code review, remove the duplicated preprocessor macro,
> and move the declarations at the beginning of the statement.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: New patch
> Cc: Like Xu <like.xu@linux.intel.com>
> ---
>  target/s390x/excp_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Thanks, applied.


