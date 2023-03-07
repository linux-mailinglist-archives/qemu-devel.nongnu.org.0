Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FE6ADD10
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVGh-0007PH-UL; Tue, 07 Mar 2023 06:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZVGf-0007Es-TE
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:14:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZVGd-00038R-Pr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:14:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so11713479wrz.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678187642;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+UfWWeab53Q03jZDtXQ+5Yh0vqFB94sHitv/tkqXpLU=;
 b=dv8vTJjwqtTjXs3u3XBxY8Imbr19fxW4hvcJCbEr4fv5qf7FHyVcArSx1WAAKIrnZg
 RwlJVPSOgwspaKLI7tNJFUrfsISnDvmrnLjDJgjloTs9Rm5qFLKtJ7f3AwfjOPcz/n24
 RqsOoNYbwCEk5IOL3AIBrcU8FCwnZiVDyfA8HcoDQI1KAWFIejtD38v57p/sDfksIeJj
 Zl/JVsxC13Jcwxyk6ApSHFlvh60IgB5pO3QIrsS+z3H1GhHj3/GwB5yr8rD8QylF0khM
 9O/yRVLU2QTK9POMEMh174whFAcf7knPFxr0d+eFD60K3LnmO/D0msrzdbFLd9ya8MPD
 iFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187642;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UfWWeab53Q03jZDtXQ+5Yh0vqFB94sHitv/tkqXpLU=;
 b=eBWgwZxh5u/TL6lP+8tKK8fR0KbVj8qxzyFgX4dFax/5KNPfaidzRBptynkHzESvOv
 y9FiCmis0qi0mWWNx377rpOtwCeeUa5pwUu6NacM2eYhrGhD1LpoOV1xAej8a4LAKUGT
 P8/0jTHGkDVP3ChOnpbGniD+IV6nFSMbgjn3DRKcQN9I7UIPaRQDA96UFtpU2qSB7qCr
 aA8hUxy+iut9nmpyVJ9UJdZtrbSQttVyPv+uMs3i33zSmbOqt1Qbm8WCmq9XxbmxrrB9
 DKKA6pw4ZlMOpu8gCi5fO3hwuXA5zKAWxzDFHlMI7jiMnApiFsiy8LjWS1oYfO27NK6q
 ACfw==
X-Gm-Message-State: AO0yUKWm7Q+C5J53JNueMnMlb9HaqZr6zRdhjP6Bmb6L2B+lrEmRu+55
 mmmGOoupKh3OGK6e6eZkisI=
X-Google-Smtp-Source: AK7set9YJQPgeJ4SYTMx8cCML/BVjgNf7J5REgSM4A5jb0VULVqcnJA3hCJjLkMEK5Knls1hRwlMjQ==
X-Received: by 2002:a5d:43d0:0:b0:2ca:8ae5:ea2 with SMTP id
 v16-20020a5d43d0000000b002ca8ae50ea2mr7831817wrr.40.1678187642054; 
 Tue, 07 Mar 2023 03:14:02 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adfea8a000000b002c7e1a39adcsm12438895wrm.23.2023.03.07.03.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:14:01 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5d2f10e0-cfa2-38f8-2d4f-0ef1926d9054@xen.org>
Date: Tue, 7 Mar 2023 11:14:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 02/25] hw/xen: Add basic XenStore tree walk and
 write/read/directory support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-3-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x436.google.com
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
> This is a fairly simple implementation of a copy-on-write tree.
> 
> The node walk function starts off at the root, with 'inplace == true'.
> If it ever encounters a node with a refcount greater than one (including
> the root node), then that node is shared with other trees, and cannot
> be modified in place, so the inplace flag is cleared and we copy on
> write from there on down.
> 
> Xenstore write has 'mkdir -p' semantics and will create the intermediate
> nodes if they don't already exist, so in that case we flip the inplace
> flag back to true as as populated the newly-created nodes.

Something has gone wrong with the comment there... 'as we populate' perhaps?

> 
> We put a copy of the absolute path into the buffer in the struct walk_op,
> with *two* NUL terminators at the end. As xs_node_walk() goes down the
> tree, it replaces the next '/' separator with a NUL so that it can use
> the 'child name' in place. The next recursion down then puts the '/'
> back and repeats the exercise for the next path element... if it doesn't
> hit that *second* NUL termination which indicates the true end of the
> path.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 527 +++++++++++++++++++++++++++++++++++-
>   tests/unit/meson.build      |   1 +
>   tests/unit/test-xs-node.c   | 197 ++++++++++++++
>   3 files changed, 718 insertions(+), 7 deletions(-)
>   create mode 100644 tests/unit/test-xs-node.c
> 

With the comment fixed...

Reviewed-by: Paul Durrant <paul@xen.org>


