Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D842FDC75
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 23:25:32 +0100 (CET)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Lut-0005uW-SU
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 17:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2Lt7-0004Xn-56; Wed, 20 Jan 2021 17:23:44 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2Lt4-0002gn-UP; Wed, 20 Jan 2021 17:23:40 -0500
Received: by mail-pl1-x631.google.com with SMTP id u11so9026331plg.13;
 Wed, 20 Jan 2021 14:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=30xrQPDNBxjwiemDm/aTJEGcDXg/RlHhnAZczYlixpg=;
 b=UtZyGBEPAHqma8xF/SZ+FvEPmqgvALxGD1qEJMrwB9MMJYQmOYBFtPigSLIvfhciqg
 uAfn8iyE+9LMVeF/inbBmEJvY8LE9RgpzvVldFzSb88G9ssUWLPEDE0wlwWgKIAjW5EJ
 rk/jdP/Y3tsi5bBWfRbwQ6KKJ6kH6DsTCQgV4UtB6oHFPFydQNKcafujOTPmvsLeKZCV
 FdJuPg70xY9pOTOiWaGZF3hd39KwIOfrfi2IhV1vdeOP3VIenINp5FEXU5wWGZESuNMP
 CarRZnzNDIwyvTCi6UWT00qJAFStqy1H7faUlhkQCRyqdSSQPlv1GwUtVMTDK4db/g3P
 B6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=30xrQPDNBxjwiemDm/aTJEGcDXg/RlHhnAZczYlixpg=;
 b=P8wJeb4DuRfZ3HWqV3b6UVQHAYUiZz1yCN9wrB3PoUElNLCq3NXTX5l+gRFqnPuluK
 vZcLl+I8MEloKPGp6Sis7Qce1uZEDjxlIZ0lXERzuleF9PAJk6bDf8LbiaIP3DV3vSu9
 ya/qBWiKyuccvw9WtfLBq3PoCqiVo/DyPrvjjBLH9vhO5OHRtLsy0oEWT6BVhUiOSMus
 Vmd0nZEjFqMkdfuMq9Dh7C5lETnLyjYchq33ODiEjRTNsNvcoXI/9ib9EMctRtPrdSum
 EMWAPbbsYAETtM8y1kh3fjvvTxX/uyz0PmqDtKcS0UCshmTeI6URpiV1/nJ/3zekQYBC
 9zwA==
X-Gm-Message-State: AOAM5309fw4Hs0XzehGKB5GwM9r8+cSL349iJKWBtdfa8lvOQTE1D75c
 igPbdL5nhWL5qxn9h84kQLg=
X-Google-Smtp-Source: ABdhPJyz74J6WLgvE8I+UMctlwV5kGP1isE56LBHUw8u67uBRO+E8ge2hixZqX5HPA+VQ+fHaLsE7w==
X-Received: by 2002:a17:90a:c595:: with SMTP id
 l21mr7873275pjt.137.1611181416154; 
 Wed, 20 Jan 2021 14:23:36 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u4sm3335241pjv.22.2021.01.20.14.23.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Jan 2021 14:23:35 -0800 (PST)
Date: Thu, 21 Jan 2021 07:23:33 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 12/12] hw/block/nvme: lift cmb restrictions
Message-ID: <20210120222333.GD2645@localhost.localdomain>
References: <20210119101504.231259-1-its@irrelevant.dk>
 <20210119101504.231259-13-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119101504.231259-13-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x631.google.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nice for codes much more clean.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

