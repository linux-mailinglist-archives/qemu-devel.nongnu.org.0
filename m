Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B05D4877E1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 14:00:24 +0100 (CET)
Received: from localhost ([::1]:33482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5or1-0007sK-3M
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 08:00:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mengpg2@engene.se>) id 1n5omy-0005mj-Or
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:56:13 -0500
Received: from [2a00:1450:4864:20::32d] (port=33491
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mengpg2@engene.se>) id 1n5omv-0000rq-Mp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:56:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 az31-20020a05600c601f00b003475c3c3d03so920290wmb.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 04:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=engene-se.20210112.gappssmtp.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=N0TGsXL51DoHu4r+2vKwQUMKU+guUAQ0QS5qzDMM3/w=;
 b=37Efftiq5KltnwoYu/krgrCaXnrl6NH5f5zHtOG4R5+IdDifNEhUVtRI0Xw7zx95VR
 rxfz5WPHgPPOwYKZxJIGsY7GD7DoOXTeEtk1mGi+/9a2igv8ejFGmadZl5fvM7k86/nf
 gOdQex2EscyXlcczZCJcUzutEblQjJ/IGwyEzkzYJjQ+ApIuJ/Dp9+1bwKmksOxivD5v
 dMtziBBo3qAMrfRGd0ZwJHxHJM/Yw7bYegYQqR+lSL/0b/0QuRyGrTwr2iUCwURG8fZ+
 JpkmEQ2FKfVEjOOJ75qrThi/VPbytcmQtrKvV2HV9KHzI8UoHok+Oa83cJmWm8wx7eBL
 AsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=N0TGsXL51DoHu4r+2vKwQUMKU+guUAQ0QS5qzDMM3/w=;
 b=AiKLjJkqrqDyRWog4PKXwEISo8SZMhvzGKKxdwfBl3au2b3AkTp74FcWuC1AlZNIYM
 UdbvAfz/y+L4Taog5dG36mtY/bPqicgBFLDruTfhSDPYGnwq/IbxPKokpC9+VPkTTgoV
 +Fz0QCtKI4WCS+vGihFyUJHLt9A412EYtkwXU5th7v/bdVuwEkL/gYGkEeBOkFfjVT9c
 Q56n+j+DbEmmoOvWwWySwtHOKmgRa1NKuCuXhX/Hf6lvlZGNgNz58exrX74EEBaC8ZgF
 5kEX9WtKens9/TzeZPgucX9sV/tJk7BxH9xQhFYwccqQySyEocvm8T7vVJFYIHFjjfbm
 6DpQ==
X-Gm-Message-State: AOAM532RM1n1gnnKhKZWj4+wvr1i8xpZHXIOnUpF5WsDm4y0uFX08KSE
 MaqbFM73gikVPXfXHf2sXylqMi55jMKy/A==
X-Google-Smtp-Source: ABdhPJz//iQli8MydaToQritD0OLFYANYqLS6Mwbc3w8d8vCLQUd5R4wHUSgjR/jX0aHTQkrVFc2Ow==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr10953169wmq.64.1641560165751; 
 Fri, 07 Jan 2022 04:56:05 -0800 (PST)
Received: from [192.168.86.87]
 (132.91.127.176.dynamic.wline.res.cust.swisscom.ch. [176.127.91.132])
 by smtp.gmail.com with ESMTPSA id a3sm4567443wrm.52.2022.01.07.04.56.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 04:56:05 -0800 (PST)
To: qemu-devel@nongnu.org
From: Marcus Engene <mengpg2@engene.se>
Subject: Instruction trace for userspace emulator
Message-ID: <484aced2-61a4-4f4a-f62c-bd9b3ec17481@engene.se>
Date: Fri, 7 Jan 2022 13:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: neutral client-ip=2a00:1450:4864:20::32d;
 envelope-from=mengpg2@engene.se; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'd like to do instruction traces for qemu user, but with more 
information. Basically I'd like qemu-x86_64 to give me roughly the same as
perf record -e intel_pt//u ./a.out

I want to submit changes upstream.

I wrote an email 14dec which Alex Bennée kindly answered but it was 
deleted locally so I can't reply to it now.

I understand the limitations of only having ELF STT_FUNC for
  * the binary I start + the interpreter as these two are loaded by qemu
  * the binary needs to not be stripped
Loading of subsequent libraries seems to totally be done by the 
interpreter, if I've read the code correctly. I would like to use 
plugins because I'd like to write another plugin later that dumps guest 
memory when entering a function of choice.

I added a new API for plugins. Example below. If any:

QEMU_PLUGIN_EXPORT
void qemu_plugin_syminfos(struct syminfo *global_syminfos) {
     local_syminfos = global_syminfos;
}

If any plugin has defined this function, elfload.c loads_symbols()

-    if (qemu_log_enabled()) {
+    if (qemu_log_enabled() || load_symbols_from_elf) {
          load_symbols(ehdr, image_fd, load_bias);
      }

The problem is that the addresses in syminfos are from ELF, and are not 
the same as the addresses in qemu_plugin_tb struct. So, somewhere I need 
to add a mapping table between this address and guest address so I can 
lookup the correct symbol. But where would I add that? I looked in 
translator.c and it's call chain but nothing was obvious to me.

Any thoughts around this would be highly appreciated.

Kind regards,
Marcus



