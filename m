Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC76D5BAE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 11:18:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjcnO-00089K-F5; Tue, 04 Apr 2023 05:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjcnM-00088T-Gc
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:17:40 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjcnK-0007u9-LF
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:17:40 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ew6so127721385edb.7
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680599857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=buEtwnTNCi90u2KLQvpNIN60Nr5cvQbZ+5RtlfCShe0=;
 b=GdlwZ6c4MURFEfQF6LkmYRwpW3sp6Ji+Y3cGVX5jUDq9LxnTP2r3JFosa2U/Q9h65Z
 /nVvS3D7ozrO42yFqtPnslNjCuLTu1ZMOHlyYgDXMMLMD/Ym9x8Uy0uwv2kcpDRU0u6T
 EAN177cGaloBAuB6bFt3M5Fm5cc7V+d+IZ6+bjjbVvZCVhoblLTrfjTgeYIGKddhO3t/
 zt1nY3C4nksKSrzWU3zC8aquYDE54SF88xzTSsgPcs2CJJe0HRvpvTya3K5Z6eqeG+Qf
 DJSDtFeJv2i83zLW20LZXedDw/cL3VYsHCuIesCz1mhUE7la3Jzdn+Lp+o8Ncudojxhv
 +j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680599857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buEtwnTNCi90u2KLQvpNIN60Nr5cvQbZ+5RtlfCShe0=;
 b=OPe5bK53Aui/yzQyV1QcFGlxSUOHpZBVeKgTelx7V0x52s1d4OylN13Rab5FodE2C/
 ekcjpHfESzzIq9d4G4votsx+zLARdixXlOeJZWg/j073Kn3C/dXoG3Uk/TlRahP+nn6b
 RsmtAZHE1KfTQ3OMK5JDyIp7O7f3PyB8H1tTH6zM9mOl2/E2vJ4UMhKU0VFZDb0TOtv4
 CuvecVEHxJAXWhRkqFZIXFwpfdQZSykkBwr+t73Nan0PstWNF8q5+35qdVu7GnQX9Xh3
 7PV3FVMo4q7G1DIo6EU8xJFhjx70B02qde0iZ82sfDWD8/uf2VNLmb86S3xnGm46bc0e
 XPbQ==
X-Gm-Message-State: AAQBX9cRrag8ICF5a9OT1MoX7CUyHghurI+m8ViLU/lWNMKrJQBA8/X+
 q2cY2EMo8jbr/FL9qPO0SCq2/p2z9AN6AdNQzDOWiw==
X-Google-Smtp-Source: AKy350aYcNk7geSbeuPeUadp3MRIRVpo1eIi/XZ6wBgVj641PEUX6IdXt5d1lnGuPIe3ZtfpHJ1ExiDrv+d82SwdOpo=
X-Received: by 2002:a50:a457:0:b0:4fb:3549:a708 with SMTP id
 v23-20020a50a457000000b004fb3549a708mr996428edb.6.1680599856795; Tue, 04 Apr
 2023 02:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
In-Reply-To: <87wn2s12bu.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 10:17:26 +0100
Message-ID: <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Tue, 4 Apr 2023 at 09:25, Markus Armbruster <armbru@redhat.com> wrote:
>
> In the title: "qmp:"
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > index 9d34afa39e0..1de8c5c55d0 100644
> > --- a/qapi/run-state.json
> > +++ b/qapi/run-state.json
> > @@ -104,16 +104,27 @@
> >  #
> >  # @running: true if all VCPUs are runnable, false if not runnable
> >  #
> > -# @singlestep: true if VCPUs are in single-step mode
> > +# @one-insn-per-tb: true if using TCG with one guest instruction
> > +#                   per translation block
> > +#
> > +# @singlestep: deprecated synonym for @one-insn-per-tb
> >  #
> >  # @status: the virtual machine @RunState
> >  #
> > +# Features:
> > +# @deprecated: Member 'singlestep' is deprecated. Use @one-insn-per-tb instead.
>
> Wrap this line, please.
>
> > +#
> >  # Since: 0.14
> >  #
> > -# Notes: @singlestep is enabled through the GDB stub
> > +# Notes: @one-insn-per-tb is enabled on the command line with
> > +#        '-accel tcg,one-insn-per-tb=on', or with the HMP
> > +#        'one-insn-per-tb' command.
> >  ##
>
> Hmm.  We report it in query-status, which means it's relevant to QMP
> clients.  We provide the command to control it only in HMP, which means
> it's not relevant to QMP clients.
>
> Why is reading it relevant to QMP clients, but not writing?

I suspect that neither is very relevant to QMP clients, but I
thought we had a requirement that HMP interfaces went
via QMP ones ? If not, we could just make the HMP query
interface directly look at the TCG property, the way the
write interface does.

I don't want to add a QMP interface for writing it unless
there's somebody who actually has a use case for it.

> Use cases for reading it via QMP query-status?
>
> Have you considered tacking feature 'unstable' to it?

Nope, because I don't know anything about what that does :-)

> >  { 'struct': 'StatusInfo',
> > -  'data': {'running': 'bool', 'singlestep': 'bool', 'status': 'RunState'} }
> > +  'data': {'running': 'bool',
> > +           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' ]},
> > +           'one-insn-per-tb': 'bool',
> > +           'status': 'RunState'} }
> >
> >  ##
> >  # @query-status:
>
> I see a bunch of query-status results in
> tests/qemu-iotests/{183,234,262,280}.out.  Do they need an update?

"make check" passed, so I guess not, unless those don't run
in "make check"...

Do those .out files need exact matching output, or can they
be written to say "we don't care about what value this field
has or whether it exists" ?

thanks
-- PMM

