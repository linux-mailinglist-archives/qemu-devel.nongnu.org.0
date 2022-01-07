Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BB487D6E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:02:53 +0100 (CET)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5u6e-0002Jy-DV
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5u55-0001Ux-Ma; Fri, 07 Jan 2022 13:35:15 -0500
Received: from [2a00:1450:4864:20::32b] (port=44886
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5u4t-0003BA-NR; Fri, 07 Jan 2022 13:35:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso1349358wmf.3; 
 Fri, 07 Jan 2022 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qaLs6zK5La4IUOABtoqN2EdVeyNCpgAC9Cb9y6Rl9lI=;
 b=Lr15k4MjQwJIuCDN8R1P+jpDC//KhnvIbrMoh07VcBeT8F+c8q5eIzqPnnjN/6KuDD
 jWjVLhh4eQoShNZSEavl4exp0xzfjv2N/QRJxOe+xDSQyNEQTtCq4AV8peQ+kk5ZjjkL
 ubECfUcIj/YdrHMkyGjjaNT3Zl/W68PBYA/Fea9trhQkHcD4MpfbDIww/htu3GttTwzq
 jC0cIrhPHzkg5Ct2SYSfGMWAVVibmY9Ktyoq8tg2rc+j056xIDmU6HXN3qaE2iikHReq
 8O5Pcuhp8pyJngx0xQO52xKXxORstOHw090SlUhDq7zOJPQMlDvHo+6FGx5yhRBIM/yT
 Vg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qaLs6zK5La4IUOABtoqN2EdVeyNCpgAC9Cb9y6Rl9lI=;
 b=S22nJ7go801+pB3uprtUkHF7/WXg98iRronqcQByHh7S5/6OGqIDek+M99mjSoEPAs
 ipqZ4qeZWGVWYMaBqpCrQuRzQ7Ne3K0vxW7S5W0Qj00bYD0LauSZYCm+7mb2R9pITYNZ
 CcE3MABw2KFU5h0+bOv626vhze4lEddOlgQEKD7t/25EYhEpxR/a9tFZStOARTIvEFRc
 lsCUKVSOi7Ee8d8jL65S4c5i1/5+AoeZ2/rrJTWahM5f5jCHsR8HDODgIX7YMYVEfmMF
 KQB0pYXQ3yOBkcumS+3xfkvZi0RhRnoG0T9Ce07WE3w8DKg4jyBnWaKL0kqaCSX9UbOU
 kamg==
X-Gm-Message-State: AOAM530oPYOjWNCkTp1xdTAWO9OTvaQqkPqwe+H9tTjLj214qYxVMPHA
 WSLDQHHjPsC9Y1OFDL7eP9k=
X-Google-Smtp-Source: ABdhPJzYLkLxjXNlrFEFwOhH4pV810UNMN/XgGZK00Mm0i7+Xj7OoUB7cxSqsp0tFYNwwLXcwfVIeg==
X-Received: by 2002:a05:600c:a54:: with SMTP id
 c20mr11904726wmq.48.1641580501936; 
 Fri, 07 Jan 2022 10:35:01 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id n15sm2684184wmc.0.2022.01.07.10.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 10:35:01 -0800 (PST)
Message-ID: <12401764-0fff-3605-1022-b85091425f37@amsat.org>
Date: Fri, 7 Jan 2022 19:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/3] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211217233006.1466747-1-f4bug@amsat.org>
 <CAFEAcA-__Z06M-r9VhfkGh4QKxenFizcO+U+0EM+oPHJQho-Dg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA-__Z06M-r9VhfkGh4QKxenFizcO+U+0EM+oPHJQho-Dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 15:48, Peter Maydell wrote:
> On Fri, 17 Dec 2021 at 23:30, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> This series simply extract the MV88W8618 device from the ARM
>> machine in hw/arm/ and move it to hw/net/.
>>
>> Since v2:
>> - declare MARVELL_88W8618 in hw/arm/Kconfig
>> - use MARVELL_88W8618 Kconfig (rth)
>>
>> Since v1:
>> - update (c) notice
> 
> Looks like the code-movement in this patchset has a clash with
> your other series that's now in master that changed the signature
> of dma_memory_read/dma_memory_write; could I ask you to respin,
> please?

Oops I didn't notice, sorry. Sure, will respin.

