Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D75F31CA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:12:23 +0200 (CEST)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMBC-0000UX-Ft
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofM53-0002ie-BX; Mon, 03 Oct 2022 10:06:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofM4z-0005IM-5J; Mon, 03 Oct 2022 10:05:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso9121400wmq.4; 
 Mon, 03 Oct 2022 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=jM0YJ6jjSw4m0NN/AxTBkuU7bfMeLhlxa4/Vm9A4qqI=;
 b=fQ6Pjt8aQYi2QeNCayyQ9TqBNQF/ZVaFyaF4cwUO8kNrHGIAheH+IC/JPzvpKv2wTV
 Kb46v/RgkpXTWOXNYmb6a/aie9es7eUKdksjL6GeBAnlIzVREBxbIXXDLKoJrJYCka/+
 ryLj/pliR8omPGnTuPydZKz8YgVrDd0yLMVStQu5y/gRpAf3M+8j7XGeDhh4mopvDWpw
 nRHOMak/5pYeCXK3TFLtJI/H4+3q8N2dIFIlgNPxsQ9XkvjD8jRvUnNDKSbcGiS+hdXo
 MVqH23NZaOZFqmp7fXuDGa7IozwQc+g0V/MurV+xcvRBCc0O+ByYMw/KPiwUKF0hV/Av
 3M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=jM0YJ6jjSw4m0NN/AxTBkuU7bfMeLhlxa4/Vm9A4qqI=;
 b=EgNE7OGsCiJudtW3bMDOTLgvScyCVwsCsVlUh4gceTMSrA5GIJmujrVvsjhcAanRLH
 7nRo2fzWJIgAJkPy9tMJ0LRPN85h29bSKts6QPdcb+n4dLkV6quq0gQbhZFqsAbunAGj
 ZjONidGF6vrh1gdIyIRnOO7MINHRyaWGfeOEPPlPoyP4c7k7ClLgq72mxc+q6UkTO8lE
 UGmKdwtttgvZ6XiYIwAmaRDBiTH71XGgeaEduFIsVm6eED6+fF7Cv0vP5Hde/HkfHX4t
 ks9qdLPuxWIhSMT28DQz7H/3R58QAJ6M+Kr0b+OkNTXBGR9sWq0rcybzrD7ARR4jpKa5
 ADyQ==
X-Gm-Message-State: ACrzQf0UKq4VBdGFV6HNGSWsacFvAP5+3iB4l2r7SmdJdTpHKUe69Xcx
 grripcbt1twxwQB9dYbhmhE=
X-Google-Smtp-Source: AMsMyM4kClhJ2YI/4dLrVD/aYLeFTw6H2LWNu3K0kgl6nq2flHCfU/NDGtGKbBmMWXFTnmS6cZlKKg==
X-Received: by 2002:a05:600c:4352:b0:3b4:84c0:2006 with SMTP id
 r18-20020a05600c435200b003b484c02006mr7015689wme.205.1664805953908; 
 Mon, 03 Oct 2022 07:05:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b0022ac119fcc5sm9806669wrs.60.2022.10.03.07.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 07:05:52 -0700 (PDT)
Message-ID: <76294919-528e-4174-b8df-8e97c10c788a@amsat.org>
Date: Mon, 3 Oct 2022 16:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 06/13] mac_newworld: Simplify creation of Uninorth
 devices
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <4a039abeeddcc6c987065ca526c6fa0457784615.1664108862.git.balaton@eik.bme.hu>
 <fbb38c03-6092-78e2-c1af-e37f1674bad4@ilande.co.uk>
In-Reply-To: <fbb38c03-6092-78e2-c1af-e37f1674bad4@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing CLI refactor team.

On 29/9/22 09:39, Mark Cave-Ayland wrote:
> On 25/09/2022 13:38, BALATON Zoltan wrote:
> 
>> Avoid open coding sysbus_mmio_map() and map regions in ascending
>> otder. Reorganise code a bit to avoid some casts.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 42 +++++++++++++++++-------------------------
>>   1 file changed, 17 insertions(+), 25 deletions(-)

> Same comment here re: sysbus. Also the patch seems correct here, but it 
> is worth noting that the PCI bus initialisation is order sensitive: the 
> last bus created is the one that becomes the default PCI bus for 
> -device, so changing this would break quite a few command lines...

Eh, I was not aware of this API fragility. So when using -device without
expliciting the 'bus' key, the default is the latest bus created... OK.

