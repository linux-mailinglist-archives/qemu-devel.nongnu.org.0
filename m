Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D2333142
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:49:45 +0100 (CET)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJkEa-0007Xn-3k
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJkDU-00073C-JG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJkDR-00036J-Fu
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615326511;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G+ngLpIsESuAALVq02eM9XE9viz4ZD8TtUMCPT7r8BU=;
 b=bAwg1i6D/CkQ74tqmnmTnJbJWVb5Y2OCj94xxc4V4Dij9H781L/DcMEQzkpG0IFlLLfy5S
 1+XP0WBNrLCCHTT7qP1KzbiC3sHR9YvZ6w5f1fdymlAyxOeWQOXPAJNaU3d2QtjDpOMMUp
 2tHVksgZEvIEJl0T510wNrWHQ/nwazE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-MB74vjAvNZiPKaDx1w-F4A-1; Tue, 09 Mar 2021 16:48:30 -0500
X-MC-Unique: MB74vjAvNZiPKaDx1w-F4A-1
Received: by mail-qk1-f200.google.com with SMTP id a137so7521528qkb.20
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 13:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=G+ngLpIsESuAALVq02eM9XE9viz4ZD8TtUMCPT7r8BU=;
 b=LGUnnA5tmKMeM1xGeYb217LAeOazgJ0UK5zQOWqKBKQPE2bmMOhok8n25M1+0YMRQ6
 snwjkXhP5kFwDBbQ/B0YNk0uGFzVNVNjXJFfF5c2dI6feSQy6ScvbAERDO0wsOyUkB2z
 QzQkkK/h5/4Ckwvc7yyyfptv5AMCYGSwg6la1TuXGTzGve6fO2bDjQK4Okozph9jqHoM
 U2GKxWHZzy4wHmW8DOaNcNEOxhzF24A1tL8OwUZefY2ea7hru6Rtc9yrDShDOTZXSk1y
 DPmhzII4Y43SD2+AEO9Ggwx0XNai21jewbs7+zmJhoHUHTJsDiORyUjrzoXl+pL/CRPh
 W5CQ==
X-Gm-Message-State: AOAM532Khb+ht6TNfjwFnPYxW7z6YrAEXW02pnNbjL7ZYsRvvBgZsHY5
 eVjvfsOrdZuX1YHs48moyUYEhJAa3XxwUKd4ez8X1kiR9UlX1odzGKGoTnyX5/7pP1+kzgQt383
 YLl3dV++uiEGSolpiZ/WuNFKZE7HmBf31eakJPrdNU6O+W8B8RXhYfS0Ta5lxubvb
X-Received: by 2002:a0c:8365:: with SMTP id j92mr5927141qva.19.1615326509240; 
 Tue, 09 Mar 2021 13:48:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyePa2WjgbGgsCBikki78Cqy7SaMtpkUpBhWhqXaJyM/3EQL/LtQRxt687wh25JdWUpDpKt1w==
X-Received: by 2002:a0c:8365:: with SMTP id j92mr5927117qva.19.1615326508856; 
 Tue, 09 Mar 2021 13:48:28 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id i125sm11062756qkd.109.2021.03.09.13.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 13:48:28 -0800 (PST)
Date: Tue, 9 Mar 2021 16:48:26 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 00/13] KVM: Dirty ring support (QEMU part)
Message-ID: <20210309214826.GK763132@xz-x1>
Reply-To: Xu:
References: <20210108164601.406146-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210108164601.406146-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 11:45:48AM -0500, Peter Xu wrote:
> This is v4 of the qemu dirty ring interface support.
> 
> It is merely the same as v3 content-wise, but there're a few things to mention
> besides the rebase itself:
> 
>   - I picked up two patches from Eric Farman for the linux-header updates (from
>     Eric's v3 series) for convenience just in case any of the series would got
>     queued by any maintainer.
> 
>   - One more patch is added as "KVM: Disable manual dirty log when dirty ring
>     enabled".  I found this when testing the branch after rebasing to latest
>     qemu, that not only the manual dirty log capability is not needed for kvm
>     dirty ring, but more importantly INITIALLY_ALL_SET is totally against kvm
>     dirty ring and it could silently crash the guest after migration.  For this
>     new commit, I touched up "KVM: Add dirty-gfn-count property" a bit.
> 
>   - A few more documentation lines in qemu-options.hx.
> 
>   - I removed the RFC tag after kernel series got merged.
> 
> Again, this is only the 1st step to support dirty ring.  Ideally dirty ring
> should grant QEMU the possibility to remove the whole layered dirty bitmap so
> that dirty ring will work similarly as auto-converge enabled but should better;
> we will just throttle vcpus with the dirty ring kvm exit rather than explicitly
> adding a timer to stop the vcpu thread from entering the guest again (like what
> we did with current migration auto-converge).  Some more information could also
> be found in the kvm forum 2020 talk regarding kvm dirty ring (slides 21/22 [1]).
> 
> That next step (to remove all the dirty bitmaps, as mentioned above) is still
> discussable: firstly I don't know whether there's anything I've overlooked in
> there.  Meanwhile that's also only services huge VM cases, may not be extremely
> helpful with a lot major scenarios where VMs are not that huge.
> 
> There's probably other ways to fix huge VM migration issues, majorly focusing
> on responsiveness and convergence.  For example, Google has proposed some new
> userfaultfd kernel capability called "minor modes" [2] to track page minor
> faults and that could be finally served for that purpose too using postcopy.
> That's another long story so I'll stop here, but just as a marker along with
> the dirty ring series so there'll still be a record to reference.
> 
> Said that, I still think this series is very worth merging even if we don't
> persue the next steps yet, since dirty ring is disabled by default, and we can
> always work upon this series.
> 
> Please review, thanks.

Ping - Paolo, what would be your take on this series?

Thanks,

-- 
Peter Xu


