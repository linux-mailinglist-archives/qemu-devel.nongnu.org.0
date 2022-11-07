Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE261EE4E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 10:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ory7r-0008Fn-Sx; Mon, 07 Nov 2022 04:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ory7k-0008F2-LY
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 04:08:58 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ory7i-0007x6-VI
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 04:08:56 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so9710993pjk.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rd2lq5ksElHgZ+7844aSdBRInH9/UWMQ4PhblAlVBWM=;
 b=EI8e036vnbQDC8UHToH/x4yw4T9MkCJ3l5oP0ChJDUkmlZkrzzzl1Kqgz63HzaJoFU
 P/s6fu6i7HZrpyahkX9V5MD1yr9vXjyeIF0JLIDJExFxtyXbDBzR/go3E7tjR6gFZ02Q
 okGOF8BOCY24h4NhtuYM4VarSlXRvJSLiksi5k9nYP/Npf6QFH1+L3WmnuMRs/Shh6fh
 /1zvEAEirKWfk+kM61Z4EcyAVH9ur6jgBqn/GcpV+/vRBhou+jIaJXbkg5VQkNq0K7ub
 gdONoh8DhB4XO/w9kbqsfo2GaVbkp847tG+nf2k7C3nFEQ24L+obbZ/fG/RwrKKdVirQ
 fVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rd2lq5ksElHgZ+7844aSdBRInH9/UWMQ4PhblAlVBWM=;
 b=7wTd7X/EaNsRJ+Dr0MmIlOaxi7Ul3KgpqGTxLwfQ6YR/oJhP0+UxvlefEFufS7Tpsf
 HBAonN7ey0A36PcZn1/exedoQ6MSO+jpxWkeptUWJAL627a+QcuudX6LJpgB8eee16Ms
 f83boRnr+Dwj08MY515ZMM6oAO3vJAnS9vlsJ27TsDP4kXXYdZ36y8cK5HQL+wcAAI+R
 A3Zmp6rzHkQ0JvQ0E+Oh3n9ElPjrDrnNI+DxJ1UDvGWKv68hWbODvcEaiwmd0LxY1B7S
 HwOf5zsGpbgv2MeJ5s11aF6+Vz/oxBYCNRUhnK4dKtvOBnR5ekVDYO80NzikMqNIrvNK
 dGTg==
X-Gm-Message-State: ACrzQf0S6FzrJHG4nyVohLmFpxGkDX/jjVu2KG8gdCwALvD8MbIMt942
 zMoHwV0QnOm58uIow1n5Ssxuuw==
X-Google-Smtp-Source: AMsMyM4vhc9qdjYpm9zaPBYq6di48YJ7yLAJLpVZCVstr6WAHjpQl72KdUhFykeAkoE1kyKQz9nomg==
X-Received: by 2002:a17:90b:254e:b0:20b:7e26:f0a0 with SMTP id
 nw14-20020a17090b254e00b0020b7e26f0a0mr66166683pjb.203.1667812129374; 
 Mon, 07 Nov 2022 01:08:49 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 ch8-20020a17090af40800b002086ac07041sm3775910pjb.44.2022.11.07.01.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 01:08:48 -0800 (PST)
Date: Mon, 7 Nov 2022 14:38:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Mike Maslenkin <mike.maslenkin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2jLGV6xZxPNGrHR@sunil-laptop>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
 <Y2ibaoOzna0iT7Sa@sunil-laptop>
 <20221107084803.myuc77xssykljyxv@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107084803.myuc77xssykljyxv@kamzik>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Nov 07, 2022 at 09:48:03AM +0100, Andrew Jones wrote:
> On Mon, Nov 07, 2022 at 11:16:00AM +0530, Sunil V L wrote:
> > On Sun, Nov 06, 2022 at 10:20:57PM +0300, Mike Maslenkin wrote:
> > > Hello Sunil!
> > > 
> > > What about virt_machine_done() function?
> > > kernel_entry variable still points to the second flash started from
> > > virt_memmap[VIRT_FLASH].size / 2.
> > > 
> > 
> > The base address of the flash has not changed to keep things flexible. So, I
> > didn't change this portion of the code to keep the changes minimal.
> 
> I think we should change virt_machine_done() to be consistent with
> create_fdt_flash() and also add a comment in virt_flash_map() explaining
> the base addresses are statically determined from virt_memmap[VIRT_FLASH],
> but the sizes are variable and determined in virt_flash_map1().
> 

Sure Drew. Let me update and send V2.

Thanks
Sunil
> Thanks,
> drew

