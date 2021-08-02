Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F403DD5F5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:48:41 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXN2-0005n7-BE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXLj-0004zY-Dy
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:47:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXLh-0003G9-Ka
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:47:19 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g21so5024514edb.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RryxnFSCMHiU53EQCGrEj2R8yZwfn+XcRAnMaSOMC8Q=;
 b=ABQinAAWlb54i2kdmN6mBpAUEP44GCRf64S5ytczrRck2ExtQ7CRgkAeLy0I8MdA2Q
 tVB4ZVJ/UaWNAL0AKUpAOzHTE5SqlxB0V9HzUbKHYdwGrqvNsgaXLwTJ7dl9JI2qw838
 slmuHjY6KJwRbrkRrZX+ae+aAknQoJr1h+GFVnzidt/ik41Maqw89K7OrRJFeqYfb253
 04oort7eMpwA4Ov4uFRzXAo+yX4IYPXqu4dnU4idxwtxT1Z/sm0p1nBEEfUVfQ0TM4h9
 tg8naDk1An4qi8LYviMGumd0LclqYq/k4uUXoC3NhlOMoaV0O7isO9FSYxtoZifIc1aq
 TuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RryxnFSCMHiU53EQCGrEj2R8yZwfn+XcRAnMaSOMC8Q=;
 b=OXQwoi1ujaAksbTETV/r8hnFc72XEDU4KcGnWqtOUfNFH/SW9iZj9wiudnnyEyAmZE
 b4uX5pQdf71o6Y9SB93UhxffrGqMTfnC4c+R3bwPU7FtzQIKzDY5wso7pdwQ73c12TtU
 6NaC4JI18G2ieZ7gD8Kn21CM8rdc7SjtGMIYhFPLPK8VNIW2m+rrBWFezxoNz2hjDC2E
 LEKTo308zCZZ15FRDXexyRyEc862xGbb0XVNgl1b9CQeSSxwImVNJfdmSw5H7q25CRPd
 MsWB3Q7qhIx+qV2DgirQldOclFigRGMzA66+x2ua55xOINcorCSp/CdPJzyiRWgbE2eD
 afsg==
X-Gm-Message-State: AOAM531Uzs6FS/dRm7baK+k1K2V0MuZwycT/Al8akNjvkKXHODK7r8by
 21UuUEtjPyPPmYIhSDI5SajzQFDC+xCUL/JEgzB18Q==
X-Google-Smtp-Source: ABdhPJwfoBXPb7DUG9l7z+hA0jDyBY7rVCl3xGHsSFAwnwv7hz5i1udw47n9hVXjOXpR87UCVDRpGoYVamDq/0nCmQk=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr19126544edb.36.1627908435887; 
 Mon, 02 Aug 2021 05:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:46:32 +0100
Message-ID: <CAFEAcA_0oyeAQZSCscLvL-Au8zx2Z+-k528SfVJDBE_doYWbvg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Updates for Coverity modeling file
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 07:29, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Recently, an update to the Coverity tools caused it to introduce hundreds
> of new complaints about using g_free() to free memory areas allocated
> by GLib functions.  The solution adopted here (patch 2) is to just
> make g_free a synonym of free, removing the custom g_free marker from
> __coverity_mark_as_afm_allocated__ and __coverity_mark_as_afm_freed__.
> This unfortunately goes against the GLib documentation, which suggests
> that g_malloc() should be matched with g_free() and plain malloc() with
> free(); since GLib 2.46 however g_malloc() is hardcoded to always use the
> system malloc implementation, and g_free is just "free" plus a tracepoint.
> Therefore, this should not cause any problem in practice.
>
> There are still problems, in that Coverity believes that the result of
> g_malloc/g_malloc0 can return NULL, which is not true.  What caused the
> issue is anybody's guess; possibly a new version of Coverity changed
> the semantics of __coverity_alloc__, but I also had to inline the model
> of g_malloc_n in g_malloc (and likewise for the other five functions)
> though it seems like Coverity.  This is implemented in patches 5-6.
>
> On top of these changes, this includes a few more changes to the model
> file:
>
> - patch 1 include a few more simplified memory read/write models, so
>   that Coverity has a model for all functions in the pci_dma_* and
>   dma_memory_* family.  This fixes a few incorrect out of bounds
>   false positive, where Coverity does not realize that only up to
>   LEN bytes are read/written by those functions
>
> - patch 3 removes the model for various allocation functions, which
>   is unnecessary now that we need not (or cannot) detect their
>   being paired with g_free
>
> - patch 4 is a small cleanup that makes the inlined allocation
>   functions smaller.
>
> This series is a sort of FYI; since the only way to debug the model file
> is to upload it to scan.coverity.com, these changes are all already live.
> The last will be as of the next build, but was effective last Thursday
> and worked (I tried disabling it on Friday in something like a bisection,
> but it failed and I have now reverted to Thursday's model).

Thanks for digging through all this mess. I take it that the
Coverity results are now stable and people can now start looking
through them and triaging again ?

-- PMM

