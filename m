Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5B422EC4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:09:17 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnwK-0002pm-6t
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXnBx-0004Ae-BX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXnBt-00050w-7n
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633450874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZPfGzMJFHp6UQg0IdGrLQKy0ZL1QOl+N2RjKsaOgl0=;
 b=IegQsKITGdqrovVqbAzE11WBmwZqsj5x2MEhcqd2guTCId1QioMwSFC2/loZZF317UcpHA
 3vR1mNIOsFnS9FR5+AUWEMcFT6MCKGCqbrDZTajFDUsKWbNY2q1bBsdm+qTNmn9B6UhsxL
 dNWIxLAQzGxROgL3/M9JsEp0QVQ7v/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-ojHImsdkOHuPWYqNjW9ITQ-1; Tue, 05 Oct 2021 12:21:01 -0400
X-MC-Unique: ojHImsdkOHuPWYqNjW9ITQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C65B31084681;
 Tue,  5 Oct 2021 16:20:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF5B60BF4;
 Tue,  5 Oct 2021 16:20:50 +0000 (UTC)
Date: Tue, 5 Oct 2021 17:20:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Message-ID: <YVx7YGqUENP83vNF@redhat.com>
References: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com>
 <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <YVwRfETMFxFKuXO1@redhat.com>
 <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
MIME-Version: 1.0
In-Reply-To: <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 06:15:35PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/5/21 10:49, Daniel P. Berrangé wrote:
> > On Tue, Oct 05, 2021 at 06:44:23AM +0200, Christophe Leroy wrote:
> 
> >> I will look at it, please allow me a few weeks though.
> > 
> > Once something is deprecated, it remains in QEMU for a minimum of two
> > release cycles, before being deleted. At any time in that deprecation
> > period it can be returned to supported status, if someone provides a
> > good enough justification to keep it.
> 
> My understanding is once being in deprecated state for 2 releases, it
> can be removed, but it doesn't have to be removed (assuming it is
> functional and nobody complains). Am I incorrect?

It should be removed after 2 releases. Things live longer because
people forget or are busy with other things, but ultimately anything
in the deprecated list is liable to be deleted at any point after
the 2 release minimum is up.

If we change our minds about deleting something, then it should
be un-deprecated.

> I am raising this because the nanoMIPS support is in deprecated state
> since more than 2 releases, but it is still in-tree and I try to keep
> it functional. However, since no toolchain reached mainstream GCC/LLVM
> it is not easy to maintain. By keeping it in that state we give some
> time to other communities to have their toolchain upstreamed / merged.

If you're trying to keep it functional and aren't going to remove
it, then it shouldn't be marked deprecated.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


