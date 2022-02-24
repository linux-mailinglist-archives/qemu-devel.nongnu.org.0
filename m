Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2184C247A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 08:31:28 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN8az-0005Jc-3e
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 02:31:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nN8W5-0003Ff-J5
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 02:26:23 -0500
Received: from [2a00:1450:4864:20::329] (port=36826
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nN8W2-0004SA-2a
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 02:26:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b00380f6f473b0so2448444wmb.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 23:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=7BaiqQDHO/Up/HwrW9wlo72NS4SmIS9X4mTs446FlxQ=;
 b=bjSzVGZw4qR39sUphGQBRc9SA0QpzrELbUqi+GPPzQbIw45BxJGXQH1ObIfEuoqku3
 Dh2+6Tcn/YLCWLEh8p7vZXG1BRlqW8YgVFyoqduCsvPuSZKB5IGD/m9a70zkm6Ey5BXP
 UuoXe9BeaSJb5a3aqvsNYx5SkGgiMihe/VLCeRlwO/65YjXjK7VKkNaUAgvNsW3TUJE8
 A8aM22WeUEgcSnDRyu6AwQ9idWllRX4G4a/H1Fz8zR5y5ITqTKMeeDF+si+7rf8eKmxI
 MVwgFOX/VBpu/9KnwYSyTnBefN/gzixs3cKoiX3jKYdUVxXZWSqXGKozMZmTqFyNG70Z
 dT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7BaiqQDHO/Up/HwrW9wlo72NS4SmIS9X4mTs446FlxQ=;
 b=Bjfrrizf6/DqkBv8rutyQOlF/fZ+zQ5fueV4e2IWQLhzJkGRjzCxP1QMkfXFU87E2v
 scA6V++LStP2BUyG7b0ojg10DlqR4Qu57IGlP11cnrZuEvuK1vyXetsIWDiIlqhJWoj9
 sw9PfFTK2Z003lmNCFj3uztzV1ojGC97wAhXZj7rQEL46be+fB+BrQYek4hM6huOFYT5
 rdFD9HVf46YckGVAt+sHg+6Fc7vV/Wou9dakEtkbgzXXs8kw7EvZcx3Tbo5SCNM54f0q
 dQS/XRTxnUTiS0LqXUKrhX7f3CL7q5Ndl6oxNXbqBJCMI57rbjmvX6KuKevnRtu7nKeg
 F8Eg==
X-Gm-Message-State: AOAM53247qWqgOaTxFFo3Y9tUnC5KsfZZ83Dx3TPpDh7ym8l3XGP3CZC
 OE7+8rx1Mrin8EJIZdRWqd0=
X-Google-Smtp-Source: ABdhPJxubsp8YYCl8jFODNi+s4JKQmV+1f16/dHdEAIKQxd1cKj++udYtEWBH9DX5Pn1oDPXgZqXkA==
X-Received: by 2002:a1c:1907:0:b0:380:f6ec:4daa with SMTP id
 7-20020a1c1907000000b00380f6ec4daamr5205099wmz.50.1645687575481; 
 Wed, 23 Feb 2022 23:26:15 -0800 (PST)
Received: from [192.168.138.175] (140.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.140])
 by smtp.gmail.com with ESMTPSA id ay12sm1804492wrb.73.2022.02.23.23.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 23:26:15 -0800 (PST)
Message-ID: <cc7dd33b-d209-4878-016e-480956784dae@gmail.com>
Date: Thu, 24 Feb 2022 08:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 5/7] hw/smbios: code cleanup - use macro definitions for
 table header handles
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, mst@redhat.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20220223143322.927136-1-ani@anisinha.ca>
 <20220223143322.927136-6-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223143322.927136-6-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 23/2/22 15:33, Ani Sinha wrote:
> This is a minor cleanup. Using macro definitions makes the code more
> readable. It is at once clear which tables use which handle numbers in their
> header. It also makes it easy to calculate the gaps between the numbers and
> update them if needed.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   hw/smbios/smbios.c | 38 ++++++++++++++++++++++++++------------
>   1 file changed, 26 insertions(+), 12 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

