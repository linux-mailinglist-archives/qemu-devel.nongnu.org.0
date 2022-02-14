Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC174B4F82
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:01:33 +0100 (CET)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJa2u-0004pV-EJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:01:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJZz9-0002as-Tb; Mon, 14 Feb 2022 06:57:41 -0500
Received: from [2a00:1450:4864:20::52a] (port=45969
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJZz4-0005Io-Fs; Mon, 14 Feb 2022 06:57:36 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z13so8342507edc.12;
 Mon, 14 Feb 2022 03:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ix0btO0hnrVOIbdED12Zi1ApfQ+7H8aqRBiJEv99u8Y=;
 b=TNoNuFmM/w/cKTVybq9pF3IwzNtisl7q++34xb9BZyeW60XVo5dZ68YFIi+eLTVbJ8
 k82HzqQEf4HCJletqD2qKUulAQr+AzgHBrUE2tfd3cw7myylSW43MYmyX//kGhIwWmU1
 AeG15jD8KlzTLi9PsFl4xAU4wDZXrs73w0ydAMfRq/BpuvF5Q4DmzuGAM9CTv/lr8E3Y
 PQk/Xt0p0x9bpfvccvDXj34BsyFAXMsMoLFSanEUWKdlOkANlf3vK8ZSuF3B0uccmHcs
 d2+otRVzcjEaiVg4v4lSlPnVwr0BpAmyBA+iSLt0CwR6unfpNyOWVzt55ZBeZiXN0yg9
 rWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ix0btO0hnrVOIbdED12Zi1ApfQ+7H8aqRBiJEv99u8Y=;
 b=pqqcnCV6SANSXvoYGGxlOB5vpN9t9VcUPRQYiJqJDC+maWBJnDUhLZqkLKlolLtfrD
 ANnwPr+/9vbKlCsBEHlFbym0UsWb8vLm3eWKgJs+n3iDzE2oEPT/vHOboCtumzEMGvl6
 5/GD0zKGQhytYTrFb2QGHTQjn3lftfAUif2EFBY09fVCA3mPdI2zqC2EcSi5/vxeLp8J
 IZX1+BWq/OW5MJT8nh2lsY9FHyGLZ4V7qV59EA5HLfK8PR6YTR3F89XBVdJdhA4s3hWN
 f+SBWWvwSYaZID+D7SBtxzJ6du7reCyrcTv45Ah5den4wxoCbPJ2MR3LxGt4rqDoGNiB
 JRTw==
X-Gm-Message-State: AOAM533OYTYduoTo7UMURoJ69/V69wXeCuHdZGsPClZqQ6ts5it+ji7i
 Sdriee5Iz4uh7pyjysWPlZA=
X-Google-Smtp-Source: ABdhPJy7PrZTLLlgwRRptYlxRAAozB2VCF5S9mtW0De48ZitYKfbTPdH8RoG5htsn7aKzyzPQ/F59Q==
X-Received: by 2002:a50:cccb:: with SMTP id b11mr15144980edj.57.1644839852288; 
 Mon, 14 Feb 2022 03:57:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id v19sm4149777edc.29.2022.02.14.03.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 03:57:31 -0800 (PST)
Message-ID: <352ec3bc-d596-55e4-4ab4-ac4cd12f47ed@redhat.com>
Date: Mon, 14 Feb 2022 12:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-2-eesposit@redhat.com> <YgZOdni4B7/mIQQ6@redhat.com>
 <eb868668-e07e-00fb-b550-0ce7394febe6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <eb868668-e07e-00fb-b550-0ce7394febe6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 11:27, Emanuele Giuseppe Esposito wrote:
> Anyways, I think that in addition to the fix in this patch, we should
> also fix bdrv_parent_drained_begin_single(poll=true) in
> bdrv_replace_child_noperm, with something similar to what is done in
> bdrv_co_yield_to_drain? ie if we are in coroutine, schedule a BH that
> runs the same logic but in the main loop, but then somehow wait that it
> finishes before continuing?
> 
> Alternatively, we would forbid polling in coroutines at all. And the
> only place I can see that is using the drain in coroutine is mirror (see
> below).

I think you should first of all see what breaks if you forbid 
bdrv_replace_child_noperm() from coroutine context.

Drain in coroutines does not poll, it gets out of the coroutine through 
a bottom half before polling.  So if bdrv_replace_child_noperm() doesn't 
require it, polling in coroutines can still be forbidden.

This patch is correct nevertheless.

Paolo

