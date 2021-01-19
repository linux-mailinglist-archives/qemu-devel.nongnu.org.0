Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00C2FAEA3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 03:13:17 +0100 (CET)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1gWC-0002wA-WA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 21:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1gUq-0002I8-M8; Mon, 18 Jan 2021 21:11:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1gUl-0005zk-Oy; Mon, 18 Jan 2021 21:11:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id x20so5722141pjh.3;
 Mon, 18 Jan 2021 18:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oYX7WH1q73YvJMsN84d/tzSDrUBVXJsHzqObQxeV+3s=;
 b=pSxOwRE5P9dWPvTvDsDWPf2q8kUBJ1PBBQED1A0DoZASWzIwShpALSbxZNRXFZCFtL
 fQsJs+wnf+636yOOtk74uHc+yEsiz/b2ikMa3lniZuMFBLYGbc5Cb7flcOcWGbQJnPmg
 H6O0cjS2JDMFNppw0dbbq1PsiQ0Fh861ka0jmSBcDxqx7DTRdgpSVdCzG3LECGT3C19q
 zwaN5CX+jB20CxxdnvMF80Li4RP/WscKc+JkG0v0iA1IxRhwmhBw7UAVLSm59c6OLi07
 S8IiPYDnI3r6WFfXA30mslbsY/7qyoS+Ydr10L8wx7kSG4v7sVtDQ+FJ3IU0QJIXgzdq
 LfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oYX7WH1q73YvJMsN84d/tzSDrUBVXJsHzqObQxeV+3s=;
 b=HE5C3lh/cWFJAuvzkeJ/mTSc8MA6zUPQDr4LLzwdrcz48ue3XWU5YXEnTWu1O6pfTS
 5ZP+KGlM9tyM96Ua9TDfvV+uD8/0D/nKZRkORX8MC+kpBS48h4m61zD7YNbSeBl/f65Z
 hlTd3pSXyBEctjY7E4cHInkwfNuGjcwmAPpsGkWqoSHNc4TXRjn6Q9cxM2Y/EqOt75ye
 wrH7EuXXwFITIFsdGugEqI09U34dHrAL6ipdE6jWZUCHyOd0YMbbRhAQJCCtyn6RUghI
 orqYxQ9mG3y9nbo5PXpcHD6FkKAEC09wAThV/OyVnYMlpMR6NuMOkehIp2mkQhP33iIb
 pMRA==
X-Gm-Message-State: AOAM530YlKKeUKDQ8PDn23QSzB4PXq+ZLNiwGcTDIUysKvSATQVDnxkk
 XcXIly7DKfyUCQyyTcQ86Uc=
X-Google-Smtp-Source: ABdhPJwlv42OmDDTvYasL+V7m0fPr9IMQ0U9G71+fAZz83Tt20r6lbjZR6Sn07Z/MZIUASH/jJbF/g==
X-Received: by 2002:a17:90b:107:: with SMTP id
 p7mr2483790pjz.110.1611022305812; 
 Mon, 18 Jan 2021 18:11:45 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id fr1sm650855pjb.7.2021.01.18.18.11.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 18:11:44 -0800 (PST)
Date: Tue, 19 Jan 2021 11:11:42 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <20210119021142.GB5939@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
 <YAWHSaXmpo64xmmp@apples.localdomain>
 <20210118130946.GJ18718@localhost.localdomain>
 <YAWI2sFftUEspcT+@apples.localdomain>
 <20210118131205.GK18718@localhost.localdomain>
 <YAWLi/ynEMfyQ66T@apples.localdomain>
 <YAXgMluXNBuIaoPo@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAXgMluXNBuIaoPo@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1029.google.com
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
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-18 20:23:30, Klaus Jensen wrote:
> On Jan 18 14:22, Klaus Jensen wrote:
> > On Jan 18 22:12, Minwoo Im wrote:
> > > On 21-01-18 14:10:50, Klaus Jensen wrote:
> > > > On Jan 18 22:09, Minwoo Im wrote:
> > > > > > > Yes, CMB in v1.4 is not backward-compatible, but is it okay to move onto
> > > > > > > the CMB v1.4 from v1.3 without supporting the v1.3 usage on this device
> > > > > > > model?
> > > > > > 
> > > > > > Next patch moves to v1.4. I wanted to split it because the "bump" patch
> > > > > > also adds a couple of other v1.4 requires fields. But I understand that
> > > > > > this is slightly wrong.
> > > > > 
> > > > > Sorry, I meant I'd like to have CMB for v1.3 support along with the v1.4
> > > > > support in this device model separately.  Maybe I missed the linux-nvme
> > > > > mailing list for CMB v1.4, but is there no plan to keep supportin CMB
> > > > > v1.3 in NVMe driver?
> > > > 
> > > > I posted a patch on linux-nvme for v1.4 support in the kernel. It will
> > > > support both the v1.3 and v1.4 behavior :)
> > > 
> > > Then, can we maintain CMB v1.3 also in QEMU also along with v1.4 ? :)
> > 
> > My first version of this patch actually included compatibility support
> > for v1.3 ("legacy cmb"), but Keith suggested we just drop that and keep
> > this device compliant.
> > 
> > What we could do is allow the spec version to be chosen with a
> > parameter?
> 
> Uhm. Maybe not. I gave this some more thought.
> 
> Adding a device parameter to choose the specification version requires
> us to maintain QEMU "compat" properties across different QEMU version.
> I'm not sure we want that for something like this.

Agreed.  The default should head for latest one.

> 
> Maybe the best course of action actually *is* an 'x-legacy-cmb'
> parameter.

This looks fine.

As kernel driver does not remove the v1.3 CMB support, then it would be
great if QEMU suports that also.

