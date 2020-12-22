Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869BF2E0B36
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 14:57:58 +0100 (CET)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriAn-0002aN-HN
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 08:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krg0i-00017r-By
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:39:24 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:33023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krg0g-0000lI-Ti
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:39:24 -0500
Received: by mail-lf1-x134.google.com with SMTP id l11so31302765lfg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 03:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEOdxOf3Oi31x+Ioc56RXk7qAlmQxla1l+5+ovO2vxQ=;
 b=bWXT6Eowm2Rd2vMNa/4HwGzq4okGY37rz4xe5Zovs/UpaMZS2IisYgX5layS+oUKXj
 eDmwWYSI6zdRbOq5+iy1gclbPIKNZq0Pni9kaKBiAzDx+J9KSzRGcO7nAMIn2VOfjweL
 29X+xUF8R0hprT20Hwa6VaFJdCaKMUy/VRKrYu2Cbg6VAwaM05YvfiXMhVW5mD3ZnLq4
 hx0JPPSzCcBl2WshQF85DQcrW8U+NDduyWp2FZWCZRzmBUE9cjEbZhCwS7z0jrfwVEiH
 5wvx5RhalETDrCmr5gZCCXovpfEifjAC9/0hH2xTAyPc4H7IFPy2ORxvz3aZfGTqJn8C
 ALFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEOdxOf3Oi31x+Ioc56RXk7qAlmQxla1l+5+ovO2vxQ=;
 b=ij5lBUJeFFDYd1SLly2jq+rr5vTcZORrQaQAISdZ55D+0jm5BCH9q5L7/F4yJiiC0N
 4hVzxo684uoWZ7DQGTAK4eljQteLyxpc2vDFeGy5Eu3WjbTfGA2V2gxqsO7uNK77e0F3
 JYa1kBYseslYCz1NxI00ZdzJU+vfG4/kwdhTxGJXbT8Q3KPIjyhJK/HaOvlFl2OwrBKR
 0kHM4YsAw2DBSgF+iKoOZ3LYxR1rNffd4qVMGnYNPvn+/kT0w4YJh594wQH3cfjPfIHP
 7wcsGx6TGKYNTFc3EtB4LGxPSusnSPCNLA1lr9eM0uSF9aWstcvN95l7vpGCzOhIXSfY
 BOrg==
X-Gm-Message-State: AOAM533afJTXIhxM5SkodsA8lFZXF8tCHeOYaVGjlCcwKPclIT9mEVDf
 zRySgofmHfn/zm7gabCRFrGdCsiotU/6qJIn5pI=
X-Google-Smtp-Source: ABdhPJxSOZZIFlE5itNqeegulycWEXMG8OkTpwJdnQNoxDMyk02F92V9oTmtGtnX+ufOiSJWRkHopx1vTFvmDN4XfzM=
X-Received: by 2002:a19:814c:: with SMTP id c73mr8138048lfd.638.1608637160635; 
 Tue, 22 Dec 2020 03:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20201222074810.GA30047@open-light-1.localdomain>
 <6846ff7a-b302-a0fd-1cd9-af0f2ee733ea@redhat.com>
In-Reply-To: <6846ff7a-b302-a0fd-1cd9-af0f2ee733ea@redhat.com>
From: Liang Li <liliang324@gmail.com>
Date: Tue, 22 Dec 2020 19:39:08 +0800
Message-ID: <CA+2MQi-qXS4BHwDuxJXN52GyA67+kv9iCoasg2knRg5ytxp1vA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] virtio-balloon: add support for providing free
 huge page reports to host
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:38 -0500
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Liang Li <liliangleo@didiglobal.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 22, 2020 at 4:28 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 22.12.20 08:48, Liang Li wrote:
> > Free page reporting only supports buddy pages, it can't report the
> > free pages reserved for hugetlbfs case. On the other hand, hugetlbfs
>
> The virtio-balloon free page reporting interface accepts a generic sg,
> so it isn't glue to buddy pages. There is no need for a new interface.

OK, then there will be two workers accessing the same vq, we can add a
lock for concurrent access.

Thanks!

Liang

