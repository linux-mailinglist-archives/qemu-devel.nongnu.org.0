Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35C562008
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 18:14:08 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wnv-0008B5-8m
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 12:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o6wlj-0006Hb-HS
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 12:11:51 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dionnaglaze@google.com>)
 id 1o6wlh-0002vo-Ab
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 12:11:51 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-317a66d62dfso184029187b3.7
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35ohpAR7cqH9U9RyAn52Y1KeS3AQQHvr9QCi1XZdTpg=;
 b=eY95lJBmcdlK0EwfQODP9AvJyJ99kW8OGcAWWEwWNSPGJw35l3xlz1W+pqvmj9u7RK
 f1kUgkjbYzJbpRm7P76ezLacp/vW9dEG4h8sTRXcgjGYwwW4jJeWuc4Ya1XOfRh9waE3
 RFS38djZZIrfRz0j+WrPk9kSf77f3PNzXWId3Sjxy5lUJb9iUIbm8LJysjLiaCHUzb9d
 vDS6NeAKNVbWRr2Q4NibE5QK+J4E1Nsec42oOnZu4VtD3tR0NEQIWWgtfM5Fe0C8EYHy
 FFvUu8DqrUFaCN9p/OQan5xeK0UUhe+ebMLQtPYV3KFr5hQd0I3WNayF9KUoyoNJT5Gt
 nhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35ohpAR7cqH9U9RyAn52Y1KeS3AQQHvr9QCi1XZdTpg=;
 b=UzZmSZTlcQJxgyKxzURTxxu+BUbv+V8iDfZqAZ+WkeoFM14oiVoZm+sBy5MeTCfL1E
 Du60ObJ8GiX1bM1j+2TWihROOR4IMIfQfMOJwyOmGZ8JFfF9rs/WgGGtDK7BR01Z1y9p
 RSYAe/6pNVoL0gK/l4SSKBV6fMiBTVWLHzsJLgufVaFnSu5yEQ1Lqc1XeEjeYnTe4qx6
 dJf8FR/TbAcKSnVyOJWo0H36+CQ42h9nmWglJdWi52ApYahG7CYw8RVEfaUnRSTY44Bc
 fkr2ACIKPMA1+b1JAFkUczE/dICXAaVWYGW+U6cclytvTrUTDeVFFdWZNxdrkriqhmSO
 DK5g==
X-Gm-Message-State: AJIora/dzxIF9InuLeG3HdUyb3Syfgt1xMGDo21ew7FbduqE8J0SbYjT
 pi1N8lBCvfRooP4u1U8EQE8mifVaMALLhlRZG3tauA==
X-Google-Smtp-Source: AGRyM1vCpZl3xnje8qjilvDpbsZrN0PzMVWLXy9VUU8EQRUjnBeOmcQvMf4njaP/oZniXnjDYvJIJNG6poE1xy2BsdM=
X-Received: by 2002:a0d:d416:0:b0:318:88a8:ca4f with SMTP id
 w22-20020a0dd416000000b0031888a8ca4fmr11812662ywd.371.1656605505325; Thu, 30
 Jun 2022 09:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220629193701.734154-1-dionnaglaze@google.com>
 <Yr1bYiA1w/lMX76k@redhat.com> <be2ebbbf-1568-1eb5-b2ff-73819d4e872d@amd.com>
In-Reply-To: <be2ebbbf-1568-1eb5-b2ff-73819d4e872d@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 30 Jun 2022 09:11:34 -0700
Message-ID: <CAAH4kHaLbOjsqWEB2EehwcHpQwH8vaqgqmRUiNpEnMDtUyT4oA@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: Add unaccepted memory configuration
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Xu@google.com, Min M <min.m.xu@intel.com>, 
 Xiaoyao Li <xiaoyao.li@intel.com>, Gerd Hoffman <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>, 
 "open list:X86 KVM CPUs" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dionnaglaze@google.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

> > The most recent patches I recall for SEV-SNP introduced a new
> > 'sev-snp-guest' object instead of overloading the existing
> > 'sev-guest' object:
> >
> >    https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04757.html
> >
>
> Correct, the SNP support for Qemu is only RFC at this point until the KVM
> support for SNP is (near) finalized.
>

Ah okay, should I wait until that RFC patch set is merged to propose
an extension to it, or should I coordinate with y'all at AMD to
include this in your patch set?

Apologies Pankaj, I forgot the change log (still new to git
send-email). The change is that the configuration option is no longer
in MachineState, but part of SevGuestState, with accessor functions
for fw_cfg.c to know if it needs to add the fw_cfg file and what its
value should be. That was the main feedback on v1.

-- 
-Dionna Glaze, PhD (she/her)

