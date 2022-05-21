Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30F52FA21
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:57:43 +0200 (CEST)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKve-0002sA-OA
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nsKsf-0000iU-Fp
 for qemu-devel@nongnu.org; Sat, 21 May 2022 04:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nsKsc-0006pH-HU
 for qemu-devel@nongnu.org; Sat, 21 May 2022 04:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653123273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uMXb1QJ8p+egwSXVcnqkwfUvACuYgu7JP1Fnnb6+/lg=;
 b=iy8aVal33d4MLttEVic3n4rD6K+4QCU8f/u5lu+z+GBWIySEgh39X45whn2kIETNJFJSlj
 dD/LY/vgc6N8P8uP5dWFMVoANrzby5svZXj7FmkS0730KpZp9XnKv44jmgFSVFCvra9g1Y
 HFH9YUmjZgkFcZbugD4VuRQPoFNvgn4=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-_m3y5sKCN76rbiyIw6WRUQ-1; Sat, 21 May 2022 04:54:31 -0400
X-MC-Unique: _m3y5sKCN76rbiyIw6WRUQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 e185-20020a6369c2000000b003d822d1900eso5250395pgc.19
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 01:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMXb1QJ8p+egwSXVcnqkwfUvACuYgu7JP1Fnnb6+/lg=;
 b=fhXQF+WAzqDAeYidmT6saPeoU45EHPF2s+FvhLgTj2rue0D3+Rp9wnrH0veMYuTsv4
 7nyeKYpkNqv81JemSOfKfSG5TQvaySuUc0U/pzHhWcNDnP8//YZFbT4gWPZHCivz9rVb
 yoDSwLlIQu/asnEGivRkub/LvS4Tqgnja13zkLcx0iKW+CtSxW8gDydQz1vl8BZ3n+uK
 JgmvSvJEUYTOsCUWcX+s4i7SisZVHUxgUO0xcqUwT85CdqOlnHdO9sntyZIpfIqp01Rh
 GEwT7sq0BqRp8mSfxaAfld3dCGt1oC/u96GDJ0wBqCGKWMydwvP1EE38Pq2aHC1lZJZ7
 8TWg==
X-Gm-Message-State: AOAM531ii21PnPg3CbQN+BF/eq6C7Wq1+OlBCnXP+sD4QTIQX9d5eyke
 Xu78e4kcxEqzgDC0oOhjYVSk/n3OMlnJg7sQDSOp3wbtX4IA7g3n2cXAmDhqEw1Qnt4xOmiLG++
 ss24OPV53Fm8+tChqKPu1lu9wHkld8vI=
X-Received: by 2002:a65:60d3:0:b0:39c:f431:5859 with SMTP id
 r19-20020a6560d3000000b0039cf4315859mr11867854pgv.442.1653123270256; 
 Sat, 21 May 2022 01:54:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjA/AY+yBQZ3IkzyAJpkZ/LIpp/XClXuv5SLddVQ0bSaa0iUKCDxgP6Y2iEEnyuNPzX1kC2Owyf7Cv1zoIaPo=
X-Received: by 2002:a65:60d3:0:b0:39c:f431:5859 with SMTP id
 r19-20020a6560d3000000b0039cf4315859mr11867841pgv.442.1653123269947; Sat, 21
 May 2022 01:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <be14c1e895a2f452047451f050d269217dcee6d9.1653071510.git.maciej.szmigiero@oracle.com>
In-Reply-To: <be14c1e895a2f452047451f050d269217dcee6d9.1653071510.git.maciej.szmigiero@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 21 May 2022 10:54:18 +0200
Message-ID: <CABgObfZfV66MN11=xEjwH0PE944-OTcAZkSpWEcJeK=1EYWJnw@mail.gmail.com>
Subject: Re: [PATCH] target/i386/kvm: Fix disabling MPX on "-cpu host" with
 MPX-capable host
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm <kvm@vger.kernel.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 20, 2022 at 8:33 PM Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
>
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>
> Since KVM commit 5f76f6f5ff96 ("KVM: nVMX: Do not expose MPX VMX controls when guest MPX disabled")
> it is not possible to disable MPX on a "-cpu host" just by adding "-mpx"
> there if the host CPU does indeed support MPX.
> QEMU will fail to set MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS MSRs in this case
> and so trigger an assertion failure.
>
> Instead, besides "-mpx" one has to explicitly add also
> "-vmx-exit-clear-bndcfgs" and "-vmx-entry-load-bndcfgs" to QEMU command
> line to make it work, which is a bit convoluted.
>
> Sanitize MPX-related bits in MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS after
> setting the vCPU CPUID instead so such workarounds are no longer necessary.

Can you use feature_dependencies instead? See for example

    {
        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
        .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
    },

Paolo


