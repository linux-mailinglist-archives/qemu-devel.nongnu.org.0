Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA42DB103
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:13:23 +0100 (CET)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCx0-0002xY-Ka
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCvD-0001H4-V9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCv1-0001Yq-FT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608048677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=31w4SD6SbJN1c3v9yM4wDlVwsblBKLn6ShIdUga6gNc=;
 b=C+9IkYD6mf2al/5tGRiBs2jl14aKYzOEuPAwZj4BJMKP9naTuMatkdk7RpsMA/Ox9CvRC1
 NP0p+ackupx/stkPYAv2mMMkV2qKR7G5Sf98mN8J9Yd0klaswYy5cTru0qqvWJqBgLA8KD
 2SNxxxJD5CBUtIjRjr2iEXbVgqDgRcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-5cK2MFddOvqxqtVluhtj0A-1; Tue, 15 Dec 2020 11:11:16 -0500
X-MC-Unique: 5cK2MFddOvqxqtVluhtj0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E217D107ACE3;
 Tue, 15 Dec 2020 16:11:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9227B5D9D7;
 Tue, 15 Dec 2020 16:11:09 +0000 (UTC)
Date: Tue, 15 Dec 2020 17:11:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man
 page
Message-ID: <20201215161106.GJ8185@merkur.fritz.box>
References: <20201209103802.350848-1-stefanha@redhat.com>
 <20201209103802.350848-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209103802.350848-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.12.2020 um 11:38 hat Stefan Hajnoczi geschrieben:
> Although individual qemu-storage-daemon QMP commands are identical to
> QEMU QMP commands, qemu-storage-daemon only supports a subset of QEMU's
> QMP commands. Generate a manual page of just the commands supported by
> qemu-storage-daemon so that users know exactly what is available in
> qemu-storage-daemon.
> 
> Add an h1 heading in storage-daemon/qapi/qapi-schema.json so that
> block-core.json is at the h2 heading level.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/interop/index.rst                       |  1 +
>  docs/interop/qemu-storage-daemon-qmp-ref.rst | 13 +++++++++++++
>  storage-daemon/qapi/qapi-schema.json         |  3 +++
>  docs/interop/conf.py                         |  2 ++
>  docs/meson.build                             |  1 +
>  5 files changed, 20 insertions(+)
>  create mode 100644 docs/interop/qemu-storage-daemon-qmp-ref.rst
> 
> diff --git a/docs/interop/index.rst b/docs/interop/index.rst
> index cd78d679d8..95d56495f6 100644
> --- a/docs/interop/index.rst
> +++ b/docs/interop/index.rst
> @@ -20,6 +20,7 @@ Contents:
>     qemu-ga
>     qemu-ga-ref
>     qemu-qmp-ref
> +   qemu-storage-daemon-qmp-ref
>     vhost-user
>     vhost-user-gpu
>     vhost-vdpa
> diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> new file mode 100644
> index 0000000000..caf9dad23a
> --- /dev/null
> +++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> @@ -0,0 +1,13 @@
> +QEMU Storage Daemon QMP Reference Manual
> +========================================
> +
> +..
> +   TODO: the old Texinfo manual used to note that this manual
> +   is GPL-v2-or-later. We should make that reader-visible
> +   both here and in our Sphinx manuals more generally.
> +
> +..
> +   TODO: display the QEMU version, both here and in our Sphinx manuals
> +   more generally.
> +
> +.. qapi-doc:: storage-daemon/qapi/qapi-schema.json

Did you intend to actually merge the TODO comments like this into master
or was this meant to be resolved before you send the series?

Kevin


