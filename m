Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D66A7068
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:02:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOsq-0002p4-JS; Wed, 01 Mar 2023 11:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOsj-0002my-Gp
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:00:42 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOsg-0001p0-4P
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:00:40 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7BAA33200961;
 Wed,  1 Mar 2023 11:00:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 01 Mar 2023 11:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677686433; x=
 1677772833; bh=jToxjqJipK9NDEoZlODzd3bnAt5nhu1rUJ+sBjsRKf0=; b=O
 +oQR9tV12qk9aQNmYhT271nJI8MWAwaOxeAcvri4wM8SPbSoQR50/ED56pDaS1n1
 VIjy/qDwFnyuLxRz5MeOpIvooEO4DUq8rbU0vQ/luoFPZr4srBBTNCndJEoLMr6F
 VKaiiW+sv5RVaSNtmTmMPxusUPneZVjZpVkZjBUFE74fi4Rp6BU9hVjU7bqMgBil
 0tzBVXdnuCiZGwXzj7ZsxFPB3T0C2eXZPJD6s65elr3lTPJnKzQuT2heOIzW7hH+
 uEU0ZX7dZDF9xjKXiMBIAucrsdiORunGY5EYmXkcz9trg87xkueoh/Nbzv8UhsjQ
 ztsfmhks0tsGC14xUxSYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677686433; x=
 1677772833; bh=jToxjqJipK9NDEoZlODzd3bnAt5nhu1rUJ+sBjsRKf0=; b=B
 BrP4WsbCr8Mi5PfBHewNSI/QtkwbWGjpvRQjtHjjWwJfrAfy1mE4yLcoAmv9NhNi
 AfQr4B2t0m2TLrlH/kwG2qO70aJfebgYQfdHg5I5ysClQY1AymPpRzcdk7Xk90Cr
 uEa9YLWg47fSL+FczSIzGNo0zZhYewMLcd7Ju7359kPS31oM+94XgdJPeZqJqs4l
 y4CZ9NUAWBG1hY+nSJfOoo0Hy7GBUeIwqnqfsFrwF4ndwdLVKcI0irzMkiGRTv5m
 XQYwSBzjYQOx0OLi+PppkdJSnpq3UBZCENGKO7tTRDK5mKjcB7OAzxASAcBDmSbE
 jILEBq0af1st85lSwqg/g==
X-ME-Sender: <xms:oHb_Y2y8qj3P22vnWte8Qyw4mBFVP3QKv_txu0xrq3wjjSJUqHd4Eg>
 <xme:oHb_YyRegUp2hFK2s-uW-S0Z1gYRigALLoyuWEW_U7voupixJIRGEPpVfvjPmBiis
 AghDPDd6D1KdDAYMQ>
X-ME-Received: <xmr:oHb_Y4XFOez9vR4t0hHWrHHoR-JQZgkYUFghrtL1kciYyJTlNLilDBjG_dxE7T3iMxmtNBeDbPJNfsL4OMQzXWRk2-JaJrrTG3oeMwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredt
 tddtudenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeegvdejveeuvdeigfejjeeufefhffetfeekuddtuddvuedt
 ueffvdejleehgeetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:oHb_Y8gDji1hDKWsrEQ29-W9VRQzRBnWEVtXgGMxS6MZ0Y9zM4rCCg>
 <xmx:oHb_Y4AQgSXi5wLbq97ZBZVDTFxsZrfTIBqhonTr9W45_j4PSE6wvA>
 <xmx:oHb_Y9KiraMZocNWo_S6C4rvyG3QKUMdn2powBbYyWQWxPYPRZ2hfA>
 <xmx:oXb_Y7PQhM0HMMpIPKL2Wx7qw2C_q1Tn-U-iojFU4rj1w0UpstJ0sQ>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 11:00:32 -0500 (EST)
Date: Wed, 1 Mar 2023 09:00:30 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/4] qga: Add optional `merge-output` flag to
 guest-exec qapi
Message-ID: <20230301160030.p72jzd4rebp6at2e@kashmir.localdomain>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
 <1575b08b853385eeaec6159b88b8c66525baec65.1677617035.git.dxu@dxuuu.xyz>
 <Y/8U+QwEmm564GQJ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/8U+QwEmm564GQJ@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=dxu@dxuuu.xyz;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi Daniel,

