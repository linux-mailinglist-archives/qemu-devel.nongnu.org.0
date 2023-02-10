Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1436920DD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUSm-0003QB-6I; Fri, 10 Feb 2023 09:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUSk-0003Pz-3R
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:33:18 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUSh-0001Cb-Ok
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:33:17 -0500
Received: by mail-pf1-x433.google.com with SMTP id r17so3565922pff.9
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EoyqZuT2eCQbPBzisd4AEJrjYx9W/vK3n0wiOZhNzwM=;
 b=J6OyvW6DQadZOtUPSG+XjxWB9VyVd+gqG78TiO9GUcBNUb7yEloVmE6YTkseT4/UJT
 mW4fMVkIeT3P6ISy1YuX6HpqyqvtMcoBxzANucFTLomhFhGO4m0y1gVAy6ZfA75t4soV
 cP/cmBD5rm3W8VINPO0VoyUAXLoberlBTck6EG+9dlPyy53AX9kw5hPTjrGAGcZO8fF0
 wHFZ1319fthomq7D4esrcg+JafzRlySnfKCclXwFlr6hT+Ed+SJnqqnPv5PvA81bF2WG
 A0Qlvd6nwqa3Mue8dAgkVU3wkK0Y2P418xY/GAIFmkrYmJczzFiFV+3Wy9X8uHzgC8uL
 5TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EoyqZuT2eCQbPBzisd4AEJrjYx9W/vK3n0wiOZhNzwM=;
 b=6NNUAl3MnmjiJsjZlEOw55o/1Voz2WfPYgGsaS8dmeOacCcWTUtA50qxsWogIFj8GY
 S1Eat29bEYPIG9UvAoCBz4LI9+0GC5AdgwvoGC0Q3OMGKIJicpSDQik+qrXWsrzgiC1P
 Ilfz+euY/0lIyrdY7MwJeoooXmt2fTRbz6vi27XSt3vDLwHra7bF3qeCqLcXpRvPjZ3S
 PmZiC41FrKo+IIsIdAqlFUcMN1CKZcXkp6GAAaa+HIjsWhJ5uEFIj2Fw75GS3xWY6oGP
 w86WjZLWIsqtxqwyEOyeFzs2iIWAqu8XbQ1kdz1n62cnycLrKo2JIeWiBOwTJY40cHIq
 0B2w==
X-Gm-Message-State: AO0yUKWtXCMnFyFYZrFhA6yIRidM2vrvsiobczgAfwaksL4P1BATkZxr
 Md7mMcSANhapE8j0Z3buoWQbUZZlNoavmYAmbFsWxw==
X-Google-Smtp-Source: AK7set/FMf5yUm3tbCiiAP0QwzvkRjvitzWezf0+tWQKOdceyVyld22nLwm8RRo8cU9hraWQ+y0cWAcVHw11vKovaNc=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3361718pfb.48.1676039593895; Fri, 10
 Feb 2023 06:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20230209233426.37811-1-quintela@redhat.com>
 <CAFEAcA-qSWck=ga4XBGvGXJohtGrSPO6t6+U4KqRvJdN8hrAug@mail.gmail.com>
 <87r0uxy528.fsf@secure.mitica>
In-Reply-To: <87r0uxy528.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:33:02 +0000
Message-ID: <CAFEAcA-SOpRiX+s14OxCJ+Lwx6kzUdroM9ufugzTVLM9Tq2gHA@mail.gmail.com>
Subject: Re: [PULL 00/17] Migration 20230209 patches
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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

On Fri, 10 Feb 2023 at 14:21, Juan Quintela <quintela@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Fails to build the user-mode emulators:
>
> This is weird.

> > https://gitlab.com/qemu-project/qemu/-/jobs/3749435025
> >
> > In file included from ../authz/base.c:24:
> > ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
> > or directory
> > 1 | #include "trace/trace-authz.h"
>
> This series only have one change for traces:
>
> diff --git a/util/trace-events b/util/trace-events
> index c8f53d7d9f..16f78d8fe5 100644
> --- a/util/trace-events
> +++ b/util/trace-events
> @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
>  qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
>
>  #userfaultfd.c
> +uffd_detect_open_mode(int mode) "%d"
>  uffd_query_features_nosys(int err) "errno: %i"
>  uffd_query_features_api_failed(int err) "errno: %i"
>  uffd_create_fd_nosys(int err) "errno: %i"
>
> Rest of trace mentions are for the removal of migration.multifd.c.orig
>
> And I don't play with authentication at all.
>
> This is Fedora 37.
>
> > https://gitlab.com/qemu-project/qemu/-/jobs/3749435094
> > In file included from ../authz/simple.c:23:
> > ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
> > or directory
>
> Problem is that this trace file is not generated, but I can think how
> any change that I did can influence this.
>
> > 1 | #include "trace/trace-authz.h"
> >
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3749434963
> > In file included from ../authz/listfile.c:23:
> > ../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
> > or directory
> > 1 | #include "trace/trace-authz.h"
>
> Looking at the ouptut of these, they are not informatives at all.
>
> I am going to try to compile linux-user without system, and see if that
> brings a clue.

Yes, I suspect this is a "user-mode only build" specific failure
(you may need --disable-system --disable-tools to see it).

meson.build only puts authz into trace_events_subdirs "if have_block"
(which is to say "if have_system or have_tools"). However the
bit of meson.build that says "subdir('authz') does not have
the same condition on it -- it's just been put in the list without
any condition on it. So I think that in a build-only-user-emulators
config meson will not generate trace events for the subdirectory
but will try to build it, which falls over.

Contrast 'block', 'nbd', 'scsi', which are all guarded by
'if have_block' for their subdir() lines, to match the guard on
the trace_events_subdirs. OTOH 'io' is also mismatched-guards...

Why this only shows up with your pullreq I have no idea.

thanks
-- PMM

