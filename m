Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9926B2B2F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:51:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJTV-0004mE-Lu; Thu, 09 Mar 2023 11:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paJTP-0004kh-AK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:50:35 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paJTN-0007IS-EM
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:50:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A04FB5C00DC;
 Thu,  9 Mar 2023 11:50:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 Mar 2023 11:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1678380632; x=1678467032; bh=LdjgRhu0qSuu/mb0EhLt9ntwEFjkgDsxcRa
 fZEhNpmI=; b=o8bCdzc1W3Oc72yfOyarcYzQSk/BYUCpcOUBs11MPM/z5we/FKm
 IQKRBcEqPlpz3Qy1F98KX4PswQ85Hs8ho+u8tkY/LCDd0O/y/K4SGx80IZA04Ipi
 dToItXctzvGrNBWpNxZ295noXW8lh2w3N+voXv3H04Z97ZGq08huUIPeU5ucPYgf
 F3eXCwnh5ntGflCoXonTha5ejOFxkLO/OnejhbH3qJaFQi8RnxOswjP7uYHsRhr+
 g/kcioN2Pia9WGJoMszTsdLmEbLgioGtDeB2826HDSK8ekMAHcavZeFt+UO+Pm+1
 fMPNz9lUvsHpaDwvk1Hl7imy957rzCxB2nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678380632; x=1678467032; bh=LdjgRhu0qSuu/mb0EhLt9ntwEFjkgDsxcRa
 fZEhNpmI=; b=rVFIpYDqaGPUfFczoQDnyShIVqMDrZEJc5BZb6XtC2639vsM97q
 EIkQvRWwBwkCC53JkFxFWuz7UvsU3JHPhXuI5yv0nYEJPduZZl3vM0xAQRq/Joux
 uW33/v9Db3HZ+k/c7m5qcRUYl46rgTYLu7KjDIu37VrbbNEHNPMzdsftQRO1vALM
 WGal1nCIxD3p6ROawy4srY+QH6L9Q15KiQG02b0sjiDeAEc0jCNs3LXNVFUrX9A1
 cHo1wydk0fDGuMZIYzu/VpjU7BZl+CDjEwighLPsLSoOZwtRNbmIon4+oO+HvRls
 zapa5REs3jmDB6ye/Ppg1bGEBTH9D6Zrbiw==
X-ME-Sender: <xms:WA4KZJb6Dp4CdmOi57PRjdSh_qH9AGnVc2VPoGzeYTRrvmW4DhFaBg>
 <xme:WA4KZAaSwR9TeOlFnyitzcamSNg_8mjWdhNlHox-CpaJGPXcfqbJcv78JP7yZD0PP
 pWl4k92Rax3wwtKUw>
X-ME-Received: <xmr:WA4KZL_ohDd0inSPYykSddP5WX8OHwPnsZpZh2wjpaeBR_pULMqyeMZa0VTU3lhus3NvGc0rhm2UwgahrNJYtwbK4wBzD-H_zjAWGis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduiedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredt
 tddtudenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeegvdejveeuvdeigfejjeeufefhffetfeekuddtuddvuedt
 ueffvdejleehgeetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:WA4KZHofqoP11gqDR-eCHgwP5IgEDcsBOqQN85_IKu3fWJ0YdscSxQ>
 <xmx:WA4KZErHcvQeQZyw_WhfDcvM2Ncq1ZQ5p-7dfpudUUuYqUCrkJZS4Q>
 <xmx:WA4KZNTyCZl4LlDB3RoQnrra9mNdOldU_zJ1O68B9n3sBKavoFWxqQ>
 <xmx:WA4KZPVeZpIUOqRrg9QHTLDEFJNE-THjDKEY5OpR0oyFBS9nDVa0Eg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Mar 2023 11:50:31 -0500 (EST)
Date: Thu, 9 Mar 2023 09:50:30 -0700
From: Daniel Xu <dxu@dxuuu.xyz>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/3] qga: Refactor guest-exec capture-output to take
 enum
Message-ID: <20230309165030.7vrrx2pt4vpd3h44@k2.tail1b9c7.ts.net>
References: <cover.1678314204.git.dxu@dxuuu.xyz>
 <59f4f17ac2cbe719fa4f571a1c373c36597b12a3.1678314204.git.dxu@dxuuu.xyz>
 <ZAmm/p8t39c0b9XN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAmm/p8t39c0b9XN@redhat.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=dxu@dxuuu.xyz;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Thu, Mar 09, 2023 at 09:29:34AM +0000, Daniel P. Berrangé wrote:
