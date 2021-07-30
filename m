Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CAD3DBCF8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 18:19:20 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9VEE-0004VD-Rp
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 12:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikitag594@gmail.com>)
 id 1m9VAf-0002zv-9U
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 12:15:38 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikitag594@gmail.com>)
 id 1m9VAd-0006Ee-N0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 12:15:36 -0400
Received: by mail-lj1-x236.google.com with SMTP id m9so13070676ljp.7
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=WA52cpyQByTBR3xiCHC1IH3NuPU6DENF2gVsWubl608=;
 b=TKHoUJF7aigMtbPQlRFHwvsEwNhQ/5b1MhEItHbFww8byg22CHG+7BOJFjPgodVqe2
 GSgM/5HEHQF4+0CoCVm7OqVr3bdEmkXM682DuvLTJiocaIZTS/i0zoQB9kOL7BLXn8Dy
 Ll8uGCDa6CBaEhmS7+EhuWVEk/EJYPYxIPRcUgezVB4Bx+ODQMWWAktjEXiZFYo+oFOE
 nrjXWfxcMwpVFtfNyctrboLSeXzaZ8TFx7i6MIGBEL0wLoOV7L6sx83U0XhPlumY3ZUa
 OFTUIOMKxn/z2Y7W72JtH8Qaj202QxBiZ6/PRNjAMCkO1WIkvIawNMk1Y2cNNe3fQi4u
 fTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=WA52cpyQByTBR3xiCHC1IH3NuPU6DENF2gVsWubl608=;
 b=tx1fsJxKI6qbvDKRq4LU/aF5LXu3Bj5bVh+l8pt+Nrc1NWKoV94AfNkxoSIlNX7Ia4
 ocTU4Burf1sF26NnrFdXcs36ds1pWWuKBAPa83ntNPmHdlm6M7Okny2qR02nchlfeuJc
 S4ItnUSW1bSnSw67q96YneOHQgLwtelipyXAHVVD/nX+EgBtDB7gipbJCNuvx8KojJ0e
 QQqLstXAvnF1G5hHhtBv944SMt9cwsGzqNC6RwJflh6mbOR4qdl6IQVKFbd2Pzs55VaO
 mNaxpKG1CRE1Zqmkrwo3l+W+QVGsj0JioFfi9TQkcnxeIA83bLPLkOu5K9Jr+MXkK2Iz
 x67A==
X-Gm-Message-State: AOAM5327aQXXNhJMtnmTfX3cHQzMUijvsJiTSqUkaH39d+CXLW68pcJn
 HphGse3f1IZLdCB+u1SojvFFblYDYqux1A==
X-Google-Smtp-Source: ABdhPJz/SVdxel153n8JQKLnA5UbqyJfy7a3fdVOEs/tq9lyuC8FYIviBQeBdzvQx3/v/Js6HipV8Q==
X-Received: by 2002:a2e:5803:: with SMTP id m3mr2204216ljb.70.1627661732264;
 Fri, 30 Jul 2021 09:15:32 -0700 (PDT)
Received: from [10.10.133.142] ([83.149.199.249])
 by smtp.gmail.com with ESMTPSA id h4sm186531lft.184.2021.07.30.09.15.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 09:15:31 -0700 (PDT)
From: Nikita Gnilozub-Volobuev <nikitag594@gmail.com>
X-Google-Original-From: Nikita Gnilozub-Volobuev <nikitav59@gmail.com>
To: qemu-devel@nongnu.org
Subject: Problem with trace of x86 binary on x86_64 system with PANDA
Message-ID: <1b6189d1-0123-efa7-23b4-42b60cefebbe@gmail.com>
Date: Fri, 30 Jul 2021 19:15:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=nikitag594@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:18:17 -0400
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

Hello there.

I'm a student and I'm writing my term paper. Part of it is the record 
the trace of x86 ELF on x86_64 Linux. For record I use PANDA. And I 
stacked with very strange problem: there is no system calls in my trace.
When I see this I was very surprised and make simple grabber of 
translation blocks. As I know I must see in that sysenter (0x0F 0x34) 
and int 0x80 (0xCD 0x80). But nothing of them was in my blocks. Maybe 
trouble is in TCG? How I can test this and proxing system calls through 
PANDA for analyze it?
For example what I mean: I have very stupid binary, it's just write 
"Hello world" to file. But PANDA can't catch any calls. Even write 
although it is clear that this call must be there.

-- 
With best wishes, Gnilozub-Volobuev N.I.


