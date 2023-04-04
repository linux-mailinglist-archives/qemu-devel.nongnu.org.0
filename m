Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BB6D6AB8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 19:36:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjkZe-0001pm-Gt; Tue, 04 Apr 2023 13:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkZW-0001pC-J8
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:35:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkZS-00080t-V4
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:35:53 -0400
Received: by mail-ed1-x533.google.com with SMTP id ek18so133778294edb.6
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680629749;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B++ILPDB3X+VuBU8jlV4qBmXikQNjKUxckqbnWCshEs=;
 b=nEMEpYDPKqf3YLC0FS2dnk3CaMTs5JeR/WJE92Vclc3fGNqm3Q4jcJ1saTecAW50kK
 SkZAAQedIQyx1QshTDj2dqfqdrj3L3TA98J03DxnWXM6lx5vIF1Y2qtzGFQYUnwou0NI
 0RdoLDwN3COEIJxX6HOFtQ68IcXGl00Q/Cro7ywaKLa/H7gl07KR0KPsmFRtsgxmVdPQ
 T++ulO6Hu1d7QX+FbmmPNluD3/GfPKnxXHpahwlm/bJjy3Lw/5Ek1C2Q4ArXC/Xs0TwO
 5CJyUvZoK5f8yImPnWACOMke+eMrjrzi/9c6YdRo3viKtljNnygfDHcE96qEVB9WWz+H
 RAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680629749;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B++ILPDB3X+VuBU8jlV4qBmXikQNjKUxckqbnWCshEs=;
 b=ZAsVdNQSr5UbC4FiRZMoY2NmkogsooEhvR2w6pc4gbWFUN/ezDgxM/vq+xN736wDDQ
 MDAOjld8uDdOsBVtnUBFk8sI9QGlXNc+R0S/0d12D0HB2SYA/bLIhZc5RJmI4z3O06Fe
 3O+Ud/FDfGrYRdf5jvsdPxDTnDnMkUZVxhUC/Qv0SNmU/DMef63tigwcG5ZzQjmNgi7w
 eZBQ0LBp9Yy165vDwgZZJYT+t9l7ol3YWaEAaeF9P3LK4mo4OPQAJxrcpFxnO8idb8AP
 o2/eET3FVDTCs7UoxEFILwIHT8mHENSY+2nIag1jc2Kmswyai5wJ/GXvSqBnCObcZxqf
 +w9Q==
X-Gm-Message-State: AAQBX9f2THyUMgAab8G4hl6dqLcTlhjt/PcSAPyQcjfqRuDdAGgZl53L
 u62KGZQh9x6KLPTcpkyNRQzltygr9q9aKimbzCsQ4A==
X-Google-Smtp-Source: AKy350bFZ5U/HvpJohqoyPJEv2MbHDufBnPeztQmU14vuRQWrqhanpo8MykXvxhbF2/kYUPL7BROh16KxkmoJmjzqmw=
X-Received: by 2002:a17:906:9bde:b0:924:efbb:8a8b with SMTP id
 de30-20020a1709069bde00b00924efbb8a8bmr173409ejc.6.1680629748942; Tue, 04 Apr
 2023 10:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-14-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 18:35:38 +0100
Message-ID: <CAFEAcA_SS8xRjGKZoSyGc0nh_-C2Wh8hauGzR82Aj8S1g8xBOQ@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
> From: Paul Durrant <pdurrant@amazon.com>
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---

Hi; Coverity points out a memory leak in this code (CID 1508098):

> +static struct qemu_xs_handle *libxenstore_open(void)
> +{
> +    struct xs_handle *xsh = xs_open(0);
> +    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);

Here we allocate memory...

> +
> +    if (!xsh) {
> +        return NULL;

...but here we can return without freeing it...

> +    }
> +
> +    h = g_new0(struct qemu_xs_handle, 1);

...and here we allocate a second time and overwrite the
pointer to the first allocation.

Deleting the first call to g_new0() would fix both of these.

> +    h->xsh = xsh;
> +
> +    notifier_list_init(&h->notifiers);
> +    qemu_set_fd_handler(xs_fileno(h->xsh), watch_event, NULL, h);
> +
> +    return h;
> +}

thanks
-- PMM

