Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A44E1D51
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 19:06:11 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzwQ-0004FZ-Gx
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 14:06:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVztt-0003a6-P3
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 14:03:33 -0400
Received: from [2607:f8b0:4864:20::52f] (port=34438
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVzts-0006K5-5j
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 14:03:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t187so8792840pgb.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3CpBs6Za3/6hXod2u0y0w9dwj9/Gockyis2LDPYUPn4=;
 b=s1+x68m5d6CVpYk4hcpBECTceIjTDqEB1bzJLPcUwCJWd33MfrybeqWmeOu27PKEaf
 PG5dOpvPXRnspDmyhrwvx/DrllYg50T9VktBN6tkaYM2xi5gon9T5TlcwUKs0bjrBCwC
 J+obUxZECqDM8MUsLuy3uivHjcR/2I7yLYKesdk9B7UKMc/OucE48IYVds4A+OxheDBw
 icyY9lqLocE7qfLg2PiYOBzHVjgkRuZ5Go9VEPTRLJD7VF+YPomUemgQ310F2OtAqTQP
 rSocvjv+FezFMtOv5CNv49EGEySncgcW+e5e1Pj7UOmPiT8ILIW724hJ1ycoDV8vJexn
 atew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3CpBs6Za3/6hXod2u0y0w9dwj9/Gockyis2LDPYUPn4=;
 b=XxzVLc6qfEYydeOR+Mp5LiGatj97Xypqab4eLkwZxew+MyMVB1CSAGWvtlgp49ZpwC
 r2MvLdV2RXfpU4JMHj7nEkkbXdqnN1ieCNg9OVN0ap3YDMCyoSqs9zDPBu3Mng+VATRI
 7PbHXrGkoB0R4FtkhbWa6kgsVOcmItYjD+Mgw8b0+mkA6H65X5UR1dXfKsd8oGNv7v/i
 ewkcpt249tnkIQxvNFogTP231JTcuO55/CKM3+ZR1Gm3zQBN0Lm3ZnAgr/66sXLmlABx
 p9POtCIOJC8CzUwLCVLyYieD4VfQA97rvHH/krZn7wxERZUdmMtAGAS4ubh3Qr1fr1eL
 RyIg==
X-Gm-Message-State: AOAM533beSp2AOllCn8Y+9q6N9A2hmv7JMIT0G5W09RvzjWvEG7jHqFq
 aC9c8MWbGnBU5WLlLGn4d1zxVw==
X-Google-Smtp-Source: ABdhPJxiHrMWLO/i2ITBsI64KHUPat2ZbCMEnkyYACunxhz/yQgTTPXx4k7VIu7nwvWd7+OR4N0KlQ==
X-Received: by 2002:a05:6a00:298c:b0:4fa:8e7b:349d with SMTP id
 cj12-20020a056a00298c00b004fa8e7b349dmr5274132pfb.26.1647799410301; 
 Sun, 20 Mar 2022 11:03:30 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056a000a1b00b004f3f63e3cf2sm17646917pfh.58.2022.03.20.11.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 11:03:29 -0700 (PDT)
Message-ID: <9428c4ad-8a52-0adc-c835-e61cc9cba7af@linaro.org>
Date: Sun, 20 Mar 2022 11:03:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] linux-user: Fix syscall parameter handling for
 MIPS n32
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
References: <20220320052259.1610883-1-xen0n@gentoo.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220320052259.1610883-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/22 22:22, WANG Xuerui wrote:
> The MIPS n32 ABI is basically n64 with the address space (i.e. pointer
> width) shrinked to 32 bits. Meanwhile the current code treats it as
> o32-like based on TARGET_ABI_BITS, which causes problems with n32
> syscalls utilizing 64-bit offsets, like pread64, affecting most (if not
> all) recently built n32 binaries.
> 
> This partially solves issue #909 ("qemu-mipsn32(el) user mode emulator
> fails to execute any recently built n32 binaries"); with this change
> applied, the built qemu-mipsn32el is able to progress beyond the
> pread64, and finish _dl_start_user for the "getting ld.so load libc.so"
> case. The program later dies with SIGBUS, though, due to _dl_start_user
> not maintaining stack alignment after removing ld.so itself from argv,
> and qemu-user starting to enforce alignment recently, but that is
> orthogonal to the issue here; the more common case of chrooting is
> working, verified with my own-built Gentoo n32 sysroot. (Depending on
> the exact ISA used, one may have to explicitly specify QEMU_CPU, which
> is the case for my chroot.)
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/909
> Signed-off-by: WANG Xuerui<xen0n@gentoo.org>
> Cc: Laurent Vivier<laurent@vivier.eu>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Cc: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Cc: Andreas K. Hüttel<dilfridge@gentoo.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


