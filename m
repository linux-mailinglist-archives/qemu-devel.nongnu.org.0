Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5767A61EAAA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 06:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oruxf-0002KB-HO; Mon, 07 Nov 2022 00:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oruxW-0002JA-KK
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 00:46:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oruxU-0001NI-Sm
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 00:46:10 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso13485253pjg.5
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 21:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7TorB7iWcnJTNHYhG0GCQsqvK4cyoE344l0UY9t1cn0=;
 b=CPBdQ4UmKBdKcbJlIWctdj7AlqOv6we8Rul/a0e7Pm4h2ReO/LYzp7lg4PE72aHK0i
 qhT9GVf/j0VUCTn9+F1P0ZWeCvPbtRYISfV4udGkdtCeGY6+neOb4YM93chGpnLAml9e
 IDAaH3LNlXzCoyy7jeRC/MHHRDjy0igDW8ylyplphY2XtwQXknZ8wxQ+O5nokhGTP/Pe
 44ie67iffzwozC7/A4OjTXLaV9w6Y+lThjFrYo8T7koc7dw7bqnx1GDKTTegGMkEbmzC
 e7Rf2GNUcL/6dK1IW6gTVBl/j06+mj+WwjmtR/hmzVuYIi50CMfJu3BWvwjInxp1gZ+D
 BQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TorB7iWcnJTNHYhG0GCQsqvK4cyoE344l0UY9t1cn0=;
 b=ajFeOgyd7xhvxHsB/omkzaZo05myBAATD8QMjld7uFMf0QGwucrrnHAHWoxm/Rp65h
 LHRswr/F1+lHTeaaF5WnSURdWCU/O2SXCv6n29To/yrW/mTQZpL96eM6RRmuaee7e3r+
 mS98x15NXCH53zGPYpajOMDghjGyQ3Y0/nYqGXHuo2/XyqDTVms779mBn+0s/diQAalk
 4HHG4ETHzPg4V+YHfcYOyu2MDKN/nt9coo3E3DXS0YLZSKfFCdM3oed/R2ll+8T6lcDP
 Vg4b87fOc3GqCOHoAhfyqryEE+Ip5pd95fBIq0QEY72iPBjHdP4sLC0rA2hPkwv5auPb
 4Raw==
X-Gm-Message-State: ACrzQf0AMpKnHcCUSzzl0+Y5qpSn6ZN7j1oZY27t8Vty2cycWNhtzih9
 +ScW/yaeJizw9wzGdXgCuoXceg==
X-Google-Smtp-Source: AMsMyM4mMuxBgD0y/QDAVEa3aAo01K93qvYNF3fJl4M+QnSi1TAc2xCNI79RKXGUC1lZZep8O43e9g==
X-Received: by 2002:a17:902:e5c5:b0:186:5f09:8468 with SMTP id
 u5-20020a170902e5c500b001865f098468mr50124694plf.122.1667799967267; 
 Sun, 06 Nov 2022 21:46:07 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170902da9100b001811a197797sm4019035plx.194.2022.11.06.21.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 21:46:06 -0800 (PST)
Date: Mon, 7 Nov 2022 11:16:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2ibaoOzna0iT7Sa@sunil-laptop>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 06, 2022 at 10:20:57PM +0300, Mike Maslenkin wrote:
> Hello Sunil!
> 
> What about virt_machine_done() function?
> kernel_entry variable still points to the second flash started from
> virt_memmap[VIRT_FLASH].size / 2.
> 

The base address of the flash has not changed to keep things flexible. So, I
didn't change this portion of the code to keep the changes minimal.

Thanks
Sunil

