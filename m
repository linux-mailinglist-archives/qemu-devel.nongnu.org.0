Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8116AE026
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:16:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXAz-0004fF-HY; Tue, 07 Mar 2023 08:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXAx-0004ek-2g
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:16:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZXAv-0000t4-7C
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:16:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso7159933wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678194975;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NFum2acnD9qYIwVa4tN5V4rmj4o+XnW3TVVaSWehf/Q=;
 b=SZwu487hPaxa1Ml6JrIRmk1SY/X8d1XEVA1jvsk+qGJqyzpAGGs9uOKiVrUZep6KgC
 9joBlBXOePTp4l1Ul9zRJ6OScp+nUDimFrAcgK1umvqbMRDW8iU/QdVo7vT11uqrxmgW
 FZKOgl0HA9zzzg7ldT8D+wDOwqhqj6idTeX8casyH7OhHPnypet9OLHo+cvzxHhXS2Al
 QeUHwUq7uYT1aChO4csj3cWZsYbeVmILH8HI0OmGqxBgndZvD7yfBqWZrMzr4LHicCak
 3qOnEMyM1QlEnqhbuI8jS1I6v2elutXpeNlz1BIOVOBPUH+0meavW0W+Bb7Cx6EyzA4G
 70qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194975;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFum2acnD9qYIwVa4tN5V4rmj4o+XnW3TVVaSWehf/Q=;
 b=kuZAaVq6qA4UVc5JPEMl13Q6gAW4cYpJ9swnXs6AgAuEy04aJyHSSwXiCG+KqKeOM4
 medtEIp6LxXqvf0III/8GU5oiFWo3Qde06dz3MTdSNTjRQrb/uAl5rDbhq6Mi2+FSpTa
 fRmybkCSesmWThfEwnFnK407ouIbWmMzEM4s9YKQICW9JobuyL0ppiC50pwwABcJ5N6m
 McufU8ThBKvW3YTH9a0feT4hlnN7a1agWDZP+84+XgXt+QjnlLWEwloZ3I0s4YB8fzk9
 K61X0+DW5W9fzH5ofyTZMUwNntwZIQS6pLeR6Xks/SVR2BS/cp/ENnIlxOgTfmYBKqNf
 EQKg==
X-Gm-Message-State: AO0yUKUhRHKrcI/X0Br1lqwMqkjxjMO3JtDbxfA9gqpPnCK2YOrNDT8k
 NrS4V1v5w0uEBhMgHJPXBPM=
X-Google-Smtp-Source: AK7set/3FVQWrAPQv/TXVvlTUtHXEfMHwVBFmnk+0VpesCeDk1kQ6VPtR483XrvlOZgc5jZ/Tz2uWA==
X-Received: by 2002:a05:600c:1c05:b0:3eb:2e32:72c3 with SMTP id
 j5-20020a05600c1c0500b003eb2e3272c3mr13181892wms.22.1678194974851; 
 Tue, 07 Mar 2023 05:16:14 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a7bc8c5000000b003e896d953a8sm16951714wml.17.2023.03.07.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:16:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <58ab28a8-ac77-889f-fb5a-aec140811889@xen.org>
Date: Tue, 7 Mar 2023 13:16:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 04/25] hw/xen: Implement XenStore transactions
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
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
> Given that the whole thing supported copy on write from the beginning,
> transactions end up being fairly simple. On starting a transaction, just
> take a ref of the existing root; swap it back in on a successful commit.
> 
> The main tree has a transaction ID too, and we keep a record of the last
> transaction ID given out. if the main tree is ever modified when it isn't
> the latest, it gets a new transaction ID.
> 
> A commit can only succeed if the main tree hasn't moved on since it was
> forked. Strictly speaking, the XenStore protocol allows a transaction to
> succeed as long as nothing *it* read or wrote has changed in the interim,
> but no implementations do that; *any* change is sufficient to abort a
> transaction.
> 
> This does not yet fire watches on the changed nodes on a commit. That bit
> is more fun and will come in a follow-on commit.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xenstore_impl.c | 150 ++++++++++++++++++++++++++++++++++--
>   tests/unit/test-xs-node.c   | 118 ++++++++++++++++++++++++++++
>   2 files changed, 262 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


