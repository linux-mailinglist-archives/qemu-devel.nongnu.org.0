Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7126B3A4A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:25:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paYza-0006Pd-Un; Fri, 10 Mar 2023 04:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paYzY-0006PM-U0
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1paYzW-0005eF-Hc
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440285;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0VAOE6edpxnqhFo1v4lsUV9fE47WAwNnvc3xfKkMoJQ=;
 b=QksvUsf5dR6ODt/DAM1axmEiu2u0qI63E4gQv8UliDZUm2I8i8j/H4BddGKlJfEi9Ys5bn
 ovZnPXlwrNnc8N3wdkys8LO1noLUFg298RrmzqgMku9zuGtAfKjTRlkiTRhPpodVIaAvbA
 U2Dt5CkeckqWSPI3LxhCf2bBQqPoqyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-zR493U0mO0C8Lq7-RaI2bQ-1; Fri, 10 Mar 2023 04:24:42 -0500
X-MC-Unique: zR493U0mO0C8Lq7-RaI2bQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4756830F57;
 Fri, 10 Mar 2023 09:24:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2A55C15BA0;
 Fri, 10 Mar 2023 09:24:40 +0000 (UTC)
Date: Fri, 10 Mar 2023 09:24:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
Message-ID: <ZAr3VuuP7s0ka0rt@redhat.com>
References: <cover.1678401400.git.dxu@dxuuu.xyz>
 <c73263127c3533c9da06042a57bed2f334c5ea2e.1678401400.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c73263127c3533c9da06042a57bed2f334c5ea2e.1678401400.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 09, 2023 at 03:40:57PM -0700, Daniel Xu wrote:
> Currently, any captured output (via `capture-output`) is segregated into
> separate GuestExecStatus fields (`out-data` and `err-data`). This means
> that downstream consumers have no way to reassemble the captured data
> back into the original stream.
> 
> This is relevant for chatty and semi-interactive (ie. read only) CLI
> tools.  Such tools may deliberately interleave stdout and stderr for
> visual effect. If segregated, the output becomes harder to visually
> understand.
> 
> This commit adds a new enum variant to the GuestExecCaptureOutputMode
> qapi to merge the output streams such that consumers can have a pristine
> view of the original command output.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  qga/commands.c       | 31 +++++++++++++++++++++++++++++--
>  qga/qapi-schema.json |  4 +++-
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/qga/commands.c b/qga/commands.c
> index 01f68b45ab..c347d434ed 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -270,12 +270,26 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
>      g_spawn_close_pid(pid);
>  }
>  
> -/** Reset ignored signals back to default. */
>  static void guest_exec_task_setup(gpointer data)
>  {
>  #if !defined(G_OS_WIN32)
> +    bool has_merge = *(bool *)data;
>      struct sigaction sigact;
>  
> +    if (has_merge) {
> +        /*
> +         * FIXME: When `GLIB_VERSION_MIN_REQUIRED` is bumped to 2.58+, use
> +         * g_spawn_async_with_fds() to be portable on windows. The current
> +         * logic does not work on windows b/c `GSpawnChildSetupFunc` is run
> +         * inside the parent, not the child.
> +         */
> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
> +            slog("dup2() failed to merge stderr into stdout: %s",
> +                 strerror(errno));
> +        }
> +    }
> +
> +    /* Reset ignored signals back to default. */
>      memset(&sigact, 0, sizeof(struct sigaction));
>      sigact.sa_handler = SIG_DFL;
>  
> @@ -409,6 +423,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
>      bool has_output = false;
> +    bool has_merge = false;

Wrap in  #ifndef _WIN32

>      GuestExecCaptureOutputMode output_mode;
>      g_autofree uint8_t *input = NULL;
>      size_t ninput = 0;
> @@ -445,13 +460,25 @@ GuestExec *qmp_guest_exec(const char *path,
>      case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
>          has_output = true;
>          break;
> +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_MERGED:
> +        has_output = true;
> +        has_merge = true;
> +        break;

Wrap in  #ifndef _WIN32

>      case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
>          /* Silence warning; impossible branch */
>          break;
>      }
>  
> +#if defined(G_OS_WIN32)
> +    /* FIXME: see comment in guest_exec_task_setup() */
> +    if (has_merge) {
> +        error_setg(errp, "merged unsupported on windows");
> +        return NULL;
> +    }
> +#endif

THis can be dropped, since 'has_merge' won't exist for
Win32 builds.

> +
>      ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
> -            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
> +            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
>              has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
>      if (!ret) {
>          error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index d1e00a4234..b4782525ae 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1210,11 +1210,13 @@
>  # @stderr: only capture stderr
>  # @separated: capture both stdout and stderr, but separated into
>  #             GuestExecStatus out-data and err-data, respectively
> +# @merged: capture both stdout and stderr, but merge together
> +#          into out-data. not effective on windows guests.
>  #
>  # Since: 8.0
>  ##
>   { 'enum': 'GuestExecCaptureOutputMode',
> -   'data': [ 'none', 'stdout', 'stderr', 'separated' ] }
> +   'data': [ 'none', 'stdout', 'stderr', 'separated', 'merged' ] }

Actually, I've just realized we can make this conditional:


 'data': [ 'none', 'stdout', 'stderr', 'separated',
           { 'name': 'merged', 'if': 'CONFIG_WIN32' } ] }

so the constant doesn't even exist in Win32 builds.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


