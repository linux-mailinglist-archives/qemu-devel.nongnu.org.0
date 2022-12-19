Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB4651001
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IjW-00015P-Pa; Mon, 19 Dec 2022 11:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7IjU-00013o-Hh
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:11:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7IjT-0004qE-1E
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:11:16 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so6826997wms.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXeHZztbDCKqGjGcXHDdlmY5P9mdvxtTjIv3fTHYmXw=;
 b=fX7Y0PpO6feGU6uJXq9mcIFXBNfi6fwdV4ygU6Pdh7IOeMAiNgBl6OwMjU2I+QiaWm
 z5LCIDWlqyJ5hYvMRAJuyod8WJOa4SNaxJOEKNT9iemsuq2SlxXpj0ui7ItYUXcarr1+
 l/lzwH5j2/wlt23g5LajErcWIDDJGcju06S+14kemDJgCPcjNnQUuMMr9mm/36gdiOGF
 EYxE4lxkToV4Rq1WidK5h148wtWrnWL1lx9Jbxi/emEBaGVXPTw1J9wtg1tlumsfNJJt
 YZ+qBWVn+LJulJx5Z62ZQ7Wg980O7QpgD3AkVfggq5XiVHbN1ZdDIryLUZfBX7SUjJKz
 fBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sXeHZztbDCKqGjGcXHDdlmY5P9mdvxtTjIv3fTHYmXw=;
 b=CoWYmIzSYVDuZAd/HR7yk0S+uOYq2Nla6t/IaVLt/qZpc/WibpinOJQGh4n4/JjxLp
 IzztP8RzhdY+43nCjEybG2uVAHiMMVsifQikaBVIIB7s3ZC1c2ecXmHbLEQdaxgJCU+E
 nJiMO945lHxTxP7Zq5hVuh+H6RUWPedfy7QTCrtLOHNMZlJlNZhZhfwZmkYmNauhgpf8
 SLk/Qgwb4y51vvXLf0NYCveovmsUvg7jl3/vK/UeFP7lv4G5U05M0ibUwZwjMP8CC9cw
 fxgkMgrUUaVk40/NIQ/eYC3BhgsLmkMhgJpunXs+9SI5BRSoL83ACEcwN91ads8xxD7k
 bhUQ==
X-Gm-Message-State: AFqh2kqi/tQv/DJLeNehyyKiuesqTPuD3XRG26Fxoa/G35TokffrryJN
 6Tm7TtcVqOFQuxxYAYWrnDy/Tw==
X-Google-Smtp-Source: AMrXdXt+5lmcxOfEwYBh3Jhftzy2tbS/BQNzY0lTjIf/AvEbPmG7yZ4lGCj1vQ8Wb2Fj5xF/KjGwtw==
X-Received: by 2002:a05:600c:54c2:b0:3d3:5166:2da4 with SMTP id
 iw2-20020a05600c54c200b003d351662da4mr5595665wmb.8.1671466273070; 
 Mon, 19 Dec 2022 08:11:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003c6bd91caa5sm12850179wmc.17.2022.12.19.08.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 08:11:12 -0800 (PST)
Message-ID: <3ce8e739-4894-b79e-1972-f972fd763e5b@linaro.org>
Date: Mon, 19 Dec 2022 17:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Should -overcommit cpu-pm=on|off be converted to some machine sugar
 property?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Paolo,

I just noticed 'enable_cpu_pm' which seems architecture specific
option that ended into common code:

$ git grep -E 'cpu[_-]pm'
accel/tcg/user-exec-stub.c:5:bool enable_cpu_pm = false;
include/sysemu/sysemu.h:49:extern bool enable_cpu_pm;
Binary file pc-bios/skiboot.lid matches
qemu-options.hx:4196:    "-overcommit [mem-lock=on|off][cpu-pm=on|off]\n"
qemu-options.hx:4199:    "                cpu-pm=on|off controls cpu 
power management (default: off)\n",
qemu-options.hx:4204:``-overcommit cpu-pm=on|off``
qemu-options.hx:4214:    guest) can be enabled via ``cpu-pm=on`` 
(disabled by default). This
softmmu/globals.c:38:bool enable_cpu_pm;
softmmu/vl.c:350:            .name = "cpu-pm",
softmmu/vl.c:3440:                enable_cpu_pm = 
qemu_opt_get_bool(opts, "cpu-pm", false);
target/i386/host-cpu.c:44:static void host_cpu_enable_cpu_pm(X86CPU *cpu)
target/i386/host-cpu.c:88:    if (cpu->max_features && enable_cpu_pm) {
target/i386/host-cpu.c:89:        host_cpu_enable_cpu_pm(cpu);
target/i386/kvm/kvm-cpu.c:43:        if (enable_cpu_pm && 
kvm_has_waitpkg()) {
target/i386/kvm/kvm.c:390:        if (enable_cpu_pm) {
target/i386/kvm/kvm.c:2576:    if (enable_cpu_pm) {

Do we want to maintain this as a generic property or
can it be deprecated / converted to a machine-specific one?

Thanks,

Phil.

