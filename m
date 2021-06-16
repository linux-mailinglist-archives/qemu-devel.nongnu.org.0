Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E83A9B4B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:57:58 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltV7F-0007uo-CV
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ltV5P-0006VW-5B
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ltV5M-0005bY-Uz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623848158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w/58mSFjvynOR2cGgwwVvPQ3Nqk1RwufGQt/NOowbYU=;
 b=SR7T/gdgL1zWWReudc3D9x29jlDPZp+YpihlLIBGUT8mswDD6zrEPVUXLkmqvXEc4TkXch
 iVPQ7Pkm0xluTC45zeBbnFA7P+wgwUZk0YNVHuuW4JmT6JFwUK+El7howT+jo/GK0dB+nL
 U4p/Dq+5sQLbtTEy+LZWYl96MaxT4io=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-TgDZa9ucMS-4zqi3atayQQ-1; Wed, 16 Jun 2021 08:55:57 -0400
X-MC-Unique: TgDZa9ucMS-4zqi3atayQQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so1107464wrs.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=w/58mSFjvynOR2cGgwwVvPQ3Nqk1RwufGQt/NOowbYU=;
 b=gwOY++Ko7RK/MmIwM0yaCmf+GPfwsKuQflHMrd1O3gqcAVdmgE5j9sxvnWlqanQ8vW
 wjiPaT0UjDoDxXOwyyN7YXpi/aU37vRTo4rWvknVe/ITT12JJsA4oxWhtXlMmTx2JznB
 VYS+uOM7SKD3l1NvfpV/kgOlwyuQM6BOd6apzNAJDxNLElLGsoKEkdKAnENJPIT3uPaW
 Qe8NugpSLwhpIatw6Gp0LWZTCHoxwSY0MW+qK2A8Xz9p1L4/A/IK/JKnzYLuLGyo9Pcg
 hzyfgC5CpPglRmpe0bm/Io/S6CBKR4M3BgXWml2/w4ggEhEq2KHiUrnO6t/hC5QgtTrj
 oKow==
X-Gm-Message-State: AOAM5317H0nBOoZCRkXvF8AYd7TpqYvprhH9w9OBasz+FEkhzJ/5x+mR
 7p6RFqM8AExdzkTvdiVRz4Crfwrn5cXOYG4ocJYsQMO6xJiEHiLcoFBcyfogDr45T6gMkXOmWKi
 wMT6tW+5xxqvIOmQ=
X-Received: by 2002:a05:600c:3397:: with SMTP id
 o23mr5179646wmp.10.1623848156501; 
 Wed, 16 Jun 2021 05:55:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPCoLaBqeyjEjNyaiCzr8V3mCDup+p8k3EtHf6vzggrvKcosWXChFvwZeA76XyJJb1ygdBiw==
X-Received: by 2002:a05:600c:3397:: with SMTP id
 o23mr5179613wmp.10.1623848156237; 
 Wed, 16 Jun 2021 05:55:56 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id n13sm2435224wrg.75.2021.06.16.05.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:55:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
In-Reply-To: <20210615175523.439830-3-peterx@redhat.com> (Peter Xu's message
 of "Tue, 15 Jun 2021 13:55:23 -0400")
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 16 Jun 2021 14:55:55 +0200
Message-ID: <87pmwm0y04.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: quintela@redhat.com
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
> source should be mostly enough, but let's change the dest too to make them
> match always.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Why we check with 4096 and not whatever the kernel returs?

So ....

> @@ -467,6 +471,8 @@ typedef struct {
>      bool use_shmem;
>      /* only launch the target process */
>      bool only_target;
> +    /* Use dirty ring if true; dirty logging otherwise */
> +    bool use_dirty_ring;

make this an int

>      char *opts_source;
>      char *opts_target;
>  } MigrateStart;
> @@ -573,11 +579,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>          shmem_opts = g_strdup("");
>      }
>  
> -    cmd_source = g_strdup_printf("-accel kvm -accel tcg%s%s "
> +    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
>                                   "-name source,debug-threads=on "
>                                   "-m %s "
>                                   "-serial file:%s/src_serial "
>                                   "%s %s %s %s",
> +                                 args->use_dirty_ring ?
> +                                 ",dirty-ring-size=4096" : "",

check if it is > 0 here and otherwise pass it

>                                   machine_opts ? " -machine " : "",
>                                   machine_opts ? machine_opts : "",
>                                   memory_size, tmpfs,
> @@ -587,12 +595,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>          *from = qtest_init(cmd_source);

> +static bool kvm_dirty_ring_supported(void)
> +{
> +#if defined(__linux__)
> +    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
> +
> +    if (kvm_fd < 0) {
> +        return false;
> +    }
> +
> +    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
> +    close(kvm_fd);
> +
> +    /* We test with 4096 slots */
> +    if (ret < 4096) {

And we return this value.

> +        return false;
> +    }
> +
> +    return true;
> +#else
> +    return false;
> +#endif
> +}

Mental note, don't we have a function inside tests/ that check if
a kvm feauture is there?

Quick check seems to imply no.

On the other hand, KVM_CHECK_EXTENSION is basically only used on
kvm-all.c

Later, Juan.


