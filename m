Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC567949B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 10:57:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKG2v-0002Lh-UY; Tue, 24 Jan 2023 04:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG2t-0002Kx-Bt
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:56:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG2r-00065D-Rh
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:56:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso10498154wms.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=As3ERYDpe1xajWwl0P5phR10L73tho+c84KJAVM3/Kk=;
 b=azvU93JJDfLLeckcdsT0H4q/VO7kqjqomxrqzagbUDpA2AYpJqMgRDRAUOUfKEwAEa
 AcSmUl4O82UPC9AyiCu9DWC8W95/Efe5UmA/SgahBDHB3rJ8eqa74GV+omKM6S3ExAlX
 DMVhv7kFsY7hUAFmA2VvoVWL5RAzZ3NNq6tzr558RgWj4VbjzoxD555Xay3uXEPiK4bb
 5vLudc2IvJCAOiyjkws7/C3TKGVb21IEvBYD3qXhDN/wwLUc2W6mZNXnNhYNsrTrZh+p
 G+MiWcIDmU2MNMGfIiv2ROH5M6QJIqs66l/xc3x5nMFBrEVzqUW3pH00mZWx9j1rmJRb
 hFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=As3ERYDpe1xajWwl0P5phR10L73tho+c84KJAVM3/Kk=;
 b=yc8syW9HV9l82a40voWdzcIOT2Zn8VmLg1O354Xev8G0tHtvj8u9tu1n1GsM0Ojmxm
 6KcOrxS72Ls00jkcpO90R7LsW1PGZ0hNne9BsniyMbf1A/vy9cjm2hcKi8XYn8QYntoD
 AjKRYN+N4fAmeX2ZzboKw35LV6sO5OE9evAHSC4E6jRbMHsuP91eZBWe4z78fm9JIYOQ
 sCRR3uVf2YxTU15EwEEi0MRLHrIKdlff8ABNVI3U5p6hUQrmvIbLdInIZHdByecouFm7
 SiJrXeWjDgR9qQVdH9gNaZuiHYO/YMC+4PcYcRQdHLSy8Q0hbOydqP6zZu3i5y9qpulC
 A+ow==
X-Gm-Message-State: AFqh2kofhOpkwSLwls8v3fDTTDEE2bFmq5LHLKEYAdFrdE8Li51G0LxX
 QAgHL7K0iZ2aoN+M368RDgOtAy7fOMfQN4Me3FYr9Q==
X-Google-Smtp-Source: AMrXdXvlUpW+fAmQ9rapa70r/uzL07EUa2hOEg7mAOoLpYYTmX+07w/E9/FSoXB62IhEpvc82OS4tmjU5MSHQwJk/oM=
X-Received: by 2002:a7b:c4d0:0:b0:3db:459:5847 with SMTP id
 g16-20020a7bc4d0000000b003db04595847mr1540405wmk.5.1674554207821; Tue, 24 Jan
 2023 01:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-4-alexghiti@rivosinc.com>
 <20230123101429.a3x6vlatbvbp7kox@orel>
In-Reply-To: <20230123101429.a3x6vlatbvbp7kox@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 10:56:37 +0100
Message-ID: <CAHVXubiapF7RS-9vWzvkapsrV3b+eX_MF+5F7Wbg8_+X8iiV_g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 23, 2023 at 11:14 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:22AM +0100, Alexandre Ghiti wrote:
> > RISC-V specifies multiple sizes for addressable memory and Linux probes for
> > the machine's support at startup via the satp CSR register (done in
> > csr.c:validate_vm).
> >
> > As per the specification, sv64 must support sv57, which in turn must
> > support sv48...etc. So we can restrict machine support by simply setting the
> > "highest" supported mode and the bare mode is always supported.
> >
> > You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> > "sv57" and "sv64" as follows:
> > -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> > -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> > -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> > -cpu rv64          # Linux will boot using sv57 scheme by default
> >
> > We take the highest level set by the user:
> > -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> >
> > We make sure that invalid configurations are rejected:
> > -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> > -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
> >                            # enabled
> >
> > We accept "redundant" configurations:
> > -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> >
> > And contradictory configurations:
> > -cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme
> >
> > In addition, we now correctly set the device-tree entry 'mmu-type' using
> > those new properties.
>
> This sentence no longer applies to this patch.


Sorry about that and thanks for noticing.

Alex

>
> Thanks,
> drew

