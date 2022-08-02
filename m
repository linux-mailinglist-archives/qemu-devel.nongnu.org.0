Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CA58802C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 18:23:01 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIufa-0006DE-BB
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIuaU-0001hE-31
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 12:17:45 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIuaS-0002mc-9n
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 12:17:41 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31f445bd486so145618037b3.13
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=CU+0nsIiE7/GRUmSvUU1zcUzoaVed5ed7riP4vnKcRM=;
 b=X+8ZfLkjs5bKiCDDHlTZ2fvJIolmMngxhDi/uAYJ4n9f4yo2LUs/MNq5/cWhjaV0hb
 LTi/iXKctG/INu8W9DdaR6Xbyzz6RqsfpVppSt+rT5WO0vmUS1aSs7Q0aLqBeXWIIVuF
 DihaJcXf1cJRnrKZNkLg8NnyW0pReoe2sMCUTKDOGHof5Wz6+awOlmMY8FrKfRGO5CzA
 UscxnD941S2PgfP49UvhBzHNOoVbGWQX/bnYylqTXjvmUQBI2lNqc/cUPU6sznYeQuLA
 SUq/Mc1lHV7PJOhgvjX1nMRCrVbaWVPZFzdXrBYCQQLbWjfzw9ADhCycsSWYmLE+xyHP
 rtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CU+0nsIiE7/GRUmSvUU1zcUzoaVed5ed7riP4vnKcRM=;
 b=PqzP3eqaRAuWZMa86acf4DM7rwdE4UVE8Enc2P7oIezKXKPa6o8LWeEcPw7FZwLM4z
 LBtwU+S42N7xLmNxCtOOzut5jEVjJzk9iBqCoTXgUe/gV9V9Ok4SOsSc7lHGjHbvxBOB
 4gJ487VwMPqcKMzwIYySW04okwvvmKECQ2nO9e/0GZRqD3ugWWT7/LcCOlHFaM6OFeZ8
 AMwwd7OUyWlET1qIY0FRdYpsFGZ0CaBk0XqJ9faO3pK/mVH8+BKKpURUrfdme144/e9L
 7QL5pfkC/DLWlgQ1f1SmDQSpweExvWi7I9DgBXC1VDhazh5O+ZnLr9ogRXRDgQvpj9j8
 qbXw==
X-Gm-Message-State: ACgBeo3DK/VPt9ulZSqBwOWDzA3i5jGe72z255yxPZZJNCLJSw1iO8su
 5+T4wbebf2m6lpLAY08glJV0WwcFHQpVstC57iCn/g==
X-Google-Smtp-Source: AA6agR7ZpIqfhaD9bCmWi3Zn6qxmpxquZWhnIni6s1lxb+OBVT/T6BuVUg4VCCz/sVsfWXSQItRIYecXY1KRsHxBSGY=
X-Received: by 2002:a0d:d2c3:0:b0:31e:62ea:3303 with SMTP id
 u186-20020a0dd2c3000000b0031e62ea3303mr19334195ywd.64.1659457058898; Tue, 02
 Aug 2022 09:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
 <1566284395-30287-16-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-16-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2022 17:17:27 +0100
Message-ID: <CAFEAcA-hV9BERt=4wP0hdb7HemrzpFC1v8UrmypKFYV4DPw-Bw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 15/36] memory: fix race between TCG and
 accesses to dirty bitmap
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 20 Aug 2019 at 08:12, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> There is a race between TCG and accesses to the dirty log:
>
>       vCPU thread                  reader thread
>       -----------------------      -----------------------
>       TLB check -> slow path
>         notdirty_mem_write
>           write to RAM
>           set dirty flag
>                                    clear dirty flag
>       TLB check -> fast path
>                                    read memory
>         write to RAM
>
> Fortunately, in order to fix it, no change is required to the
> vCPU thread.  However, the reader thread must delay the read after
> the vCPU thread has finished the write.  This can be approximated
> conservatively by run_on_cpu, which waits for the end of the current
> translation block.
>
> A similar technique is used by KVM, which has to do a synchronous TLB
> flush after doing a test-and-clear of the dirty-page flags.
>
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


> +static void tcg_log_global_after_sync(MemoryListener *listener)
> +{
> +    CPUAddressSpace *cpuas;
> +
> +    /* Wait for the CPU to end the current TB.  This avoids the following
> +     * incorrect race:
> +     *
> +     *      vCPU                         migration
> +     *      ----------------------       -------------------------
> +     *      TLB check -> slow path
> +     *        notdirty_mem_write
> +     *          write to RAM
> +     *          mark dirty
> +     *                                   clear dirty flag
> +     *      TLB check -> fast path
> +     *                                   read memory
> +     *        write to RAM
> +     *
> +     * by pushing the migration thread's memory read after the vCPU thread has
> +     * written the memory.
> +     */
> +    cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
> +    run_on_cpu(cpuas->cpu, do_nothing, RUN_ON_CPU_NULL);
> +}

So I think this implementation has two problems that we've only just
noticed:

(1) if memory_global_after_dirty_log_sync() is called in a context
where the caller holds the BQL, then the implementation here will
temporarily drop the BQL inside run_on_cpu(). That breaks
assumptions in pretty much all the graphics device models which
call memory_region_snapshot_and_clear_dirty() and assume that
things they'd determined before the call stay valid (pointers
into DisplaySurfaces, information about size and location of
the framebuffer in guest memory, etc).

(2) if memory_global_after_dirty_log_sync() is called in a context
where the caller does *not* hold the BQL, this is undefined
behaviour, because run_on_cpu() calls qemu_cond_wait() passing
it the BKL, and at least for the posix implementation that
ends up being posix_cond_wait() and calling that without the
mutex held is undefined behaviour. This happens for the migration
code for everything except the final iteration.

Does anybody have any bright ideas for fixing these? (2) I guess
we could handle just by having the migration code (or this
code right here) grab the BQL if it doesn't already have it.
(1) is much harder: you kind of conceptually want to do a "go back
and restart the update-display operation", but there's no clear
way to tell if you need to do that. You can postpone some things
(like "get the current UI display surface") until after the
call to memory_region_snapshot_and_clear_dirty(), and you could
have a "check a flag to see if the guest re-entered the display
device while we were inside memory_region_snapshot_and_clear_dirty()"
test, but some things the guest might do could potentially invalidate
things in a non-obvious action-at-a-distance way that doesn't
require an access to the display device. (e.g. a display device that
lets the guest program the FB to be anywhere in the address map,
plus the ability for the guest to cause remapping of RAM banks
or similar -- the display device can't tell if the RAM banks
got remapped or not, that's handled by a different device.)

thanks
-- PMM