> On Wed, Mar 08, 2023 at 03:49:39PM -0700, Daniel Xu wrote:
> > Previously capture-output was an optional boolean flag that either
> > captured all output or captured none. While this is OK in most cases, it
> > lacks flexibility for more advanced capture cases, such as wanting to
> > only capture stdout.
> > 
> > This commits refactors guest-exec qapi to take an enum for capture mode
> > instead while preserving backwards compatibility.
> > 
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> > ---
> >  qga/commands.c       | 37 ++++++++++++++++++++++++++++++++++---
> >  qga/qapi-schema.json | 32 +++++++++++++++++++++++++++++++-
> >  2 files changed, 65 insertions(+), 4 deletions(-)
> > 
> > diff --git a/qga/commands.c b/qga/commands.c
> > index 172826f8f8..5504fc5b8c 100644
> > --- a/qga/commands.c
> > +++ b/qga/commands.c
> > @@ -379,11 +379,23 @@ close:
> >      return false;
> >  }
> >  
> > +static GuestExecCaptureOutputMode ga_parse_capture_output(
> > +        GuestExecCaptureOutput *capture_output)
> > +{
> > +    if (!capture_output)
> > +        return GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
> > +    else if (capture_output->type == QTYPE_QBOOL)
> > +        return capture_output->u.flag ? GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL
> > +                                      : GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
> > +    else
> > +        return capture_output->u.mode;
> > +}
> > +
> >  GuestExec *qmp_guest_exec(const char *path,
> >                         bool has_arg, strList *arg,
> >                         bool has_env, strList *env,
> >                         const char *input_data,
> > -                       bool has_capture_output, bool capture_output,
> > +                       GuestExecCaptureOutput *capture_output,
> >                         Error **errp)
> >  {
> >      GPid pid;
> > @@ -396,7 +408,8 @@ GuestExec *qmp_guest_exec(const char *path,
> >      gint in_fd, out_fd, err_fd;
> >      GIOChannel *in_ch, *out_ch, *err_ch;
> >      GSpawnFlags flags;
> > -    bool has_output = (has_capture_output && capture_output);
> > +    bool has_output = false;
> > +    GuestExecCaptureOutputMode output_mode;
> >      g_autofree uint8_t *input = NULL;
> >      size_t ninput = 0;
> >  
> > @@ -415,8 +428,26 @@ GuestExec *qmp_guest_exec(const char *path,
> >  
> >      flags = G_SPAWN_SEARCH_PATH | G_SPAWN_DO_NOT_REAP_CHILD |
> >          G_SPAWN_SEARCH_PATH_FROM_ENVP;
> > -    if (!has_output) {
> > +
> > +    output_mode = ga_parse_capture_output(capture_output);
> > +    switch (output_mode) {
> > +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE:
> >          flags |= G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL;
> > +        break;
> > +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDOUT:
> > +        has_output = true;
> > +        flags |= G_SPAWN_STDERR_TO_DEV_NULL;
> > +        break;
> > +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDERR:
> > +        has_output = true;
> > +        flags |= G_SPAWN_STDOUT_TO_DEV_NULL;
> > +        break;
> > +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL:
> > +        has_output = true;
> > +        break;
> > +    case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
> > +        /* Silence warning; impossible branch */
> > +        break;
> >      }
> >  
> >      ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
> > diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> > index 796434ed34..4ef585da5d 100644
> > --- a/qga/qapi-schema.json
> > +++ b/qga/qapi-schema.json
> > @@ -1200,6 +1200,36 @@
> >  { 'struct': 'GuestExec',
> >    'data': { 'pid': 'int'} }
> >  
> > +##
> > +# @GuestExecCaptureOutputMode:
> > +#
> > +# An enumeration of guest-exec capture modes.
> > +#
> > +# @none: do not capture any output
> > +# @stdout: only capture stdout
> > +# @stderr: only capture stderr
> > +# @all: capture both stdout and stderr
> 
> Functionally fine. A minor naming thought.... How about we call
> this '@separated' and tweak the docs
> 
>   @separated: capture both stdout and stderr separately
> 
> Then in your in next patch you introduce
> 
>   @merged: capture both stdout and stderr merged

Sounds good to me.

Thanks,
Daniel

