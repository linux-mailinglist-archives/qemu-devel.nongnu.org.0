Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D595E15CA99
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 19:41:45 +0100 (CET)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2JQm-0005bm-VR
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 13:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j2JP8-0004gI-H4
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 13:40:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j2JP6-0002du-92
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 13:40:02 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j2JP6-0002bl-3q
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 13:40:00 -0500
Received: by mail-pg1-x541.google.com with SMTP id 6so3584054pgk.0
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WpagkWEB+HFU0SwhFjWW2kqcjRn0A0RQR9U9vbiDKXQ=;
 b=t34QHKT8C0S4sCPcE3usOzJDQl+dEARKOQE5ebVrlAopYWEcOLNDRfqJ7jntHw9x7q
 tyVyIqQRZ4xlvmen45w8utj/fZFTtrM14hsBsJVUQhThb/av/2piqtLijezEhPEzxeqA
 IzI3W3a9Lb0voCvEN9oet/VVinYRAWD+gn8XGb9wHB1TfOjXmunRAaEin9ywDdjFyZoJ
 Jo/iVmWiAdZ/psMRFoRSzcoP5AVdtF1wFFdjDgYIWBbMo/aBusjvsXZS1k340bddjJAW
 /Y2Bes93Co0FsnvffOuV7WJoAMiREB5kHo2mQE6t80Kl5Y2VfTX+JLjgbuO9aa8C6M4t
 Vm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WpagkWEB+HFU0SwhFjWW2kqcjRn0A0RQR9U9vbiDKXQ=;
 b=sJ52+CWrF5FHuv3c8NjHDwlZKeIFpuVkDGvZGDNxBYlzubereEhLeaoQL86Vn0sVVY
 3ryzjT4YoiSFGJZ3o270EbpBf0+W5tnd3fRFizhep+xtZSys4u9irYcxWvHynK/Y7iGN
 mRywGfTywD/R6EgaDqWy+snNm5r2cf6XfYc/q5j7R6tINoj8pulnQBJlkH9fAPK5Ulmc
 5bDlSGRMP/7PVvANaP/BITmvxhDatJO19aDmXqmY6Q6RFrFkDVGUohYc9vBWORTKDAe8
 4FgrTB9dEiOytPN/WkZBrPfEzmGQTWOqS2lFZtKecbEEBJL2nktLYsX7tZyOBvGBeylc
 V+8g==
X-Gm-Message-State: APjAAAWWXmnurQ8KmajqhvXzr3VrQ7dpBRGeosMIk4fcmOCZgfiwoFMa
 Fww+eQ7iGu7oZ/0D5hM1bpuJyMZR8hk=
X-Google-Smtp-Source: APXvYqzglZCrYD/PN02be8NKeMBx4SQKMzF49fdoW+9/MyGwPdDpxHV9NhCssyHUpqrYYvMvHUoHFg==
X-Received: by 2002:a65:404d:: with SMTP id h13mr17092537pgp.156.1581619198677; 
 Thu, 13 Feb 2020 10:39:58 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 23sm3911509pfh.28.2020.02.13.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 10:39:58 -0800 (PST)
Date: Thu, 13 Feb 2020 10:39:58 -0800 (PST)
X-Google-Original-Date: Thu, 13 Feb 2020 10:39:56 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 26/35] target/riscv: Disable guest FP support based on
 virtual status
In-Reply-To: <af25bd3f009f8f73b43c91ab5205bfcb9d28666b.1580518859.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-7d291f79-4c48-48a5-858f-65ca37fdf4c3@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 31 Jan 2020 17:02:44 PST (-0800), Alistair Francis wrote:
> When the Hypervisor extension is in use we only enable floating point
> support when both status and vsstatus have enabled floating point
> support.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e7728cb0ca..827a38324c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -99,6 +99,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  bool riscv_cpu_fp_enabled(CPURISCVState *env)
>  {
>      if (env->mstatus & MSTATUS_FS) {
> +        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_FS)) {
> +            return false;
> +        }
>          return true;
>      }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

