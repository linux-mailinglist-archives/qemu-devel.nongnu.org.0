Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A84CD109
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 10:29:25 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ4FY-0001z5-40
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 04:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ4Dd-00017z-2J
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 04:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ4Da-0001N7-Ep
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 04:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646386041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QyB0zJaH25J+XgrzWUVFYSnFwmTa+QRmVCKlSYExn0=;
 b=ekXOW146yecZZQev5XgzSj3MlagyZQsKvBaTNzwzx8gb0196UcWbvrypPCAxY44KgwcOb9
 aLnz+EIKJN9D9+MrsJ1nNOSkSyHgN/UcfzizyzxiL6lrEKaX8euTKUmTpdgZuiGk7t/Ex2
 wtxVXNfJ44fInK6Pbt90Cd+xqrdHlnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-sGFLhZmtNz-drUFNJFgSKg-1; Fri, 04 Mar 2022 04:27:18 -0500
X-MC-Unique: sGFLhZmtNz-drUFNJFgSKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6641091DA0;
 Fri,  4 Mar 2022 09:27:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 527BD808BD;
 Fri,  4 Mar 2022 09:27:13 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:27:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 3/4] qsd: Add --daemonize
Message-ID: <YiHbcKbJJpc45u1u@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
 <20220303164814.284974-4-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303164814.284974-4-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.03.2022 um 17:48 hat Hanna Reitz geschrieben:
> To implement this, we reuse the existing daemonizing functions from the
> system emulator, which mainly do the following:
> - Fork off a child process, and set up a pipe between parent and child
> - The parent process waits until the child sends a status byte over the
>   pipe (0 means that the child was set up successfully; anything else
>   (including errors or EOF) means that the child was not set up
>   successfully), and then exits with an appropriate exit status
> - The child process enters a new session (forking off again), changes
>   the umask, and will ignore terminal signals from then on
> - Once set-up is complete, the child will chdir to /, redirect all
>   standard I/O streams to /dev/null, and tell the parent that set-up has
>   been completed successfully
> 
> In contrast to qemu-nbd's --fork implementation, during the set up
> phase, error messages are not piped through the parent process.
> qemu-nbd mainly does this to detect errors, though (while os_daemonize()
> has the child explicitly signal success after set up); because we do not
> redirect stderr after forking, error messages continue to appear on
> whatever the parent's stderr was (until set up is complete).
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst   |  7 +++++++
>  storage-daemon/qemu-storage-daemon.c | 15 +++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
> index 878e6a5c5c..8b97592663 100644
> --- a/docs/tools/qemu-storage-daemon.rst
> +++ b/docs/tools/qemu-storage-daemon.rst
> @@ -154,6 +154,13 @@ Standard options:
>    created but before accepting connections. The daemon has started successfully
>    when the pid file is written and clients may begin connecting.
>  
> +.. option:: --daemonize
> +
> +  Daemonize the process. The parent process will exit once startup is complete
> +  (i.e., after the pid file has been or would have been written) or failure
> +  occurs. Its exit code reflects whether the child has started up successfully
> +  or failed to do so.
> +
>  Examples
>  --------
>  Launch the daemon with QMP monitor socket ``qmp.sock`` so clients can execute
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index b798954edb..9f2c3332bf 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -137,6 +137,9 @@ static void help(void)
>  "\n"
>  "  --pidfile <path>       write process ID to a file after startup\n"
>  "\n"
> +"  --daemonize            daemonize the process, and have the parent exit\n"
> +"                         once startup is complete\n"
> +"\n"

So far the long options in the help text are sorted alphabetically. Do
we want to keep this?

Kevin


