Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32114D1B70
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:14:40 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbXs-0000EC-1C
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRbNi-0001dt-2S
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:04:10 -0500
Received: from [2607:f8b0:4864:20::62c] (port=39436
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRbNg-0001gs-Is
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:04:09 -0500
Received: by mail-pl1-x62c.google.com with SMTP id 9so17301119pll.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8zXt9UCaAezuQQSVuoGZ3qOLW0v6J1oJoAuIkflyJyM=;
 b=EGO7bJ77+ETAdxwrajiE0aJzvuTvXWEJPJRRo5+W/a/xWEjvPqLc98ggCjdDiwA41I
 njSUZsc1C55rMt+SaHAnx5ovBp1hh/6kqR4Gon49iCFIJkB7PQHJwfgDYhex8qqG/N+q
 BEcGcfrFZwQe07tffKNMks5R7LB80vgRyb2jqSLE+Ao417cIZR7NhSaSiJOpnNnYlR28
 DQzRhu83YQdKxMc+LxsVQrjZhsfPzVPoykpmche6Fd0POmYimcjhrYw/oCGMDjgaiw5V
 5AiPkAhJtTizbTxzC5OnL8jkCes8AX0T7asMQmS2C8h+LoCaAaueJn8DBB5YRbB+zkyL
 wyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8zXt9UCaAezuQQSVuoGZ3qOLW0v6J1oJoAuIkflyJyM=;
 b=G6HB5700w9yWJMbdRU2lVTIH97BL5nNuF/W9kZfMAtMIVsFXaVJf7ONCi+aPaKzZh9
 Lg+Gcc3KWRcD4qO5VQcXRAbUU4XkjQ/DWeoHb5ZQK+3S109gNkaD3eWpWm7Z8KGqbbmA
 SwjJDw8fLbOKHtfcVN8PrYEfCqLmNxz947SCe/3ekMxUzoVP/0vPagiTqFZeqcnHWhEZ
 f+4CTfulP5NcD5QMVc11vhIHZlNbnWTzN25KDyxqxoP1YMecUi0nxX/R56IB+Nw5ceKE
 hWf71sh/ckv3ift91dY4uAXIVsKnEW+Cxa9xTSXjZYtapfBbn+zcbYbi/4GB5EFNe4fJ
 81Bg==
X-Gm-Message-State: AOAM531VjeNMEfH1tdEUlHqG1ilA76ACm/hI/GMCQjxfPIqFdDGQNZ2w
 nuuy9btKV1R8PzjCxa59OBk=
X-Google-Smtp-Source: ABdhPJwyS5lr6gvMYqdRo/IdiA0Y5Le/jb8j2P8wBK0S6DTl+MqzndAcROegqmFrE0SLzg0YsBTv/g==
X-Received: by 2002:a17:90a:d3d1:b0:1bb:fdc5:182 with SMTP id
 d17-20020a17090ad3d100b001bbfdc50182mr5233039pjw.206.1646751847101; 
 Tue, 08 Mar 2022 07:04:07 -0800 (PST)
Received: from [192.168.16.175] (11.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.11]) by smtp.gmail.com with ESMTPSA id
 cv15-20020a17090afd0f00b001bedcbca1a9sm3242961pjb.57.2022.03.08.07.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 07:04:06 -0800 (PST)
Message-ID: <8eabbe37-9c75-5f74-8e3e-40909c3e2f98@gmail.com>
Date: Tue, 8 Mar 2022 16:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 05/11] edk2: add microvm build
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-6-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308145521.3106395-6-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 15:55, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   roms/Makefile.edk2 | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

