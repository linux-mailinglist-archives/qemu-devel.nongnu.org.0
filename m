Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9B303108
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 01:54:49 +0100 (CET)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Cd6-0001Bz-MI
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 19:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4Cbg-0000Fa-4X; Mon, 25 Jan 2021 19:53:20 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l4Cbd-0002eM-Us; Mon, 25 Jan 2021 19:53:19 -0500
Received: by mail-pl1-x632.google.com with SMTP id d13so2978194plg.0;
 Mon, 25 Jan 2021 16:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qin+WfBEgvnHVcjHWlbSONJYOr7eBM+g7fW+oLFrv84=;
 b=lCcYUUCxbULeLMwJu4Ldkfru6Iu+9rtfRjShdKBkZpb159W5M5bfMDELm+LDY24+ar
 Zt/jFOb0u0/fqNsoZG2Hs0PLtKNgFkUeMfIC35qA6eDJnXvoKvJDLMWu64E3H7zATvMg
 MD4ay/FKOG/9UcHuiCWbRxWvqRjWF68n7busB3fiY1buY2TS6w3L9yqPoLgfu2qVfKex
 j5w8U5kePCaPUOD5B6r1TKYWd7tX5eGFPV5E1blTQjg34K4SIhqaO0E2BP+FEkO7h9ib
 u1T1dpb7jc/TV1h42YKZBCPtbn60JyRcSweQ8WdNc9xnrI2nDTowck/fkNzlCbm0Qm+j
 MbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qin+WfBEgvnHVcjHWlbSONJYOr7eBM+g7fW+oLFrv84=;
 b=LPkZ14+7f1FwIkAxMsjYaFSXJd4f0UAUkHdVY5yWllcMXt8hL3ZVIYeZn69JAxo+Y0
 UdBUQTlql6bTZv3vky94HUJk1AbggevUdVIdlLhj1XuLkAFWdT7tT8s69zpUuHnsx3cc
 plILRBgwlshxugnLQHluqB6xAnA0us1sqWoEsMP12OLAGy7TEAFI1r/tWeMAfnU15Aus
 FrKJEnoUDSbXjWBBXtVfoOHIKUPceOqayz5rdLtSFukrsrD9g7FbqUJEs9VvBL4lwpQD
 zFwjzfoOGfoX2X20cJ+ZyLoe/sQsoJxXRPE+lW7d1sGYCLyjDwXA5T+tcBnFpiqBGgRy
 sL8g==
X-Gm-Message-State: AOAM530j2+bEpvWHqf6ivJWj+2VYxdNdy0jgnVRIJweOsjxsHz/g/Y+c
 J2qaC8tFnsc6J3E4a3ycGOo=
X-Google-Smtp-Source: ABdhPJwe1vaQfSPNLcivQFsk3w8YP4oBr1GCH9ueibVbKuwRDcgEIn/j90tUnRdR49FAEqFBJ5YJlQ==
X-Received: by 2002:a17:902:42:b029:da:e72b:fe9e with SMTP id
 60-20020a1709020042b02900dae72bfe9emr3365886pla.31.1611622396217; 
 Mon, 25 Jan 2021 16:53:16 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id o14sm500677pjf.12.2021.01.25.16.53.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Jan 2021 16:53:15 -0800 (PST)
