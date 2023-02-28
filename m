Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC76A606A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6cx-0002Q5-Qb; Tue, 28 Feb 2023 15:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6cv-0002Ps-N4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:31:09 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6cs-00035n-Ij
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:31:09 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F0EFD5C00F5;
 Tue, 28 Feb 2023 15:31:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 28 Feb 2023 15:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677616263; x=
 1677702663; bh=1TzrBw0ne8EXsWwsqSkPcwpkbe1yLZDYf7b/OKFdv0Y=; b=M
 Dkrh6D1BBI77jvnYgKE4MoLSRrU9NaEwJXDvN6Xv/zG2zZuZ8eRt0zvE8u+uygQO
 aFVfQnTKBcqHSeAI1JdOwBKnqF0FDUEJPrV1x0n1POCZDEGHIgj+LUoUC4lVDDDo
 BbzHHoM/R4oFDTlHwfLHVmBQ8a66JW8kQUElHpprtsIpGnPYW0pSqsTGDRXDQKgn
 GPeKIqsn8mSJITcUG8CAnWWsWnN3jHb7J8FTzM351PulWBFp8Uew7BeNhAcXvuNF
 0/hz0Uw3iq7c8cSP6mb34+tw+tGtCc8OIRnyNUBBFEh3H9pf6jHsc/NzBwZhclH8
 /rWOv0NQ9SROLt7rx9ZPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677616263; x=
 1677702663; bh=1TzrBw0ne8EXsWwsqSkPcwpkbe1yLZDYf7b/OKFdv0Y=; b=c
 YXme3uHGlzIOXFxMt7YJFWvxSr6VAhEfh0vjt0fKms4FFXl+vSWGZAHiufeETAQ+
 8gjnfmb25ImSwNducob7JBqwCGTcht4oQaH/XQiXHegoqL3b1PysqmAWlbPYOawI
 5zgUoZjxdOEStK9gbYr59JmQy4XXvBJZ3Lp/N2ubZ9wZQgzJw2ricDdsCrLKaEU+
 LbyFf/JohlzeK6htaGSmgiAQbb4Nzp98DlyJfZ8gg7kGh2B9n2OyggHvqIofxOje
 384C44GSt7R+CDo9GzzaFd3AA5ojevhnU5BDJHnA7tgODrvzzjFIi6q0347vBV0e
 KrdwVuUzRFmywSNZ3jRpw==
X-ME-Sender: <xms:h2T-Y1l53BMJVXKirWNf57Tjx4Ev7gdMZJ_3gpmnmQjt69z0zvEFxQ>
 <xme:h2T-Yw29593qGkt_UmKDcoC1GpLc86_3nFzSD_UalddM-qKHs7aa9gj3eKacZ6e6m
 aqH67rsYawdtgIF6Q>
X-ME-Received: <xmr:h2T-Y7qE4TQomCxjMB6AaH21jAqDScbRUlCXQjLyQRi1zSD2GEu8zcvmRa4w-3kHzlyvlxVwQwTXRKWTI3Fv0WXKBZ_lL86kZo3K-1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredt
 tddtudenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeegvdejveeuvdeigfejjeeufefhffetfeekuddtuddvuedt
 ueffvdejleehgeetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:h2T-Y1kLoA0kSAxUuQ8cx8oErJ1KnjnkTXizh6HUix7D4Chd_dOn2g>
 <xmx:h2T-Yz2PpnfZx_61AsumcEeX1Ndb62-GG5FMcoJF3KhKckIp_xKSEw>
 <xmx:h2T-Y0tnvglabyaH1TiDtg1OKsIfTCrNx7xCnSWSh8P4upSr1qohUQ>
 <xmx:h2T-YxBnCzNQRYenRNAK3XAbGiubs741JFSg-H-1ggOvE8hwPN4QjA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 15:31:03 -0500 (EST)
Date: Tue, 28 Feb 2023 13:31:01 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: kkostiuk@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] qga: Add optional `merge-output` flag to
 guest-exec qapi
Message-ID: <20230228203101.gsgbc5ejdfjtg2pf@kashmir.localdomain>
References: <cover.1677609866.git.dxu@dxuuu.xyz>
 <e4a6d274d554479c665de82b3627f1df2055306a.1677609866.git.dxu@dxuuu.xyz>
 <CAJ+F1CJROMSagNReTttyAmoy_9GMkbmcvc6+WB4ZyKcp3yzQ9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJROMSagNReTttyAmoy_9GMkbmcvc6+WB4ZyKcp3yzQ9g@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=dxu@dxuuu.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Marc-André,

Apologies if it looks like I ignored your previous email. I forgot to
renew my domain registration so all my emails were getting blackholed
or bounced for ~17 hours.

But w.r.t. fallback with old versions of glib, I think it may be a
little uglier than that. It looks like the build system uses
preprocessor macros to warn on too-new APIs. So I suppose we could
#undef and redefine GLIB_VERSION_MIN_REQUIRED, but may not be very nice.

But if you feel strongly I can try that.

On Tue, Feb 28, 2023 at 11:26:09PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Feb 28, 2023 at 10:51 PM Daniel Xu <dxu@dxuuu.xyz> wrote:
> >
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
> >  qga/commands.c       | 14 ++++++++++++--
> >  qga/qapi-schema.json |  6 +++++-
> >  2 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/qga/commands.c b/qga/commands.c
> > index 172826f8f8..e13a8e86df 100644
> > --- a/qga/commands.c
> > +++ b/qga/commands.c
> > @@ -270,12 +270,20 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
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
> > +        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
> > +            slog("dup2() failed to merge stderr into stdout: %s",
> > +                 strerror(errno));
> 
> I would leave a FIXME comment for glib 2.58 g_spawn_async_with_fds() usage

Ack.

> 
> > +        }
> > +    }
> > +
> > +    /* Reset ignored signals back to default. */
> >      memset(&sigact, 0, sizeof(struct sigaction));
> >      sigact.sa_handler = SIG_DFL;
> >
> > @@ -384,6 +392,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >                         bool has_env, strList *env,
> >                         const char *input_data,
> >                         bool has_capture_output, bool capture_output,
> > +                       bool has_merge_output, bool merge_output,
> >                         Error **errp)
> >  {
> >      GPid pid;
> > @@ -397,6 +406,7 @@ GuestExec *qmp_guest_exec(const char *path,
> >      GIOChannel *in_ch, *out_ch, *err_ch;
> >      GSpawnFlags flags;
> >      bool has_output = (has_capture_output && capture_output);
> > +    bool has_merge = (has_merge_output && merge_output);
> >      g_autofree uint8_t *input = NULL;
> >      size_t ninput = 0;
> >
> > @@ -420,7 +430,7 @@ GuestExec *qmp_guest_exec(const char *path,
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
> 
> I think you should return an error on Windows instead.

Ack.

[...]

Thanks,
Daniel