On Wed, Mar 01, 2023 at 09:03:53AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 01:48:03PM -0700, Daniel Xu wrote:
> > Currently, the captured output (via `capture-output`) is segregated into
> > separate GuestExecStatus fields (`out-data` and `err-data`). This means
> > that downstream consumers have no way to reassemble the captured data
> > back into the original stream.
> > 
> > This is relevant for chatty and semi-interactive (ie. read only) CLI
> > tools.  Such tools may deliberately interleave stdout and stderr for
> > visual effect. If segregated, the output becomes harder to visually
> > understand.
> > 
> > This commit adds a new optional flag to the guest-exec qapi to merge the
> > output streams such that consumers can have a pristine view of the
> > original command output.
> > 
> > Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> > ---
> >  qga/commands.c       | 28 ++++++++++++++++++++++++++--
> >  qga/qapi-schema.json |  6 +++++-
> >  2 files changed, 31 insertions(+), 3 deletions(-)
> > 
> > diff --git a/qga/commands.c b/qga/commands.c
> > index 172826f8f8..cfce13d034 100644
> > --- a/qga/commands.c
> > +++ b/qga/commands.c
> > @@ -270,12 +270,26 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
> >      g_spawn_close_pid(pid);
> >  }
> >  
> > -/** Reset ignored signals back to default. */
> >  static void guest_exec_task_setup(gpointer data)
> >  {
> >  #if !defined(G_OS_WIN32)
> > +    bool has_merge = *(bool *)data;
> >      struct sigaction sigact;
> >  
> > +    if (has_merge) {
> > +        /*
> > +         * FIXME: When `GLIB_VERSION_MIN_REQUIRED` is bumped to 2.58+, use
> > +         * g_spawn_async_with_fds() to be portable on windows. The current
> > +         * logic does not work on windows b/c `GSpawnChildSetupFunc` is run
> > +         * inside the parent, not the child.
> > +         */
> > +        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
> > +            slog("dup2() failed to merge stderr into stdout: %s",
> > +                 strerror(errno));
> > +        }
> > +    }
> > +
> > +    /* Reset ignored signals back to default. */
> >      memset(&sigact, 0, sizeof(struct sigaction));
> >      sigact.sa_handler = SIG_DFL;
> >  
> > @@ -384,6 +398,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >                         bool has_env, strList *env,
> >                         const char *input_data,
> >                         bool has_capture_output, bool capture_output,
> > +                       bool has_merge_output, bool merge_output,
> >                         Error **errp)
> >  {
> >      GPid pid;
> > @@ -397,6 +412,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >      GIOChannel *in_ch, *out_ch, *err_ch;
> >      GSpawnFlags flags;
> >      bool has_output = (has_capture_output && capture_output);
> > +    bool has_merge = (has_merge_output && merge_output);
> >      g_autofree uint8_t *input = NULL;
> >      size_t ninput = 0;
> >  
> > @@ -410,6 +426,14 @@ GuestExec *qmp_guest_exec(const char *path,
> >          }
> >      }
> >  
> > +#if defined(G_OS_WIN32)
> > +    /* FIXME: see comment in guest_exec_task_setup() */
> > +    if (has_merge) {
> > +        error_setg(errp, "merge-output unsupported on windows");
> > +        return NULL;
> > +    }
> > +#endif
> > +
> >      argv = guest_exec_get_args(&arglist, true);
> >      envp = has_env ? guest_exec_get_args(env, false) : NULL;
> >  
> > @@ -420,7 +444,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >      }
> >  
> >      ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
> > -            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
> > +            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
> >              has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
> >      if (!ret) {
> >          error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
> > diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> > index 796434ed34..9c2367acdf 100644
> > --- a/qga/qapi-schema.json
> > +++ b/qga/qapi-schema.json
> > @@ -1211,6 +1211,9 @@
> >  # @input-data: data to be passed to process stdin (base64 encoded)
> >  # @capture-output: bool flag to enable capture of
> >  #                  stdout/stderr of running process. defaults to false.
> > +# @merge-output: bool flag to merge stdout/stderr of running process
> > +#                into stdout. only effective if used with @capture-output.
> > +#                not effective on windows guests. defaults to false. (since 8.0)
> >  #
> >  # Returns: PID on success.
> >  #
> > @@ -1218,7 +1221,8 @@
> >  ##
> >  { 'command': 'guest-exec',
> >    'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
> > -               '*input-data': 'str', '*capture-output': 'bool' },
> > +               '*input-data': 'str', '*capture-output': 'bool',
> > +               '*merge-output': 'bool' },
> >    'returns': 'GuestExec' }
> 
> I feel like 'merge-output' is a somewhat specialized policy. What if
> we want to capture only stderr, and discard stdout, or vica-verca ?
> IMHO, the original 'capture-output' field was poorly designed and
> should have been an enum. I believe we can retrofit greater
> flexibility by using an enum plus and alternate thus:
> 
>  { 'enum': 'GuestExecCaptureOutputMode',
>    'data': [ 'none', 'stdout', 'stderr', 'all' ] }
> 
>  { 'alternate': 'GuestExecCaptureOutput',
>    'data': { 'flag': 'bool',
>              'mode': 'GuestExecCaptureOutputMode'} }
> 
> And then change 'guest-exec':
> 
>     '*capture-output': 'GuestExecCaptureOutput'
> 
> the use of the alternate makes this backwards compatible, as we can
> distinguish a JSON bool on the wire from an enum represented as a
> string.
> 
> This should be easy to implement, as it just involves selectively
> toggling G_SPAWN_STDOUT_TO_DEV_NULL / G_SPAWN_STDERR_TO_DEV_NULL
> flags, instead of setting them both together.

Thank you for taking a look. What you're describing makes sense to me.

I'll split out the first 2 sanitizer fixes in the series today. I'll
rework the rest of the patches per you suggestion likely this weekend.

Thanks,
Daniel

[...]

