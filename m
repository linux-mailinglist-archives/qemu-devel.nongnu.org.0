Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1986A5446
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvBz-0001Js-TP; Tue, 28 Feb 2023 03:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWvBv-0001IB-Th
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:18:33 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWvBr-00057o-Kq
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:18:29 -0500
Received: by mail-lf1-x136.google.com with SMTP id bi9so12077688lfb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 00:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODIxoor5LiV54cycZmYGtbTfqY/BIllLgf4zlQBflpU=;
 b=VM2EXcVH3kPjI59nCROgKVdZ1i1rtc50tcPk+OPL7gonKOKrp3gRFmLPWByspwBk3M
 rZ1AoYy4jEi9NKDhGbhyymQVM3BJJx0xLhe46/rZmbHOZHrRvp19jl8Gy+9uCBMJ1sA/
 E5m/xPwf3OZskJDQ57CJbsHvC3yi/97KWMCPdyIU7Fn9DLvivakFLCFn8WFRHpqIfS88
 LkbVTDCXAakNFne/1/mFBfDh7sPpnlzbxvdVVYPEIVZQHYoc7ujQ+1B7nCS0N1hRra7G
 RPQYD/Vn7/7g6+9XsKRu8LWrMBCPoEbSZqVVjegEUXtN0zZb9pDv+MhpLcOfOsyZzk6N
 nmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODIxoor5LiV54cycZmYGtbTfqY/BIllLgf4zlQBflpU=;
 b=G7V3FOugcXoxMaklHSnevtRxfnawHzpQch0njDhXBU4FuH8GbO00v51NTmJtUSR2kq
 xzOo/uezRWqLoAIwg/h2BoZegO9aIQa1kh2T0tuS5s0dW7nX/QEmukkA9VopfuPMUj5k
 +zuTzdaUAulV5kbQdBaVMw3SMTkDQn3jk+UaKHYHtz6Lpu4iKzoC5qICy7r/q9MBCM1P
 W43aUPBFDOz+MkJ1fQDkeetO5Tg31gcA9PTrOAhVQij2EWe/0sRYaos7j6nM81XIWVW2
 lSZRyoFyl+48Y+ZKtLq0mmm0L//IbSuYQ3dKjmPTi1sJ7AACW2iBFdPIGC9S0C+5cz4f
 rs+g==
X-Gm-Message-State: AO0yUKXsBGygo0LJAnqdr5F4n2dYfs7E0uDz6U1DAcRJVHX7pnWtez8T
 p4oQMGIRpV4NE4kuaHOr1ZPrqglXxrs6TC2YYW0=
X-Google-Smtp-Source: AK7set/4Ae8DdL3Y1IWE+QHH0xs1w17i5R/UBWM8DzFobQwiVkCZVTBy233d4I/StYYVlSYEHo0e8BHcOhtDgDMC+rw=
X-Received: by 2002:a05:6512:340f:b0:4d5:ca32:6ed6 with SMTP id
 i15-20020a056512340f00b004d5ca326ed6mr1122839lfr.4.1677572302608; Tue, 28 Feb
 2023 00:18:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677197937.git.dxu@dxuuu.xyz>
 <6ed3091be8bc0ae8d3fee767b6e7400a8e32c493.1677197937.git.dxu@dxuuu.xyz>
 <CAJ+F1CKa70J1cah7XnyCAtuUXJFCjmyau+BZpFWbyvR_jKTdBQ@mail.gmail.com>
 <82c2bde8-9400-4289-9b6b-a9b6306fa362@app.fastmail.com>
In-Reply-To: <82c2bde8-9400-4289-9b6b-a9b6306fa362@app.fastmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Feb 2023 12:18:11 +0400
Message-ID: <CAJ+F1C+osSQnFLmLBta+5uGB_PUD09z0Kzz7ncYL0N4Q1UXWhw@mail.gmail.com>
Subject: Re: [PATCH 2/3] qga: Add optional `merge-output` flag to guest-exec
 qapi
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

