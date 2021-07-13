Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB73C756A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:59:10 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LkT-00081D-FL
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Lj6-0006Lj-Qo
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Lj3-0007g3-8F
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626195459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hS9VUC1u39twyaWBDCgCruHn2MMmKEJlUCx9BUVbEQ=;
 b=H6JY0iP7AFOYYOcNgThj0Eblp0ECYukTPBa4GkqG2A++HsYx7EcSkcHq5Jm+UBNjaBDJ6M
 DhxT1HFxy39i5EW20d85eTNjEo0oAP3/f1wtWSTq4wO51gJnL1jBodC78rujefUThvQywv
 sPqLSJdOe+ATo+nBypYNzdbnyXqg9+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-aouXAbUFM5y-Ah2IAe2X0w-1; Tue, 13 Jul 2021 12:57:38 -0400
X-MC-Unique: aouXAbUFM5y-Ah2IAe2X0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A96571023F41;
 Tue, 13 Jul 2021 16:57:36 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C0235C22A;
 Tue, 13 Jul 2021 16:57:35 +0000 (UTC)
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
In-reply-to: <20210623180021.898286-4-f4bug@amsat.org>
Date: Tue, 13 Jul 2021 12:57:34 -0400
Message-ID: <871r82179d.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 writes:

> Avocado allows us to select set of tests using tags.
> When wanting to run all tests using a NetBSD guest OS,
> it is convenient to have them tagged, add the 'os:netbsd'
> tag.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 1 +
>  tests/acceptance/ppc_prep_40p.py       | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Cleber Rosa <crosa@redhat.com>

Phil,

I can ammend the commit message and queue this one if you think it's a
good idea.

Cheers,
- Cleber.


