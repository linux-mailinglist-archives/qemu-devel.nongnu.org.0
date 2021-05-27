Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4151839383B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:44:14 +0200 (CEST)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNnZ-0000h6-Bi
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmNgN-0003Uy-RW
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmNgJ-0002cO-9A
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622151401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjyMKTLlH88qyw3COXy0Mm8PeLWbkH37xlEzfJ+HQLQ=;
 b=NPXk9kksuyfV8CN9VDaQWbo6TW3p9j5mDvus9l0Yl94V5asB09VooB1esAkXAn/1atlI+8
 A6UeJtmlPzfOIK5qqwAx0F7CDwFjmbvW2l+/kXTj1M5fw4Moyvu5OG7OeyjOozqg4Q6Uqy
 9Vs+MiZCxYD9RGn5TlHBSEA1DGXrKZk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-sBXicnkqPSGWpPjsMGWzmg-1; Thu, 27 May 2021 17:36:40 -0400
X-MC-Unique: sBXicnkqPSGWpPjsMGWzmg-1
Received: by mail-ej1-f72.google.com with SMTP id
 n25-20020a170906b319b02903d4dc1bc46cso583480ejz.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 14:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjyMKTLlH88qyw3COXy0Mm8PeLWbkH37xlEzfJ+HQLQ=;
 b=lp1n2lN+SfvoXSGUisVKzub33muaYLLlBHP29VwSdnCGIeDfOIUaA1/WXo1MSSYByK
 G3ZtAuXLeJX5St+m7wgxFePJh7bWK5wWV9JIWvNo9Kt4+h64m1le1Ah0kR5atRVC//lj
 4OUNdn8ADGwP0CWpkSg7wU7p6A9AyL7QK383NbvNHR0S2RmqptFatZrfrV+/AfmtXktK
 YrrbRaMGf2ZEJ0E0CMM/Wljnus12w0B04OYbLaOi65txOtrKZ43WTMMcl9wuSOGwA8oA
 pi78+exjoyPzlDKwj2mIyvkAk/h00LIANn9gEpE7k74TyNLIn2tr3zLYPlaxaP8nX2Hl
 CuiQ==
X-Gm-Message-State: AOAM531zppAd8qzGZNSICwI5sH7ixn48mATmhiupi0YuJrX0nDImBHrO
 ZjwcmeacWBji1uOukaf/BH945xAVDqYEuSTcEdnW1Kk6RdghJxLVfRKN53Q/ebjKwWsbT4zqwNt
 6rqXFKPjh/SIXtjo5zXFtH3jvJ8ex5QY=
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr6265666edr.144.1622151398467; 
 Thu, 27 May 2021 14:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAEc76t0WtsBEI+PHv2BIS5VsXow1/p6n1DXrbLqIAaXsQnFgGaxlcYnGbQBOEU2HfQBYOMKoWcjTWQabuUro=
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr6265650edr.144.1622151398301; 
 Thu, 27 May 2021 14:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210430134830.254741-1-ckuehl@redhat.com>
 <4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com>
In-Reply-To: <4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 27 May 2021 23:36:26 +0200
Message-ID: <CAP+75-WxB3aKHC51gEF+vR0T9iEvkfC7mwJk+GdJEp8HpqhqYw@mail.gmail.com>
Subject: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping^3...

On Tue, May 11, 2021 at 9:35 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Cc'ing qemu-trivial@
>
> On 4/30/21 3:48 PM, Connor Kuehl wrote:
> > Connor Kuehl (2):
> >   sev: use explicit indices for mapping firmware error codes to strings
> >   sev: add missing firmware error conditions
> >
> >  target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
> >  1 file changed, 25 insertions(+), 23 deletions(-)
> >
>


