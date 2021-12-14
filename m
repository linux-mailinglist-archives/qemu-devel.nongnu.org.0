Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A4474B27
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 19:46:46 +0100 (CET)
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxCp3-0006dF-3J
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 13:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxCkb-0005CE-Sb
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:42:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxCkZ-0007W4-B5
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639507319;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAC3jDayoMcyWBaiN8yJfQqJE5QJgR5Hr0O1lsKs3iI=;
 b=B80QWbCIauY5/bUNJ/kI1bA7dHi3raTdwR8vLPdVgyk8383FIF+KczhmeaWKJGG7lP7T9j
 nbj5pINle+Qxd/ZSPr3oCZL6VDJzeRh/LLKFfeVmjLY+no9TG2kEukjk8uTejFeW9S+Ogz
 FkpivqIIkR8C5FfdZvvSKp88TsLzVLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-NfxTKn-wMwmVtnvsJ3kzSQ-1; Tue, 14 Dec 2021 13:41:56 -0500
X-MC-Unique: NfxTKn-wMwmVtnvsJ3kzSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E86E1030BD4;
 Tue, 14 Dec 2021 18:41:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FBB9D5D5;
 Tue, 14 Dec 2021 18:41:36 +0000 (UTC)
Date: Tue, 14 Dec 2021 18:41:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] monitor: move x-query-profile into accel/tcg to fix build
Message-ID: <YbjlXvoQHC4yuqdw@redhat.com>
References: <20211214182207.1416246-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211214182207.1416246-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 06:22:07PM +0000, Alex Bennée wrote:
> As --enable-profiler isn't defended in CI we missed this breakage.
> Move the qmp handler into accel/tcg so we have access to the helpers
> we need. While we are at it ensure we gate the feature on CONFIG_TCG.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
> ---
>  qapi/machine.json    |  1 +
>  accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
>  monitor/qmp-cmds.c   | 31 -------------------------------
>  3 files changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 067e3f5378..0c9f24a712 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1492,6 +1492,7 @@
>  ##
>  { 'command': 'x-query-profile',
>    'returns': 'HumanReadableText',
> +  'if': 'CONFIG_TCG',
>    'features': [ 'unstable' ] }
>  
>  ##
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 409ec8c38c..9498a16681 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -1091,3 +1091,34 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
>  }
>  
>  #endif /* !CONFIG_USER_ONLY */

I think this #endif probably needs to be after the qmp_x_query_profile
impl, as it is for the other TCG QMP cmds  ?

> +
> +#ifdef CONFIG_PROFILER
> +
> +int64_t dev_time;
> +
> +HumanReadableText *qmp_x_query_profile(Error **errp)
> +{
> +    g_autoptr(GString) buf = g_string_new("");
> +    static int64_t last_cpu_exec_time;
> +    int64_t cpu_exec_time;
> +    int64_t delta;
> +
> +    cpu_exec_time = tcg_cpu_exec_time();
> +    delta = cpu_exec_time - last_cpu_exec_time;
> +
> +    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
> +                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
> +    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
> +                           delta, delta / (double)NANOSECONDS_PER_SECOND);
> +    last_cpu_exec_time = cpu_exec_time;
> +    dev_time = 0;
> +
> +    return human_readable_text_from_str(buf);
> +}
> +#else
> +HumanReadableText *qmp_x_query_profile(Error **errp)
> +{
> +    error_setg(errp, "Internal profiler not compiled");
> +    return NULL;
> +}
> +#endif
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 343353e27a..be5e44c569 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -355,37 +355,6 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
>      }
>  }
>  
> -#ifdef CONFIG_PROFILER
> -
> -int64_t dev_time;
> -
> -HumanReadableText *qmp_x_query_profile(Error **errp)
> -{
> -    g_autoptr(GString) buf = g_string_new("");
> -    static int64_t last_cpu_exec_time;
> -    int64_t cpu_exec_time;
> -    int64_t delta;
> -
> -    cpu_exec_time = tcg_cpu_exec_time();
> -    delta = cpu_exec_time - last_cpu_exec_time;
> -
> -    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
> -                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
> -    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
> -                           delta, delta / (double)NANOSECONDS_PER_SECOND);
> -    last_cpu_exec_time = cpu_exec_time;
> -    dev_time = 0;
> -
> -    return human_readable_text_from_str(buf);
> -}
> -#else
> -HumanReadableText *qmp_x_query_profile(Error **errp)
> -{
> -    error_setg(errp, "Internal profiler not compiled");
> -    return NULL;
> -}
> -#endif
> -
>  static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
>  {
>      RdmaProvider *rdma;
> -- 
> 2.30.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


