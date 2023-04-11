Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6BB6DE380
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:08:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIPK-0000qu-Po; Tue, 11 Apr 2023 14:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmIPI-0000pG-LI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:07:52 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmIPE-0002IA-8h
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:07:52 -0400
Received: by mail-ej1-x62b.google.com with SMTP id sh8so22517521ejc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681236466; x=1683828466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p+ZXlQzojGZSUw8Sbrj54moAbTxBe6kr2mEZxRk868M=;
 b=htQd6MnaVmc6ChTU9ga2AKBuKN/jMCHPNppmEK68X4N53Qb1vdWgV8+ScDciTYIfNf
 yTTv+p+l/7zd7JnjzLpoI0T9rpGVoM3rBovx9O9MYXZOOZAHEGAEofuZXYNMCMm4S2je
 HrVEnuiyo58GeRHtEWg1acuDtaAm6cAXPjFpqpLP5RG7wvqkVgDZy63tt4L/jkH3PrAd
 Sr0luoY0PXQkxG7c620MMgKqeEVWRqOW0XxeVlYVPHJ9+xt8lWSFR5GsDF9XgX9moyki
 BeRspCtNH3VYVNWx8BrwC9LwJQBkchSkeHcXsjk9cpa6LVSFcMgpqK+vqEBZEk7zBBSP
 tJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681236466; x=1683828466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+ZXlQzojGZSUw8Sbrj54moAbTxBe6kr2mEZxRk868M=;
 b=BgDM7HM9sgy12suDidfvCF7XeBHwRqV8ogeuznVlsKsHzAKnLWrQLeWdhvi0+Z/dYv
 Yb2dX2YOzHfZXxAKKsMMAprAyN9uwcQDNYYLYUiM38ioz3QanVonHhKlaKd/gdIk23kF
 slQDsB6swAg2aZujCbK/kKBqz7apaWv1LtbxEitNmT3mbaB0jcYTpvSARycbCvyMVVER
 iYzd0rqb93F6sFJPId3M4Sc62jAfyxOa2nayAhqq1d4befKOG2fO6Zi2Mu2ETckDOCWU
 j903PrJzJd9zbDxT+oppfFRwDc+flglt84QtYaPV0FGpXn7XFgwZ7jjjrsh4P3Ucg70/
 gh4w==
X-Gm-Message-State: AAQBX9fUZrKcObMcQmEvHcMbvqUZq4pYaXm4YkdAzluZPaxn78hP13jf
 RDcARnDNpsXvd/od8/DQZ6JkWhjQwRMHbVYF7MZvdw==
X-Google-Smtp-Source: AKy350aJKxcJXaacrbJSaqSrXddCMNffIuvTCBmwTQDw5caxmJIJZoc5CGUDO73D9H9Mawv/lNkDNQ71sykqnrtiSRU=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5987227eje.6.1681236466538; Tue, 11 Apr
 2023 11:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-23-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-23-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 19:07:35 +0100
Message-ID: <CAFEAcA-vCihVupZsLBdh6+-xjdNX2-K1Ceo+tgsjA=KCdWTjpg@mail.gmail.com>
Subject: Re: [PULL 22/27] hw/xen: Add emulated implementation of XenStore
 operations
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Now that we have an internal implementation of XenStore, we can populate
> the xenstore_backend_ops to allow PV backends to talk to it.
>
> Watches can't be processed with immediate callbacks because that would
> call back into XenBus code recursively. Defer them to a QEMUBH to be run
> as appropriate from the main loop. We use a QEMUBH per XS handle, and it
> walks all the watches (there shouldn't be many per handle) to fire any
> which have pending events. We *could* have done it differently but this
> allows us to use the same struct watch_event as we have for the guest
> side, and keeps things relatively simple.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>



> +static void xs_be_unwatch(struct qemu_xs_handle *h, struct qemu_xs_watch *w)
> +{
> +    xs_impl_unwatch(h->impl, DOMID_QEMU, w->path, NULL, xs_be_watch_cb, w);

Coverity points out that this is the only call to xs_impl_unwatch()
where we don't check the return value. Is there some useful way
we can report the error, or is it a "we're closing everything down
anyway, no way to report anything" situation? (This particular
Coverity heuristic is quite prone to false positives, so if that's
the way it is I'll just mark it as a f-p in the coverity UI.)


> +    h->watches = g_list_remove(h->watches, w);
> +    g_list_free_full(w->events, (GDestroyNotify)free_watch_event);
> +    g_free(w->path);
> +    g_free(w);
> +}

thanks
-- PMM

