Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3E51C507
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:21:26 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeEH-00032F-7a
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdxc-0004m2-CF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:04:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:56359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdxZ-00024m-Bo
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651766647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=emrQEjnKCJ6H+dINtKV6dNQn64w0bWCuXV6LFWBiPPI=;
 b=NHcof+BIQXkyJVU7FHr4xXsC1NBMaCewoyvcIQEzsivVHvvg+fHEsskXZdRvJq7vYbEojp
 TJeKX09NI3FJ+ESsigJ9ETCRXOSLWtOOk7hJ8iaspO0qHr7/BSnC1SzJ3QknaLR31zV4ap
 1fHZ4LIEM2+nEEMyw1J4KcASelPyEa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-rby0lzBqMJWzmfK1vdJM0A-1; Thu, 05 May 2022 12:04:04 -0400
X-MC-Unique: rby0lzBqMJWzmfK1vdJM0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84371299E75E;
 Thu,  5 May 2022 16:04:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DC2540CF905;
 Thu,  5 May 2022 16:04:02 +0000 (UTC)
Date: Thu, 5 May 2022 17:04:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 bleal@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 17/17] vfio-user: avocado tests for vfio-user
Message-ID: <YnP1cZZZ35EZF2sw@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <fed0fbe8ee48383f6a018bf9eacd8a7258e2201d.1651586203.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yoJTqIgpbjxv9IrL"
Content-Disposition: inline
In-Reply-To: <fed0fbe8ee48383f6a018bf9eacd8a7258e2201d.1651586203.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yoJTqIgpbjxv9IrL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 10:16:58AM -0400, Jagannathan Raman wrote:
> +    def launch_client(self, kernel_path, initrd_path, kernel_command_line,
> +                      machine_type, socket, *opts):
> +        client_vm = self.get_vm()
> +        client_vm.set_console()
> +        client_vm.add_args('-machine', machine_type)
> +        client_vm.add_args('-accel', 'kvm')
> +        client_vm.add_args('-cpu', 'host')
> +        client_vm.add_args('-object',
> +                           'memory-backend-memfd,id=sysmem-file,size=2G')
> +        client_vm.add_args('--numa', 'node,memdev=sysmem-file')
> +        client_vm.add_args('-m', '2048')
> +        client_vm.add_args('-kernel', kernel_path,
> +                           '-initrd', initrd_path,
> +                           '-append', kernel_command_line)
> +        client_vm.add_args('-device',
> +                           'vfio-user-pci,socket='+socket)

This patch series is just the server. Does this test case work yet?

If not, please defer it to the client series.

Stefan

--yoJTqIgpbjxv9IrL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz9XEACgkQnKSrs4Gr
c8iHMAf/QmaiWzIbO9Br67ly28cS5AsE9Rr9WHsaWIBNoUbutL3Ycm6B66BaV2PT
tsiFmUa6q2+l7NVGGy87dhUxaIfLeG9oECcajIkjvAjfgcrBh18BvOcZANI0bSMG
M8bK/9U3ioVWTIBRZ7ZVJ1CfwZr9u2rVNHarFZm1SVgdZE5BNZuK+OdEvQeNdFm1
2zuSKnwIlgV1Dm4dSmsOGVv4L03sOPoBNQbsTqEaN/v45+104I/o10sHKqBi79nL
hn/frX2Hwv26ofM/vYtuJmvsSCs/hk9CpNn6Km6cHs2+Vsi/XXBrVAQpF5lFn+SD
lgZwupCawbPprEyLUK89RGiLZZsvAQ==
=XmEx
-----END PGP SIGNATURE-----

--yoJTqIgpbjxv9IrL--


