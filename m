Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940F318C9F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:52:21 +0100 (CET)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACOK-0005I2-8l
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lABkM-0001Kc-0j; Thu, 11 Feb 2021 08:11:02 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lABkH-0004sU-0O; Thu, 11 Feb 2021 08:11:01 -0500
Received: by mail-pl1-x633.google.com with SMTP id u15so3298531plf.1;
 Thu, 11 Feb 2021 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1gN12M6mYltc7l2SrtftxcOxyHm+qQYGCDBkBR3nSjU=;
 b=eqWKCRSMnqNVo0iJcCvmwk4D+smQvXnlOYOQZEnB5HHcZ+rupjaWv/x+X45TtfIonA
 NjIfUiQ1cfzYeXldhQqz7tbtxEiP/7uy9PPZ4KMhKZuhpwmSlcVWj0u/vZ/iggnzEHc4
 Yka6+HA8ZPcVRXcgusIYB14Clw2hZkAuhTDZS7kx+LnF5aRB6BkNVYsHmTng+ekyxRS9
 Q0m8t0dFWQCfL14yM4BlQUHf87KBnn2+12O6dJkyAU9Raecr34/tB63Yhxd4kCZv6VW+
 vePeq1VLAgrY5cAMzhWztkeplYKDX92NjW+SwWEyTAkWFTHB/l7gHDILn5VwS2VJQnoi
 eUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1gN12M6mYltc7l2SrtftxcOxyHm+qQYGCDBkBR3nSjU=;
 b=bYUTxcecK2wVTm44vBhmBHHqXp6ZOMb4q6QlhQwyNHkvxMq72Y3ACH1OUJHhaJL1AO
 a0h4wMAyiS6G+GgvRpWMDpGuGkpQjB4htLzgyNOiv0wQrZDpoAxqwzZOSb26XHMznVhi
 d037P06OlJwDN7SLPRA8y2cIl+1VU9SpabQVuilf7mcj2oPE2Re0wz/fDx3SH7Pk8efz
 5D4NyF6mqbsuDDLBqa6EHx4528Aifm31KCkVYR99XO4UtGuDfcPevTveRVvI3UYnYBL2
 eP8rWRPz77zJhkXlBpN4KpqvF9SjmviLfusaxTk+783/NKpA2Cog2XsMGW29W3iemu5S
 H3Zg==
X-Gm-Message-State: AOAM5302BPg59EtzVHMw82uNKlXLoBvV0EJQNGh7rXSBhOjHtmt2w71F
 /N5wxcZtBvrYsXY7LKFhuKs=
X-Google-Smtp-Source: ABdhPJyIvelV+zNUBotWefAZTTGJp9CM+/7h8EZm2rhQ1zG8kWsWMrEV3XqCHrBtH2zv2JaSZO/gzw==
X-Received: by 2002:a17:90a:cb15:: with SMTP id
 z21mr3837944pjt.164.1613049053961; 
 Thu, 11 Feb 2021 05:10:53 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c84sm5838662pfb.16.2021.02.11.05.10.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Feb 2021 05:10:53 -0800 (PST)
Date: Thu, 11 Feb 2021 22:10:52 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: fix legacy namespace registration
Message-ID: <20210211131052.GI24885@localhost.localdomain>
References: <20210211105451.937713-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211105451.937713-1-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Klaus,

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

