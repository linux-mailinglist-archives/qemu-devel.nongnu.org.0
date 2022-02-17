Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518684BA52F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:55:18 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKj7k-0005fQ-9T
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nKj2d-0006js-Bu
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nKj2X-0004qL-9h
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645112985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9R3cv7MD4/itsF5nn4efHQFBZZeu3tVbhYUgOxCnV/w=;
 b=P4BvDyE6Nczw2zjcQ+6v1Jesz6hDhxgVizroOJgEN6CAPY/mOf4MW+re8U3Nqz/NvOCcer
 Dtnc4smh50Lj/1F6SRkO2zSKA/9Ep9iuprOindXxwq1RiFhmLxV6NFJKtHjTO7gnfWrTvb
 gA7YqgImXNDrUQS5Wqa1Q+iWJwhVMiY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-RTZATtitPD-KsGpB3CzV8w-1; Thu, 17 Feb 2022 10:49:44 -0500
X-MC-Unique: RTZATtitPD-KsGpB3CzV8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 o24-20020a05600c379800b0037c3222c0faso2659673wmr.1
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 07:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9R3cv7MD4/itsF5nn4efHQFBZZeu3tVbhYUgOxCnV/w=;
 b=PHdWZzaHt2k3jLic4cufR3O7itRJBk8fZ0+uwVXo5X3iSJERwTf+YTbHyYvtgvsid3
 28o6NdDakQZ0awdfPEjbRwxz42csTVmrflucMT0Yw7+g1ur415WJizD7tPcDS28RCfI9
 9l6mIth8i/fd5yYKjg9bRU1X3xiFuf2IW40lIKq8ud0cZaXh3+BGIv4pAQxIvSAzj7c8
 8QTqAs9wl3e5y80xGSVodLAhyrm9pMQvpi4VnYzJHGPN0Jpk4cgTS9ITPrt+P7zT8gNg
 Fjo0Ggf7Vc2LYMJBqcMbbFDrz+fqErhC4sdYOBZ2KYkOfrAz3IEed6cp3xhKmORps26W
 EWtg==
X-Gm-Message-State: AOAM531NEpUXrNbOfuB/oLOw/V3+WVKeerkhrcaBZdjQGUS0irGTep/a
 bk/vqWPwtFJa/7SKAZwjh3vuNZt6e4xmuXOvp8uL7KwobGZsRloaNYeVGFgBUIP6pT6Ll4EBwmq
 Rsa/DTMHeedvK/cg=
X-Received: by 2002:a05:600c:348a:b0:37b:ecb3:a249 with SMTP id
 a10-20020a05600c348a00b0037becb3a249mr6741883wmq.33.1645112983181; 
 Thu, 17 Feb 2022 07:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhlNBmYdfInp6BvW8TJwKl1Aeg0MX8iriILZNZtA/lHnosWgQK0OmkC3VaMn1kb8iWnVkflQ==
X-Received: by 2002:a05:600c:348a:b0:37b:ecb3:a249 with SMTP id
 a10-20020a05600c348a00b0037becb3a249mr6741863wmq.33.1645112982940; 
 Thu, 17 Feb 2022 07:49:42 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id c8sm2127518wmq.34.2022.02.17.07.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 07:49:42 -0800 (PST)
Message-ID: <f78c7e95-2557-4f0f-a0f3-ce3f9d5906a5@redhat.com>
Date: Thu, 17 Feb 2022 16:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-2-eesposit@redhat.com> <YgZOdni4B7/mIQQ6@redhat.com>
 <eb868668-e07e-00fb-b550-0ce7394febe6@redhat.com>
 <352ec3bc-d596-55e4-4ab4-ac4cd12f47ed@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <352ec3bc-d596-55e4-4ab4-ac4cd12f47ed@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 14/02/2022 12:57, Paolo Bonzini wrote:
> On 2/14/22 11:27, Emanuele Giuseppe Esposito wrote:
>> Anyways, I think that in addition to the fix in this patch, we should
>> also fix bdrv_parent_drained_begin_single(poll=true) in
>> bdrv_replace_child_noperm, with something similar to what is done in
>> bdrv_co_yield_to_drain? ie if we are in coroutine, schedule a BH that
>> runs the same logic but in the main loop, but then somehow wait that it
>> finishes before continuing?
>>
>> Alternatively, we would forbid polling in coroutines at all. And the
>> only place I can see that is using the drain in coroutine is mirror (see
>> below).
> 
> I think you should first of all see what breaks if you forbid
> bdrv_replace_child_noperm() from coroutine context.

Checked. Basically, if I add the assertion assert(!qemu_in_coroutine())
only in bdrv_parent_drained_begin_single(), iotests and unit tests run
as intended.

If I add the assertion in bdrv_replace_child_noperm(), so that the
function can't be invoked by coroutines, everything breaks. Starting
from qemu-img, as it uses bdrv_create_co_entry() and therefore
qcow2_co_create_opts() for qcow2 format.

On the other side, if I add subtree_drains throughout the code, we end
up having  bdrv_parent_drained_begin_single() called much more
frequently, and since bdrv_replace_child_noperm() *is* called by
coroutines, the drain count won't match, so
bdrv_parent_drained_begin_single() will be called much more frequently
and the assertion will fail.

I am testing the fix agreed with Kevin, i.e. implement something very
similar to bdrv_co_yield_to_drain() in
bdrv_parent_drained_begin_single(), where we just create a bh to do the
work in the main loop, and it seems to be working. Maybe that's the way
to go for bdrv_replace_child_noperm?

Should I get rid of this one or have both fixes in two patches? This
patch just fixes part of the problem, but as Paolo said it's correct
nevertheless.

Emanuele

> 
> Drain in coroutines does not poll, it gets out of the coroutine through
> a bottom half before polling.  So if bdrv_replace_child_noperm() doesn't
> require it, polling in coroutines can still be forbidden.
> 
> This patch is correct nevertheless.
> 
> Paolo
> 


