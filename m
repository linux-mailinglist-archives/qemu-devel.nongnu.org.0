Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C955B54C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 04:41:57 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ehI-0002E5-Gs
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 22:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5eg5-0001QE-NB
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 22:40:42 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5eg3-0002ly-Tu
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 22:40:41 -0400
Received: by mail-pf1-x432.google.com with SMTP id t21so7707541pfq.1
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 19:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=kTpFcMVzZrdsJTuV94FsQTy8u1XtjphN545kfh9Pi4U=;
 b=TDIdj4drXb9I320DvdMTzyaLrqBYy+j7ZQSnkWxAxAlm5mQ7XoeAUrCi0qpN9IpT5a
 z7J7UDNV7+pqwtUjxbTCAiyJ6NGHLC4RAz+9EC1l5o4Ur6AeIemgsw48WZS1rybNiSN9
 a+CYrvClDPj5r9RP879QDAaRV2x4HLZCy/2jxztnswKODQ01RpD0FWvtmu+J3rUq24uF
 oyBvzTk8wCocMyUPrSyuqPiHhl7VBpkyfLBHaZ5UjKw1ONR7ZO9qeZytvZ/H6TScmyAM
 phr9g6BrqdpZVHNSmREJZZ6Ay1Xu3DJGFEHKgOgHXPnyUY2XgcKmrztICwZfwDBupWHO
 NmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=kTpFcMVzZrdsJTuV94FsQTy8u1XtjphN545kfh9Pi4U=;
 b=iRzV4x2UAXAhEtVIpBdIS/+tGSF9ryC8B4JB0zhM8XPhL+HKUA53S/asvyRwSwQk8B
 MT8L/c8A00HpIM2/iA4dMRqZt9A2mVX836f5+JxFSHz/FU9Sz1r0FRFyzzhg9yzQp1Ix
 UoSCof4om9AtAWjnZ1q/NkdSoK9ROoNX2+OjJGQ9SXpAviEwASjtVNpLSytQPHR5yt4c
 YnNLq0gQhcxUsKTZqCBkfyFm/gy65thFjy+/A14rJfOdhyTiJR42KwBk1h3GKmCtbGbz
 6dUmgmjS8KBds+b0wKQCpsoGfj6scVkKbHzZ+YbrQZzgX8puDvkOCUT4VStrqp/A/HGV
 NuJw==
X-Gm-Message-State: AJIora977qH7c/MP7DTeYxAtW5+bSa3I6XPEYi/GsKKbDHh+6yq55X1Q
 I2TmJjrZcgpRig4iPty4DQocFA==
X-Google-Smtp-Source: AGRyM1tvXkx8qaVhLvPTniG+1BjxOI1nir9OgnWlNSyoDjvl9LBWkihI2JzDgWSkDUs6QafXFzva1w==
X-Received: by 2002:a05:6a00:22d4:b0:525:ba83:55a1 with SMTP id
 f20-20020a056a0022d400b00525ba8355a1mr2594648pfj.3.1656297637718; 
 Sun, 26 Jun 2022 19:40:37 -0700 (PDT)
Received: from [192.168.44.231] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a056a00175100b00525119428f8sm5859970pfc.209.2022.06.26.19.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 19:40:37 -0700 (PDT)
Message-ID: <c27c93e9-c6e9-1d12-8b45-41c34065a977@linaro.org>
Date: Mon, 27 Jun 2022 08:10:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Intermittent meson failures on msys2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi guys,

There's an occasional failure on msys2, where meson fails to capture the output of a build 
script.  E.g.

https://gitlab.com/qemu-project/qemu/-/jobs/2642051161

FAILED: ui/input-keymap-qcode-to-linux.c.inc
"C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe" 
"C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal" "exe" "--capture" 
"ui/input-keymap-qcode-to-linux.c.inc" "--" 
"C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe" 
"../ui/keycodemapdb/tools/keymap-gen" "code-map" "--lang" "glib2" "--varname" 
"qemu_input_map_qcode_to_linux" "../ui/keycodemapdb/data/keymaps.csv" "qcode" "linux"
[301/1665] Generating input-keymap-qcode-to-qnum.c.inc with a custom command (wrapped by 
meson to capture output)
ninja: build stopped: subcommand failed.


https://gitlab.com/qemu-project/qemu/-/jobs/2625836697

FAILED: ui/shader/texture-blit-frag.h
"C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe" 
"C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal" "exe" "--capture" 
"ui/shader/texture-blit-frag.h" "--" "perl" 
"C:/GitLab-Runner/builds/qemu-project/qemu/scripts/shaderinclude.pl" 
"../ui/shader/texture-blit.frag"
[313/1663] Generating texture-blit-vert.h with a custom command (wrapped by meson to 
capture output)
ninja: build stopped: subcommand failed.


Could you have a look please?


r~

