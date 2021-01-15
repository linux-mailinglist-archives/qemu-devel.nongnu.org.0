Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944BE2F7E9A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:51:46 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QS1-0006YY-Lj
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0QQ7-0005R0-PW
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0QQ5-0007eZ-HB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610722184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmdAoZMcg9ug9Jw8fnKlcABxw73KIUEPoRDdAHrnSN0=;
 b=GWrs9AwUPI83DEpoIuM7aKQVGbmMoVKsa7oHVzMFwcOyKxjXX4JABxiUYfCKJWm59gbIbJ
 lE4vydRs1ZUQCR1JPhpCJJ3EoQKhYWy/QuHokES4WahwOnS9aD+UNXe18g8pgvItk7yz1K
 YxRT7fQCZpK0PY4zqZTrGfUHLZ2niJU=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-8r1lKtPyN_6fHinitS1DSw-1; Fri, 15 Jan 2021 09:49:43 -0500
X-MC-Unique: 8r1lKtPyN_6fHinitS1DSw-1
Received: by mail-vs1-f71.google.com with SMTP id a63so1572640vsc.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TmdAoZMcg9ug9Jw8fnKlcABxw73KIUEPoRDdAHrnSN0=;
 b=A3GFAXsTcd4Zcg/iwCpF2NC7QiVAyOPbFNIuNoSkExJ0AbPqGai9QXLCeYC76+9MjJ
 imo4oo5AasKI/D7I5SarQUhjeqrDe1XIddrXWciSlZZxWHzh/wq5ZfAVqsmtmWgYcBhV
 kTUwp+Z0o61pDmYSbRLpLkXd2z3a0Cr9RIRmFdqEQSfIueyD0MXwAYU+aez3bji+Qs9c
 CEaSI0kn1FniBoIEvGWafSgayJx90rAAEEOefGvxAee894USqe+eJT/+4eNr2vaLpKvS
 4AAZIG/jkLRBCc0Jdbc+OZyc2TAL1Kx9giFt3MPmRPbCK1Tjn9vFD+8yhhTYts6RP/7Q
 +6Sg==
X-Gm-Message-State: AOAM530xf+WgxVjFeV0yoIPQIGmYoGx7U9jmeCVo/q3vNuCqwYBhtG8E
 K9Q9m7pWcgh6p7rLOBQGPhSAAa55px98mU6DIEeXvIl0YIss0PHZb48m/NIZlgDkF4BLvFOtf5u
 EFzEDM2BOkrnoSJZXCglw1l2ZjV5WQhU=
X-Received: by 2002:ab0:2a01:: with SMTP id o1mr9671642uar.133.1610722182736; 
 Fri, 15 Jan 2021 06:49:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw81YYN2ZY7RXkhfm6xd2wjrRTwaUtxt7xr1ZmiPUpXsUAViN4HFuP/n4vMTDIG3SHbbGth8xgnGUjDimnKI8E=
X-Received: by 2002:ab0:2a01:: with SMTP id o1mr9671626uar.133.1610722182574; 
 Fri, 15 Jan 2021 06:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-9-mreitz@redhat.com>
In-Reply-To: <20210114170304.87507-9-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 11:49:16 -0300
Message-ID: <CAKJDGDYXuH-Q4+2MXtnsDVE4L-1UCsXFPpAoh5x9KCepAciUnQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] iotests/129: Limit mirror job's buffer size
To: Max Reitz <mreitz@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:37 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Issuing 'stop' on the VM drains all nodes.  If the mirror job has many
> large requests in flight, this may lead to significant I/O that looks a
> bit like 'stop' would make the job try to complete (which is what 129
> should verify not to happen).
>
> We can limit the I/O in flight by limiting the buffer size, so mirror
> will make very little progress during the 'stop' drain.
>
> (We do not need to do anything about commit, which has a buffer size of
> 512 kB by default; or backup, which goes cluster by cluster.  Once we
> have asynchronous requests for backup, that will change, but then we can
> fine-tune the backup job to only perform a single request on a very
> small chunk, too.)
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/129 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


