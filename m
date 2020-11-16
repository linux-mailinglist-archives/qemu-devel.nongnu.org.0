Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861232B431D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:49:24 +0100 (CET)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ked0d-0003St-L0
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1keczQ-0002eg-UR; Mon, 16 Nov 2020 06:48:10 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1keczL-00070M-Ai; Mon, 16 Nov 2020 06:48:07 -0500
Received: by mail-pf1-x442.google.com with SMTP id w14so13857206pfd.7;
 Mon, 16 Nov 2020 03:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z6P2Snms+F8VSdWdaOAwSc23aWtl6JBv8nhoYYOjcsg=;
 b=PblhGhj7X67HrWocWShbB6e+4yWvkLShVo8TP9+U9XEI9oR8fP3+U3IA8huidgdxyZ
 VyIkdr6rRaCc7RNGsNbZhxquLjVxWgN17R9NyVzYSfKhJPeC2eXyXb9h6VcsAJTQIWId
 Dh48GwoTHdbeUI29CKvm+n8fRVxVtctKHe7b6RvIaXtDKzyeaznJ4CcO55VYrHWr+lGR
 tUjWCasMWQaBrjpMSk7OBCJ9K89ztEBEEHRLKSUcgqeTJ0+7lHKjw+/wtZC/NZnv1hfw
 atKRQyGpVIsm5QGoVQfV0y6oONnxL383XhMaB35jxQJOj9ytURh3JEpErumGIgHl/WkR
 0qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z6P2Snms+F8VSdWdaOAwSc23aWtl6JBv8nhoYYOjcsg=;
 b=ZCTGdRcQh0gdKpP9n15cU/kADsavW4jsC+5Qzkfla/T634bUs6EBAxxVPAMWydWVjk
 wCTpuAaIcPWMoDA7ZON64l9zPnhmlEjJE7n4KUReXG+e0yDM1AG8nSGq7LUkMPk1zA2V
 4XpkBG0zkxeM+D3Ycstp1KMvcER/xuw1OFBgFymzd2xGnKaAGz42b5xniVQRqVHSaQFk
 v06fs+q/b+AdalhLqALxttk5hGVxNyjTmXd64yqh5Uu7xouWPPFO/Z9VfPdcQB2vPTJs
 PtUAcMmFI9rKaltEqAXn9VRmDcnwWfgSQlweNzPreMYCEEPxBvOTnfv2bAGeJCUQnXjs
 CyCw==
X-Gm-Message-State: AOAM530b+9iLM5RAkZHGmYULuLdM3owfbDK3+QM/ymXaahBqBreZtEVJ
 HkiSnONzK5W2LnQm2cLango=
X-Google-Smtp-Source: ABdhPJx475RWaFow2HEZQdvcbqryVwBkrVQTPQYPMZ7kNnIJ6oxXu8MkipK2iNB7YvaesKc7U6wPEw==
X-Received: by 2002:a63:5a07:: with SMTP id o7mr12259237pgb.77.1605527279822; 
 Mon, 16 Nov 2020 03:47:59 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id y19sm17526140pfn.147.2020.11.16.03.47.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 03:47:59 -0800 (PST)
Date: Mon, 16 Nov 2020 20:47:57 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 4/5] nvme: add namespace I/O optimization fields to
 shared header
Message-ID: <20201116114757.GD7308@localhost.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-5-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12 20:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This adds the NPWG, NPWA, NPDG, NPDA and NOWS family of fields to the
> shared nvme.h header for use by later patches.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

