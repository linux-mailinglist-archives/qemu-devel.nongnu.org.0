Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D60A58B9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 16:05:04 +0200 (CEST)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4mx4-0004r1-Lz
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 10:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1i4mtq-0003DO-IR
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1i4mtp-0007s2-8R
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:01:42 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39312)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1i4mtp-0007qp-19
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 10:01:41 -0400
Received: by mail-pg1-x542.google.com with SMTP id u17so7519553pgi.6
 for <qemu-devel@nongnu.org>; Mon, 02 Sep 2019 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oElsIV9jGIkcznG1hjJ8A0RR90Xk82sVn+s7o2gFZVw=;
 b=DXppbnrXBC0KMs7ss5fQmX7CDEQq+auVg7CleiurbMVAP2aZuNeZ/eeoG7IAf7Q5G2
 yF2MXLqxAZ4/d6KLZtHYXiC5PB06hmUylHFK3n1exR9AA+x3ksX81iJkZzb7MeVne0pC
 hsEH20Gxaswbb/kckl+W+HkK6gqHkk5k3Hl9TPPiTfQFueXLyNfimygd0FxEIn29FWOi
 Mua1ElsB5f6GaRj4XUfKLym+xBmzZ7U4/ZrAHzQrL4qBIynxLbGDlRBrFAP01RAy2lcp
 Nu1K3OFuyBblUR2xzLzhyuKthb+lbsANz3tRXlTdmbe55idWtK4XLENzw1mh0c2STiwl
 UBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oElsIV9jGIkcznG1hjJ8A0RR90Xk82sVn+s7o2gFZVw=;
 b=LwbWve5ZvIODXVEXr0r04WjaT/ImG5E+KwsaDacJbh2FC14hae0Vk64X3REN89X5ep
 KNcytRYZ+3Obt8bRWL7cai1VGwDEGFL+K84NTMkn/I2A0LGVsSCBKjRLEbm2f4n+HQok
 f9fb5npqhNzNQ+WoHvwT8B589MC7GR/jHwgYsvXHlihNse1H7a+mGiS4Fh2vPp0wjuNO
 w2laIlUgodEXC1v1rpHwHj0ZROeuxAQ8U65dIY8lQRaT1+mZMfVNZPOsehJesErEsLJv
 mlAdRMqtnnCGi9vmDvj5Ni5CB+LFbmuX90tEbgZd0zjfor7Yjk7XHN51ElRX7Vw+uNJb
 MwEA==
X-Gm-Message-State: APjAAAWYaotndhHo4BYCabWdLqX8muAbaZ7+cGgKVAEBDXjrC4bhbux2
 5jkl8iM27pKfSHmKaGBw1fG7PC3nrOFXc19V
X-Google-Smtp-Source: APXvYqzmu+EGTXDNrqYXP+2H5xO4gh6c5a+VEn68aWjYu6uZjC/5Tp8GmdxMGDXUcvnl1NSbKFBxhQ==
X-Received: by 2002:a62:f208:: with SMTP id m8mr33296600pfh.108.1567432899637; 
 Mon, 02 Sep 2019 07:01:39 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com ([206.81.201.98])
 by smtp.gmail.com with ESMTPSA id v18sm4562020pfn.24.2019.09.02.07.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Sep 2019 07:01:39 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Sep 2019 17:01:29 +0300
Message-Id: <20190902140134.74081-4-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20190902140134.74081-1-mrolnik@gmail.com>
References: <20190902140134.74081-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v30 3/8] target/avr: Add instruction decoding
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
Cc: thuth@redhat.com, dovgaluk@ispras.ru, richard.henderson@linaro.org,
 Michael Rolnik <mrolnik@gmail.com>, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- encoding of all 16 bit instructions
- encoding of all 32 bit instructions

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/insn.decode | 175 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 target/avr/insn.decode