Date: Tue, 26 Jan 2021 09:53:13 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210126005313.GB3719@localhost.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <YA8qRozbWUr37dI3@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YA8qRozbWUr37dI3@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x632.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-25 21:29:58, Klaus Jensen wrote:
> On Jan 24 11:54, Minwoo Im wrote:
> > Hello,
> > 
> > This is sixth patch series for the support of NVMe subsystem scheme with
> > multi-controller and namespace sharing in a subsystem.
> > 
> > This version has a fix in nvme_init_ctrl() when 'cntlid' is set to the
> > Identify Controller data structure by making it by cpu_to_le16() as
> > Keith reviewed.
> > 
> > Here's test result with a simple 'nvme list -v' command from this model:
> > 
> >   -device nvme-subsys,id=subsys0 \
> >   -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
> >   -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
> >   -device nvme,serial=baz,id=nvme2,subsys=subsys0 \
> >   -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0 \
> >   -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2 \
> >   \
> >   -device nvme,serial=qux,id=nvme3 \
> >   -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3 \
> >   \
> >   -device nvme-subsys,id=subsys1 \
> >   -device nvme,serial=quux,id=nvme4,subsys=subsys1 \
> >   -device nvme-ns,id=ns4,drive=drv13,nsid=1,subsys=subsys1,zoned=true \
> > 
> >   root@vm:~/work# nvme list -v
> >   NVM Express Subsystems
> > 
> >   Subsystem        Subsystem-NQN                                                                                    Controllers
> >   ---------------- ------------------------------------------------------------------------------------------------ ----------------
> >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme0, nvme1, nvme2
> >   nvme-subsys3     nqn.2019-08.org.qemu:qux                                                                         nvme3
> >   nvme-subsys4     nqn.2019-08.org.qemu:subsys1                                                                     nvme4
> > 
> >   NVM Express Controllers
> > 
> >   Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
> >   -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
> >   nvme0    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1c0n1
> >   nvme1    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1c1n1
> >   nvme2    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1c2n1, nvme1c2n2
> >   nvme3    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys3 nvme3n1
> >   nvme4    quux                 QEMU NVMe Ctrl                           1.0      pcie   0000:00:0a.0   nvme-subsys4 nvme4c4n1
> > 
> >   NVM Express Namespaces
> > 
> >   Device       NSID     Usage                      Format           Controllers
> >   ------------ -------- -------------------------- ---------------- ----------------
> >   nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0, nvme1, nvme2
> >   nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
> >   nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
> >   nvme4n1      1        268.44  MB / 268.44  MB    512   B +  0 B   nvme4
> > 
> > Thanks,
> > 
> > Since V5:
> >   - Fix endianness for 'cntlid' in Identify Controller data structure.
> >     (Keith)
> > 
> > Since V4:
> >   - Code clean-up to snprintf rather than duplicating it and copy.
> >     (Keith)
> >   - Documentation for 'subsys' clean-up.  (Keith)
> >   - Remove 'cntlid' param from nvme_init_ctrl().  (Keith)
> >   - Put error_propagate() in nvme_realize().  (Keith)
> > 
> > Since RFC V3:
> >   - Exclude 'deatched' scheme from this series.  This will be covered in
> >     the next series by covering all the ns-related admin commands
> >     including ZNS and ns-mgmt. (Niklas)
> >   - Rebased on nvme-next.
> >   - Remove RFC tag from this V4.
> > 
> > Since RFC V2:
> >   - Rebased on nvme-next branch with trivial patches from the previous
> >     version(V2) applied. (Klaus)
> >   - Fix enumeration type name convention with NvmeIdNs prefix. (Klaus)
> >   - Put 'cntlid' to NvmeCtrl instance in nvme_init_ctrl() which was
> >     missed in V2.
> >   - Added 'detached' parameter to nvme-ns device to decide whether to
> >     attach or not to controller(s) in the subsystem. (Klaus)
> >   - Implemented Identify Active Namespace ID List aprt from Identify
> >     Allocated Namespace ID List by removing fall-thru statement.
> > 
> > Since RFC V1:
> >   - Updated namespace sharing scheme to be based on nvme-subsys
> >     hierarchy.
> > 
> > Minwoo Im (6):
> >   hw/block/nvme: introduce nvme-subsys device
> >   hw/block/nvme: support to map controller to a subsystem
> >   hw/block/nvme: add CMIC enum value for Identify Controller
> >   hw/block/nvme: support for multi-controller in subsystem
> >   hw/block/nvme: add NMIC enum value for Identify Namespace
> >   hw/block/nvme: support for shared namespace in subsystem
> > 
> >  hw/block/meson.build   |   2 +-
> >  hw/block/nvme-ns.c     |  23 +++++++--
> >  hw/block/nvme-ns.h     |   7 +++
> >  hw/block/nvme-subsys.c | 106 +++++++++++++++++++++++++++++++++++++++++
> >  hw/block/nvme-subsys.h |  32 +++++++++++++
> >  hw/block/nvme.c        |  72 +++++++++++++++++++++++++---
> >  hw/block/nvme.h        |   4 ++
> >  include/block/nvme.h   |   8 ++++
> >  8 files changed, 242 insertions(+), 12 deletions(-)
> >  create mode 100644 hw/block/nvme-subsys.c
> >  create mode 100644 hw/block/nvme-subsys.h
> > 
> 
> Thanks Minwoo! This really is great stuff.
> 
> Notwithstanding the nitpicks I've pointed out for [1/6] and [6/6] (no
> need to v7 for those), take my
> 
> Tested-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

Thanks Klaus!

