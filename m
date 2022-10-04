Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB95F476B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:22:14 +0200 (CEST)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofkgO-0003s4-QR
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ofk1W-0008E0-Cj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:39:58 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ofk1T-0008Lw-BY
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:39:57 -0400
Received: by mail-lf1-x130.google.com with SMTP id d18so8641122lfb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4t0N2bprBniMQRcB/3qFmooQSc3A7XC7fAMoxb8s4/g=;
 b=C32agy2ULzvIFgr79jFj59nUVP8RorH8QzYqciN6EgVs+VNKdcz7q4CV/cJPDoLkap
 pVTwYnTBSzV/xbP8DR8g+Dr1SHKCjwbo4G9hBlXcZSlyQG6x3rI5yk5KP4hhxK51maiq
 GP4iRrKEtjAkaonVPyD30GbmgQGksw1icwsTsXjv/kNyrKGTYdP6fKKGZgSaiUqI3juO
 TyeWtPibkqaL2vZDx0wGOtu2LSjjCW1+OvOFPT1TJy4tZObbK3E+/gzHjnf3ezE02F3Y
 hBrNuVTSe81htxqDyxYC1pzaQL1kYbCggbjBGk/VdPqGw0kb39aLFZdyhvA2ugVE0H/d
 e/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4t0N2bprBniMQRcB/3qFmooQSc3A7XC7fAMoxb8s4/g=;
 b=dhmYt3GOJKXiHATSXt6V9F8oaVUz7gfHeR+KfEFTPU22Q5ncfwh4vxouvT2iG2nxeU
 6SqpLe6CTOioRPkc13YfoBRVFejJfEhskJtj1FVWL3ZlBXtEVylS8Yt8UjF7SgofOfe/
 WOwyTL0Z01imPvau7QUY3OSvirheV4QSEooOADRN234amz2NngqK5jPr964biSVV8OvZ
 /zhmoaBF+a2wSSf7gH+2y6jXwgSgMO/3iyPEA5BPrMTyE7eXLo9gyRm9b67YweFIyv1L
 Lxv2/JoTF/6Xp7wNW6VPBCoKimkz5gdcjSqT4t4soP52FaqGb0xVUwsgSvEwBDtWvyNv
 Y1bA==
X-Gm-Message-State: ACrzQf1BqgRQoNTgeobY/p9rycPUmeps7ISNfUO1JnEDrMLsXQuwvV+B
 XFd4JZWcQbfSd/lfq/7rkV6brGHq3cAfpa3Eefj8Lw==
X-Google-Smtp-Source: AMsMyM5k0EwfNM7bE4QTJeF9u69v1+y2xAlpFHPuF6waoo+QftXzYBsJvVbwshD+nLREU1ta1b6NNHSmr8A/Tz3xiMY=
X-Received: by 2002:a05:6512:2392:b0:4a2:550a:e21d with SMTP id
 c18-20020a056512239200b004a2550ae21dmr1274483lfv.550.1664897992505; Tue, 04
 Oct 2022 08:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <CA+EHjTyrexb_LX7Jm9-MGwm4DBvfjCrADH4oumFyAvs2_0oSYw@mail.gmail.com>
 <20220930162301.i226o523teuikygq@box.shutemov.name>
 <CA+EHjTyphrouY1FV2NQOBLDG81JYhiHFGBNKjT1K2j+pVNij+A@mail.gmail.com>
 <20221003110129.bbee7kawhw5ed745@box.shutemov.name>
In-Reply-To: <20221003110129.bbee7kawhw5ed745@box.shutemov.name>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Oct 2022 16:39:15 +0100
Message-ID: <CA+EHjTzS1YDS0DxMyKaUqgykKp5G637NoGPQxdORQfLfKRNqrQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=tabba@google.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

Hi,

On Mon, Oct 3, 2022 at 12:01 PM Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Mon, Oct 03, 2022 at 08:33:13AM +0100, Fuad Tabba wrote:
> > > I think it is "don't do that" category. inaccessible_register_notifier()
> > > caller has to know what file it operates on, no?
> >
> > The thing is, you could oops the kernel from userspace. For that, all
> > you have to do is a memfd_create without the MFD_INACCESSIBLE,
> > followed by a KVM_SET_USER_MEMORY_REGION using that as the private_fd.
> > I ran into this using my port of this patch series to arm64.
>
> My point is that it has to be handled on a different level. KVM has to
> reject private_fd if it is now inaccessible. It should be trivial by
> checking file->f_inode->i_sb->s_magic.

Yes, that makes sense.

Thanks,
/fuad

> --
>   Kiryl Shutsemau / Kirill A. Shutemov

