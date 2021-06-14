Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695053A5C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 07:15:14 +0200 (CEST)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsewL-0004zX-3R
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 01:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsevQ-0004Jy-PV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:14:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsevP-0002Xy-1q
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:14:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso11985824wmj.2
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 22:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UUfLcAV6xtlnUeAFkcSiPQP866mVcgvw1lffM7RfJ1s=;
 b=RAycgupF1Ow/90Ox9depnSimlXWd1Q99Jwbq8Oy3irLLmrkqG8+KrXHvUsWUTjwLjy
 09AIWPoGfG4vkT8UTOG80BRk5NGDX/NUZFF+2+a47lvb1ry/c07tV89iO02YTJyBU/e5
 h+oliZ+gi7ULDrc/qwDf8/3QavLRdbX2NYCCtYY1XK5DZ8enG2rEEWK85K8OpRnX1Lhs
 VYPCiATM0QltgY9fgfU+m+LvQAgLH7brgeqfrVPkgQHN2GIFyb13Zx7RFPc1oLt6Jwys
 IrwZiOkg0ps5Cu0dZufxx1nrTFmY/JPBwRtCSKxs96AKL0Q8fpVbX+6xnKOECX2F0RIt
 t6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UUfLcAV6xtlnUeAFkcSiPQP866mVcgvw1lffM7RfJ1s=;
 b=mBhCbrjyAV4iWNtoZhhIKDvVMirLkStLHKBjvoBoYcV0DamblTClf35scCkwxjIKQw
 +hp3pLg0nM87wJnzlcUyJZtGAGpGA0sA+6zkiZcRp8itHYnOkNl+OqXQWBn+cWx2tVP8
 Kw6ECZEdh2FApFL/Jk1OY+58xyFKiRxjusQnoS9IaJpg1wyEtQpFafpwenmeg0u8SLfB
 Wtsu31EOqkFw9AMlKb5eRWqPyJkQJRnWo9+8XwpnBvcORa05z230y+6qtc/K5sMwkBne
 B8fFptLeeQkf8C0DXKxggBynNZawfy0fWBKKev3JX/heVuYmmbNFuSAokOiKfEQ0HYWX
 DK1Q==
X-Gm-Message-State: AOAM5313Ltt02xCQIA/RNyYLpGSsKQhFkd7N7loDqNSBkGbwTGxh8KwA
 R7yDq/ZRzqvIoaBivuqFazc=
X-Google-Smtp-Source: ABdhPJzXIxBnYAYodCPRvXp0rv5PgchoKirKJuXuOA27xIMgoxw5o4Cg71sGbRNo88d5QIp6BoxIbA==
X-Received: by 2002:a1c:146:: with SMTP id 67mr31308145wmb.61.1623647652971;
 Sun, 13 Jun 2021 22:14:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a3sm15631735wra.4.2021.06.13.22.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 22:14:12 -0700 (PDT)
Subject: Re: [PULL 1/9] yank: Unregister function when using TLS migration
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
References: <20210609144512.211746-1-dgilbert@redhat.com>
 <20210609144512.211746-2-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <453116f4-9e24-41db-2fd7-5f08428eca8a@amsat.org>
Date: Mon, 14 Jun 2021 07:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609144512.211746-2-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Leonardo,

On 6/9/21 4:45 PM, Dr. David Alan Gilbert (git) wrote:
> From: Leonardo Bras <leobras.c@gmail.com>
> 
> After yank feature was introduced in migration, whenever migration
> is started using TLS, the following error happens in both source and
> destination hosts:
> 
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
> 
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
> 
> Also, inside migration_channel_connect() and
> migration_channel_process_incoming() move yank_register_function() so
> it only runs once on a TLS migration.
> 
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> --

Please use the '---' separator, otherwise tools don't strip
out your comments and they end in the repository, adding
confusion.

> Changes since v2:
> - Dropped all references to ioc->master
> - yank_register_function() and yank_unregister_function() now only run
>   once in a TLS migration.
> 
> Changes since v1:
> - Cast p->c to QIOChannelTLS into multifd_load_cleanup()
> Message-Id: <20210601054030.1153249-1-leobras.c@gmail.com>
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/channel.c           | 26 ++++++++++++++------------
>  migration/multifd.c           |  3 ++-
>  migration/qemu-file-channel.c |  4 +++-
>  3 files changed, 19 insertions(+), 14 deletions(-)

