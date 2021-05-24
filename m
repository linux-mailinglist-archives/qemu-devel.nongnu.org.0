Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC438F2EF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:26:52 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFHu-0000ct-Q8
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFFr-0007XF-Ia
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llFFp-0005yG-6O
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZjW4SG/3FrFG6UijlBG1oXh3AyAD5wvilzDOBLrA+c=;
 b=Zu5qAVdc8bBIGki71gOFLHSx9lDdJxwRpJId1AFIuHQsun+K8dCt/Hf/vuVXY7qdZUf5iW
 RFXnChNoKsQNcmV679afIugM4ly38hDRAqDn5ow4CxC3h4vFF7FPSxnRQ35S97F7n7ujGc
 F0T2pl8kggQRO8ExdMxABQGYdYLkZMc=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-bYxpciYzNmWxFniMKMSVVg-1; Mon, 24 May 2021 14:24:37 -0400
X-MC-Unique: bYxpciYzNmWxFniMKMSVVg-1
Received: by mail-vs1-f69.google.com with SMTP id
 v15-20020a67c00f0000b029023607a23f3dso11705275vsi.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZjW4SG/3FrFG6UijlBG1oXh3AyAD5wvilzDOBLrA+c=;
 b=Kj4JW0KfQXCSYP5CwtZc08tADkFZrcvBviQb2w0pwQxzaCKsHIrmKvXSEkHcg5sWmi
 G21t1xt1j4hyVbZn8kifyeenA73+enJHO8doJZw/jKqGR8ZW75J7CRbLS6G5nz8m6BCB
 Bs6t77aYv052nWtSzWuP809Bv5l+B8CoduNlftkOCBTYIPjX9mgRhvP2eCFrrk5UsSDn
 9VjdiENQdIdA02lTKWe/U0aAAbftA8P+o+MkkoxLTWwyHZTeLaVb9aRmlRVtArIo7Rvd
 MPaZfrjWyGxVtHi4gJ7Jg9Yh9L89WuT8NBnhaxk0Bo/GtFMn5FLTCv4PpIa5M3NvWGMn
 eo1g==
X-Gm-Message-State: AOAM531pBDgI5CRVfCyWcUKT5jnhaBK4OQ8WJXFaS+w/51ZxEWIla1uq
 KiJ3qEvk09xLTlx3fR8yDPZDRrsDOJ5u5JobVBX7Jz+eCL9p1zQJwQikecXdBH718g0W9oIRmyL
 5YMjlJTpL63KWKXU5ZBSZ5WKAaNrfpEo=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr22998755vkp.11.1621880677324; 
 Mon, 24 May 2021 11:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAnw6x2NBuQJmPAJ3ryMbhbGZg99YbR37uNaLoxB0BQ/iZaYBfShcVLPG00bXpdJ/a9ifUJH667Sb/ky9mK1w=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr22998751vkp.11.1621880677175; 
 Mon, 24 May 2021 11:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-5-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-5-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:24:10 -0300
Message-ID: <CAKJDGDZDLWZk=pB8N--oXV7FUvwNhiKVkUWqmzpG26qM3mV6Rw@mail.gmail.com>
Subject: Re: [PATCH 4/7] tests/acceptance: Sun4uMachine: Remove dependency to
 LinuxKernelTest
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 7:44 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> The Sun4uMachine class inherit from LinuxKernelTest to effectively only use
> the KERNEL_COMMON_COMMAND_LINE attribute. This change remove that unneeded
> dependency, making Sun4uMachine self-content.
>
> I took the occasion to delint the code: the unused os import was
> removed, imports were reordered, and the module has a docstring now.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/machine_sparc64_sun4u.py | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


