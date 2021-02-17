Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CC31DE1A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:27:01 +0100 (CET)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQbM-0002ON-G4
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCQaC-0001Yn-H9
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:25:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCQaB-0006EL-16
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:25:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id w4so2751674wmi.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=74nteVNm0yzS8Ksfa0vek8VyAcESoVNSVkdYznIb/u8=;
 b=Exx58+BmxrXGq6R5z6XBYytmhAo8JuFlU5SQY67geRF1DSa43C2atnVBaQ4VNgqHuL
 L88K63eNDCWSqPOwTrezZE/KO4Nn4dw0we4tGpG2dOao+8f5K6SnmyZpUMCpPVxVFQdf
 oe623K/1b+j8qtw18+cP+sVa2zN3TE3MIRkr4TZ14eCFEEmWjvrVnPOurSW847QXRXkb
 5OEHMm/7mFaW1Dvg6QfkbjX4FtbCl2O3WS5bSnTqr/7Uvm41XyyrIrmukN3ugp5uvxAt
 s+Aj/qCCcUZx1u3PssdPvUJWtz+8q6t1kevKbUl3GBuK1m8TpricTUxIdmM7KNctOpoP
 ib8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74nteVNm0yzS8Ksfa0vek8VyAcESoVNSVkdYznIb/u8=;
 b=Jrsc06LEOcYGXt5714JkYEasTHveQDOaocoOqIrSdkoYb2tqtXCFgoYatO1muvlXCu
 gYiOFNzjrO7TYAJkFdWZAjxuxEzYo1F4NUO3sQBp1XJQTPAIE9qHU5SFGJ65k2FfL/RY
 67k9O/2PoBqTkSQRNtRHFnkbjcx2M6FdN9nH17g8Mt1wqUlQVD+g4hR5Z9kAKSt3jDUE
 RhPGTy+GVItkm7ajkPmPT7K9xlD4PL0KYl0S6EmbFbh/eG4atZEImO1d6lMrkSi+KJ5S
 /pmKM8xa5MRZDUK3Vzpy6ZPhM8ZDlOWwLuaD/8JX8uUWlCn3nxg/jdg6DodJ+xhzYTC7
 jFfQ==
X-Gm-Message-State: AOAM533pbJQ0HsQNDWD49QMdODuCsQwdZPqan0MfBslXPk2I7MJkFuuC
 24bGqHzgiq+1HZFBv9oU2Rs=
X-Google-Smtp-Source: ABdhPJzYMeBcmfNxOtQJMAabWlpwuRnORZB7BYznjh0TmRYCBpXZ0UDCgYmElKuSAZqLSSjo3BSHIA==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr7764952wma.141.1613582745162; 
 Wed, 17 Feb 2021 09:25:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w81sm3927274wmb.3.2021.02.17.09.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 09:25:44 -0800 (PST)
Subject: Re: [PATCH v3 70/70] gitlab: Enable cross-i386 builds of TCI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <20210208023752.270606-71-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d680d76c-6adc-9fe4-e9a4-59953ed6144f@amsat.org>
Date: Wed, 17 Feb 2021 18:25:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208023752.270606-71-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 3:37 AM, Richard Henderson wrote:
> We're currently only testing TCI with a 64-bit host -- also test
> with a 32-bit host.  Enable a selection of softmmu and user-only
> targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml                    | 17 ++++++++++++++---
>  .../docker/dockerfiles/fedora-i386-cross.docker |  1 +
>  2 files changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

