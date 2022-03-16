Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19E4DAF3B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:53:13 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSDI-0003EE-9X
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:53:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nUSC6-0002QA-J3
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nUSC3-0002vH-8S
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647431513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckOoaKhse0IlHIis3P3wgrYpfkSM8t/YreS1AHOmkZ0=;
 b=anZnhuGZpKnTFPDrbrwU7NpcjSQl7HlXcNtDeIVPSjjBicfWRs5m8RHOFdd65veEwIpBv+
 ltuKdYR0kAnTwEbZad13UJYyT7Qbr7V+FcH1AMRd/kZeOI48XzroppMXJSTp/h0zcC9Z7E
 bpiF1XIDs9gKz2ltDTS1tEroGcT2TYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-BHchplvqPvGEoZqjAdgaZA-1; Wed, 16 Mar 2022 07:51:50 -0400
X-MC-Unique: BHchplvqPvGEoZqjAdgaZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCE82801E8D;
 Wed, 16 Mar 2022 11:51:49 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown
 [10.22.17.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1892F112D418;
 Wed, 16 Mar 2022 11:51:38 +0000 (UTC)
References: <20220311171127.2189534-1-bleal@redhat.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v2] tests/avocado: starts PhoneServer upfront
Date: Wed, 16 Mar 2022 07:49:24 -0400
In-reply-to: <20220311171127.2189534-1-bleal@redhat.com>
Message-ID: <87r172glo8.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Beraldo Leal <bleal@redhat.com> writes:

> Race conditions can happen with the current code, because the port that
> was available might not be anymore by the time the server is started.
>
> By setting the port to 0, PhoneServer it will use the OS default
> behavior to get a free port, then we save this information so we can
> later configure the guest.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Beraldo Leal <bleal@redhat.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>