On Tue, Feb 28, 2023 at 5:15 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> Hi,
>
> On Mon, Feb 27, 2023, at 1:22 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Feb 24, 2023 at 8:31 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
> >>
> >> Currently, the captured output (via `capture-output`) is segregated in=
to
> >> separate GuestExecStatus fields (`out-data` and `err-data`). This mean=
s
> >> that downstream consumers have no way to reassemble the captured data
> >> back into the original stream.
> >>
> >> This is relevant for chatty and semi-interactive (ie. read only) CLI
> >> tools.  Such tools may deliberately interleave stdout and stderr for
> >> visual effect. If segregated, the output becomes harder to visually
> >> understand.
> >>
> >> This commit adds a new optional flag to the guest-exec qapi to merge t=
he
> >> output streams such that consumers can have a pristine view of the
> >> original command output.
> >>
> >> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> >> ---
> >>  qga/commands.c       | 13 ++++++++++++-
> >>  qga/qapi-schema.json |  6 +++++-
> >>  2 files changed, 17 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/qga/commands.c b/qga/commands.c
> >> index 360077364e..14b970e768 100644
> >> --- a/qga/commands.c
> >> +++ b/qga/commands.c
> >> @@ -274,6 +274,15 @@ static void guest_exec_child_watch(GPid pid, gint=
 status, gpointer data)
> >>  /** Reset ignored signals back to default. */
> >>  static void guest_exec_task_setup(gpointer data)
> >>  {
> >> +    bool has_merge =3D *(bool *)data;
> >> +
> >> +    if (has_merge) {
> >> +        if (dup2(STDOUT_FILENO, STDERR_FILENO) !=3D 0) {
> >> +            slog("dup2() failed to merge stderr into stdout: %s",
> >> +                 strerror(errno));
> >> +        }
> >> +    }
> >
> > https://docs.gtk.org/glib/callback.SpawnChildSetupFunc.html
> >
> > "On Windows, the function is called in the parent. Its usefulness on
> > Windows is thus questionable. In many cases executing the child setup
> > function in the parent can have ill effects, and you should be very
> > careful when porting software to Windows that uses child setup
> > functions."
> >
> > It looks like this would be bad.
>
> Ah that's a good catch. I'm not very familiar with windows APIs so
> unfortunately I don't have any good ideas here.
>
> Best I can tell g_spawn_async_with_pipes_and_fds() work with it's
> source_fds and target_fds mapping. But it looks like that came in
> glib 2.68 so we cannot use it yet.

g_spawn_async_with_fds() is from 2.58.. but we still depend on 2.56,
because of CentOS 8. And it seems we will have to wait until Dec 2023
to bump it.

I don't know whether it would be acceptable to simply return an error
when using 'merge-output' on old host (with glib < 2.58).

 Otherwise, I think you should use g_spawn_async_with_fds() when
possible, and use the ChildSetupFunc fallback, but only on Unix (for
CentOS 8!).

>
> How about limiting this merge-output flag to linux/unix systems
> for now? Could document this in the qapi doc string.
>
> >
> >> +
> >>  #if !defined(G_OS_WIN32)
> >>      struct sigaction sigact;
> >>
> >> @@ -385,6 +394,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >>                         bool has_env, strList *env,
> >>                         const char *input_data,
> >>                         bool has_capture_output, bool capture_output,
> >> +                       bool has_merge_output, bool merge_output,
> >>                         Error **errp)
> >>  {
> >>      GPid pid;
> >> @@ -398,6 +408,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >>      GIOChannel *in_ch, *out_ch, *err_ch;
> >>      GSpawnFlags flags;
> >>      bool has_output =3D (has_capture_output && capture_output);
> >> +    bool has_merge =3D (has_merge_output && merge_output);
> >>      g_autofree uint8_t *input =3D NULL;
> >>      size_t ninput =3D 0;
> >>
> >> @@ -421,7 +432,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >>      }
> >>
> >>      ret =3D g_spawn_async_with_pipes(NULL, argv, envp, flags,
> >> -            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : =
NULL,
> >> +            guest_exec_task_setup, &has_merge, &pid, input_data ? &in=
_fd : NULL,
> >>              has_output ? &out_fd : NULL, has_output ? &err_fd : NULL,=
 &gerr);
> >>      if (!ret) {
> >>          error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
> >> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> >> index 796434ed34..4192fcc5a4 100644
> >> --- a/qga/qapi-schema.json
> >> +++ b/qga/qapi-schema.json
> >> @@ -1211,6 +1211,9 @@
> >>  # @input-data: data to be passed to process stdin (base64 encoded)
> >>  # @capture-output: bool flag to enable capture of
> >>  #                  stdout/stderr of running process. defaults to fals=
e.
> >> +# @merge-output: bool flag to merge stdout/stderr of running process
> >> +#                into stdout. only effective if used with @capture-ou=
tput.
> >> +#                defaults to false.
> >
> > Add (since: 8.0)
>
> Ack.
>
> [...]
>
> Thanks,
> Daniel



--=20
Marc-Andr=C3=A9 Lureau

