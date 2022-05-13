Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEF5268ED
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:02:59 +0200 (CEST)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZcw-0002GM-Fq
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npZX3-0001RN-Dy
 for qemu-devel@nongnu.org; Fri, 13 May 2022 13:56:53 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npZX1-0005LH-OH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 13:56:53 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7ca2ce255so97869177b3.7
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lVFXmaYnWA3rJ4B+KPqLfF3IWtOM+pKxN8h25lO2MlQ=;
 b=B8n38XQRAVlzW/pxU91DDOrO6Lj+83okrjcchlpCz47soWIXtmYR2CKJheJWF1A5cG
 viW0JpVWmvtY6XRzNxadefMsKWdAghmkgCbUhKZWuaNDXXzv9eHs3I/f2CuJP7ho+NZ1
 MA2TfktVVKaVU7diwt43Waevq1uJdNGYg+6Y5wexXr7RZIbj6hz2DAhTH7No9bxCWVE6
 FRqHKLRvV/rGJbRTlq87ZzhnSkWolVqQN4gvl6i2jJA0opfIF7VXuG2SNYfGMAKl8u+O
 xSdO64iEhK3yr03kEUDmEN2TIvKv82naKprzjO/SAX9quRbcNVllciWrVM/UHSn+q1sv
 DbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lVFXmaYnWA3rJ4B+KPqLfF3IWtOM+pKxN8h25lO2MlQ=;
 b=icdaRegb2H/h0OKKxdmRsM1P/j8R6qTB3Pz2u99lD5kMwNkxYGFw7C+hHBUOCHKnxo
 cOIJN21M3UkIC7pAiU+t6gBeNlxACbm8aLVyIX5gpkcUsZHvNTHUrS1h8F/vStVU5oyx
 sPaa0rExS2lQ10qKJZmHJNDoYdIz+eHLnDYMODoNx0bQZ9oKxB1GLQ0OGApjxHkfFMth
 pTuJMCp+ykyvbJQF0ofOR+Qx4ArQf5EN8Mvwhn++oqgxeiLfLAndwB8miQdrNleCy/F9
 UVM8l6BdeFShTSy5DEQu4UFuvZ51C+BBAb8zQA4wpal9TjCZq3vKZsc9OPzLUg6c4MOs
 rw9Q==
X-Gm-Message-State: AOAM5312VHsl/OF5gkwjLLIy1/Hih7OiyMOaKh4zFm0XlPUCzpY6QSep
 qgpk1z+29vukDBrL2maLHi0dbVJ9Ui/Rts/sa/YFJg==
X-Google-Smtp-Source: ABdhPJzh4QeofVdvP0RSdWVSJ/FDAfkxkAWW22/fbn9nNLHalicSOFG8kPXEnC2wpQcNQjZdfHW2GBv3b9zxasAEZHw=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr7015979ywj.329.1652464610651; Fri, 13
 May 2022 10:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200228092420.103757-1-quintela@redhat.com>
 <20200228092420.103757-4-quintela@redhat.com>
 <CAFEAcA9SqOgVWQpR5Z=_wLbrxxGOCqtKn2_0owPmtu4nb96XCQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9SqOgVWQpR5Z=_wLbrxxGOCqtKn2_0owPmtu4nb96XCQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 18:56:39 +0100
Message-ID: <CAFEAcA9zp1QoKObY_=L8xPmuK7xEvcM+9hohW0fV+KE3fVBAOw@mail.gmail.com>
Subject: Re: [PULL 03/15] multifd: Make no compression operations into its own
 structure
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping! Any opinions, especially from qapi codegen people,
on the right thing to do here?

On Tue, 12 Apr 2022 at 20:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 28 Feb 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
> >
> > It will be used later.
> >
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
>
> Hi; Coverity thinks there might be a buffer overrun here.
> It's probably wrong, but it's not completely obvious why
> it can't happen, so an assert somewhere would help...
> (This is CID 1487239.)
>
> > +MultiFDCompression migrate_multifd_compression(void)
> > +{
> > +    MigrationState *s;
> > +
> > +    s = migrate_get_current();
> > +
> > +    return s->parameters.multifd_compression;
>
> This function returns an enum of type MultiFDCompression,
> whose (autogenerated from QAPI) definition is:
>
> typedef enum MultiFDCompression {
>     MULTIFD_COMPRESSION_NONE,
>     MULTIFD_COMPRESSION_ZLIB,
> #if defined(CONFIG_ZSTD)
>     MULTIFD_COMPRESSION_ZSTD,
> #endif /* defined(CONFIG_ZSTD) */
>     MULTIFD_COMPRESSION__MAX,
> } MultiFDCompression;
>
> > @@ -604,6 +745,7 @@ int multifd_save_setup(Error **errp)
> >      multifd_send_state->pages = multifd_pages_init(page_count);
> >      qemu_sem_init(&multifd_send_state->channels_ready, 0);
> >      atomic_set(&multifd_send_state->exiting, 0);
> > +    multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
>
> Here we take the result of the function and use it as an
> array index into multifd_ops, whose definition is
>  static MultiFDMethods *multifd_ops[MULTIFD_COMPRESSION__MAX] = { ... }
>
> Coverity doesn't see any reason why the return value from
> migrate_multifd_compression() can't be MULTIFD_COMPRESSION__MAX,
> so it complains that if it is then we are going to index off the
> end of the array.
>
> An assert in migrate_multifd_compression() that the value being
> returned is within the expected range would probably placate it.
>
> Alternatively, if the qapi type codegen didn't put the __MAX
> value as a possible value of the enum type then Coverity
> and probably also the compiler wouldn't consider it to be
> a possible value of this kind of variable. But that might
> have other awkward side-effects.
>
> thanks
> -- PMM

