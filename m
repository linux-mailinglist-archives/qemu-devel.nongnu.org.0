Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1209F6D6533
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:25:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhaP-0003Nn-Tn; Tue, 04 Apr 2023 10:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjhaN-0003Nb-UM
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:24:35 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjhaM-00015C-6Z
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:24:35 -0400
Received: by mail-ed1-x535.google.com with SMTP id ek18so131408587edb.6
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680618272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h1JjJ2CfNxg+yo1MyBPoDK1KmOJD9aU2mtRWyYtvck4=;
 b=bzhpI5znV5n8DEHRjFaS0CLdH1H1seRooESsKFq9d/1IgpBl7XR4hRZFs0wdcGOQLp
 EBe/EqTESYtCA6ZjiAxqSa5R144rzwywt+CGw5yAIEs9pomahWSu8qlZ/FA/CKSR1YIr
 NtxxpeZDG/swVAageUC7aVoMfmwjux0VAJiHHohfYeoofQyC2wrNNsQJCEMMKm/6iUVv
 sIvB3U81yfNJxKZN3y8kGDOvvhKRU6ZNmOXH6AVvy/YlAeXiESgMktADsYy4MUvSbzTn
 VTkohs8dE+dnBULEVXB56RmQ/kdJsBf7WPGTcTMVz5AcD94YXpc11wOQmWQd3f6gvaB1
 xGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680618272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h1JjJ2CfNxg+yo1MyBPoDK1KmOJD9aU2mtRWyYtvck4=;
 b=3fz4tbA6k0CVWL3Ij+2Gt0j0Vdg3/HYmRbNO8crAaQPtqPrbpveia4TQUdZkcs9Si1
 AUJbjpKr1G9Ij36bfdQpI1ZC2xsLSbt5bocINFkEVTUtqMMMnL71s1Ti53FB09jsyMnO
 wsE7G6ozVK+9yRukAgu017GVx9RBDcfrMYJos5goyOEt2ZEyxodUJnP7V2L4Tdclu5nB
 3R5jq9XJfl8ET5T10MwtdHS7NhvF6UpY1mYvUaNbbB5Nm2lmooBbeBTkm/X3bG/Ft3QS
 zXlbquj1RddZVD/ff2VhQvc+Nn8cq8RZQBwc3CQo3qbLeUketUXJ0qmM5Zl7qQcLqL4g
 iLpg==
X-Gm-Message-State: AAQBX9ekw2YrMUhoVWahVtOL2R1ea1EouXxVZKINT9/tg+y5rV8akuCt
 AyMtPu46CcGMD9sbpBwPeH89K4cmsJURpDX6qOkF2A==
X-Google-Smtp-Source: AKy350aDh0zvKIqLzWpzIK/6FMyzYytywcL4zbYXf1hunHdM/QoMj2BO1mMSFZTikvBoh27Qb5xTnTb7xbQ/facfQgE=
X-Received: by 2002:a17:907:6b8f:b0:932:4577:6705 with SMTP id
 rg15-20020a1709076b8f00b0093245776705mr1412544ejc.6.1680618272074; Tue, 04
 Apr 2023 07:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
 <875yabzsmc.fsf@pond.sub.org>
In-Reply-To: <875yabzsmc.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 15:24:21 +0100
Message-ID: <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 4 Apr 2023 at 14:25, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 4 Apr 2023 at 09:25, Markus Armbruster <armbru@redhat.com> wrote:
> >> Hmm.  We report it in query-status, which means it's relevant to QMP
> >> clients.  We provide the command to control it only in HMP, which means
> >> it's not relevant to QMP clients.
> >>
> >> Why is reading it relevant to QMP clients, but not writing?
> >
> > I suspect that neither is very relevant to QMP clients, but I
> > thought we had a requirement that HMP interfaces went
> > via QMP ones ?
>
> Kind of.  Here's my current boilerplate on the subject:
>
>     HMP commands without a QMP equivalent are okay if their
>     functionality makes no sense in QMP, or is of use only for human
>     users.
>
>     Example for "makes no sense in QMP": setting the current CPU,
>     because a QMP monitor doesn't have a current CPU.
>
>     Examples for "is of use only for human users": HMP command "help",
>     the integrated pocket calculator.
>
>     Debugging commands are kind of borderline.  Debugging is commonly a
>     human activity, where HMP is just fine.  However, humans create
>     tools to assist with their activities, and then QMP is useful.
>     While I wouldn't encourage HMP-only for the debugging use case, I
>     wouldn't veto it.
>
> When adding an HMP-only command, explain why it is HMP-only in the
> commit message.
>
> >                If not, we could just make the HMP query
> > interface directly look at the TCG property, the way the
> > write interface does.
>
> How useful is it HMP?

Well, as usual, we have no idea if anybody really uses any feature.
I've never used it myself but I have a vague recollection of reading
list mail once from somebody who used it. You can construct theoretical
scenarios where it might be nice (eg "boot guest OS quickly and then
turn on the one-insn-per-tb mode once you get to the point of interest"),
I guess. These theoretical scenarios are equally valid (or esoteric)
whether you're trying to control QEMU via QMP or HMP.

I think on balance I would go for:
 * remove (ie deprecate-and-drop) 'singlestep' from the QMP struct,
   rather than merely renaming it
 * if anybody comes along and says they want to do this via QMP,
   implement Paolo's idea of putting the accelerator object
   somewhere they can get at it and use qom-get/qom-set on it
   [My guess is this is very unlikely: nobody's complained so
   far that QMP doesn't permit setting 'singlestep'; and
   wanting read without write seems even more marginal.]
 * keep the HMP commands, but have both read and write directly
   talk to the accel object. I favour splitting the 'read'
   part out into its own 'info one-insn-per-tb', for consistency
   (then 'info status' matches the QMP query-status)

In particular, the fact that messing with this obscure debug
functionality requires updating the reference-output for a
bunch of io tests that have no interest at all in it rather
suggests that even if we did want to expose this to QMP that
the query-status command is the wrong place to do it.

thanks
-- PMM

