Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEA466586
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:41:37 +0100 (CET)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnH9-0005bv-Dx
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:41:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1msnF4-00045J-UT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:39:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1msnF1-000470-Tc
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638455958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iDMz08HNLJWt0JpOW1KHpfljjVIApCiKR/avutrjmlw=;
 b=BYSoZgDhR10aSt5a05srAxVNUcPdLdsnJ29KAVhhZ7ntxrSFd0Cp9AY1c9zHqeiY6pxrFO
 rQ+bwl7bQxDn4vlP/x86eYZ/ZmSLzEL4g7Y13Dn6c7KnfjpHf9RMkkmi2yPqB7MWKZ80pf
 q3MfTtRttAQpKHE2NMc82JHaozFIqGQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-11-JlZIgG2SNeaebgCLugD5Yg-1; Thu, 02 Dec 2021 09:39:17 -0500
X-MC-Unique: JlZIgG2SNeaebgCLugD5Yg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020aa7c741000000b003e7bf1da4bcso23621108eds.21
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 06:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iDMz08HNLJWt0JpOW1KHpfljjVIApCiKR/avutrjmlw=;
 b=R7qEa41f8y76v/WPnEQZqSC4C6TlgBIZU4uneoyvLhzuq0Je7axaYHm2BAD7MWNtsZ
 892qc1gl5pOVwOCFjJIENVyz9B/FVAwlmgyZiTkqKJkTh495BmEWnR/z7fQaGH38KJEj
 XphkZ9syDJzwB/NzXzHIQ6vWVH6aA0W4t4FtH1v51Xh1mx1vjE/KPWTpfz4UWLc15w66
 M8/pl4gupAab5BGB3ZyPNfijwIS4O4x5TFRfsotPjt2jUJ/YPCWed/T7Wty64Np2WGdX
 9CJ5sxOwCedDdVDRAPdiJKBvIffVHYSxJfMA29Wo+vYv2zgCkEgnXE9+v4bwPGQYoqOu
 9Ejw==
X-Gm-Message-State: AOAM530QxqLS5WH2hd0Piu1KkrU2KZWHSwIAt+zZrq7ZwKHKU9hoqXQC
 zaT4S2zWndCvpz9av7hQW6GdT6FMBW8SYS2ghPZa5cMKH+EGJdDl5D2c6PniUUEiCC37ncyvsBm
 TiR5Yr6LiP3PfEOA=
X-Received: by 2002:aa7:d8da:: with SMTP id k26mr18152894eds.406.1638455955946; 
 Thu, 02 Dec 2021 06:39:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgd4v3+Wbih6+pC9Jcl09Y5qsLheHh8n2ri4n4cXXBp/cMhq+TN0aayUm2QGiguAoGumK2vw==
X-Received: by 2002:aa7:d8da:: with SMTP id k26mr18152865eds.406.1638455955757; 
 Thu, 02 Dec 2021 06:39:15 -0800 (PST)
Received: from steredhat (host-79-46-195-175.retail.telecomitalia.it.
 [79.46.195.175])
 by smtp.gmail.com with ESMTPSA id b7sm2494567edd.26.2021.12.02.06.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:39:15 -0800 (PST)
Date: Thu, 2 Dec 2021 15:39:13 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] aio-posix: split poll check from ready handler
Message-ID: <20211202143913.d3plt5oubyb24ca4@steredhat>
References: <20211130112057.252679-1-stefanha@redhat.com>
 <20211201115508.tjcwyft7bkfc2mbi@steredhat>
 <YajFg9YW9wKulgqU@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YajFg9YW9wKulgqU@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 01:09:23PM +0000, Stefan Hajnoczi wrote:
>On Wed, Dec 01, 2021 at 12:55:08PM +0100, Stefano Garzarella wrote:
>> On Tue, Nov 30, 2021 at 11:20:57AM +0000, Stefan Hajnoczi wrote:
>> > @@ -657,10 +704,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>> >     }
>> >
>> >     progress |= aio_bh_poll(ctx);
>> > -
>> > -    if (ret > 0) {
>> > -        progress |= aio_dispatch_ready_handlers(ctx, &ready_list);
>> > -    }
>> > +    progress |= aio_dispatch_ready_handlers(ctx, &ready_list);
>>
>> I honestly don't know this code well, so this change isn't clear to me.
>>
>> IIUC this is necessary because we now use REVENTS_POLL_READY, so even if
>> `wait` is interrupted, we want to run the handlers ready so far.
>> Or maybe is it an unrelated optimization?
>
>Previously we didn't need to run aio_dispatch_ready_handlers() in
>polling mode (ret would be 0). Now we do, so the conditional needs to be
>removed.
>
>There is no change for the ctx->fdmon_ops->wait() -EINTR case. fdmon
>won't add handlers to ready_list when returning -EINTR and previously
>polling would run handlers immediately. In order to preserve that
>behavior we now need to call aio_dispatch_ready_handlers()
>unconditionally because polling may have added handlers.

Yeah, now I see.
Aside from not knowing the code, I had only considered the ret < 0 case.

Thanks for clarifying,
Stefano


