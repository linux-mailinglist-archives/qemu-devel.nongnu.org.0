Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9043D9030
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:16:21 +0200 (CEST)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kM8-0004eL-7r
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8kKS-00037d-B6
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8kKP-00077f-Hf
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627481671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+He5vsXwQXmzIVxcJHnCVu3Fn/P7eLxT/qgl3Wx59qg=;
 b=DrRNTexMzutkyHtEZSwpEChQbom8Sr3zGNFfc3AwZZKRm2nPJaq7H7yd2hlIifLXkL2bpd
 HPok8nTaZvErce/ksl8KfMaRfZCzqvTqn04N7L7sADpVBRY2MxNb8hdOTUTrrdzhQnLfI7
 v7nGt19di+Brx0Chh6jc0+sQbfIfV/c=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-8Vcxak2ZPrCaAZP72jD9OQ-1; Wed, 28 Jul 2021 10:14:30 -0400
X-MC-Unique: 8Vcxak2ZPrCaAZP72jD9OQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 f9-20020a1709028609b0290128bcba6be7so2071540plo.18
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+He5vsXwQXmzIVxcJHnCVu3Fn/P7eLxT/qgl3Wx59qg=;
 b=NTgIe6BlpgqqzUQvHMXCwUzpGyE4zQjUI3rLX54vdApREuh6wgvdXxnNKC6dQiLtO8
 2PXkb5EWNELYmfP0mGwZbUxsYUn2LMJwNkjpxFe6SeknvAbEh4asL0UCT/uj4/zjRtsC
 7VOMMeBZ9Mif3bCAQK/FK1fPdFQ+/JlK2b/isxIfb3HaebwpBUJsffh8T35xiMAvIgGg
 asEkP63tplPFZKtfcSW8pCjYHOW1lA4yxoh5nRpk3InCAfE3WOBK/pt98+43B+dj2rvR
 FaFu8Xab6rGpI8z5Q859qlBkzZzR+pZGMCIxMbF7l9NA73wJbKuUEaqhxlpaULFVlokB
 mPZw==
X-Gm-Message-State: AOAM533vY/9Wejk+FizXqCckHJqFME5rpP37jn6/f/s+bSK0dMGzejxj
 5MGUmUbSMXm5s+W9b0e+C8Ht5KQmiYwV9pOmMt4k6jHWVpBbm54jt/hUHwd+0C/c2dVaRq2dLCU
 NULBXJVQgC8ocvxjrwqvNIC9Y99gz7mM=
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr9914766pjb.108.1627481669028; 
 Wed, 28 Jul 2021 07:14:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+KjHL/f77Vd5y00+giEDeqAzBdG8D3ca9rgZhnimH6auWoj4iyrnMHIR7Rb+GsFmywHiWQuy6fKfkAXdNTAA=
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr9914750pjb.108.1627481668830; 
 Wed, 28 Jul 2021 07:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075141.400816-1-thuth@redhat.com>
In-Reply-To: <20210728075141.400816-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 28 Jul 2021 11:14:02 -0300
Message-ID: <CAKJDGDZemkD+4eriPCVL8VXcim85+SxS9wU92rA=xapBqQiACQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x
 CFI jobs as manual
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 4:51 AM Thomas Huth <thuth@redhat.com> wrote:
>
> These two jobs are currently failing very often - the linker seems to
> get killed due to out-of-memory problems. Since apparently nobody has
> currently an idea how to fix that nicely, let's mark the jobs as manual
> for the time being until someone comes up with a proper fix.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


