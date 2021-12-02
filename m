Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B431F466997
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 19:05:00 +0100 (CET)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqS3-00032q-H5
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 13:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msqPf-0001Vw-AF
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 13:02:31 -0500
Received: from [2a00:1450:4864:20::434] (port=34796
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msqPd-0006hq-SI
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 13:02:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id j3so542594wrp.1
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 10:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dX/wSXVTpZA1NxTy7+0R0Y79bRCIt+KDL2YR/nH8WpQ=;
 b=ItdGfoRit+b7cvqpCYai5Qs1kamlSo+Ijl0ePhxCR8/mvGdOJalTgn4yhAT+ByEnqe
 XhiKfRPn5ZCKgoFxcYd3ymovveA1/TH43pcpkOoHwCB8mewExuCnEfysRBNSwouAn2vF
 RfIM54dE1rVHantyPajC2jZJxH3fq7r/ncuMmlOx48mmkKsgNfyWbLhkNntpda60OKAn
 cjVv8WSdrBLciQTf9ci+BzwdYqUR9afe3RbK82OdxT0uLz3CuLjOmz2uOQ3eD5ZdYg5T
 /ykUMAxGkaSaQKurnEhhxbAZEMw0gsXTgATaJx5lTNOPwVpKDzQSfxH1jbD3QfOn5HvA
 PBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dX/wSXVTpZA1NxTy7+0R0Y79bRCIt+KDL2YR/nH8WpQ=;
 b=ZhL6dnyXoSMaOG7WMyKXGIiZ/Egns0ujqj5WB8gqyEHGml9qVNL3foNZpA/kU8h83f
 RU5vnicBqlsA7q8IvIpZkFMJYsmA0IO0cuyRxJS98/un1V8+CX7ah9v8wssRy/vV2df7
 e8fC8yzJL6TG1b8rvMmZSruqIeQhwIOVtoTJgjoQCW0DCwpens5wc+rt3UiKr1vr1POF
 lYuF6jnSpySKg3rTcguvkHqUZa2iCG59Av1vLrG8IZvXQ0Ndtq2TjBJPMEdugIDjfj4a
 Okr48+FbjbyUgiejsV8YdY39t4wZXrUsAg5GXCp+f6pvaOae2PmE2djJV4bZQuRqRJKY
 kF6Q==
X-Gm-Message-State: AOAM531/92q5PJGnk4Qk0tondMYIJRSOUGF2e1UD4TAO1zrgA309N7K4
 O+9MOUfswfDK+OG0ZbQEBF3OzGkwJbPf0w==
X-Google-Smtp-Source: ABdhPJwERNchc9r8qE+RvI5hdbHZ7KeRov61sJ05AaJgXG0GdqFAZOCJv4zglr2AzhZ8TlhjIr5cKg==
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr16762624wrw.396.1638468148432; 
 Thu, 02 Dec 2021 10:02:28 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id l26sm377221wms.15.2021.12.02.10.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 10:02:27 -0800 (PST)
Message-ID: <d3cfcbf5-3763-288f-19a3-0c58399e4edd@amsat.org>
Date: Thu, 2 Dec 2021 19:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] MIPS misc fixes
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/30/21 22:17, Jiaxun Yang wrote:
> Two problems caught when I was trying to add CI job for various configurations.
> 
> Jiaxun Yang (2):
>   hw/mips: bootloader: Fix write_ulong
>   hw/mips/boston: Fix elf_load error detection

Thanks, queued to mips-fixes.

