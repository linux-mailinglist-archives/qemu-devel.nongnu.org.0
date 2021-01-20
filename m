Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E383D2FC613
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 01:50:02 +0100 (CET)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l21hC-0003Xq-02
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 19:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l21eg-0002Ln-6G; Tue, 19 Jan 2021 19:47:26 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l21ee-0006Gf-1v; Tue, 19 Jan 2021 19:47:25 -0500
Received: by mail-pl1-x62e.google.com with SMTP id q4so11547033plr.7;
 Tue, 19 Jan 2021 16:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/ZefdSlXw2KGiB9gOxaq/xLBwp6Yy5DtmJP+PRtmV4M=;
 b=TmUjGDIi9JtaYllunl62xyaxxAz/EbBZPE52wfazjIDX/G8bs3Sp9T1bOHNr1Nl4Kj
 f2D4ZJ15ywOsg/h4khh4X0hLm2O7JvBoM1R1sbyxpQGV6PLrs24czbU5Sco2FJ2UuQ3b
 vK0y2FSgRmrFaaiBqaDjtSG/QVE6dlKUM1ORal690LBW/xsyemNykSXb1/5+h4npzal0
 N5/D0w61Jk1D4csuBQ38pfo497DXMioaltCKfgVqrJx4iqI6HMFImwtFwUhKT2wk4enK
 0oz4phMhfTObuWH4WnD+PFDda0X9b1DpuSWKn4OOTAReBbAUzo6N0xpxy9EcOWQlc6Zc
 2Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/ZefdSlXw2KGiB9gOxaq/xLBwp6Yy5DtmJP+PRtmV4M=;
 b=OjfcA9BeycrJWt6v2wONs0xCNdSUpPACyHEnB5RZqAQdO4U10Uf8Ed+NOn0GMr/2BJ
 +opWhx4jMqT9xrHI02jfB6JsyJvQ2lGqAvHq8ra/PhznA0pO9pLO+25HX5S7H2uHDJ7h
 XLivL+XxmVQdO+hGJSNDstT5PZcyXEHB9IGMw8K0yvtYJXlTvGuBr+fhnYPNlckkP3A/
 NBuQXuNCrxi8lVAklMtwS54qpRmbMhhx1O8Q17Nhh6Wg8g9noZcLSOkjLgUjvKC1uR+5
 C7rCk+jKP6Hgcf40QjbH4gikq0EP4xtgZb4sN6Def9+6hI3RkJPNeSFJzU5iezvNe2Uj
 CeHA==
X-Gm-Message-State: AOAM530fnXdp4Sd2Q1L8RyyDDD6v0ilYOmp+RMAigeBopKK5VNYv5CA8
 yQeAvf9qgYgdGMJ0lyVIV2k=
X-Google-Smtp-Source: ABdhPJy/KEG8SYlrgKZx6L/WuDZA3GMpnNgNqWBNDxBq+M7553HXeO37EkscSKpEfcIyISKg48we/A==
X-Received: by 2002:a17:90a:b90c:: with SMTP id
 p12mr2538206pjr.136.1611103642157; 
 Tue, 19 Jan 2021 16:47:22 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id i7sm259443pfc.50.2021.01.19.16.47.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Jan 2021 16:47:21 -0800 (PST)
Date: Wed, 20 Jan 2021 09:47:19 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V3 7/8] hw/block/nvme: add 'detached' param not to
 attach namespace
Message-ID: <20210120004719.GC4205@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <20210119170147.19657-8-minwoo.im.dev@gmail.com>
 <YAckBNC3ReHdyP4w@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAckBNC3ReHdyP4w@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62e.google.com
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

> Isn't the HBitmap slightly overkill? Can qemu/bitmap.h suffice?

Definitely, yes, I think.  Current patch series supoprt up to 32
controllers so I think qemu/bitmap.h is enough for us.

Will update the bitmap operations in the next series.

