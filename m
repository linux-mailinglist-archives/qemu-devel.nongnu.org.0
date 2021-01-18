Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF92FA123
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:19:29 +0100 (CET)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1URM-0002yb-VP
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1UKM-0008Qg-1u; Mon, 18 Jan 2021 08:12:14 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1UKI-00037d-62; Mon, 18 Jan 2021 08:12:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id b3so10194065pft.3;
 Mon, 18 Jan 2021 05:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qDGOIEYY8taQXW5RRZu0Ue/H37F961dJWDVe4CxpEFQ=;
 b=BSeqwRpqB6XFffjAHIe6uFypWMSBXJ3jXxjOQV62lsM4ygaarH3m6Gh/SNkfLA9r4a
 xBQ1P2ShyvkvivMWQG+10FyV5kfH9r8n2jnvZpG3i57ul3wbwrfWKNtftguMxG6DesY2
 pheVvlmG/Ch2X4Ccp0JPi9gI2aFHZ6PppN8LYktAYcG3o5wUmhXwlsvMVOBRp45q4fn4
 kWNifEDyIBF9OKN2fMA1fD6oj0wJaXAowuKFigXS1It/sydpIxsXGgZj8npcJse87HcZ
 UYebBb1OosC0UP7PYA+qNKpSrvkJL4w0QN6pZV7cOCMvLV45/7uftk7jZpabH1JbuZbv
 8VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qDGOIEYY8taQXW5RRZu0Ue/H37F961dJWDVe4CxpEFQ=;
 b=fZrcvVtJiDaD5RXm7f505YMr0PWMd1wcZ9Ztz9QPqK3lQPV55AbeIwmSs7hP6oRABs
 3Vy50Ln3mTca/9QQj2eYc34X2TyYw9PqaiyqYDkWCHXDjCBd3Cd3HEGXy1oZ0eKA92wJ
 xiy3cDzpLTnpPxAkxoWvNdc2g7xyrCw0zybNuXJJjk+8yE82FAnRM0kSsUJ24t6nWgbR
 LQCSPHPlrQO14T3x9HnXH5ggPEryhShHQch/Ge1HebcI3vwQH8jOcTnLDUeREePsh2EP
 yq3dZUyoMlyOXmONgpLg+E+ZYVtGaKSYF2fk3RiQCeBb+JJeABETzpCeiZj/qGew9eoC
 lxEQ==
X-Gm-Message-State: AOAM533Q7TdwRdfMALFXQCub+j4TnsSHiRbss3qcW2tx911EWAGIMUFe
 5MdwoXa7jcF7hbS+AiNtETg=
X-Google-Smtp-Source: ABdhPJzfaGKcy8RP4d6VVOI4XREL2QpWfb8fR40nkrD3W/vvQBSk5VuPicegNijD079iQIBuo6Kr4A==
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr26401949pfe.21.1610975528556; 
 Mon, 18 Jan 2021 05:12:08 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m77sm15647605pfd.105.2021.01.18.05.12.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:12:08 -0800 (PST)
Date: Mon, 18 Jan 2021 22:12:05 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <20210118131205.GK18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
 <YAWHSaXmpo64xmmp@apples.localdomain>
 <20210118130946.GJ18718@localhost.localdomain>
 <YAWI2sFftUEspcT+@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAWI2sFftUEspcT+@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-18 14:10:50, Klaus Jensen wrote:
> On Jan 18 22:09, Minwoo Im wrote:
> > > > Yes, CMB in v1.4 is not backward-compatible, but is it okay to move onto
> > > > the CMB v1.4 from v1.3 without supporting the v1.3 usage on this device
> > > > model?
> > > 
> > > Next patch moves to v1.4. I wanted to split it because the "bump" patch
> > > also adds a couple of other v1.4 requires fields. But I understand that
> > > this is slightly wrong.
> > 
> > Sorry, I meant I'd like to have CMB for v1.3 support along with the v1.4
> > support in this device model separately.  Maybe I missed the linux-nvme
> > mailing list for CMB v1.4, but is there no plan to keep supportin CMB
> > v1.3 in NVMe driver?
> 
> I posted a patch on linux-nvme for v1.4 support in the kernel. It will
> support both the v1.3 and v1.4 behavior :)

Then, can we maintain CMB v1.3 also in QEMU also along with v1.4 ? :)

