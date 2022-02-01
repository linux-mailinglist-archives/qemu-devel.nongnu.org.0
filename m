Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BF4A680C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:34:58 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1jl-0004QP-Cc
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nExwe-0004KP-L2
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:32:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nExwc-0002FW-Lg
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643740317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0bO7/RIBD+J1mJ/5JCP0H5lHbXE+fFmHcCNBf1GOHc=;
 b=RRoem7KOwi1AkTz3iu++4jCvzwfiGJPHntWOpl/otWUzi22fTUmTtFdDRRCsNEuL/YgQle
 eaFsnTFNr1AbLf6GDN9F2AO7KZj4E/XKmNcGBpX/wKo5nUADSvZItJ2eKQ0Rva5mudS4Y8
 Wa88LF6YwCLiO0aAEC1MULhJs5LCfW4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-t3Zhp6-tNsCgYfDjHmnwig-1; Tue, 01 Feb 2022 13:31:54 -0500
X-MC-Unique: t3Zhp6-tNsCgYfDjHmnwig-1
Received: by mail-lf1-f69.google.com with SMTP id
 c7-20020ac24147000000b0042ac92336d1so6259546lfi.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0bO7/RIBD+J1mJ/5JCP0H5lHbXE+fFmHcCNBf1GOHc=;
 b=136bp7zLiFdJrQZdGmDxkufxZ98rjQkvpJuwHkmaTyBM3uTP73288+FrpfpaZeo58y
 7+tZoepz7hSYKWwZQ5Pkq9r5Ko4VLcXpHNwzgyy/mevggAH+NbZBzP/LLvVMrfhVpLJM
 OwFgW4itRUC1vfeINP/JnQCJG2Y0ztoEAOrX5imd7IYh6XAnKWGly47rmUNDjAjWrV/3
 UyyN6zRG2OVFdIK1kQJtlfR058ybgUMeV4iNkgZQrvAevt+55uoLPakZ8B086kFtF6yE
 fHSTM0NZ1WgG1Z2wAUI003hl5Db4Mbea+F+tJUb49J7zr0ibO+AHA61T+X2qgzqEGcgY
 V7lw==
X-Gm-Message-State: AOAM533RnnI3SOhgqHs1hm4DwKGjxVXOOQb9XNrBaAdJCQPl1Gjf6AAl
 8Hd/ByHtBMUpMZe+MNjdZowS4mPS78rG5M57WIGXO4JUEYtxqKnpKnVAozeT9T+ODV7sAqnGTwU
 1Y9bA8QMiQHPY+iXeRLItgX4ugiM3iDQ=
X-Received: by 2002:a05:6512:ad1:: with SMTP id
 n17mr11830544lfu.630.1643740312801; 
 Tue, 01 Feb 2022 10:31:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd/8qyC6VJEDwW9wANugGzfoT32r46d53AYikoCWixJvGScNBHgYOmXvcz2CepEyKh1WqpEuNfbrRk9t8+cgc=
X-Received: by 2002:a05:6512:ad1:: with SMTP id
 n17mr11830525lfu.630.1643740312539; 
 Tue, 01 Feb 2022 10:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20220129094644.385841-1-leobras@redhat.com>
In-Reply-To: <20220129094644.385841-1-leobras@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 1 Feb 2022 15:31:41 -0300
Message-ID: <CAJ6HWG5PjNiJ9U=6k9wdjs4JuBr7H+62r=-qTrsJTXgJ8frQzg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
To: Paolo Bonzini <pbonzini@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, 
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello David Edmondson and Igor Memmedov,

Thank you for the feedback!

For some reason I did not get your comments in my email.
I could only notice them when I opened Patchwork to get the link.

Sorry for the delay. I will do my best to address them in a few minutes.

Best regards,
Leo

On Sat, Jan 29, 2022 at 6:47 AM Leonardo Bras <leobras@redhat.com> wrote:
>
> The following steps describe a migration bug:
> 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
> 2 - Migrate to a host with EPYC-Naples cpu
>
> The guest kernel crashes shortly after the migration.
>
> The crash happens due to a fault caused by XRSTOR:
> A set bit in XSTATE_BV is not set in XCR0.
> The faulting bit is FEATURE_PKRU (enabled in Milan, but not in Naples)
>
> To avoid this kind of bug:
> In kvm_get_xsave, mask-out from xstate_bv any bits that are not set in
> current vcpu's features.
>
> This keeps cpu->env->xstate_bv with feature bits compatible with any
> host machine capable of running the vcpu model.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  target/i386/xsave_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
> index ac61a96344..0628226234 100644
> --- a/target/i386/xsave_helper.c
> +++ b/target/i386/xsave_helper.c
> @@ -167,7 +167,7 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
>          env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
>      }
>
> -    env->xstate_bv = header->xstate_bv;
> +    env->xstate_bv = header->xstate_bv & env->features[FEAT_XSAVE_COMP_LO];
>
>      e = &x86_ext_save_areas[XSTATE_YMM_BIT];
>      if (e->size && e->offset) {
> --
> 2.34.1
>


