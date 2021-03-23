Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76B3465D4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:02:01 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkPo-0001DC-18
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjOV-0001j9-HH
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:56:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjOU-00066A-2I
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:56:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id e9so21301722wrw.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q5ezwumITBdg52+I9sS+Z/bxVtNRGHZLANt/9npX2nQ=;
 b=T4EiU68qfKsr0jgElrt6cwF9dWG7FhULNUPdPeeF+cS6I0Sy+/2KKZfp8ou+WmP3+g
 DPcsX9xURZDIyhFNTBRYd5o54bi+iaQRhNxMdpOZnjGy3LF6poW0hl5dS/dd4nRG4uht
 etKWL4nLKjcfsOJ44EY/xIHhfsXLYqTx8GQ0kUi42eRHBX51XSqfSnX/SDlepNInVwBu
 CUWC94LXjcIpMQ5UQO9zm6aUiMoXV45X8z8y0l15vYUFOr6M1wG7Y9lr41v48lS51aQw
 ginEUYVrdnEeMRCDqjPgxxCr/l4jqdI2o28lgrAU3Ri3PLlxvCYXj1QaMjxcoBoiVx0n
 8/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q5ezwumITBdg52+I9sS+Z/bxVtNRGHZLANt/9npX2nQ=;
 b=EygPdzAiy+lksyBf1/lXaufsD9P15dihfpYD5/ccGQfdjzFNJeFJ/2OS3s3ZsvvNvb
 Mo+sQ8eg8sckmkI2Mn6CthOmweMOirZTPuXX085UCdIWGUXo3ATEb2Qhjja3AlHMpQOv
 sW9h5jitahrpiyA1WVp3eHJCSLunPkDCWYCSlkX8yLDQXDABiXfIcpPGEBuOyB8puZV/
 10LpMDAlUd+iam36tE2eYVSNpfqdYHY/57TZDRGd/slAYm1BPFTujMazDBQTPtdYuZ+8
 ftflBf3Jma2XP4FWbMraLPE+8lX/6c1uyNGKNCKdIiQVoKT2jcAOWto5apiOtUTeQV2i
 0pLw==
X-Gm-Message-State: AOAM530xrVO7ZbtI4gTiLmuRh+1WfXU6kP4czGYiVns4fLKrmu5pik4i
 8ry76/Wueo6+Gf+699lY4J4=
X-Google-Smtp-Source: ABdhPJwOeHdqhD3PyXOAqiDrgXYzRjb8HhLXoHNVzNtDskcCQvIO0W8JmPLNLtwM8U8iCMVWHnG9Xw==
X-Received: by 2002:adf:edc3:: with SMTP id v3mr4542079wro.79.1616514992730;
 Tue, 23 Mar 2021 08:56:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h20sm2894272wmm.19.2021.03.23.08.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 08:56:32 -0700 (PDT)
Subject: Re: 'make check-acceptance' odd error: "'bytes' object has no
 attribute 'encode'"
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <67ae4815-8542-e6f7-b3a7-192151f85c9e@amsat.org>
Date: Tue, 23 Mar 2021 16:56:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: avocado-devel <avocado-devel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel@

On 3/23/21 4:23 PM, Peter Maydell wrote:
> I just got this running 'make check-acceptance': does it
> ring a bell with anybody?
> 
> [etc]
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_4k
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_16k_up
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_64k_dbg
> Fetching asset from
> tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> Fetching asset from
> tests/acceptance/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> Error running method "pre_tests" of plugin "fetchasset": 'bytes'
> object has no attribute 'encode'
> JOB ID     : 71b2d5569d9ccc8b68957d3ad2b2026bea437d66
> JOB LOG    : /home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/tests/results/job-2021-03-23T15.09-71b2d55/job.log
>  (001/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
> PASS (465.84 s)
>  (002/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm:
> PASS (27.46 s)
>  (003/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:
> PASS (99.43 s)
> [etc]
> 
> thanks
> -- PMM
> 


