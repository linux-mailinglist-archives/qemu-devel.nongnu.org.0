Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F4334241
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:56:55 +0100 (CET)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Cf-00083E-RK
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK15z-0000jp-SE
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK15y-00069v-7P
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWH3nZ9M/1f3E+qtUj95wVjktoN5lIrtuO6vOvKojMQ=;
 b=CCAVO6air6/pFfRexRapszlC6Qh0F0MFK4TfeEsTfvRyrhyvr9MUR/69IzFXmXwCdu0xD0
 wlql3qcfE4IdE/AQAjAgVDUMm5ZRZh30wFzdvJOzYuYNoGvUQdG8KVRH/vEkOcYu9TzunF
 JYAPQbSa+PKT/myqUFgl0RlZk9YTWw4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-2c_vYP1uNa2YPHn_qle4wQ-1; Wed, 10 Mar 2021 10:49:55 -0500
X-MC-Unique: 2c_vYP1uNa2YPHn_qle4wQ-1
Received: by mail-vs1-f70.google.com with SMTP id 1so650033vsw.16
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWH3nZ9M/1f3E+qtUj95wVjktoN5lIrtuO6vOvKojMQ=;
 b=YO8TsadAnMjk923BL2gtQnPXSnsLpB4/cXom2eoSZ2J8oqeYLcMyh1R/LmgyRrt8Qv
 vOm9+sfIKAxlWORIGE7oFDqi+Z/ZhDrRQu8Krok91SDe5fa5mmHOMQlG7aCtSKfNpfxP
 0S88HTuXNaemecNSPnuvPaNGDDWdJhBodQQTnBPwChSZYAUs3UVA78y5bKs5H7tZIKSO
 nqSdCPqcnjX6OKsQEMjaqCODwqKwhaayxgzY3BT0xNFUxUVBT0dV/WHWlhl2n/YJgREt
 XfOpELZgSHRLhA6Xrk/48bVDqeRfdLp1tTcF67kGZu2w5kvibqF6t7t2vB24AzaJ6q/t
 vUvQ==
X-Gm-Message-State: AOAM530a7YQXquQqr2Ia66FvKWZpkMsU+o9RRQejxw5Yg95sg8mg/q24
 czUJJ992eY0DUdLzwaXpeEv+0XvqlDB7RRNoW+aw4OBk5PtYjBqt2B3aodtO3clhMLCH/Lyzjbk
 +8B7w6YyrX43lYxHykR1QqBdgWbSeptc=
X-Received: by 2002:a67:3241:: with SMTP id y62mr2032346vsy.45.1615391395282; 
 Wed, 10 Mar 2021 07:49:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEkhYZfsO5XCfYkgULYHZ4I6UP0yGTeIDJH8Tvs+t9wdEVpC5Tn/9ltj0WXNmCYlthmw7Lhz1kPw0WdktckyM=
X-Received: by 2002:a67:3241:: with SMTP id y62mr2032329vsy.45.1615391395086; 
 Wed, 10 Mar 2021 07:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20210310094936.1318317-1-thuth@redhat.com>
In-Reply-To: <20210310094936.1318317-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 12:49:29 -0300
Message-ID: <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
>
> When running "make check-speed", currently nothing happens. This is
> because the redirection to "bench-speed" is not working as expected
> (since the bench-speed rule in the generated Makefile.mtest filters
> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
> Fix it by calling "make bench-speed" instead of using a dependency.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/Makefile.include | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>


