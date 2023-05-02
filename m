Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B936F48EC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 19:10:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pttUf-0006QI-SR; Tue, 02 May 2023 13:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pttUc-0006QA-CW
 for qemu-devel@nongnu.org; Tue, 02 May 2023 13:08:46 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pttUa-0008HC-Nt
 for qemu-devel@nongnu.org; Tue, 02 May 2023 13:08:46 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso92376a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683047323; x=1685639323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wKq68nL7IZe8CxCPKWRpfsYPAqO/kJptEynBmrLXGno=;
 b=wJTz2Lb9P2BIcudGgZCX+y+30ZlzVkLjiFwcmaHxkHtJYW7P5L/qYfTAiZ+i4zqgtg
 0IlRSg4MA1HAqV+D0ba8Ih+KRJ5IYo8McCdQYaAKLoHJ0c0yM/3QuOL+N3HOsRbmwYwx
 YUU/sXI+6PaC+TgDxUDSllY3ZQNDycR8MxfDHtYukm8AT+M2ON6OQQ1vFKjobX/XROMj
 LU2FAObSj+uKhG8pYCmYJCX5Fj6GEMmI/En30Rt2dV3vL3qtYvuJaDb3J756VQ5g+rlh
 iU74ECh20gV+Mkf64cBgq/6oJ7b7yB7X2hG+wTL4we+cWq1KMC3EYdj26hWTxXZn5xCh
 tYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683047323; x=1685639323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKq68nL7IZe8CxCPKWRpfsYPAqO/kJptEynBmrLXGno=;
 b=OSAvX6t+qhhA27L1yVBwSqOv36JgQ+iHHS6r9+Q9wocBsiBbAOIC6YlT5zaXoC6XiX
 TTIAWBFEElMHSjDh0OBFXLfr/5B4CIBT75QIO11vZhydiOw0+m1yTz8qmjm3OrItpiwq
 E5MakBTTYXyeYy1bskFBUfhO5VWwvx+8fs3GYCIw516GKfQECGViRLnUvjf9sHD8LJ2c
 gdrYpaUm04meSODibWV5raNvxzkq5uH7bqaY/u27gzueBgsDihyVnf38b9S3oZl3dFO9
 IuhPgnJyPJq6AVC+nQ5fqUIi+oURhB8ZMLOiB8nKpcBzp/nfYtunFcewQkfQ9MDBOYzr
 a2kw==
X-Gm-Message-State: AC+VfDzFTXIILamANd1P7u0s4aXEXsPO96yNiq98I6xuX35HAm9gTenI
 ENw4wQT736C2SgLBpYxHyMUHIoTLBp82LH61+ykfSA==
X-Google-Smtp-Source: ACHHUZ5ryAaiEYM7YxlTJAHU6zLdkibBxJTqdgb+u5+jyCzwLxskxERr5n7iMCM3uXDn/QRibKS6VOtt1URTw1XYbYQ=
X-Received: by 2002:a05:6402:44a:b0:504:b511:1a39 with SMTP id
 p10-20020a056402044a00b00504b5111a39mr8695641edw.12.1683047322896; Tue, 02
 May 2023 10:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-6-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-6-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 18:08:32 +0100
Message-ID: <CAFEAcA9gzJGMqsEY5TuNmb74RskgUTMW+XcqGV53n3SsKyVVXg@mail.gmail.com>
Subject: Re: [PULL 05/27] hw/xen: Watches on XenStore transactions
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Firing watches on the nodes that still exist is relatively easy; just
> walk the tree and look at the nodes with refcount of one.
>
> Firing watches on *deleted* nodes is more fun. We add 'modified_in_tx'
> and 'deleted_in_tx' flags to each node. Nodes with those flags cannot
> be shared, as they will always be unique to the transaction in which
> they were created.
>
> When xs_node_walk would need to *create* a node as scaffolding and it
> encounters a deleted_in_tx node, it can resurrect it simply by clearing
> its deleted_in_tx flag. If that node originally had any *data*, they're
> gone, and the modified_in_tx flag will have been set when it was first
> deleted.
>
> We then attempt to send appropriate watches when the transaction is
> committed, properly delete the deleted_in_tx nodes, and remove the
> modified_in_tx flag from the others.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>

Hi; Coverity's "is there missing error handling?"
heuristic fired for a change in this code (CID 1508359):

>  static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
>  {
> +    struct walk_op op;
> +    XsNode **n;
> +
>      if (s->root_tx != tx->base_tx) {
>          return EAGAIN;
>      }
> @@ -720,10 +861,18 @@ static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
>      s->root_tx = tx->tx_id;
>      s->nr_nodes = tx->nr_nodes;
>
> +    init_walk_op(s, &op, XBT_NULL, tx->dom_id, "/", &n);

This is the only call to init_walk_op() which ignores its
return value. Intentional, or missing error handling?

> +    op.deleted_in_tx = false;
> +    op.mutating = true;
> +
>      /*
> -     * XX: Walk the new root and fire watches on any node which has a
> +     * Walk the new root and fire watches on any node which has a
>       * refcount of one (which is therefore unique to this transaction).
>       */
> +    if (s->root->children) {
> +        g_hash_table_foreach_remove(s->root->children, tx_commit_walk, &op);
> +    }
> +
>      return 0;
>  }

thanks
-- PMM

