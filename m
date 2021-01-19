Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B32FAEA6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 03:13:54 +0100 (CET)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1gWn-0003gv-DE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 21:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1gVd-0002rS-54; Mon, 18 Jan 2021 21:12:42 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1gVY-0006GT-9B; Mon, 18 Jan 2021 21:12:40 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l23so11119803pjg.1;
 Mon, 18 Jan 2021 18:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w89baiizCHjvnqOa7YA3sgA8U2bXPn+u/n0GWXNemcY=;
 b=VGIk5rGfvrpKy9PPSPTLN2QodPKg2NtqwhiWCk/ptWeyREbr9oHXY/H0PM4P/CPvUR
 1kKFSgWIgpD5Bex9lzvJXGi67X8g+52cUcLf/yGNcAkUK2yz1ZNMSVnnBCwB6HeQul/n
 6jzh2+6y4kbXYJS7oub+GL2NmRB10U2FS63IeMGQVrWmE1Gc5sQQhf9sxtEWVwtrtMQC
 /UCV6kjzIELp1LkNuY54qvx3t5o13eKJ+u/9bmlmCMA4v5mT3M8/gMIUJNVU7DOXd+SY
 IOKa9QMrMlb/Apwcz5gxwbcAKDiZqwtcWTNdZ/aI4PD1jHRGXOKVfKJzC5Z7L8SpwEtP
 g6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w89baiizCHjvnqOa7YA3sgA8U2bXPn+u/n0GWXNemcY=;
 b=GMyfUG33oojIRwpqtf1qHyOzY8O1gN96Z1aWAd7nZCFc9AmvdWxAYtla3Cu+z4PQex
 yxCd2Ij0f1V/+jPWedAOYC5R/DZaoqBLopDWfMDPySwZWKxHb+ujMnu6pP0KqwuTEnCv
 wm/h3E9YkkHSU+KsS/hNDTCgPK71jCD6EyjaMrfF6NP3+u0JZluul+ibWaaqUVii8UAR
 DPWiQjUJw64NhkrIGUziSh3b+1krGEZ1zB8OcIoEW5WTT9DJhtpumDtL0LiLVw6lkxcs
 NZRRGrJ7l2LKdBjOMI3Q5lXCwWyrbT/BTsFjqvFPM1qDL8u7Qnw9snWLwuHS/ctpiMoG
 qszw==
X-Gm-Message-State: AOAM531aASnbowLMge6Z2KDKBQEaL2dm8MBAgxxyf/GDzikA4fYQgm/e
 3QvC6KRAcfbSDmFkU8YWSM4=
X-Google-Smtp-Source: ABdhPJyY0O3fWVFjdzkYLhdNVjPAR3QT73T0XdBtZJJTWgjPxH9la34Q9tGTNlW3cRiXisRjoRqwFQ==
X-Received: by 2002:a17:902:d70f:b029:de:b33a:891a with SMTP id
 w15-20020a170902d70fb02900deb33a891amr2112209ply.70.1611022354681; 
 Mon, 18 Jan 2021 18:12:34 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm17123164pgv.16.2021.01.18.18.12.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 18:12:34 -0800 (PST)
Date: Tue, 19 Jan 2021 11:12:31 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V2 10/11] hw/block/nvme: add NMIC enum value for
 Identify Namespace
Message-ID: <20210119021231.GC5939@localhost.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-11-minwoo.im.dev@gmail.com>
 <YAXusxmM1mUN4D7w@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAXusxmM1mUN4D7w@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102e.google.com
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

> Let's keep convention (or should be convention...) of using NvmeIdNs
> prefix for identify data structure fields on the enum.

Okay!

