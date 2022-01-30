Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CC4A3ABD
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:37:53 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEIpT-0005BO-RY
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:37:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEImV-0003MU-47
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:34:47 -0500
Received: from [2a00:1450:4864:20::434] (port=43744
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEImT-0002dA-Cw
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:34:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id v13so21805473wrv.10
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 14:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PZBcFnzmJwjsEJz1byWkZdQUx5fzWoLs3jaZyBgN+Fk=;
 b=hMbpeq/IF8uRJUNXHgGDhfEZg8JsscC5G1jVBdioTZa4TwqUJ+gjFevrIEAl8YWSz6
 z/YiucvTUk6cUCspuKVqLVuNuLVIQxp/6gaL/JVXQa40jkLSii/iZOonrortlMYhKMja
 MYNerOQp+IfMjkyBb0bbDhA24n6rbjJdeXHLq+czi4rBYVoElGXIyUiYgM/bfG6d6Cgb
 p397LqpoCgK8LxIP/Xt5rXZpsqMWNgx4PVQoqOy0B5aNV+GzvmVAmS+kr1hKvXOYc8B1
 ZtOvx+8047GTDxMPmzGNfJbIxPMEKuWRq4/i50tnDAvI5Yckw95rSOxGuJhg5Q9TeuWD
 9NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PZBcFnzmJwjsEJz1byWkZdQUx5fzWoLs3jaZyBgN+Fk=;
 b=Mnmkj4kzzdv7U8hBOJfZAVwlehzdogai0+W+GillVYwlhAQ4inY8usDsEZ40rBGl0Z
 b5hjLp5dQ8iqhmM7owNXW4DNE11AmqNvnQVUScNBlDuDYQu+KbGdLX2in9ve4KECOEch
 JJr9aTzZjY3UWMfDCHDzrLUpXExECjYCfVXRo+uRKWmp0z+MoEQOYPcnIXcsG5FGAf//
 f7jBastvnQ4gOwc3R83F9ovf069sJtnood9n3lbxx7VspiXR/91tpfbBMDuTbieOskRD
 5Lil316/NBDXHJaHjkHLxbgTwkLKS3GjiU+NEUE7wJAgruH94jHQkV0BpgEe7fNTlkk4
 QeYw==
X-Gm-Message-State: AOAM533MmVkHpQevW+69KnGS2ch/J2ckmnZpFlYwmn+HRFBa7lvOXtAU
 3linQEfz/QksFkh5e2BOHlI=
X-Google-Smtp-Source: ABdhPJzQUxY7P32ufa5fuSrHSX7I/njtUwG88VCyc6SS5OyxRY1MY7TLHz12N0NqkYa+GL3xGD0L3Q==
X-Received: by 2002:adf:e352:: with SMTP id n18mr15157269wrj.186.1643582083739; 
 Sun, 30 Jan 2022 14:34:43 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s9sm10042906wrr.84.2022.01.30.14.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 14:34:43 -0800 (PST)
Message-ID: <6d386239-aba0-19ad-0bf3-028687d89902@amsat.org>
Date: Sun, 30 Jan 2022 23:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] malta: Move PCI interrupt handling from gt64xxx to
 piix4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-2-shentey@gmail.com>
In-Reply-To: <20220112213629.9126-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/1/22 22:36, Bernhard Beschow wrote:
> Handling PCI interrupts in piix4 increases cohesion and reduces differences
> between piix4 and piix3.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c         | 58 +++++++++++++++++++++++++++++++++++++++
>   hw/mips/gt64xxx_pci.c  | 62 ++++--------------------------------------
>   hw/mips/malta.c        |  6 +---
>   include/hw/mips/mips.h |  2 +-
>   4 files changed, 65 insertions(+), 63 deletions(-)

Great!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