diff --git a/target/avr/insn.decode b/target/avr/insn.decode
new file mode 100644
index 0000000000..6b387762c6
--- /dev/null
+++ b/target/avr/insn.decode
@@ -0,0 +1,175 @@
+#
+#   A = [16 .. 31]
+#   B = [16 .. 23]
+#   C = [24, 26, 28, 30]
+#   D = [0, 2, 4, 6, 8, .. 30]
+
+%rd             4:5
+%rr             9:1 0:4
+
+&rd_rr          rd rr
+&rd_imm         rd imm
+
+@op_rd_rr       .... .. . ..... ....        &rd_rr      rd=%rd rr=%rr
+ADD             0000 11 . ..... ....        @op_rd_rr
+ADC             0001 11 . ..... ....        @op_rd_rr
+AND             0010 00 . ..... ....        @op_rd_rr
+CP              0001 01 . ..... ....        @op_rd_rr
+CPC             0000 01 . ..... ....        @op_rd_rr
+CPSE            0001 00 . ..... ....        @op_rd_rr
+EOR             0010 01 . ..... ....        @op_rd_rr
+MOV             0010 11 . ..... ....        @op_rd_rr
+MUL             1001 11 . ..... ....        @op_rd_rr
+OR              0010 10 . ..... ....        @op_rd_rr
+SBC             0000 10 . ..... ....        @op_rd_rr
+SUB             0001 10 . ..... ....        @op_rd_rr
+
+
+%rd_c           4:2                         !function=to_C
+%imm6           6:2 0:4
+
+@op_rd_imm6     .... .... .. .. ....        &rd_imm     rd=%rd_c imm=%imm6
+ADIW            1001 0110 .. .. ....        @op_rd_imm6
+SBIW            1001 0111 .. .. ....        @op_rd_imm6
+
+
+%rd_a           4:4                         !function=to_A
+%rr_a           0:4                         !function=to_A
+%rd_d           4:4                         !function=to_D
+%rr_d           0:4                         !function=to_D
+%imm8           8:4 0:4
+
+@op_rd_imm8     .... .... .... ....         &rd_imm     rd=%rd_a imm=%imm8
+ANDI            0111 .... .... ....         @op_rd_imm8
+CPI             0011 .... .... ....         @op_rd_imm8
+LDI             1110 .... .... ....         @op_rd_imm8
+ORI             0110 .... .... ....         @op_rd_imm8
+SBCI            0100 .... .... ....         @op_rd_imm8
+SUBI            0101 .... .... ....         @op_rd_imm8
+
+
+@op_rd          .... ... rd:5 ....
+ASR             1001 010 ..... 0101         @op_rd
+COM             1001 010 ..... 0000         @op_rd
+DEC             1001 010 ..... 1010         @op_rd
+ELPM2           1001 000 ..... 0110         @op_rd
+ELPMX           1001 000 ..... 0111         @op_rd
+INC             1001 010 ..... 0011         @op_rd
+LDX1            1001 000 ..... 1100         @op_rd
+LDX2            1001 000 ..... 1101         @op_rd
+LDX3            1001 000 ..... 1110         @op_rd
+LDY2            1001 000 ..... 1001         @op_rd
+LDY3            1001 000 ..... 1010         @op_rd
+LDZ2            1001 000 ..... 0001         @op_rd
+LDZ3            1001 000 ..... 0010         @op_rd
+LPM2            1001 000 ..... 0100         @op_rd
+LPMX            1001 000 ..... 0101         @op_rd
+LSR             1001 010 ..... 0110         @op_rd
+NEG             1001 010 ..... 0001         @op_rd
+POP             1001 000 ..... 1111         @op_rd
+PUSH            1001 001 ..... 1111         @op_rd
+ROR             1001 010 ..... 0111         @op_rd
+STY2            1001 001 ..... 1001         @op_rd
+STY3            1001 001 ..... 1010         @op_rd
+STZ2            1001 001 ..... 0001         @op_rd
+STZ3            1001 001 ..... 0010         @op_rd
+SWAP            1001 010 ..... 0010         @op_rd
+
+
+@op_bit         .... .... . bit:3 ....
+BCLR            1001 0100 1 ... 1000        @op_bit
+BSET            1001 0100 0 ... 1000        @op_bit
+
+
+@op_rd_bit      .... ... rd:5 . bit:3
+BLD             1111 100 ..... 0 ...        @op_rd_bit
+BST             1111 101 ..... 0 ...        @op_rd_bit
+
+
+@op_bit_imm     .... .. imm:s7 bit:3
+BRBC            1111 01 ....... ...         @op_bit_imm
+BRBS            1111 00 ....... ...         @op_bit_imm
+
+
+BREAK           1001 0101 1001 1000
+EICALL          1001 0101 0001 1001
+EIJMP           1001 0100 0001 1001
+ELPM1           1001 0101 1101 1000
+ICALL           1001 0101 0000 1001
+IJMP            1001 0100 0000 1001
+LPM1            1001 0101 1100 1000
+NOP             0000 0000 0000 0000
+RET             1001 0101 0000 1000
+RETI            1001 0101 0001 1000
+SLEEP           1001 0101 1000 1000
+SPM             1001 0101 1110 1000
+SPMX            1001 0101 1111 1000
+WDR             1001 0101 1010 1000
+
+
+@op_reg_bit     .... .... reg:5 bit:3
+CBI             1001 1000 ..... ...         @op_reg_bit
+SBI             1001 1010 ..... ...         @op_reg_bit
+SBIC            1001 1001 ..... ...         @op_reg_bit
+SBIS            1001 1011 ..... ...         @op_reg_bit
+
+
+DES             1001 0100 imm:4 1011
+
+
+%rd_b           4:3                         !function=to_B
+%rr_b           0:3                         !function=to_B
+@fmul           .... .... . ... . ...       &rd_rr      rd=%rd_b rr=%rr_b
+FMUL            0000 0011 0 ... 1 ...       @fmul
+FMULS           0000 0011 1 ... 0 ...       @fmul
+FMULSU          0000 0011 1 ... 1 ...       @fmul
+MULSU           0000 0011 0 ... 0 ...       @fmul
+
+
+%io_imm         9:2 0:4
+@io_rd_imm      .... . .. ..... ....        &rd_imm     rd=%rd imm=%io_imm
+IN              1011 0 .. ..... ....        @io_rd_imm
+OUT             1011 1 .. ..... ....        @io_rd_imm
+
+
+XCH             1001 001 rd:5 0100
+LAC             1001 001 rd:5 0110
+LAS             1001 001 rd:5 0101
+LAT             1001 001 rd:5 0111
+STX1            1001 001 rr:5 1100
+STX2            1001 001 rr:5 1101
+STX3            1001 001 rr:5 1110
+
+
+%ldst_d_imm     13:1 10:2 0:3
+@ldst_d         .. . . .. . rd:5  . ...     &rd_imm     imm=%ldst_d_imm
+LDDY            10 . 0 .. 0 ..... 1 ...     @ldst_d
+LDDZ            10 . 0 .. 0 ..... 0 ...     @ldst_d
+STDY            10 . 0 .. 1 ..... 1 ...     @ldst_d
+STDZ            10 . 0 .. 1 ..... 0 ...     @ldst_d
+
+
+MOVW            0000 0001 .... ....         &rd_rr      rd=%rd_d rr=%rr_d
+MULS            0000 0010 .... ....         &rd_rr      rd=%rd_a rr=%rr_a
+
+RCALL           1101 imm:s12
+RJMP            1100 imm:s12
+
+SBRC            1111 110 rr:5 0 bit:3
+SBRS            1111 111 rr:5 0 bit:3
+
+# The 22-bit immediate is partially in the opcode word,
+# and partially in the next.  Use append_16 to build the
+# complete 22-bit value.
+%imm_call       4:5 0:1                     !function=append_16
+CALL            1001 010 ..... 111 .        imm=%imm_call
+JMP             1001 010 ..... 110 .        imm=%imm_call
+
+
+# The 16-bit immediate is completely in the next word.
+# Fields cannot be defined with no bits, so we cannot play
+# the same trick and append to a zero-bit value.
+# Defer reading the immediate until trans_{LDS,STS}.
+@ldst_s         .... ... rd:5 ....          imm=0
+LDS             1001 000 ..... 0000         @ldst_s
+STS             1001 001 ..... 0000         @ldst_s
-- 
2.17.2 (Apple Git-113)


