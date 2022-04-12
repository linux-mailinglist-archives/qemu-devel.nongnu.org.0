Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AB4FE875
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:06:09 +0200 (CEST)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neLq4-0003C7-3Y
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neLoU-0002R7-9j
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:04:30 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neLoO-0000XK-DM
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:04:28 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id f38so34780209ybi.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KDDDbWVhYlO3FVT3yZCrN7m660q9ysQ2QxBgdX8dYT0=;
 b=wPo7+jlEtiCg+Hjeuy+AJJjcdFbSZWdZ2tTLux95JODi0dRevaHo52i+ZzSu1/R1Oi
 xcDveADLccDjrQndlikNswdTBFl2sS8j7CBd7DQBpnC9KxFmIU1AuWJJCiC71OwCbZ2W
 rK8x4q5OiHh9HHJxmMPxBjxomE+I8rz2wTM62pEiMBRarHdwjQEKc1DZm5ds0ZkA7kE/
 nUoR97c0x1Pu4puFd2mliOgoGzgFEV543lWec6+5mDmR6rTCmI1ooD4+rG3NipKGhK0B
 26fYYVGqMkmDRrtF59/HTNtJCBX259khjVbQpx+/ZvTgKpl5qN94q/6rJRM3vVT/dEsl
 B6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDDDbWVhYlO3FVT3yZCrN7m660q9ysQ2QxBgdX8dYT0=;
 b=KxOc2lkvrLEy9ugKmJVI5agC+DUwMxca0BQxXBT1tMkJmEA/cmtbPitnN0uPYymPD1
 43sxWicwfQfxJgSmH/T4QEZnXS01p5fNaZjcDkObBl14SWd0Q3N/aXKxs2oUcdph0HdE
 lZtLEDUW9nB7t0/DWt5m7cjuKVskBt3Cnd+NOOISWV94UxcujpYAJff+uDZpVcTGYanU
 ZLVa+WjnJkkBOD9TM/AltdbGqAqJd6FO4YuFns+yR54fQ77Ri1ufJIv6x1F0pIgOUvfY
 0XQsJRTvjAM4QIE9NFayd4Tp3oi89FA3xB9S1yQ/XxhGbnkN5z2iwT/eDAmxhw+rWFby
 nKAA==
X-Gm-Message-State: AOAM533j0LB4ZjefF4/jxDfQP2B5zHfDNTFKz8W6b+AjUHZ4P7Zeb5o+
 EpMMYw1yNv6lc/OIYYolJtgqsuohBuzJmlb6XE4Ekg==
X-Google-Smtp-Source: ABdhPJzcFWdpd+oEB1RT6XTNBKQE94XXqvWGEuKInkXRjsYdh6SVSagaxNCHgs7MHGxxpO3xp1lYVGgXkW/F8kvTSiw=
X-Received: by 2002:a25:3b55:0:b0:641:bd5:e3fa with SMTP id
 i82-20020a253b55000000b006410bd5e3famr14542463yba.193.1649790263167; Tue, 12
 Apr 2022 12:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200228092420.103757-1-quintela@redhat.com>
 <20200228092420.103757-4-quintela@redhat.com>
In-Reply-To: <20200228092420.103757-4-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 20:04:11 +0100
Message-ID: <CAFEAcA9SqOgVWQpR5Z=_wLbrxxGOCqtKn2_0owPmtu4nb96XCQ@mail.gmail.com>
Subject: Re: [PULL 03/15] multifd: Make no compression operations into its own
 structure
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Feb 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
>
> It will be used later.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

Hi; Coverity thinks there might be a buffer overrun here.
It's probably wrong, but it's not completely obvious why
it can't happen, so an assert somewhere would help...
(This is CID 1487239.)

> +MultiFDCompression migrate_multifd_compression(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->parameters.multifd_compression;

This function returns an enum of type MultiFDCompression,
whose (autogenerated from QAPI) definition is:

typedef enum MultiFDCompression {
    MULTIFD_COMPRESSION_NONE,
    MULTIFD_COMPRESSION_ZLIB,
#if defined(CONFIG_ZSTD)
    MULTIFD_COMPRESSION_ZSTD,
#endif /* defined(CONFIG_ZSTD) */
    MULTIFD_COMPRESSION__MAX,
} MultiFDCompression;

> @@ -604,6 +745,7 @@ int multifd_save_setup(Error **errp)
>      multifd_send_state->pages = multifd_pages_init(page_count);
>      qemu_sem_init(&multifd_send_state->channels_ready, 0);
>      atomic_set(&multifd_send_state->exiting, 0);
> +    multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];

Here we take the result of the function and use it as an
array index into multifd_ops, whose definition is
 static MultiFDMethods *multifd_ops[MULTIFD_COMPRESSION__MAX] = { ... }

Coverity doesn't see any reason why the return value from
migrate_multifd_compression() can't be MULTIFD_COMPRESSION__MAX,
so it complains that if it is then we are going to index off the
end of the array.

An assert in migrate_multifd_compression() that the value being
returned is within the expected range would probably placate it.

Alternatively, if the qapi type codegen didn't put the __MAX
value as a possible value of the enum type then Coverity
and probably also the compiler wouldn't consider it to be
a possible value of this kind of variable. But that might
have other awkward side-effects.

thanks
-- PMM

