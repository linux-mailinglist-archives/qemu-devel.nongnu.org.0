Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C496A5F9A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5cJ-0001UU-OL; Tue, 28 Feb 2023 14:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pX5cH-0001UI-QX
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:26:25 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pX5cF-0007K6-UV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:26:25 -0500
Received: by mail-lf1-x135.google.com with SMTP id f41so14578860lfv.13
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677612381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LENQpDRerP08C/PgmM70e8YHnVPYeCb8LayGhYhl43o=;
 b=Usqeb3b/NtoOh98SOcgiQP/BIElJkgTauXSag2RD57x2n6svlWPtOZw/+ipg4uHRip
 ctrQ/HmaMDUQPz7YRfjjjCL+Q8NaRdT422oyd1VwjY3jQBXR7yabIrXCC4pqN/0vxKvi
 k5o/y3GZg91AE4EUU+jSU3/BqR7BmgIfC+92IeVPxtji2gmIvrf3qoDiKcErYSdWMNSz
 O6sKZNMu39Rl5FDcNxYAB1vF0X4HLSmJjIGgJV1KWMZy9D1pmNK6NnNEgCWzGzeOdHsR
 EsM/z9FSCnVU35bWUZAvpaNMxtRZXHgbOEClEOAJIMFRmxrF49gXfyKy9anu3Zkj8l6/
 Tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677612381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LENQpDRerP08C/PgmM70e8YHnVPYeCb8LayGhYhl43o=;
 b=nafskgpcgrSZB3UWKp4BM3iC3JNO8QJd1+E+h6k9/TUko7vEdyyIX0NeppGS5k5zi7
 O2MxVgxOk9SgOaym66DH7/n7bR7pkBa9RRTx56+fmGKOLe3S1mB3MZguGJpn+V+dj30H
 G9o/sNdFApUxvYHqW0sqvECGADKPiMhQp+dvwoKc/IT5XkcFt6JJoIyg0+7+2acw4792
 ir+l/gBkEuxLvsSXfKvUSW0LXTkJ5Q9n+EQF3ZfLpEeRPGwtXm9iwUZLcS8vhAlZ6b9o
 fFcSEBEH4aXJ/T43MOHyt/hy4lZ9R21MD7+GRQBT7cX6xoUYBXY6SQaclLiJHLDeSKl8
 8XgQ==
X-Gm-Message-State: AO0yUKXvt5k8JPSp58lu6opW9aHDcUy3xIUpi71Pc6qwUbog3lxKaKFe
 DFj9b+pPcEzviV8/Ph2rV0ojattLbc2A5lCrBHg=
X-Google-Smtp-Source: AK7set94UKEPPxrbNv5Mw/VrwSD35AHuARqOESvMvohNj0Z2rhsi2FDfQ0Gu4xfYtyf6iEvLmIX8oeVqAUgF0teUlrg=
X-Received: by 2002:ac2:52b8:0:b0:4dd:9da1:bef0 with SMTP id
 r24-20020ac252b8000000b004dd9da1bef0mr1073620lfm.5.1677612381142; Tue, 28 Feb
 2023 11:26:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677609866.git.dxu@dxuuu.xyz>
 <e4a6d274d554479c665de82b3627f1df2055306a.1677609866.git.dxu@dxuuu.xyz>
In-Reply-To: <e4a6d274d554479c665de82b3627f1df2055306a.1677609866.git.dxu@dxuuu.xyz>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Feb 2023 23:26:09 +0400
Message-ID: <CAJ+F1CJROMSagNReTttyAmoy_9GMkbmcvc6+WB4ZyKcp3yzQ9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] qga: Add optional `merge-output` flag to
 guest-exec qapi
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: kkostiuk@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Feb 28, 2023 at 10:51 PM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> Currently, the captured output (via `capture-output`) is segregated into
> separate GuestExecStatus fields (`out-data` and `err-data`). This means
> that downstream consumers have no way to reassemble the captured data
> back into the original stream.
>
> This is relevant for chatty and semi-interactive (ie. read only) CLI
> tools.  Such tools may deliberately interleave stdout and stderr for
> visual effect. If segregated, the output becomes harder to visually
> understand.
>
> This commit adds a new optional flag to the guest-exec qapi to merge the
> output streams such that consumers can have a pristine view of the
> original command output.
>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  qga/commands.c       | 14 ++++++++++++--
>  qga/qapi-schema.json |  6 +++++-
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/qga/commands.c b/qga/commands.c
> index 172826f8f8..e13a8e86df 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -270,12 +270,20 @@ static void guest_exec_child_watch(GPid pid, gint s=
tatus, gpointer data)
>      g_spawn_close_pid(pid);
>  }
>
> -/** Reset ignored signals back to default. */
>  static void guest_exec_task_setup(gpointer data)
>  {
>  #if !defined(G_OS_WIN32)
> +    bool has_merge =3D *(bool *)data;
>      struct sigaction sigact;
>
> +    if (has_merge) {
> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) !=3D 0) {
> +            slog("dup2() failed to merge stderr into stdout: %s",
> +                 strerror(errno));

I would leave a FIXME comment for glib 2.58 g_spawn_async_with_fds() usage

> +        }
> +    }
> +
> +    /* Reset ignored signals back to default. */
>      memset(&sigact, 0, sizeof(struct sigaction));
>      sigact.sa_handler =3D SIG_DFL;
>
> @@ -384,6 +392,7 @@ GuestExec *qmp_guest_exec(const char *path,
>                         bool has_env, strList *env,
>                         const char *input_data,
>                         bool has_capture_output, bool capture_output,
> +                       bool has_merge_output, bool merge_output,
>                         Error **errp)
>  {
>      GPid pid;
> @@ -397,6 +406,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
>      bool has_output =3D (has_capture_output && capture_output);
> +    bool has_merge =3D (has_merge_output && merge_output);
>      g_autofree uint8_t *input =3D NULL;
>      size_t ninput =3D 0;
>
> @@ -420,7 +430,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      }
>
>      ret =3D g_spawn_async_with_pipes(NULL, argv, envp, flags,
> -            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NUL=
L,
> +            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd=
 : NULL,
>              has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &g=
err);
>      if (!ret) {
>          error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 796434ed34..9c2367acdf 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1211,6 +1211,9 @@
>  # @input-data: data to be passed to process stdin (base64 encoded)
>  # @capture-output: bool flag to enable capture of
>  #                  stdout/stderr of running process. defaults to false.
> +# @merge-output: bool flag to merge stdout/stderr of running process
> +#                into stdout. only effective if used with @capture-outpu=
t.
> +#                not effective on windows guests. defaults to false. (si=
nce 8.0)

I think you should return an error on Windows instead.

>  #
>  # Returns: PID on success.
>  #
> @@ -1218,7 +1221,8 @@
>  ##
>  { 'command': 'guest-exec',
>    'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
> -               '*input-data': 'str', '*capture-output': 'bool' },
> +               '*input-data': 'str', '*capture-output': 'bool',
> +               '*merge-output': 'bool' },
>    'returns': 'GuestExec' }
>
>
> --
> 2.39.1
>


--=20
Marc-Andr=C3=A9 Lureau

