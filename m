Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6C2693CD5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 04:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRPJr-0005kx-FX; Sun, 12 Feb 2023 22:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pRPJm-0005il-LE
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 22:15:50 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pRPJk-0002Fj-8U
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 22:15:49 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e17so3290357plg.12
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 19:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S4a6IGBvWMqLgMTjeQ/cbKiXdve1YRpp52+qy5xMlDY=;
 b=kNDNPJL5x3qNeLqXnIjkx/4cjWa2XdrBVsHHF/5UaMjyfM1Q5GpXkjd9vkY9tBHUMP
 +CYSpN8UGx+v91Qw5imVZGJ3V8nQqwH0Ed0fPkU3HM9WztcCGAn+qiutFUG/uJx/GLky
 pPISBe9YPlfX3EKCGEL8mhayJuu8CS4imZTNZKH32mns6ZyAlSpJy0+g3L/fefR19tgk
 z2N6u+LdhlicoMiz9CE/XYR8epwu8oZotdT7ntXpvEYHaRx7W7i4+EFu4mXDQJaltbpv
 7yFkA9KEBEjaa/mZki/9p3RTqbCrjQETRBBuEWGccx1/nkrm6opJms5oWER8q4liQyPM
 4V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S4a6IGBvWMqLgMTjeQ/cbKiXdve1YRpp52+qy5xMlDY=;
 b=2K9m5cPAIiucg8OOWp0k98/Fh6SFdkBgr1EUcJXx7nJrKEFvwFzN1TAZcbGFoSSWvC
 DyLLm6ML2SO1Kp0nOZtidG73f4oKlvaiaeItXOzGia1JRNWO4238AIZAuGooJ+Sb7y7P
 kS5KnbdbxK+XQHBO1Bf6p1kcKBdmbvCMfi1LUBEeSzIMR0jSO0nyDc1pHWllZjVUxhfo
 XY1hEggWxA6NyPXyKc6vEszyT35T1XZNhqVOw8Z8h06R0wIxP0So7+RrO0wDwpuvkyEb
 E/nj3J0frpsi2QSKzhmLqzP5sg8SSbDVawEAbYY8Y0PV4FSiHUIgsiVBjZ0WWjD4EN3M
 KzZw==
X-Gm-Message-State: AO0yUKXvYGhf41obTo11yuMimECwCzL/SzkWy3lMQssOmPy6fIEypljn
 57sKYnBZQbkgIGi/63tiC/u9UA==
X-Google-Smtp-Source: AK7set+mR6I9OXkaWrvUA+8sJtk5efnKc1JG8uapa/QtTAZSa/dHeGCw67oO+qz9Olhu+jwnAdywzQ==
X-Received: by 2002:a05:6a20:7d83:b0:c3:19ef:1a83 with SMTP id
 v3-20020a056a207d8300b000c319ef1a83mr22245751pzj.32.1676258145220; 
 Sun, 12 Feb 2023 19:15:45 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i4-20020aa79084000000b005a8851e0d04sm2875804pfa.158.2023.02.12.19.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 19:15:44 -0800 (PST)
Date: Sun, 12 Feb 2023 19:15:43 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: weiwei <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Message-ID: <20230213031543.GA3943238@debug.ba.rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-2-debug@rivosinc.com>
 <f4cdeb7f-99db-cd87-54cd-baed603832db@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4cdeb7f-99db-cd87-54cd-baed603832db@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, Feb 11, 2023 at 11:19:11AM +0800, weiwei wrote:
>
>On 2023/2/9 14:23, Deepak Gupta wrote:
>>Introducing riscv `zisslpcfi` extension to riscv target. `zisslpcfi`
>>extension provides hardware assistance to riscv hart to enable control
>>flow integrity (CFI) for software.
>>
>>`zisslpcfi` extension expects hart to implement `zimops`. `zimops` stands
>>for "unprivileged integer maybe operations". `zimops` carve out certain
>>reserved opcodes encodings from integer spec to "may be operations"
>>encodings. `zimops` opcode encodings simply move 0 to rd.
>>`zisslpcfi` claims some of the `zimops` encodings and use them for shadow
>>stack management or indirect branch tracking. Any future extension can
>>also claim `zimops` encodings.
>>
>>This patch also adds a dependency check for `zimops` to be enabled if
>>`zisslpcfi` is enabled on the hart.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>Signed-off-by: Kip Walker  <kip@rivosinc.com>
>>---
>>  target/riscv/cpu.c | 13 +++++++++++++
>>  target/riscv/cpu.h |  2 ++
>>  2 files changed, 15 insertions(+)
>>
>>diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>index cc75ca7667..6b4e90eb91 100644
>>--- a/target/riscv/cpu.c
>>+++ b/target/riscv/cpu.c
>>@@ -110,6 +110,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
>>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
>>+    ISA_EXT_DATA_ENTRY(zimops, true, PRIV_VERSION_1_12_0, ext_zimops),
>>+    ISA_EXT_DATA_ENTRY(zisslpcfi, true, PRIV_VERSION_1_12_0, ext_cfi),
>
>By convention, it� should be ext_zisslpcfi� .

Noted. Will fix it.

>
>>  };
>>  static bool isa_ext_is_enabled(RISCVCPU *cpu,
>>@@ -792,6 +794,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>              return;
>>          }
>>+        if (cpu->cfg.ext_cfi && !cpu->cfg.ext_zimops) {
>>+            error_setg(errp, "Zisslpcfi extension requires Zimops extension");
>>+            return;
>>+        }
>>+
>
>If� Zisslpcfi implicitly means Zimops is implemented as commented in 
>following code, I think we should just enable zimops� when zisslpcfi 
>is enabled.
>
Hmm... That's a good idea (at-least for qemu implementation)
Only catch is this
    - Since zimops does move 0 to rd. That's still an operation that's happening on 
      destination. If none of the extensions are implemented, it might be good to have
      just zimops enabled *just* to make sure binary is not breaking anything (by moving
      0 to destination)
>>          /* Set the ISA extensions, checks should have happened above */
>>          if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>>              cpu->cfg.ext_zhinxmin) {
>>@@ -1102,6 +1109,12 @@ static Property riscv_cpu_properties[] = {
>>  #ifndef CONFIG_USER_ONLY
>>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>>  #endif
>>+    /*
>>+     * Zisslpcfi CFI extension, Zisslpcfi implicitly means Zimops is
>>+     * implemented
>>+     */
>>+    DEFINE_PROP_BOOL("zisslpcfi", RISCVCPU, cfg.ext_cfi, true),
>>+    DEFINE_PROP_BOOL("zimops", RISCVCPU, cfg.ext_zimops, true),
>
>These properties can not expose to users before all its functions are 
>ready. And it need add 'x-' prefix as experimental extensions 
>currently.

Noted will revise it.

>
>Regards,
>
>Weiwei Li
>
>>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>>diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>index f5609b62a2..9a923760b2 100644
>>--- a/target/riscv/cpu.h
>>+++ b/target/riscv/cpu.h
>>@@ -471,6 +471,8 @@ struct RISCVCPUConfig {
>>      uint32_t mvendorid;
>>      uint64_t marchid;
>>      uint64_t mimpid;
>>+    bool ext_zimops;
>>+    bool ext_cfi;
>>      /* Vendor-specific custom extensions */
>>      bool ext_XVentanaCondOps;
>

