Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A7493756
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:32:03 +0100 (CET)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Jy-0006jl-IG
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA76h-0008C4-8i; Wed, 19 Jan 2022 04:18:19 -0500
Received: from [2a00:1450:4864:20::529] (port=37882
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA76b-0004JJ-PO; Wed, 19 Jan 2022 04:18:18 -0500
Received: by mail-ed1-x529.google.com with SMTP id c24so5783409edy.4;
 Wed, 19 Jan 2022 01:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=niDVcAp2WKGSP/ijOFW7lAH3NkD+2yPY8Mz1Iiuhv2E=;
 b=ahNfGeeIeNEdaRKPk8eF06bGWAT4f+1Y7jeQYju8NT0Jx+8fJVBHQo6J0I+u17GLHa
 1Dr2MdAATva8HNe0IAB1g+lmyiIREcVC8fiDyY0Nonh5PMtKRm8I+vgfICLnpfre9wlx
 we5OEKyEnzDON7YCxcspy48oH7JeGOiUtTlgieJQ0p36fB7vy2p2HfJfVp+CqMNQk37+
 P0j44jRGDVmdhJbex8/iOBf7QQfnbjPkRgnQPM+I8s1GLl/Kg+WsH3+uYiBjxG4cv6kC
 nYYOKp5i6xHJLs4Zj2+D3VOvjqo0P9nAFxLo1qn8ywbl8jDskvMv8UKwexs5NWB9HULu
 Uziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=niDVcAp2WKGSP/ijOFW7lAH3NkD+2yPY8Mz1Iiuhv2E=;
 b=xv070ZloelqkxjkEUDtfOswJ0yaFnqa3yRrycMw26dW604VDOE7EgWSCEnaLzv+N3j
 5hNsWavCxWM/uemf3botmbUlVjfxB1+4+DOCplF3wPR65/ttgGV9QH1uXFFTvjwMZQan
 UIndX7p90U2SuLcFVI1Pxz/xCBOWjwSu9slro8woN+eK9tzoXZqu8gD0SrYMXGJKBdZK
 O9dt01IJ+m2++Nn7HY7KIPooiex+mLTs91/OKAHN8m181b/kgON3OCIm7Up9py1Ew7Li
 rp5FlCEkddBiC/pP+bq20ZUisWtKMzoW1pDyZ0XwGO9qU7O0ST5DGlR/s/KtCM1fRMo3
 PzhQ==
X-Gm-Message-State: AOAM533dwp9BPMit4IkGOTCda00s7ywd5oUpUXoBuKqug242OmhOmupF
 ozIitnvJb/vQpIquxp2VPIo=
X-Google-Smtp-Source: ABdhPJxWu/N3Rc9mbvsYc6VCk1+UFpC2oin0fZydrTqmhFh5hjNWpm28oTaj+Qsa2sUIPyq9tBA7CQ==
X-Received: by 2002:a50:bb0c:: with SMTP id y12mr29600227ede.247.1642583885484; 
 Wed, 19 Jan 2022 01:18:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 4sm6199488ejc.160.2022.01.19.01.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:18:05 -0800 (PST)
Message-ID: <53900301-5b8c-a724-4e48-ba3fa003cc1e@redhat.com>
Date: Wed, 19 Jan 2022 10:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 05/12] test-bdrv-drain.c: adapt test to the coming subtree
 drains
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-6-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118162738.1366281-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
> - First of all, inconsistency between block_job_create under
> aiocontext lock that internally calls blk_insert_bs and therefore
> bdrv_replace_child_noperm, and blk_insert_bs that is called two lines
> above in the same test without aiocontext. There seems to be no
> reason on why we need the lock there, so move the aiocontext lock further
> down.
> 
> - test_detach_indirect: here it is simply a matter of wrong callbacks
> used. In the original test, there was only a subtree drain, so
> overriding .drained_begin was not a problem. Now that we want to have
> additional subtree drains, we risk to call the test callback
> to early, or multiple times. We do not want that, so override
> the callback only when we actually want to use it.

The language here is a bit overcomplicated.  Don't think that you're 
writing Italian, instead use simple sentences.

First, the test is inconsistent about taking the AioContext lock when 
calling bdrv_replace_child_noperm.  bdrv_replace_child_noperm is reached 
in two places: from blk_insert_bs directly, and via block_job_create. 
Only the second does it with the AioContext lock taken, and there seems 
to be no reason why the lock is needed.  Move aio_context_acquire 
further down.  [Any reason why you don't move it even further down, to 
cover only job_start?]

Second, test_detach_indirect is only interested in observing the first 
call to .drained_begin.  In the original test, there was only a single 
subtree drain; however, with additional drains introduced in 
bdrv_replace_child_noperm, the test callback would be called too early 
and/or multiple times.  Override the callback only when we actually want 
to use it, and put back the original after it's been invoked.

This could also be split in two commits.

Paolo

