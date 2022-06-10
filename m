Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58952546E2E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:18:27 +0200 (CEST)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzl5N-0003LS-Tf
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzl3N-0001v7-JY
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 16:16:22 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzl3L-0004CP-OW
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 16:16:21 -0400
Received: by mail-pg1-x531.google.com with SMTP id c18so133910pgh.11
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dVctl4IRQkd1fURU+QcpGbC8x5JnhZO/zEKOCc/5Ty0=;
 b=EY+ItrPHt5Ye3nt8CxjZltnAx1rCtMg/lqcfxI3EB6SBDqixhySMFpr69GGHmhjDI/
 IR6A/48AT/DMp6xs2SxY+nWoyKfm+UjNvwReUJTB+78VWdllV/18YeDjIqkjxB1L+nQa
 IF6zmUEb/+UswLnzEmJQrdSuTsNQGcHf5CsOgKgYmmn52p+Po4CM4v+T00Ebtz8qXpql
 JradafFOVN7S0tDPnB1LyVdXSFC1XgU6Hhb0NBkRv+9pVjRzEvTYEVOsq1yZFgdHw344
 d6R5tDaiMBwriqTJyECVBeUfbVyDcJ82t2rnk33isaac2hIdhY0GjGrBq2ya5g5PChJP
 wWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dVctl4IRQkd1fURU+QcpGbC8x5JnhZO/zEKOCc/5Ty0=;
 b=5mhXv+yyL2uCkkvDTh0rqhRkAmhs/LarFjPftDrCHSkVSq3eNnMd99vo8ISTgt995t
 bpvqELteT+4McNj6ag4wK5JoGGMUqLw8sJG+/gCX1snznwQto6jXizde5ieCiC9Hpgah
 0rzV869BhPsA1O6A6J/y8PI/qTaGempchJjlWn7BxYoQtRpIZu6l4U/DLr0Q6pBe321J
 CWwr1fIJ4EEP8Dj8RvtN8sSEwB5MwZKdoYV5IzSlN/kC3V187BnYtd1tnsppWdwNjMCg
 yXFBjA4ceXvvIIy+o+GRqnWH6jQSDyrhjUy5cPL98VGnz/8z8eDKp56x8dYG5/w+7lhb
 1IbQ==
X-Gm-Message-State: AOAM533+ggXvhUlF1sFPT7qWhmjBIOSIMftsBllHSsWNuqzmzzA43U8c
 NtgYC/PnBMdahwZGAPDinc31PA==
X-Google-Smtp-Source: ABdhPJxrGdO6Q0Zts48COU1P/9MJo/gokFe2MqT/BAV89cuQwKmYGsK+pVSRknZBtTOtWKGvYTgFPg==
X-Received: by 2002:a05:6a00:cd5:b0:51c:19f1:4657 with SMTP id
 b21-20020a056a000cd500b0051c19f14657mr28909933pfv.67.1654892178207; 
 Fri, 10 Jun 2022 13:16:18 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a62a112000000b0051c49fb62b7sm7044478pff.165.2022.06.10.13.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 13:16:17 -0700 (PDT)
Message-ID: <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
Date: Fri, 10 Jun 2022 13:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220610092043.1874654-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/10/22 02:20, Gerd Hoffmann wrote:
> The following changes since commit 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
> 
>    Merge tag 'pull-xen-20220609' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-06-09 08:25:17 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
> 
> for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
> 
>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44 +0200)
> 
> ----------------------------------------------------------------
> usb: add CanoKey device, fixes for ehci + redir
> ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
> virtio-gpu: scanout flush fix

This introduces regressions:

https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
https://gitlab.com/qemu-project/qemu/-/jobs/2575867208


  (27/43) tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password:  ERROR: 
ConnectError: Failed to establish session: EOFError\n	Exit code: 1\n	Command: 
./qemu-system-x86_64 -display none -vga none -chardev 
socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock 
-mon chardev=mon,mode=control -node... (0.09 s)
  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR: ConnectError: Failed to 
establish session: EOFError\n	Exit code: 1\n	Command: ./qemu-system-x86_64 -display none 
-vga none -chardev 
socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock 
-mon chardev=mon,mode=control -node... (0.09 s)
  (29/43) tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password:  ERROR: 
ConnectError: Failed to establish session: EOFError\n	Exit code: 1\n	Command: 
./qemu-system-x86_64 -display none -vga none -chardev 
socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock 
-mon chardev=mon,mode=control -node... (0.09 s)


r~

