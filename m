Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3650DDE8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:31:17 +0200 (CEST)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivzv-0002rW-VT
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivwb-0001EC-Qv
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivwY-00053l-WF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650882466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W3rmkyFK9OJpng5RgNnA9hNn6IwFgUsmVMBSt2+M7aI=;
 b=e2lvzuZWbnRs0kus6CnkakVNOL2e/BdKdcoSg+m9nhSfJOqKbdnIVQmyGTwVMB7uJHoewk
 22HdOkBnrfNe2JJYLcnmxf43vy3p385gUwkJHWTs9Gynrze3cXru3AwLwlOMl7RR5hml8G
 7CMsxdSjhlcWaMFO3VzDu5Tmen2LD7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-BQ3loivSOMOzDjtnCP7oVQ-1; Mon, 25 Apr 2022 06:27:42 -0400
X-MC-Unique: BQ3loivSOMOzDjtnCP7oVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DDA729AB3F2;
 Mon, 25 Apr 2022 10:27:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA8240CF910;
 Mon, 25 Apr 2022 10:27:41 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:27:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 15/17] vfio-user: handle device interrupts
Message-ID: <YmZ3nAtyjt+gjqvL@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <847e6d373eb3d8ff4cdeb7a3ad9b935785bfbf8e.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AJaMlC+RasMS0HZ0"
Content-Disposition: inline
In-Reply-To: <847e6d373eb3d8ff4cdeb7a3ad9b935785bfbf8e.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AJaMlC+RasMS0HZ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 19, 2022 at 04:44:20PM -0400, Jagannathan Raman wrote:
> +static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
> +                                             unsigned int vector)
> +{
> +    MSIMessage msg;
> +
> +    msg.address = 0;
> +    msg.data = vector;
> +
> +    return msg;
> +}
> +
> +static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
> +{
> +    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
> +
> +    vfu_irq_trigger(vfu_ctx, msg.data);
> +}

Why did you switch to vfu_object_msi_prepare_msg() +
vfu_object_msi_trigger() in this revision?

Stefan

--AJaMlC+RasMS0HZ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmd5wACgkQnKSrs4Gr
c8j9Xwf/UhKH9B37fLp1lUf/daPbUyX6eWHWhMQW3WkRfp7uBzc9/JSUpInPmDyW
nVEH1nx9AKXmoUQ2dMUuvXi+v9GV1YTQCbH+hlnyHtkdHQcvFEcdQPIpp+tZUhPq
n+iQQUNVKdn9FALd0p+QInhB9Ot9AEm83NVT2eONBYqcswB5efZORMKceAuvrZJo
lTqgLky5PqUOE8+TbbLH0DIUnG/vudWvucU2Nwg3ht6Ur++NbkM4hs9D7Izpl9Oj
g3K9NmIDM6M5uV7x0uHorTdYSqqzBTc9zIQ4NLC+s9kBMmerugzTolOAJZ6RwzdM
Cx2uXsAOYvu9d5ovaMVB2qYITPov6A==
=Lx7Z
-----END PGP SIGNATURE-----

--AJaMlC+RasMS0HZ0--


