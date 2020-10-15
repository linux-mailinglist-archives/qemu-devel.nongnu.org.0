Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8328EBB7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 05:46:05 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSuDM-0006Np-3a
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 23:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1kSuBi-0005tN-1D
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 23:44:22 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1kSuBd-0003oh-HO
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 23:44:21 -0400
Received: by mail-lj1-x242.google.com with SMTP id m16so1644633ljo.6
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HHTEFLARrai9jAcwvYx9rODqAnP/mRVKE4w7Ff4URe4=;
 b=qfZILCfxkUpQvE6YU3Z9UodjGZTM49N99Qs09Qi/4D5OgMHut9bruj5fsGafj+WSqd
 IzSk2arafb2CF6N468LF2DMB9Ru6VOsUrx9OcRJnPaGGsxkEQlQEFe5Iruz9ANnaL6qo
 bFrI68ljv6tVt4AR+c/yd/G4suzPxvqoS+5sfzfdLVbRfwnsTEhIx5p60B2AylA92DYL
 lKwZtP2S8JaHJAQeuulu5cQ2npU0PtTcVhmbsSsDcsjyI4LIW95dIePKGAen64iJDxMS
 7/cvyDiaoN5ikqwUy82WUUjLha/tTcqc+TG96F+SsaIDxH6/WVUQR1Xu7K80mlEnsf3P
 mf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHTEFLARrai9jAcwvYx9rODqAnP/mRVKE4w7Ff4URe4=;
 b=bNrVGY+J1+aNFom47WQQ6BjQiuuYWxye0LDHmJ3Y/5jNtaThJTFHZbaIxpm3kPLder
 NXai/81c7FuhlR7f4LcBz1L+6If9/McLPJGz/o6Rhr3JTsBCURuJtR284laySEUUxyO4
 F5GP4ro2v8oMgRxRmyjmjpVgC4JYccDCOx5fTHETEW8KzGbF48B0E9Ru9ooyJfImbL3i
 /zFoNr1DORZyMlo7tY+wSOt9aS8sYRvvVLZcMX6YeSKxw05fL7FilQ4luk1ZCQtYSvBB
 305vGzKBGBEUjEGPdJunKOZ4DLKEw9K12G22xVnYDQee69xWZikIvKANB6g9RRenxSVr
 9GBg==
X-Gm-Message-State: AOAM531arfS+Ni0tUoNqSOp+eB49CGJb/Tp25Mkf8h2jsp2s62pp08uw
 FzUDNtZC+b4VlZQeZqUDBrakyx9/65zdnQpeBOQ=
X-Google-Smtp-Source: ABdhPJwrojk583U17UFreB26E6EJBzeY9pns7nnbhf5WVPSQWFljj9y5nCaSrAUUweCPWKFxAyW3SN3Koo6Xjpsvyx8=
X-Received: by 2002:a2e:b006:: with SMTP id y6mr419563ljk.462.1602733454595;
 Wed, 14 Oct 2020 20:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqMd4_58_+QKetjOsubBqrDnaYF+YWE3TC3kEcNGxPiPfg@mail.gmail.com>
 <47ead258320536d00f9f32891da3810040875aff.camel@redhat.com>
 <CA+-xGqOm2sWbxR=3W1pWrZNLOt7EE5qiNWxMz=9=gmga15vD2w@mail.gmail.com>
 <20201012165428.GD26135@linux.intel.com>
 <CA+-xGqPkkiws0bxrzud_qKs3ZmKN9=AfN=JGephfGc+2rn6ybw@mail.gmail.com>
 <20201013045245.GA11344@linux.intel.com>
 <CA+-xGqO4DtUs3-jH+QMPEze2GrXwtNX0z=vVUVak5HOpPKaDxQ@mail.gmail.com>
 <20201013070329.GC11344@linux.intel.com>
 <CA+-xGqO37RzQDg5dnE_3NWMp6+u2L02GQDqoSr3RdedoMBugrg@mail.gmail.com>
 <626a8667-be00-96b7-f21d-1ec7648ee1e6@redhat.com>
In-Reply-To: <626a8667-be00-96b7-f21d-1ec7648ee1e6@redhat.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Wed, 14 Oct 2020 23:43:54 -0400
Message-ID: <CA+-xGqMdVm1tqDMt9PTOxi80oEW_3pFiQaH+WvQfpZ9K1QJKDw@mail.gmail.com>
Subject: Re: Why guest physical addresses are not the same as the
 corresponding host virtual addresses in QEMU/KVM? Thanks!
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PLING_QUERY=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo and Sean,

It is clear to me now. Thanks much for your reply and help.


Best regards,
Harry

