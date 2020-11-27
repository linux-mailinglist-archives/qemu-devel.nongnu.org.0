Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A422C6076
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:25:35 +0100 (CET)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiY8M-0007TU-J5
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shivaprasadbhat@gmail.com>)
 id 1kiWz9-0005zQ-Vw; Fri, 27 Nov 2020 01:12:00 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shivaprasadbhat@gmail.com>)
 id 1kiWz7-0008Bm-J7; Fri, 27 Nov 2020 01:11:59 -0500
Received: by mail-oi1-x242.google.com with SMTP id a130so4718510oif.7;
 Thu, 26 Nov 2020 22:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYwXla8WKtj3uayoowRxdF7RzivrBWu+g2zCDlTl1+Y=;
 b=RZd9crbNberrf8U8IFfZbrj5dKc922KfbjQwddwagSZ+2w9buugGYzpx0cl6trpZGO
 cf0+4XB4J3wm1BxWiHBo5RFqacdPVd74tvATXM4rnYjItXlu7N/YyYmfnUy9TjqPj3pY
 PqidXWgqNg+HL3UPggRyiDLnDYKk+uwwBv/iiZRtTDbF2EmUrB/xaIM+Gtj6HZN47C5X
 046IZ0PkY99a3WBFmbLft1LOIgERhM0eomcqZvlCMvMuh8e4ys0qcCWD+oR3c05Pd26B
 3ZNvDxHpkfDNhW5MbvBmyg5OC3SgatZjPbdi9Fncs4fN/vr6QLEHBeJktDh6XG8w3Igt
 WahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYwXla8WKtj3uayoowRxdF7RzivrBWu+g2zCDlTl1+Y=;
 b=Jfo8gXMTmKNNyDL9z6qHLWmWkdrp4h7BrprMZn4WVsWyHz7z0fxcxnwjd943/Ww0iN
 0YeEleQeH5DodGPEPrC8GoAZeqpWZOR7pGCpqdlpFjes9dWIrONoLbvKyvDlCn+DYccL
 7bD9T2tRv9tiThAWmB+KKdM9PEPjr0CEaEIwUViUoCp+fI3hf4BicWkvT/ajtY4KKquP
 9Vxw2rkPDAlCN45ifFVVSBEc6+swaa54EVVifaRnsMztu3R6xFEs+Ob0w6IANYobZPhg
 7OvoD6Wn9L/9AHImsldeNgAJU5cUa5C2ddnswkTE/stZcJBPW+I1VCX6MpbKA9PQBEzh
 lf0A==
X-Gm-Message-State: AOAM530nzNaJmJUlEfMATop+5Kuc8ne+58mTynG8DALS934ptQ++BWs0
 9mHm3T4LaUDesGaBO2tw2+aW+8HZxJGay1j3dsU=
X-Google-Smtp-Source: ABdhPJz/ZF3rBCF3boSVMgo5j1kdEICrXw/euclUweMTPX6oHmt+iEcFz3+37CUoAArConJVpd6DLktIvClg//hvADA=
X-Received: by 2002:aca:5742:: with SMTP id l63mr4090546oib.166.1606457514493; 
 Thu, 26 Nov 2020 22:11:54 -0800 (PST)
MIME-Version: 1.0
References: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
 <160637728389.1977658.13576068142432992889.stgit@lep8c.aus.stglabs.ibm.com>
 <20201127054152.GB72234@in.ibm.com>
In-Reply-To: <20201127054152.GB72234@in.ibm.com>
From: Shivaprasad bhat <shivaprasadbhat@gmail.com>
Date: Fri, 27 Nov 2020 11:41:43 +0530
Message-ID: <CAAfHSJu-_=DKA+Rt9gXCn4jvw_ebv1+hVPE2J8QN_4N2OBfZjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] spapr: drc: Add support for async hcalls at the
 drc level
To: bharata@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=shivaprasadbhat@gmail.com; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 02:22:32 -0500
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
Cc: xiaoguangrong.eric@gmail.com, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 mst@redhat.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 bharata@linux.vnet.ibm.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the comments Bharata.

On Fri, Nov 27, 2020 at 11:12 AM Bharata B Rao <bharata@linux.ibm.com> wrote:
>
...
> > +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> > +retry:
> > +    if (qemu_guest_getrandom(&token, sizeof(token), &err) < 0) {
> > +        error_report_err(err);
> > +        g_free(state);
> > +        return 0;
> > +    }
>
> Returning w/o releasing the lock.

Ah, right.. Will fix it.

>
> > +
> > +    if (!token) /* Token should be non-zero */
> > +        goto retry;
...
> > +    SpaprDrcDeviceAsyncHCallState *state, *next;
> > +
> > +    qemu_mutex_lock(&drc->async_hcall_states_lock);
> > +    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
> > +        if (state->continue_token == token) {
> > +            state->func = func;
> > +            state->data = data;
> > +            qemu_thread_create(&state->thread, "sPAPR Async HCALL",
> > +                               spapr_drc_async_hcall_runner, state,
> > +                               QEMU_THREAD_JOINABLE);
> > +            break;
> > +        }
> > +    }
>
> Looks like QLIST_FOREACH should be enough here as you don't
> seem to be removing any list entry in this path.

okay.

>
> > +    qemu_mutex_unlock(&drc->async_hcall_states_lock);
> > +}
> > +
> > +/*
> > + * spapr_drc_finish_async_hcalls
> > + *      Waits for all pending async requests to complete
> > + *      thier execution and free the states
> > + */
> > +static void spapr_drc_finish_async_hcalls(SpaprDrc *drc)
> > +{
> > +    SpaprDrcDeviceAsyncHCallState *state, *next;
> > +
> > +    if (QLIST_EMPTY(&drc->async_hcall_states)) {
> > +        return;
> > +    }
> > +
> > +    QLIST_FOREACH_SAFE(state, &drc->async_hcall_states, node, next) {
> > +        qemu_thread_join(&state->thread);
> > +        QLIST_REMOVE(state, node);
> > +        g_free(state);
> > +    }
> > +}
>
> Why is it safe to iterate the list here w/o the lock?

This is called in the reset path, the chances that a previous hcall to
check pending status is still running at this stage is extremely low.
I can still hold the lock to be safe though.

>
> Regards,
> Bharata.

