Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB749FAFE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:44:31 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRYE-0007SO-LQ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:44:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDQF7-00021W-5I
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDQF5-0000B0-13
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643372438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XnPzy2Vkq3tnDVN+F+GwJlYRrJGEhGKzC6U+HoSvBh4=;
 b=eWPlC7enBRatOilT2A8LowxJoHsToOqc8h09Pu0z3Um35Ozrq6yHv5sFUGDtLlSSAPnDfZ
 E7YOrPt0aaNrolwGk2nXmmAvR+4u/yDz++FFyaFEovOuIcOH2fo8XCXMTiZaNhIAYagGTG
 cvuBe3h7AUAwu07vCuA7z6Zibjy6aek=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-GES5NJkdOd-YpDw-9eQlSQ-1; Fri, 28 Jan 2022 07:20:35 -0500
X-MC-Unique: GES5NJkdOd-YpDw-9eQlSQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 ej14-20020ad45a4e000000b00425d03eabe4so3736629qvb.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 04:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XnPzy2Vkq3tnDVN+F+GwJlYRrJGEhGKzC6U+HoSvBh4=;
 b=glAP0Ih0XCrUNZk+EifzO/cV/oi149UmfJctadY63ajHXl1tKh1liYg/o3dMHAyHPl
 f6a+lo3rMEYO/dcLRB5PzE04e6WXTWuaUJOMTOfjmAganT/7XE6S0EZVQ3UPYwlo5upQ
 fG1r0VE42Sfy8GXReaga6QJ9IR+hN/QtFSfuaoI2PcMn4BplRmTGuuFdPIAE44LEf3XZ
 69mxQ8s4cvc3UE3o5AnKDSNRg/1m7XoXcMejf3WDgjLB5f+VnkqvSjjrkZKLBNA6orqu
 8JEYDUkOuy6jzW8QdygtcZyoZMLngtyPd2+Lu8Vom2pKs5GP2dFGeVOtZrohood2+YyL
 Gvuw==
X-Gm-Message-State: AOAM531ifbdO/7iq4iPBu8u6lpPi1W/ovL29+XjNFFiLKC6nEU7tnpgC
 II9NwBR4OdVOsn+Z4T40BUqMozwEae7+jK6pcZ6UGhb8JavDq9FAJ4dnNt2NdPe2bYL77WFHKjX
 K8vzMmRcNZCdgu9E=
X-Received: by 2002:a05:620a:430e:: with SMTP id
 u14mr5532307qko.561.1643372434776; 
 Fri, 28 Jan 2022 04:20:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw238ARqGRHbrXxfM6hAuH+c26HWl461uYToPpdAQQ++VUv5nRSWXRczctikvwI98ghiimvgA==
X-Received: by 2002:a05:620a:430e:: with SMTP id
 u14mr5532294qko.561.1643372434562; 
 Fri, 28 Jan 2022 04:20:34 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id g11sm3372545qko.58.2022.01.28.04.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 04:20:33 -0800 (PST)
Message-ID: <83c0f357-7849-23e8-19d9-7e47f28b32e7@redhat.com>
Date: Fri, 28 Jan 2022 13:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/12] Removal of Aiocontext lock through drains: protect
 bdrv_replace_child_noperm.
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <YfEwpbxfcNF6K5Cm@stefanha-x1.localdomain>
 <84e1fa9d-0b26-7b79-d36b-fbaa2af2fbd6@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <84e1fa9d-0b26-7b79-d36b-fbaa2af2fbd6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/01/2022 14:46, Paolo Bonzini wrote:
> On 1/26/22 12:29, Stefan Hajnoczi wrote:
>> Still, I'm a bit surprised I didn't notice any
>> aio_context_acquire/release() removals in this patch series because I
>> thought callers need that before they switch to
>> BDRV_POLL_WHILE_UNLOCKED()?
> 
> I think the callers are new and were not calling
> bdrv_subtree_drained_begin() (and thus BDRV_POLL_WHILE) at all?
> 
> Emanuele, enlighten us. :)

Yes, the callers were not calling any kind of drains (or at least most
of them) *and* no context lock was acquired before calling them.

The current logic (or at least how I see it) when draining is:
"ok, we need to use bdrv_drain or bdrv_subtree_drain, but these function
call BDRV_POLL_WHILE(), which in turns calls AIO_WAIT_WHILE and thus
performs aio_context_release(lock); [...] aio_context_acquire(lock);
*Therefore* we need to acquire the lock". The lock is taken as a
consequence of the drain implementation.
This makes the lock usage useless, because we are just blindly acquiring
it for the purpose of making BDRV_POLL_WHILE happy.

On the other side, here no lock was acquired before, and
BDRV_POLL_WHILE_UNLOCKED is not releasing anything, thus no lock is needed.

This seems to hold and kinda proves my logic above.

Thank you,
Emanuele


