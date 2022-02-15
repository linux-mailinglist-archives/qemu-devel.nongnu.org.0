Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E24B6AB9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:25:02 +0100 (CET)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJvx6-0001Wz-NT
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJvrU-0008Nd-V5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:19:13 -0500
Received: from [2a00:1450:4864:20::42b] (port=36618
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJvrT-0001kk-4K
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:19:12 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o24so28848985wro.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CP27Kh/7m2+PaDA2NMkJ9yz10CAuFEdzl1SJbOsAISU=;
 b=gf1101F5Y59Mk63lv2UcIa5IJ7nePOVtvfZnTyNXvUw/smk0Wzyd0l4ejJjs+j6g0a
 ZckfTUYQ+QLUdDemGc9Y1P6ktRT2V6aqcSFZb3XR6ICZsqU+4t3H+v019AQH8lKPOyHE
 apG5r817AmnaIg+WVQhrq2184IqneduchwNcdn4FULBRVhJbqIrWd8u6mtXQ56im+Sys
 Mb+rG81TOy3Edg5q4nIZZY3mArp0icBGFpHK7dt/FtF/jEorpOC5WjTCYnkdGXRO1JQw
 t1U02mqQyKrwvhc7mOmSKkFUvxwg45IytKg1vi+z7DyoHGl2CZJMi3zXNcrCCjg1HSW5
 agng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CP27Kh/7m2+PaDA2NMkJ9yz10CAuFEdzl1SJbOsAISU=;
 b=ZBHdnwINyIBNCA6w3qSz8v93Pp92gdd7JWHigJV6nuc+jnOeCG174AF5l8Sk09cpFI
 vqZDyleOtiMZfKP9ynHDkPzRWglUbkp73VODJ+/BMm+oD7EbmRUwLCMkUzpyliCy28ah
 gMbkWS/Etr69akRWSsSW/a+r+YPN7T8u9F9u0QbmyNat81MZh4QVFNa8x66iMW6VNK4R
 kgZs8XIlx0rAUCpZAvy6Khmj/ij39/fg2PbX+/23fQAgTuF/U0lBGQPUnsdYYvAIf1oB
 PLUbMb+AToGZ9k7A/bYc+VAmcsVpb/jjGgL311Cr6VpiQwiLIEFhElNXnAjARWyWuOEB
 3E+Q==
X-Gm-Message-State: AOAM531P5X40DOgFipVcdDRYyG9FCIDzhbDtwGL2Y3DF69XPb8py/MNR
 +6r60oe/jBiO8bX3YzzuNGCoZqWeDnNSCQT0TK5MSA==
X-Google-Smtp-Source: ABdhPJyY42rCmyK9LG/FjEn1mHNCdVGKKt2trvAViYr7RRM/1V6jkWU8go7MWdAMdOsAEKzkp6qETojYX1Vf5DaoKhc=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr2746640wrs.295.1644923949671; 
 Tue, 15 Feb 2022 03:19:09 -0800 (PST)
MIME-Version: 1.0
References: <CAAFEQFF9tjKEt1fL5=kiVpRxXX=Ti9HKW-YE1rnFXx0dPB9VQA@mail.gmail.com>
In-Reply-To: <CAAFEQFF9tjKEt1fL5=kiVpRxXX=Ti9HKW-YE1rnFXx0dPB9VQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 11:18:58 +0000
Message-ID: <CAFEAcA8pr1w8OLRPDHb7+F=9UysEEOhQpU=o6upg_s1AQ-rnbg@mail.gmail.com>
Subject: Re: Holding RISCV CPUs in reset
To: vysakh pillai <vysakhpillai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 10:30, vysakh pillai <vysakhpillai@gmail.com> wrote:
>
> Hi,
>  In an SMP system like the sifive_u machine which has a RISCV  e_cpu as h=
art0 and a set of u_cpus as hart 1-N, is there a way to start just the hart=
0 and hold the other CPUs in reset until explicitly released by hart0 SW?
>
>  I am working on a machine similar to the sifive_u machine that has a set=
 of control registers which are accessible by hart0 to release the other co=
res from reset once the SoC level initialization is completed by the hart0 =
SW. Currently, the CPUs spin if they have a non-zero mhartid, executing cod=
e from resetvec.

I don't think the riscv code has support for this, but QEMU's
core machinery does because it's used by some arm boards,
so it shouldn't be too difficult to add the necessary riscv parts.

You can look at the handling of the 'start-powered-off' property:
the SoC model sets that on CPUs which do not start running
immediately. The target/riscv code may need some minor changes
to do something appropriate with it.
The power-controller device model on an arm board then starts CPUs
as required by calling arm_set_cpu_on() or similar. There will
need to be a riscv-specific version of that code too.

(We don't distinguish "starts powered off" from "starts held
in reset", because from QEMU's point of view both states are
the same: the CPU is not executing instructions.)

thanks
-- PMM

