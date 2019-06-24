Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE250AAB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 14:27:55 +0200 (CEST)
Received: from localhost ([::1]:50730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfO4g-0005Cq-EX
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 08:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vkuznets@redhat.com>) id 1hfO3K-0004kp-At
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 08:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vkuznets@redhat.com>) id 1hfO3J-00060h-CV
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 08:26:30 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:37092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vkuznets@redhat.com>) id 1hfO3I-0005dJ-8M
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 08:26:28 -0400
Received: by mail-wm1-f46.google.com with SMTP id f17so13184931wme.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 05:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=7Eqylms9Pt2vs4t9jzpS6qpNHzu07poMRKRolyaR+7A=;
 b=XmnpVhBZdym59VaSb+Re2BQIlczcjbVan2zP0idFGjo01UfMdE0ecy9XN8W9ZP5wie
 +5TY5LhPQWDFJWBE02MnZKkIMoCmoy3NJMziDnUYgeTNNf761nGH7MGY9zF9fbTfgkL4
 k1iJ30K75FMMNwN2Y/bIbrjR/Wxy6vd3q3ys42BLCNFZhIUNnqazSdiFgPwV3TZ4ihC8
 ld3lMCkhNwQkCVWyXcMltKYXxDu6CbtR3PwwOt82PKKXt7KWVdyEFi56yzndX9y/gZCB
 wIRiegE3/bzXJMN4BUZtpeNEa2bXhk8lMItws8UgVozNybt8NLCO7X0H61UAaG6ZXr1I
 uOvA==
X-Gm-Message-State: APjAAAXUpzkMc43uTc1vH67wXQJkAf/pN35h51jqRP/5xwHJo+cwsQbI
 9sbsZAtv3QhgCoarolgJ4GLkjROlfw8=
X-Google-Smtp-Source: APXvYqx6NhCUxlVLDJ2fmuYpfeSh7dgsNCI2e9SKNGKlkeJL1IIh1ehfXBKXdm8/MrROcuVJzArwWQ==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr15562181wmk.55.1561379170130; 
 Mon, 24 Jun 2019 05:26:10 -0700 (PDT)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q15sm8214727wrr.19.2019.06.24.05.26.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 05:26:09 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
In-Reply-To: <87r27j1byq.fsf@zen.linaroharston>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
 <1561116620-22245-4-git-send-email-pbonzini@redhat.com>
 <87r27j1byq.fsf@zen.linaroharston>
Date: Mon, 24 Jun 2019 14:26:08 +0200
Message-ID: <875zovf9un.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.46
Subject: Re: [Qemu-devel] [PULL 03/25] i386/kvm: convert hyperv
 enlightenments properties from bools to bits
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Bennée <alex.bennee@linaro.org> writes:

>
> This looks like it's broken the build:
>
>   configure' '--without-default-devices' '--disable-user'
>
> with:
>
>   /home/alex/lsrc/qemu.git/target/i386/hyperv-stub.c: In function ‘kvm_hv_handle_exit’:
>   /home/alex/lsrc/qemu.git/target/i386/hyperv-stub.c:18:19: error: ‘X86CPU’ {aka ‘struct X86CPU’} has no member named ‘hyperv_synic’; did you mean ‘hyperv_vendor_id’?
>            if (!cpu->hyperv_synic) {
>                      ^~~~~~~~~~~~
>
> Does the stub need updating for the new flag? I'm a little confused
> about the relationship between HyperV and KVM. I thought they were
> different hypervisors?

Yes, they are. But to run Windows guests we can pretend being Hyper-V
:-)

I'll send a patch to fix the stub if nobody beats me to it. Thanks!

-- 
Vitaly

