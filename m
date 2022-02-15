Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C34B7A64
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:22:25 +0100 (CET)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6DH-0008Hp-J8
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6Ac-0005SP-E1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6AZ-0008AY-N8
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644963575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vl4cjeX04MhjmaU8szejBtZZaZXpt9xFamqeoA/iGfw=;
 b=D5PRPtJiY3j0uQLvyvsRDvxRO5IRazkY7mavdn7A47rfEi/bOG8E9Nt94uZxwWBWq9W6Id
 KggSAnm1vJuPcGFo4ashe1Fi+nB5iDgLm4HcS7gvUbbzJSvlVz7Xsduw0+0jUfDFb9uxJU
 jMFDNgXCmzpa/dyXP1DjRqi3JVjWGLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-Z0cWhDx2PveZYPyfaxxT3A-1; Tue, 15 Feb 2022 17:19:31 -0500
X-MC-Unique: Z0cWhDx2PveZYPyfaxxT3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC4621091DA4;
 Tue, 15 Feb 2022 22:19:30 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57FB15E26D;
 Tue, 15 Feb 2022 22:19:16 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:19:14 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/3] iotests: Allow using QMP with the QSD
Message-ID: <20220215221914.2g4w7f7aol7ge3wy@redhat.com>
References: <20220215135727.28521-1-hreitz@redhat.com>
 <20220215135727.28521-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215135727.28521-3-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 02:57:26PM +0100, Hanna Reitz wrote:
> Add a parameter to optionally open a QMP connection when creating a
> QemuStorageDaemon instance.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 6ba65eb1ff..47e3808ab9 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -39,6 +39,7 @@
>  
>  from qemu.machine import qtest
>  from qemu.qmp import QMPMessage
> +from qemu.aqmp.legacy import QEMUMonitorProtocol

I thought we were trying to get rid of aqmp.legacy usage, so this
feels like a temporary regression.  Oh well, not the end of the
testing world.

>      def stop(self, kill_signal=15):
>          self._p.send_signal(kill_signal)
>          self._p.wait()
>          self._p = None
>  
> +        if self._qmp:
> +            self._qmp.close()
> +
>          try:
> +            if self._qmpsock is not None:
> +                os.remove(self._qmpsock)
>              os.remove(self.pidfile)
>          except OSError:
>              pass

Do we need two try: blocks here, to remove self.pidfile even if
os.remove(self._qmpsock) failed?

Otherwise, makes sense to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


