Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E695F2FB623
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:46:24 +0100 (CET)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qOt-00010X-LA
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1qNY-0000BU-MP; Tue, 19 Jan 2021 07:45:00 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1qNU-0002Sw-RO; Tue, 19 Jan 2021 07:45:00 -0500
Received: by mail-pj1-x1031.google.com with SMTP id m5so12116015pjv.5;
 Tue, 19 Jan 2021 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rQ+ZEyD7s0o8uCj/44rJMqm1ByRnOwXZmTr/WQoyBP0=;
 b=AfDTa2aGdMYptyUWYZqKlb9mQO0upR9HCPGcvZU55bOR4rwRn6UxK0EOwZRLVXMcQ0
 f5hRhy5azgdrWHqFcA8eLC0oOMru+8ITGjotBvhrigyTG7iil1806h2Ppl+P+PeUD9i0
 gC8tq9JTaCCTBT8PvKIx03sy23xztdP+hzvBEYqInRyEeSxnDaGZJH/DSpNPxflLakAW
 K3ipR51HbgxmiWNbVkdx0qPv1XizJeiJJVc1MY1FFH9SY6oWlqvTS0Y7bmO+FUg+TnYl
 xTgIGW/mgK63crykan5KusZsENfIvoyAoZAG2hHIWCrAsmRET0kG3Z5vXIwYZRXGWzNP
 NYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rQ+ZEyD7s0o8uCj/44rJMqm1ByRnOwXZmTr/WQoyBP0=;
 b=OBWKXS1UZ9OMBiQ73IJfgsTj2f95n0w0V91aI/+fq/Umq70yhwRFUZT+riKm2mTKDT
 uaOJDTgCkLGTtN2rjGXbNZ8XyUEpW5zs4309d1vWaXkxGjG56kBspiOly46rzXiGRKRz
 uPJqUYUqb77ve2cvprMME2rA+x4Vdv/eb7C/p4NPgVe/LVwzUtCR7UL24HmKFaNCquXv
 n7S0IOxG5Vk54rOMVT4xh0wOW6ltninBk8ZwuzAelv7BcVybWYFZBLZf8htTBBlXTEP9
 BSFGwtK0qirEfcrubaP8nEGBcUyBA5UUUkbWVnmlgNhH+li/fKIQlWPzulZ0mwS0s0oq
 l//A==
X-Gm-Message-State: AOAM5339j7NPjCWaJWIWVr77ycSl2iIDYplqKX0RBwMzJwyRzwQzJRJi
 BLxtoLNLh6F2lH8VXaa/8us=
X-Google-Smtp-Source: ABdhPJy3iXL2st6RpQto4pDeTDD3bVJVvi6AwwSIEhY3At79C1nlDTc2gQ7QCNQnTF0qpCXD7p5n2g==
X-Received: by 2002:a17:90a:1c09:: with SMTP id
 s9mr5295610pjs.83.1611060293525; 
 Tue, 19 Jan 2021 04:44:53 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id r1sm6450382pfg.176.2021.01.19.04.44.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Jan 2021 04:44:53 -0800 (PST)
Date: Tue, 19 Jan 2021 21:44:50 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <20210119124450.GI5939@localhost.localdomain>
References: <20210119101504.231259-1-its@irrelevant.dk>
 <20210119101504.231259-11-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119101504.231259-11-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1031.google.com
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

On 21-01-19 11:15:02, Klaus Jensen wrote:
> From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> 
> Implement v1.4 logic for configuring the Controller Memory Buffer. This
> is not backward compatible with v1.3, so drivers that only support v1.3
> will not be able to use the CMB anymore.

Reviewed the legacy-cmb paramete, but we should update the commit
description up there as we can support v1.3 behavior also, or you can
update it when you are picking up :)

