Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F842F6AC4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:19:59 +0100 (CET)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08A2-0003aC-Fu
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l086T-0001Ke-SC
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:16:18 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l086R-0000mU-8W
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:16:17 -0500
Received: by mail-pl1-x632.google.com with SMTP id x18so3409047pln.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3cFdWxw06XtJxEQNbyV5xhCjQTgSMAxjKPo4MsxEILg=;
 b=yC1VnVjkX3uTwVpa2xOf2aHryJVdvGUwVNRVsiGnSujAsyxA1/M1LQ1hV/vmy8W72A
 KBbPp4G9TigmtJZ5cK94ciMgQRwPvub/cM3LsosxbVGsADI4SywH1SvyMNl4ORnyvlgH
 O3aYSmTPuScttXnHE0toxvdAr9MVFk+ryfQLuOLwexY6bN7DuX8kFGwEvwnlD+q0rAGv
 kATySch0B7SwB/rksLKtrlqFsby2XmSUavz52SxYgxLxeOizA8rc9O51wTccKvjVYxot
 pe+3Pw456aa0SSPtEH4G8x5zVrjqjBTguQrjEuwyRnMo3B5ozgcOs/APLerzGISOmtGu
 A/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3cFdWxw06XtJxEQNbyV5xhCjQTgSMAxjKPo4MsxEILg=;
 b=N77nuyKOm+QcX+lCKbJQ2BvNeDsH4KGoYM1XF7xwG9OHxAPEfGdlt32IWJAkhyXO8C
 CFS2XNG6BpFLfsPwne1Q/9GNGov36AesGI814tybOGg7wGYlur32TqvGSdDJpStFzI82
 rioGS62AlS11ftops/xIfp0TrAZqrEQj15Kuoiqi0+FiuuzwrV3Psl+i/GVfKNCP3p69
 rU4Wo7ADjz3aOIP1fITS8MZBioSFihEUS59ZYIJIIJerh7IiKgu8KQKc/lSQ9Ql4hwjy
 Oo6/uQ6bGmol3S/UjfhWsJkJnuN/kd0n4imaFYzqfcTKmzX6wF9q87r0RPhJgujARdbD
 Ev7A==
X-Gm-Message-State: AOAM530nhXHn8sJ+Da62ezxJsmz/LFGx5O1P4n/Dg3ZfHg/HAnwN7N43
 fjrku/OJK1msmbFnG2s0wCNo6g==
X-Google-Smtp-Source: ABdhPJx327X0X8f8AyWQUbFFlGwOovAynYnhru3IhW4JTh04WGYGvsVWtVbUf7CoYucHn58K369ttA==
X-Received: by 2002:a17:902:6ac9:b029:dc:2fe7:d949 with SMTP id
 i9-20020a1709026ac9b02900dc2fe7d949mr9026558plt.2.1610651772673; 
 Thu, 14 Jan 2021 11:16:12 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h8sm7146348pjc.2.2021.01.14.11.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:16:12 -0800 (PST)
Date: Thu, 14 Jan 2021 11:16:12 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 11:16:10 PST (-0800)
Subject: Re: Emulation for riscv
In-Reply-To: <CAEUhbmV4axZYh_6uBA5JdjdWjKLMgad=aAcRtmfgw8G6WqfC+A@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-578c8136-f661-491b-8c66-2583feffff1b@penguin>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alistair23@gmail.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 moyarrezam@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 01:49:40 PST (-0800), bmeng.cn@gmail.com wrote:
> On Thu, Jan 14, 2021 at 8:09 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Nov 6, 2020 at 2:36 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>> >
>> >
>> > Palmer Dabbelt <palmer@dabbelt.com> writes:
>> >
>> > > On Thu, 22 Oct 2020 17:56:38 PDT (-0700), alistair23@gmail.com wrote:
>> > >> On Thu, Oct 22, 2020 at 4:58 PM Moises Arreola <moyarrezam@gmail.com> wrote:
>> > >>>
>> > >>> Hello everyone, my name is Moses and I'm trying to set up a VM for a risc-v processor, I'm using the Risc-V Getting Started Guide and on the final step I'm getting an error while trying to launch the virtual machine using the cmd:
>> > >>
>> > >> Hello,
>> > >>
>> > >> Please don't use the RISC-V Getting Started Guide. Pretty much all of
>> > >> the information there is out of date and wrong. Unfortunately we are
>> > >> unable to correct it.
>> > >>
>> > >> The QEMU wiki is a much better place for information:
>> > >> https://wiki.qemu.org/Documentation/Platforms/RISCV
>> > >
>> > > Ya, everything at riscv.org is useless.  It's best to stick to the open source
>> > > documentation, as when that gets out of date we can at least fix it.  Using a
>> > > distro helps a lot here, the wiki describes how to run a handful of popular
>> > > ones that were ported to RISC-V early but if your favorite isn't on the list
>> > > then it may have its own documentation somewhere else.
>> >
>> > Even better if you could submit some .rst pages for QEMU's git:
>> >
>> >   docs/system/target-riscv.rst
>> >   docs/system/riscv/virt.rst (and maybe the other models)
>> >
>> > then we could improve the user manual where RiscV is currently a little
>> > under-represented. A number of the systems have simple example command
>> > lines or explain the kernel support needed for the model.
>>
>> Thanks for pointing that out Alex. Bin has sent some patches for this
>> so RISC-V should have a presence soon.
>>
>
> Yep, after the initial patches are merged, we can start adding more
> RISC-V docs in reST.

Thanks for doing this!

