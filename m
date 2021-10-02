Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110A141FAE4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:31:57 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcJ9-0006mE-6f
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcGh-0005LW-Et
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:29:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWcGf-0004xw-MR
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:29:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so2011226wmg.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFMap3G+EpBtt31KvkYXdQyiSgMTHW+iMzpfTzswHDw=;
 b=IGT61OtNjNtQAFXabXAvIVueeUeKJCOCB3fU4UhMelbMdqqOUdcAWGL3FpECvPMMC2
 8dY1g3CFdoBKONWvNpRhvj0hsSA655CMapIcen9R8p08cuVLGdrHWnfrsH4OXDqPchaU
 FVNfOXFb0G0f/FfULEXNvDy0gsOGgLYH7SlZGtps0elpaY2kz8GEVqwiogFIkdh2UzXt
 T19/c8GADcbrr1VvcL9XNbPMNd+jRD2U6flklbjZ1o28f4PqlrfsU7LuenLx1dpffuEz
 GnrQb1+VV6xcN7CLbr7lMNxUjxBX//TGsa5pevUxm92K5n57j+9lTmPAvclrK/YFTIsB
 hooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFMap3G+EpBtt31KvkYXdQyiSgMTHW+iMzpfTzswHDw=;
 b=YsSMObeJnz+UVNXNu/nw7+gSvumZi088HpaxGdkJj2GPB4ZD32ZaNqB1Vq4H+LCXL2
 /GjHzOU9jGZUyeqvtyF4/dL4qlNP3+rI3DVNRBWBgOs93BMcPVc9vAYaFhaW3QAqxvmz
 m8L71YpyOlhnt03W+grdldbxOWDnVuRlBbXPbLFby+9Rs4EXVmgJolQ+J5MOdkADDRUC
 gCdNpWV+q4QF0eqMRpHratZXJ6tbHFw5SHHR+RB/sKGpPv0s8/R/lUQLkH+ubewxHYBV
 lXtFIEIGj9f/YG04GwuO39pa5jsldz4/Do9+JU70DqAuSgvixIZ1YpF7vaCV5NhAUhJZ
 GZ8w==
X-Gm-Message-State: AOAM530zcX408GSiKERvKueptngR/jZekHVw6pGpULERIRU6uLzJ2BSj
 XsR1C1HzN6GFhHxd++ZCH0HD2GCYgezhVcC8r7J/vA==
X-Google-Smtp-Source: ABdhPJzsi3xF1K5GNeK/ZDHuRloXZ+T7KZA8uDnACuqXR57Vdw6FORLwfpwZ4h/gUYt3Gv2kE5bTrmn19hiCEzxDzDU=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr8888179wmm.133.1633170559896; 
 Sat, 02 Oct 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Oct 2021 11:28:25 +0100
Message-ID: <CAFEAcA9_nVnW3DnvomvytX8xH53KM24xfn5rCSywa3WWCwEZ4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Sept 2021 at 06:24, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This series implements the Xilinx eFUSE and BBRAM devices for
> the Versal and ZynqMP product families.
>
> Furthermore, both new devices are connected to the xlnx-versal-virt
> board and the xlnx-zcu102 board.
>
> See changes in docs/system/arm/xlnx-versal-virt.rst for detail.

Hi -- now this has landed upstream, Coverity points out a
lot of memory leaks on error or logging paths, where
the code does things like:

*** CID 1464071:  Resource leaks  (RESOURCE_LEAK)
/qemu/hw/nvram/xlnx-versal-efuse-ctrl.c: 628 in efuse_ctrl_reg_write()
622         dev = reg_array->mem.owner;
623         assert(dev);
624
625         s = XLNX_VERSAL_EFUSE_CTRL(dev);
626
627         if (addr != A_WR_LOCK && s->regs[R_WR_LOCK]) {
>>>     CID 1464071:  Resource leaks  (RESOURCE_LEAK)
>>>     Failing to save or free storage allocated by "object_get_canonical_path((Object *)s)" leaks it.
628             qemu_log_mask(LOG_GUEST_ERROR,
629                           "%s[reg_0x%02lx]: Attempt to write
locked register.\n",
630                           object_get_canonical_path(OBJECT(s)), (long)addr);
631         } else {
632             register_write_memory(opaque, addr, data, size);
633         }

You need to free the memory here. A good pattern is how it's
done in xlnx-zynqmp-can.c with g_autofree:

    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
        g_autofree char *path = object_get_canonical_path(OBJECT(s));

        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer data while"
                      " data while controller is in reset mode.\n",
                      path);
        return false;
    }

Could somebody send some followup patches that fix all of these,
please? (There are 10 coverity issues, covering probably all of
the places where object_get_canonical_path() is used in this series.)

thanks
-- PMM

