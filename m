Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9D130875B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:31:35 +0100 (CET)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Q7p-0006zh-5H
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5Q5U-000602-08
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:29:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5Q5P-0000vG-Nn
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611912543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ObFCnOCOME3UwjzQtE3r1Rd8H1S1kuidph+PqU82EQ=;
 b=dkiO3/pqMz/nbsnh0kGvvW2pC1gLmsS8Dpg4R5LwcEt3lUyMvDwUw9GGcYZoLbGqT9wk2M
 PjmgsD+TRcKHdbPzYlP2CiGi6EwJV8dz2gVeN0oawM29OONbZgv5uPWl6twHTpVbInSpHR
 jJjkzeXXqXKCcJk0ukRZo+Zo0zcVDHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-XTRSKEFYPQKwmI7OKDjYDA-1; Fri, 29 Jan 2021 04:28:59 -0500
X-MC-Unique: XTRSKEFYPQKwmI7OKDjYDA-1
Received: by mail-wm1-f69.google.com with SMTP id z188so4910286wme.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 01:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ObFCnOCOME3UwjzQtE3r1Rd8H1S1kuidph+PqU82EQ=;
 b=EO1luaq99LF0yVHLLhmnBzUqrCSa8ZmN1oBQOyFaVaPoxklLJ5W4pxlTr+FlNj2SXg
 D7rpenySIwHhXsTH304OLctPJtpB8aIjbv2BISvEZz1u0LAKqZS+EJSssUWqh8I2awp8
 SsgbBJYYS+2ho7fDD8bPZaW76W4O4QY6KxONFRuPN+QGX/PyuvEHd8w+3p9tJGDdeB4A
 GV1lo8IXwSq3DdXqGQWI+LMREqr1XluwkEfEGgpzN+U+evlNV2XbRj8J1bQnydEGV8vc
 VF6l7rZBxmfZsJE3cgCOCtYtNJ9lymIvecJ6oTCnqReYT/2HXy6ahDSuliPLPzouQgEc
 D39w==
X-Gm-Message-State: AOAM530054jhKkwuVbhee2NayGsWFK/4qJQHlhrbnWRBdccKUQAH2mu1
 VL6wUsXDYbwWYIv10apMIfv6ddySFwnkIA2yp0skj41x5AcPUJowzvkjRn+5bEepRQzMBgu9dDp
 h9B3/wwCC4oaBm2E=
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr3477651wrx.230.1611912537978; 
 Fri, 29 Jan 2021 01:28:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGhy3jxlB93u0N602/75bDdBw7xfpdLbQsDBv2vPvsYJhhbaII/WAgvC5oAbwRZWEgQYN3Eg==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr3477645wrx.230.1611912537868; 
 Fri, 29 Jan 2021 01:28:57 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s19sm12447186wrf.72.2021.01.29.01.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 01:28:57 -0800 (PST)
Subject: Re: [PATCH] accel/kvm/kvm-all: Fix wrong return code handling in
 dirty log code
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210129084354.42928-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5531b70e-91df-2f38-df40-7346f5e496b5@redhat.com>
Date: Fri, 29 Jan 2021 10:28:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129084354.42928-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Serge Hallyn <serge.hallyn@ubuntu.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 9:43 AM, Thomas Huth wrote:
> The kvm_vm_ioctl() wrapper already returns -errno if the ioctl itself
> returned -1, so the callers of kvm_vm_ioctl() should not check for -1
> but for a value < 0 instead.
> 
> This problem has been fixed once already in commit b533f658a98325d0e4
> but that commit missed that the ENOENT error code is not fatal for
> this ioctl, so the commit has been reverted in commit 50212d6346f33d6e
> since the problem occurred close to a pending release at that point
> in time. The plan was to fix it properly after the release, but it
> seems like this has been forgotten. So let's do it now finally instead.
> 
> Resolves: https://bugs.launchpad.net/qemu/+bug/1294227

Is this the "Close the oldest Launchpad bug" contest? =)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)


