Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11366A3D0B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYmL-0006Kc-Rp; Mon, 27 Feb 2023 03:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWYmH-000648-CZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:22:33 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWYmF-0000s7-Dr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:22:33 -0500
Received: by mail-lj1-x22b.google.com with SMTP id t14so5537445ljd.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SA01+q+FMkiTWJxb4V8IgT1pnk2GGsvIruYZ5+a9UU=;
 b=XJysJrqSe295zcost9MgqvrcXRFU6du4V99VkXuHWyrHn5CKfYDQ3IUUqayxagsRYH
 dpG9kXSE4uzyPO7d8RSnNeKvNY/TGJMRDOVFhd9C6gj0BcpVlxmrhkdaFYD2dl4bOrPQ
 bb2XXgRJh/qYYRNYj+4MJdrCYUeXUSyKf4OjGvHB0W2X/47a5rEj4ytMetZ2KUzZa3ZI
 lj2FX1Q/ENoo8Sp0gOUkaff6SnMQ/91UluCBsQTH1oafRrhrPjtwAPSXYTQccVLuj5Sm
 DUAfhtu+FEhLi7kzTDh0+8hIhq5Zo04tTPH/jCVWiWJW+oshwK/6vkZh/soyr62D5aSm
 2Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6SA01+q+FMkiTWJxb4V8IgT1pnk2GGsvIruYZ5+a9UU=;
 b=tPNRUT2HS9y99foyaLN/UP30fMnykrGoKxSG0pFy1nS1GDuJOuiafBoAbZs/sqkMBY
 zfGCbikhv5/cot8UoEl9AHV9lkINmq4CheuG1ahJG0fTmRBfoTIqg8MbP1AAUEiZ6y7a
 1ZQacEW3MhKnRJCgzV3D1xshN/wOTn4SzMWIYjVHI79qhfcaV+Myh5IFYQm64oUTQTV+
 aLlzBHzNYvOtVAj6aDXV7fyAv5Vztu/UP8H1sT54koIQa4hal2+1UoacOWSPeXNhoAUR
 GURRGeH//WcpHeb22HtLWct71gHONuYSiMIPJIRRv9gamPKca/iLH+3nY5srXXK0YGY0
 f8Pg==
X-Gm-Message-State: AO0yUKUzfCAaV1RYXvQkUm8uSW+pWQaGii8TEGXRWjitP9Kjhvj/bEKi
 KtHnv53k9LQrbM4GUxfCB6TfAV6RbK5yIMVarOk=
X-Google-Smtp-Source: AK7set8xLakQsCodJltwGqtpiw/TA4gWTKYv17w8CUi88Wk6B7uJAwItXU8AndnR578Tcw9TlHRot17QkhvVoSCJ/Vo=
X-Received: by 2002:a2e:b802:0:b0:295:a8c7:4b3b with SMTP id
 u2-20020a2eb802000000b00295a8c74b3bmr2557358ljo.4.1677486149011; Mon, 27 Feb
 2023 00:22:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <6ed3091be8bc0ae8d3fee767b6e7400a8e32c493.1677197937.git.dxu@dxuuu.xyz>
In-Reply-To: <6ed3091be8bc0ae8d3fee767b6e7400a8e32c493.1677197937.git.dxu@dxuuu.xyz>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 27 Feb 2023 12:22:17 +0400
Message-ID: <CAJ+F1CKa70J1cah7XnyCAtuUXJFCjmyau+BZpFWbyvR_jKTdBQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] qga: Add optional `merge-output` flag to guest-exec
 qapi
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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

On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
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
>  qga/commands.c       | 13 ++++++++++++-
>  qga/qapi-schema.json |  6 +++++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands.c b/qga/commands.c
> index 360077364e..14b970e768 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -274,6 +274,15 @@ static void guest_exec_child_watch(GPid pid, gint st=
atus, gpointer data)
>  /** Reset ignored signals back to default. */
>  static void guest_exec_task_setup(gpointer data)
>  {
> +    bool has_merge =3D *(bool *)data;
> +
> +    if (has_merge) {
> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) !=3D 0) {
> +            slog("dup2() failed to merge stderr into stdout: %s",
> +                 strerror(errno));
> +        }
> +    }

https://docs.gtk.org/glib/callback.SpawnChildSetupFunc.html

"On Windows, the function is called in the parent. Its usefulness on
Windows is thus questionable. In many cases executing the child setup
function in the parent can have ill effects, and you should be very
careful when porting software to Windows that uses child setup
functions."

It looks like this would be bad.

> +
>  #if !defined(G_OS_WIN32)
>      struct sigaction sigact;
>
> @@ -385,6 +394,7 @@ GuestExec *qmp_guest_exec(const char *path,
>                         bool has_env, strList *env,
>                         const char *input_data,
>                         bool has_capture_output, bool capture_output,
> +                       bool has_merge_output, bool merge_output,
>                         Error **errp)
>  {
>      GPid pid;
> @@ -398,6 +408,7 @@ GuestExec *qmp_guest_exec(const char *path,
>      GIOChannel *in_ch, *out_ch, *err_ch;
>      GSpawnFlags flags;
>      bool has_output =3D (has_capture_output && capture_output);
> +    bool has_merge =3D (has_merge_output && merge_output);
>      g_autofree uint8_t *input =3D NULL;
>      size_t ninput =3D 0;
>
> @@ -421,7 +432,7 @@ GuestExec *qmp_guest_exec(const char *path,
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
> index 796434ed34..4192fcc5a4 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1211,6 +1211,9 @@
>  # @input-data: data to be passed to process stdin (base64 encoded)
>  # @capture-output: bool flag to enable capture of
>  #                  stdout/stderr of running process. defaults to false.
> +# @merge-output: bool flag to merge stdout/stderr of running process
> +#                into stdout. only effective if used with @capture-outpu=
t.
> +#                defaults to false.

Add (since: 8.0)

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
>


--=20
Marc-Andr=C3=A9 Lureau

