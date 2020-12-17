Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17972DD0BF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:49:16 +0100 (CET)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprmV-0002Lm-UB
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kprkQ-00019W-0t
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kprkO-0001il-Dt
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608205623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iug3ggY0w5bjkPxymdifqXFLb7U0VPYPijxffyBr6r0=;
 b=S2UGXmKA/5Yv3YT6khjnjWQay34ovedmyDiZHMugxrAvbvM0mMWz+tMBfiLrkf3nat2qRN
 KP6qK+a5Dq7wIvpr+GgQGnvbmTsAIWpCjbLcNSK2NzpOPxpBS8uW2i/97Gt1nNBolQ37t8
 GCyeKRGYe1/qceN41Wovy3y9lV1+IXU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-ZoorttTxNiui2dkGluokHA-1; Thu, 17 Dec 2020 06:47:01 -0500
X-MC-Unique: ZoorttTxNiui2dkGluokHA-1
Received: by mail-ej1-f69.google.com with SMTP id lw15so8537563ejb.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iug3ggY0w5bjkPxymdifqXFLb7U0VPYPijxffyBr6r0=;
 b=jMQKu2CPItlXuR/mAU76saHKdEhHPaVpQJoxZlGgH3zqP70rv/O3qguoswDs4V8yZD
 2H10dJYq5hFiNBlBifLwLghw2TD6x8iXE0K/+AJfGwAwdSvr3R+cObbRI2PAGlVTgDZL
 gGZVmHIaal8Gc3+ueEC/bwyI4dufJ4wmx+/Xs9qsKLwgSnP4Cgdq0RatAnnRyNZ/9Q55
 GI+el5nwONW0AAV0S/79ztPxgRDo8MNM1/h0ZaoI9594LnqxPG3WBq67V2EfpTG2YZth
 gifL32GbPBgDCOvU5cdCw2KekIjd8RWdel5Q+l6Mda/Ez38+qh6rIQr5D6+d6Okn/Edj
 vbFA==
X-Gm-Message-State: AOAM532cjqMt6rKPf4lzDywsjJ8irtniPVhO6cNySkrOoFcsqi9CfNz0
 aWMv2ewF1vGrcGiutF1vRjnocC/4TWeoBxv/CaY5ZPw0XZLzXVxrfxjJAX/k5Ocifqs8258ytPG
 A/t/Jl8WNmAWWMmpxFTfkiVtsKLgz6jEW/Xutym+YnB3DBlyGzuD7W5am9BdsmM87f2s=
X-Received: by 2002:a05:6402:1d15:: with SMTP id
 dg21mr37536902edb.280.1608205620221; 
 Thu, 17 Dec 2020 03:47:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP40djTKi+lSCTWw6rwY+qq8djAgPs4SoSsmaKPHHHJI7JBMTeEvvI0L3+YCw4sjWNK/Sj5g==
X-Received: by 2002:a05:6402:1d15:: with SMTP id
 dg21mr37536883edb.280.1608205619971; 
 Thu, 17 Dec 2020 03:46:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k21sm3553844ejv.80.2020.12.17.03.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 03:46:58 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
 <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
Message-ID: <7fc16ac5-d0c2-9475-abc8-bd415c6b2a73@redhat.com>
Date: Thu, 17 Dec 2020 12:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/20 12:32, Claudio Fontana wrote:
> Is the root cause elsewhere though?
> 
> I don't like stubs very much, because often they are introduced as the easy way out of a problem instead of doing the necessary refactoring,
> and they end up confusing the hell out of someone trying to understand what is actually used where, never mind trying to debug the linker errors.
> 
> There is already an bunch of #ifndef _WIN32, #else , ... in util/main-loop.c (quite a bunch of them really),
> is that what actually needs reworking, and putting the pieces together in the build system in a way that makes sense?

qemu_fd_register is almost not needed at all, since we have

         WSAEventSelect(node->pfd.fd, event, bitmask);

in aio_set_fd_handler.  I think we can remove the call to 
qemu_fd_register from qemu_try_set_nonblock, and that should fix the 
issue as well.

Paolo


