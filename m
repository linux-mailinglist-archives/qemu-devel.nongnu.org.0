Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4B314193
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:21:39 +0100 (CET)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DyU-0000qB-BW
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l98E9-0004so-U9; Mon, 08 Feb 2021 10:13:27 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l98E5-0006yF-JX; Mon, 08 Feb 2021 10:13:25 -0500
Received: by mail-pg1-x536.google.com with SMTP id b21so10393322pgk.7;
 Mon, 08 Feb 2021 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VBKw0KHSUKjpw2gerHW0X5GtHK3yXUMi+TayvoSDb6I=;
 b=JbdxeVJXtdxutxqyrx03V7+Snzj2R1rRxUOpPpWu30F5/J80tANwh2BSaQj4wJUla+
 CgIlyV/WrV1GeCT6yRPARshe4rmDMAIX1BAle9sVlLMCaEAQ9W/J36Klw4rHdGAOsCED
 WfqDEDI17SNh14dvoARJ4MqJY4t2tDPSmcy90lzHumufLJFtudO76pqjtIbHpTfrj05z
 iWdX1/RzdiC0hZojzL6vVQTAEe7Fyfr5v9LJ2xsYCL/D0USH8Ir7EZB1T/wowlh4xxt3
 GITv5bWMx+v01WtXYsdpf8y9VLbW9KGb5wcdIIpd9uMX9iYXUu6Qyli9Z2EBDD+6MYhv
 wbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VBKw0KHSUKjpw2gerHW0X5GtHK3yXUMi+TayvoSDb6I=;
 b=uEvA+587qLJVn5Wqxkp/D6sGmRL9/F8VZoNuCXTkSlAgL8Z1EsMgVDYj2W00ZGq3cx
 3mYspLoY6YmomEA/mAN04GYp3Ak5pC4BJl37Guho06UhdAMMxaS9wd/5fgM3UI7KPikr
 E3N5lfoG2ksvXj02Tx+mryACTRIErBg8jDcJFEsrMStsyX9N+DyWyYkFNNnhpOkT/aRs
 /xs7/97ae5WIgZpplql8anS3VT0aFJf8o2Vw319+0NK2UDaBhvhGymgdkK2qivMeITeT
 gzvgT2OKHhCV6+kQaJF6/wSoAuiUU6i9wvFKfc8fM7K+eu57FVBWJTzRdLw2uzYBR8f/
 3F5g==
X-Gm-Message-State: AOAM5320ymw2S/J8BFh0RXY5lIPRjf0EfoAcJC2Uf3Why0aRcUVHiHBj
 OPtUmBZc+6vUoooTYmJCALQ=
X-Google-Smtp-Source: ABdhPJwqEQiA6Veb6ZhUBDT12jadiFU7fwm+TdK9kHQ4lPfPFkKQiZIvlClk+EjHcMi6gzTm03dZDg==
X-Received: by 2002:a65:5c48:: with SMTP id v8mr17775285pgr.400.1612797199726; 
 Mon, 08 Feb 2021 07:13:19 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id r189sm19540114pgr.10.2021.02.08.07.13.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Feb 2021 07:13:19 -0800 (PST)
Date: Tue, 9 Feb 2021 00:13:17 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v2 3/8] hw/block/nvme: fix strerror printing
Message-ID: <20210208151317.GD8941@localhost.localdomain>
References: <20210207214940.281889-1-its@irrelevant.dk>
 <20210207214940.281889-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210207214940.281889-4-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x536.google.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-07 22:49:35, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Fix missing sign inversion.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

