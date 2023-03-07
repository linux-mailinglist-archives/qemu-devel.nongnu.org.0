Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061776AE0A4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXR2-0006LT-PD; Tue, 07 Mar 2023 08:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXR0-0006LJ-Do
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:32:54 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXQy-0004US-OH
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:32:54 -0500
Received: by mail-wm1-x32a.google.com with SMTP id j3so7782254wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678195970;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDsyvzDA2+Psrh9BpIfxaF+LujFd3oi/i0xLE80Ui3c=;
 b=nCMky25iTURI9/TaPxOOya0n8CwUqv0yj6qGrMSx6lMjSlnDlwRUrYXtgHwfnq/gse
 eYkVl7NqBmisW5VRBiDY1Bpbl/egKRSoddKECq0nRvtyoIQLxpc908BsZSmVol5R/tko
 IKzXdCM9aWfBr6LiXszRINHazD/jb7WCg4nXrwnXVnDAZaNN1E+RlHjGZcPUkdJQenKv
 Cp6q3UeOcNftTLHaWxdwlERwLrW3bCksyEZP0vYM2281kbPQ4yTDnfP5oX11YZUTE9qk
 9UTZpQGrweRo4nkdV2gkhAhQle/bkw2oykklgJA24exZiN1tr/OjGaFxatGT3dxNplEP
 zCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195970;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kDsyvzDA2+Psrh9BpIfxaF+LujFd3oi/i0xLE80Ui3c=;
 b=2IgQ/JmwrgRZQ7PPmAaLDD3UdjmkFaA9JUl00ND/qX3OfirdOZ2PPu5RkFpphJapiI
 xmayWKXaI+gfAdUEBEW4gyFQpNHjNRquINyIzT7mYIEFhqr5KJanZ3/SU/0zNvXAZ7iE
 n8hCsuzFJH1WNtMJBsrAdDwURC7jjhbCoW9T0Cxh1FSi6/CE1axZWQS3iNlSmphIYKVi
 tsya+nuC8QnBv2hfvsmfwmHIukrvfDjnW4Lsme1I9nB16nMZfqeRN3fgFCEPauS427/c
 MThwQiYDORHQj/EPied/Vyz2M6zaobPJNnFLRtBs01xlca1ef0a18b/FP26fA1FebGly
 1udw==
X-Gm-Message-State: AO0yUKVx2mERsiEC3lUpdSl40UMfKWto2hQMT6b1OYY4cgJEe0sRkEeJ
 4vR/+O2U6bGRFVkd0msxu38=
X-Google-Smtp-Source: AK7set8Z0OvvHtBbdRob0NHfPmqKbu8pXQDMIHHkSrhsvZr6Y+/aoR8LjxYbUVWyGzMM5Yz9b0WSvg==
X-Received: by 2002:a05:600c:1e14:b0:3ea:edd7:1f1f with SMTP id
 ay20-20020a05600c1e1400b003eaedd71f1fmr12651873wmb.40.1678195970271; 
 Tue, 07 Mar 2023 05:32:50 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 r39-20020a05600c322700b003eafc47eb09sm12525574wmp.43.2023.03.07.05.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:32:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f133ca78-8b1e-149c-d907-7a843c8f322d@xen.org>
Date: Tue, 7 Mar 2023 13:32:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 05/25] hw/xen: Watches on XenStore transactions
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
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
> ---
>   hw/i386/kvm/xenstore_impl.c | 151 ++++++++++++++++++++++-
>   tests/unit/test-xs-node.c   | 231 +++++++++++++++++++++++++++++++++++-
>   2 files changed, 380 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

... with a couple of nits in comments called out below...

[snip]
> +static gboolean tx_commit_walk(gpointer key, gpointer value,
> +                               gpointer user_data)
> +{
> +    struct walk_op *op = user_data;
> +    int path_len = strlen(op->path);
> +    int key_len = strlen(key);
> +    bool fire_parents = true;
> +    XsWatch *watch;
> +    XsNode *n = value;
> +
> +    if (n->ref != 1) {
> +        return false;
> +    }
> +
> +    if (n->deleted_in_tx) {
> +        /*
> +         * We first watches on our parents if we are the *first* node

We first *fire* watches on our parents...

> +         * to be deleted (the topmost one). This matches the behaviour
> +         * when deleting in the live tree.
> +         */
> +        fire_parents = !op->deleted_in_tx;
> +
> +        /* Only used on the way down so no need to clear it later */
> +        op->deleted_in_tx = true;
> +    }
> +
> +    assert(key_len + path_len + 2 <= sizeof(op->path));
> +    op->path[path_len] = '/';
> +    memcpy(op->path + path_len + 1, key, key_len + 1);
> +
> +    watch = g_hash_table_lookup(op->s->watches, op->path);
> +    if (watch) {
> +        op->watches = g_list_append(op->watches, watch);
> +    }
> +
> +    if (n->children) {
> +        g_hash_table_foreach_remove(n->children, tx_commit_walk, op);
> +    }
> +
> +    if (watch) {
> +        op->watches = g_list_remove(op->watches, watch);
> +    }
> +
> +    /*
> +     * Don't fire watches if this node was only copied because a
> +     * descendent was changed. The modifieD_in_tx flag indicates the

s/modifieD/modified

> +     * ones which were really changed.
> +     */
> +    if (n->modified_in_tx || n->deleted_in_tx) {
> +        fire_watches(op, fire_parents);
> +        n->modified_in_tx = false;
> +    }
> +    op->path[path_len] = '\0';
> +
> +    /* Deleted nodes really do get expunged when we commit */
> +    return n->deleted_in_tx;
> +}


