Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC3479779
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:23:56 +0100 (CET)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMZv-00006U-4m
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMY0-0007TW-KL; Fri, 17 Dec 2021 18:21:57 -0500
Received: from [2a00:1450:4864:20::432] (port=42675
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMXv-0005CL-KU; Fri, 17 Dec 2021 18:21:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so6784174wrd.9;
 Fri, 17 Dec 2021 15:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fyk7sOgbQJodc780e5wtDMdml/a7QDvW2xQGESBTKoQ=;
 b=MmkF2vN5Vh/iUucJETPQ74tLBTFyaldydL3wmm/AQk3OT+GcilmqQA4JJp72N2yQF/
 uZgY5dtgyHsW5/o55HTu3aDTwZpNXYjVJ9xCLewPPeoUq7Jx39VDvyymDBAv2ly7TJvW
 wO4izBzkhre1jPn9ghHOBPSEbhHeoOCrSTG4IpthGkIuvfc63UFa5Q002O4rnVtAtguj
 BpxC/NjSJ4Z8j+GU2bg7OVVTBQfQUhdXlAN2N6R4ImBgQz0XnzcIM1Fl0sKxIv9ZsOdm
 j4zwGYy8malvc6owUve3muV3UdlioumCFUXSdDfqNO5RPHtANaLx+Q0EFVdzG7jlz/Ey
 BWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fyk7sOgbQJodc780e5wtDMdml/a7QDvW2xQGESBTKoQ=;
 b=GVXJBniGWc2Qv65xRFmzeaXbZq3j+ZX5qA21MV6oQUSQx6eH771TJ8aQjIpX6LR9WY
 XZ0SbUQnmu0V6CtZH7IouDRP0wFLLXy+Yd7pg8sk4c1XPKz5VJAf71TfY/Lm0Fia7XfC
 t9YGGNKSpx4oeeXGKHahprHln1PnJLWECx2X6R3wQJ5Ac9bFnySmy+JU3QjN8oN6nJ2J
 ZvQ5GNnn8c9znSL5xP6av7koeC10anMLbSEY6tJRmitLoGYVeWn6loEdRLdME/AR0l1A
 X/KAKUXljji9WcPdQoygHZs4aBqxSnvD8RbLh49w1W2dCjiUuacA1FFjuLUu7gMYVKV8
 K94A==
X-Gm-Message-State: AOAM531WE99zZJmg/q75QnzireF3OmyPcNKGOUDsExVxiDuMOdM/s8wo
 aWyrIbi21EJgv9YFIL1n49M=
X-Google-Smtp-Source: ABdhPJyJMoLrIIjsK7t2RyMFhxMOT3e02vkv/a98/laGyPHYbLOJwtDwTSKNqkOt8USLRhLI/Pekpg==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr3979106wrt.596.1639783309088; 
 Fri, 17 Dec 2021 15:21:49 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g3sm5121205wrp.79.2021.12.17.15.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:21:48 -0800 (PST)
Message-ID: <4deee347-132d-b935-c6d1-459b26a438ba@amsat.org>
Date: Sat, 18 Dec 2021 00:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211216125647.805544-1-f4bug@amsat.org>
 <20211216125647.805544-3-f4bug@amsat.org>
 <ac288aa7-b78a-d564-329a-07267f2d4cc3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <ac288aa7-b78a-d564-329a-07267f2d4cc3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 23:25, Richard Henderson wrote:
> On 12/16/21 4:56 AM, Philippe Mathieu-Daudé wrote:
>> +softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true:
>> files('mv88w8618_eth.c'))
> 
> So... there's currently a MARVELL_88W8618 define for the audio component
> of the same chip.  Should we re-use that here?

I missed that, good point.

> 
> Otherwise,
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

Thank you.

