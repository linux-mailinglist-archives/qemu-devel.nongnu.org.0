Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC326AFAAE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh1O-0008J8-BD; Tue, 07 Mar 2023 18:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZh1I-0008Ie-At
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:00 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZh1G-0002bj-Is
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hn8zDKl0azr+BZgZe2y2ALTtC4U//Kv0tqSqO+Qp4Ss=; b=X+yz9vlLN2f5FRwQnzVxjWkj10
 Gl0sjU9iRC4A5x0N5Y2dCfl4jURLK1/mSw9hy0V73d3gNQdmoGCAbwWAHgcu139A4LFT8F1pzuIJa
 C0wYWl4n/1AXGNRtxiMVZ/EhQ8cYlAFdqjtUk51bY7QxWVzF9rSswe5pLn9FjV11FFKmXrkDrhCqG
 bxC2M3pyjlHVmiPNlpi2LAEXrJxuiffnMBEAgi/LOgylvW++Iwefm+l8T9I9iEkugEvt0HX5T5k7Q
 cOo7GfcN2kpVkYLcZyZBcceLJ+VZNpt5gW0RQieswjE27bCBi6WtZPvBdL/TpSvkOWbrEOy1Iio3z
 1vukUhRm93Bc6f8BD2heG8SUWkbRk1CxdLotlm0jEcazRI6C8zak+pPYFwO95oScHhn9grfpUAHpd
 rAKhXdaZslAbKYgbBJ9AX3ACAeJELrU+I2YzD5OyEHrtUrsd64vVGaDZgt7Dq9GPt2m2347y5HY9b
 6i/MfgOvzPpzPDqktrdwpu0P+FOsOfaylzj0Q9JzlA+Faud00Fo9iWZtT9ltczcDIRCK7NYMtkysu
 Gz/aFZ1nF8ki3EmWKLV4V16sfK7HxvK3yI/GqzuVNjdUsVChR0q9hHEaLvRTj/diRwSKeYLcN9pYi
 51ihFUg4BlTGRteOgvH7LkyQOIvfuVHbJIWJcTWS4=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZh0a-000Bok-04; Tue, 07 Mar 2023 23:46:16 +0000
Message-ID: <83144281-4b2d-4bd6-b8f3-345e4b795f5a@ilande.co.uk>
Date: Tue, 7 Mar 2023 23:46:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>, richard.henderson@linaro.org,
 anjo@rev.ng
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: sh4-linux-user compile failure
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hi Richard/Anton,

It looks as if a compile failure has crept into sh4-linux-user, most likely related 
to the recent TARGET_TB_PCREL/CF_PCREL changes:


cc -m64 -mcx16 -Ilibqemu-sh4-linux-user.fa.p -I. -I.. -Itarget/sh4 -I../target/sh4 
-I../common-user/host/x86_64 -I../linux-user/include/host/x86_64 
-I../linux-user/include -Ilinux-user -I../linux-user -Ilinux-user/sh4 
-I../linux-user/sh4 -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall 
-Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem 
/home/build/src/qemu/git/qemu/linux-headers -isystem linux-headers -iquote . -iquote 
/home/build/src/qemu/git/qemu -iquote /home/build/src/qemu/git/qemu/include -iquote 
/home/build/src/qemu/git/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing 
-fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes 
-Wredundant-decls -Wold-style-declaration -Wold-style-definition -Wtype-limits 
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
-Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
-Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value 
-Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers 
-isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET="sh4-linux-user-config-target.h"' 
'-DCONFIG_DEVICES="sh4-linux-user-config-devices.h"' -MD -MQ 
libqemu-sh4-linux-user.fa.p/accel_tcg_tb-maint.c.o -MF 
libqemu-sh4-linux-user.fa.p/accel_tcg_tb-maint.c.o.d -o 
libqemu-sh4-linux-user.fa.p/accel_tcg_tb-maint.c.o -c ../accel/tcg/tb-maint.c
In file included from ../accel/tcg/tb-hash.h:26,
                  from ../accel/tcg/tb-maint.c:28:
../accel/tcg/tb-jmp-cache.h:24:5: error: "TARGET_TB_PCREL" is not defined, evaluates 
to 0 [-Werror=undef]
    24 | #if TARGET_TB_PCREL
       |     ^~~~~~~~~~~~~~~
../accel/tcg/tb-jmp-cache.h: In function ‘tb_jmp_cache_get_tb’:
../accel/tcg/tb-jmp-cache.h:33:5: error: "TARGET_TB_PCREL" is not defined, evaluates 
to 0 [-Werror=undef]
    33 | #if TARGET_TB_PCREL
       |     ^~~~~~~~~~~~~~~
../accel/tcg/tb-jmp-cache.h: In function ‘tb_jmp_cache_get_pc’:
../accel/tcg/tb-jmp-cache.h:45:5: error: "TARGET_TB_PCREL" is not defined, evaluates 
to 0 [-Werror=undef]
    45 | #if TARGET_TB_PCREL
       |     ^~~~~~~~~~~~~~~
../accel/tcg/tb-jmp-cache.h:48:12: error: implicit declaration of function ‘tb_pc’ 
[-Werror=implicit-function-declaration]
    48 |     return tb_pc(tb);
       |            ^~~~~
../accel/tcg/tb-jmp-cache.h:48:12: error: nested extern declaration of ‘tb_pc’ 
[-Werror=nested-externs]
../accel/tcg/tb-jmp-cache.h: In function ‘tb_jmp_cache_set’:
../accel/tcg/tb-jmp-cache.h:56:5: error: "TARGET_TB_PCREL" is not defined, evaluates 
to 0 [-Werror=undef]
    56 | #if TARGET_TB_PCREL
       |     ^~~~~~~~~~~~~~~
In file included from ../accel/tcg/tb-maint.c:30:
../accel/tcg/internal.h: In function ‘log_pc’:
../accel/tcg/internal.h:60:5: error: "TARGET_TB_PCREL" is not defined, evaluates to 0 
[-Werror=undef]
    60 | #if TARGET_TB_PCREL
       |     ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


ATB,

Mark.


