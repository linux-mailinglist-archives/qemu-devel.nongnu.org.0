Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23EC4D63D7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 15:38:40 +0100 (CET)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSgPf-0006nL-FC
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 09:38:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nSgOs-00067u-4e
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 09:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nSgOp-0003uR-2p
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 09:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647009465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYjShqpuoPsDk5MFrsvgppLYmsFY5VE9DQn5ImFYJeY=;
 b=FgjjQRZtq8h/9etD0XAuGKyq72vm10vesSeXXpm4cWPXNEKlhlGLrQppG860j9LJ9UbuMw
 U1z1LJ/XcFzAnuGzsIHGAtw47gwMuWY0mcxleOdVo5Ho1gvYD8qcJEXzVbFHVVjyMuqadS
 4bad0E8ZYkdwPz343naM0+0EDW7Hj+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-ZKMpC8W2OAmaCaXhAni62g-1; Fri, 11 Mar 2022 09:37:44 -0500
X-MC-Unique: ZKMpC8W2OAmaCaXhAni62g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C83C1800D50;
 Fri, 11 Mar 2022 14:37:43 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown
 [10.22.9.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB797D3E5;
 Fri, 11 Mar 2022 14:37:35 +0000 (UTC)
References: <20220311130919.2120958-1-bleal@redhat.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: starts PhoneServer upfront
Date: Fri, 11 Mar 2022 09:28:24 -0500
In-reply-to: <20220311130919.2120958-1-bleal@redhat.com>
Message-ID: <875yokpnbn.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>  tests/avocado/avocado_qemu/__init__.py | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avoca=
do_qemu/__init__.py
> index 9b056b5ce5..e830d04b84 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -602,9 +602,8 @@ def prepare_cloudinit(self, ssh_pubkey=3DNone):
>          self.log.info('Preparing cloudinit image')
>          try:
>              cloudinit_iso =3D os.path.join(self.workdir, 'cloudinit.iso'=
)
> -            self.phone_home_port =3D network.find_free_port()
> -            if not self.phone_home_port:
> -                self.cancel('Failed to get a free port')
> +            if not self.phone_server:
> +                self.cancel('Failed to get port used by the PhoneServer.=
')

Can you think of a condition where `self.phone_server` would not
evaluate to True?  `network.find_free_port()` could return None, so this
check was valid.  But now with `cloudinit.PhoneHomeServer`, I can not
see how we'd end up with a similar condition.  Instantiating
`cloudinit.PhoneHomeServer` where a port can not be alloccated, AFAICT,
would raise a socket exception instead.

Also, the name of the utility class is PhoneHomeServer.  Using a
different name in the message will make cross references into the
Avocado docs harder.

Finally, a nitpick: I'd drop the leading dot in such a test cancelation
message.

Other than those points, the direction of those changes are indeed a
great improvement.

Thanks,
- Cleber.


