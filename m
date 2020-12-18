Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1182DE341
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:25:19 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFkz-0000yK-Gl
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqFhe-0008Tk-HY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqFha-0000aL-V6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608297706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CJX3ho2yh7L+iE9ZmA5gvUjBiG1Rh6Epkcng6PYgY4=;
 b=N6D/O8V1Gm1C7sT34EupG75D/9b9QOl4WyvvhSzixMrarYbk+IC/uiwtxYAcyhuNSZs2jd
 oocNKRMmr186SeylEn2UUCI7gjZB8Xqgeuxs/Xf7YCJcU4S++1KvwRjzzGqkd8rsshT4yz
 8gRFgk2nXJbPtghuL83DtInEbDfe4Bg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-kHfxiLzuOoqo34bkKtAguA-1; Fri, 18 Dec 2020 08:21:44 -0500
X-MC-Unique: kHfxiLzuOoqo34bkKtAguA-1
Received: by mail-ej1-f70.google.com with SMTP id w6so798806ejo.2
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8CJX3ho2yh7L+iE9ZmA5gvUjBiG1Rh6Epkcng6PYgY4=;
 b=fulBr+xMS0jVa5KdikXQIEI7eUPaVJ2Era0gbAhLVlDUJK/4SO8cg9CxfTG+F2buUV
 VFU0L5KV1oCNdVnf5fzj5yY08HBubt3JcTZWTT+vSQmj+FyxHVgEI0hcO8/NAq3ZDh2U
 JVcn/p1yjuQBShgshFmV4We62r2+672iMXqErMHrCu/XcOpOOT4R+9cn4lKXt6FoRfDJ
 ObjjXnLX5uyjq7MYusZZ4eNjLBPU20PDrrKB2CZnGF09NvVnnSy17d+b4G1NISUUAeCk
 zUNHqFYjIpHEM+lntBOQD2sodAmYz8oYSIVtYG+uMa8tAYU03HCl19KphNYKHQ5/UN/B
 kf1A==
X-Gm-Message-State: AOAM533cX4puUyrzLg2gMRUgH7CGEUoVjzEUac8NgZg6wvIYfK7/lC9p
 I8OI0ir4zHcF5wb6JYbFT2jPavcEpoQIvKEYUdIsjskCY9C0L72HtVf50jTb0KG1NLkDjc9OpHe
 nKSrFB43tLV0uq8rV8KluK5C0jBYxEPHJqHNOQtp8R3fiC3RT5YsFeKgubhA/2rKPk/4=
X-Received: by 2002:a05:6402:1c90:: with SMTP id
 cy16mr4375872edb.73.1608297702439; 
 Fri, 18 Dec 2020 05:21:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk5qVrygT3hEMcMBtSTsdD7UIC+LaR6IZHZZ1gJOvUclAd2EVbi/3ercS5tMX7bA5vyfWUeg==
X-Received: by 2002:a05:6402:1c90:: with SMTP id
 cy16mr4375851edb.73.1608297702219; 
 Fri, 18 Dec 2020 05:21:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k17sm5372702ejj.1.2020.12.18.05.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 05:21:41 -0800 (PST)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
 <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
 <7fc16ac5-d0c2-9475-abc8-bd415c6b2a73@redhat.com>
 <CAMxuvawOQc7sHoVV+eaAChwDb5RVRBHWPqzZ85xoovp+_nqtdg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
Message-ID: <4287c327-0e3e-5f35-b078-0360796e6103@redhat.com>
Date: Fri, 18 Dec 2020 14:21:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvawOQc7sHoVV+eaAChwDb5RVRBHWPqzZ85xoovp+_nqtdg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 14:01, Marc-André Lureau wrote:
>> in aio_set_fd_handler.  I think we can remove the call to
>> qemu_fd_register from qemu_try_set_nonblock, and that should fix the
>> issue as well.
>
> That's tricky to say whether this won't introduce regression. For most 
> fds from qemu, if they use aio_set_fd_handler, that should be ok.
> 
> But what about other fds? For examples, the ones from slirp?

slirp already calls qemu_fd_register, see net_slirp_register_poll_fd

> In fact, I 
> don't understand how it could work today. We are passing socket() fd 
> directly to g_poll(). But according to the documentation:
> 
>   * On Win32, the fd in a GPollFD should be Win32 HANDLE (*not* a file
>   * descriptor as provided by the C runtime) that can be used by
>   * MsgWaitForMultipleObjects. This does *not* include file handles
>   * from CreateFile, SOCKETs, nor pipe handles. (But you can use
>   * WSAEventSelect to signal events when a SOCKET is readable).
> 
> And MsgWaitForMultipleObjects doesn't mention SOCKET as being valid 
> handles to wait for.

No, it's more complicated.  On Win32, gpollfds is only used for sockets 
(despite the name!), while poll_fds is used for prepare/query/g_poll/check.

What we do is basically the same that QIOChannel and aio-win32.c already 
do, just with more indirection to fit the SLIRP callback API:

- main_loop_wait calls net_slirp_poll_notify, which asks SLIRP to send 
back the list of file descriptors through the net_slirp_add_poll callback.

- the file descriptors are stored in the gpollfds global.

- os_host_main_loop_wait does a select on the sockets with 0 timeout

- if no socket is ready, g_poll is done with the original timeout 
(otherwise the timeout is zeroed)

- the sockets were registered with WSAEventSelect in 
net_slirp_register_poll_fd, so they interrupt the subsequent g_poll if 
data comes in.

I don't see any other use of MainLoopPoll, so all non-SLIRP sockets 
should be going through {qemu,aio}_set_fd_handler.  In particular this 
is the case for all of chardev/ (which uses QIOChannel), io/ and net/. 
These are all the other users of qemu_set_nonblock and 
qemu_try_set_nonblock.

Paolo

> But when I run qemu with slirp, with or without qemu_fd_register, I 
> don't see any error or regression.
> 
> Am I missing something?


