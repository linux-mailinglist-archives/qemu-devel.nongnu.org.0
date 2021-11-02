Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B3442E41
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:35:11 +0100 (CET)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht0Q-0004V2-9U
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhsMO-0000es-Ci
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:53:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhsMM-0000zH-98
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:53:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id b71so3918617wmd.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ihkhIBS0KvhiU0tqsT32G6g1glKHrsGAJg+WZKeeVQQ=;
 b=DynSE90md6jICmNd1x4pISOO+iwycCsNeDEd5CQv45e/xVxWc/SC6ciHFJQkOlW/Vc
 vRKY/jud7iJHeNDeC5qu3s5HBadYWwGNdZE6tSLJ5lS4JMNcPG2Sx0h3+T3n9ICP6v9M
 WXpMNqhGS4wnBJCMrXjiyX/vTsWNnOEG8rwkeuS6oD+zK1PP8zzfSIYC2P4wHp2Jtywn
 6fdXI9ag0JT1Zz0msR8HZz1BDMU4gmI9Hj8Oe6skpHC5UzACRS+ECS8mlz0KKd83O5fC
 Lw37EzCH1+eXHT9YjZ+ktvzb2Sk7rayF54NkqUh5YMOFtZ31Oc8Xa/ZQVNxu3jt42N9N
 VG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ihkhIBS0KvhiU0tqsT32G6g1glKHrsGAJg+WZKeeVQQ=;
 b=lk9f4Fq5HS34jmtJcQd0fMs0ZDIsf/Gv1KhYSwZgW2NLIA6Czb4yMruYAGI6yw/84m
 /KYfFcUrwXzYwBTz7ctT9jF7HWqARApCqBTWQFdy2Tzg3lPlPiXcmuu6ABOGvMCUixvf
 c2GZWDvZNdYfExFlnC6u8E8LBcd3Q523UFvFdIv6xcC0lRdmsDxROFXtEQ2JNXZbHInZ
 ZCSzIdccIqognuAdEKBaosFEVZSNvO2XMY/gMIEWX5dj8kGBkm7dyNgyRhN7jsj7QHdz
 876ntX9seQZA6caEs/irAEV/OlJgwCSPABW918wOvb6MLH/Jj5YyCn78c8bK/Y1RM9xP
 WjjA==
X-Gm-Message-State: AOAM531DOp8ABdRmotXWmfeIsYSij72t3Lnjk8R5zl3MnhWzgK9bXgbg
 sCqUFIX0xTCZ5OtjgmNna9SFcm3XkGc=
X-Google-Smtp-Source: ABdhPJxytNO63/L97eg6Gceut1f8oTVVg2aLt8/H8vGzZmcbiTVCrMW6Wj1KjptZp9NzF4q/qdTRHw==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr6216572wmc.24.1635854024547;
 Tue, 02 Nov 2021 04:53:44 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w1sm2272451wmc.19.2021.11.02.04.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:53:43 -0700 (PDT)
Message-ID: <498aac82-46e5-00e9-2318-627968db75e7@amsat.org>
Date: Tue, 2 Nov 2021 12:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1635161629.git.balaton@eik.bme.hu>
 <6f955022-ba0c-5dbf-05bd-cb73d910a40f@amsat.org>
 <a1dbf134-d273-85cb-a956-7c2be89f3fa@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a1dbf134-d273-85cb-a956-7c2be89f3fa@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 11:53, BALATON Zoltan wrote:
> Hello,
> 
> On Mon, 25 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/25/21 13:33, BALATON Zoltan wrote:
>>> This is the same as posted before just omitting the two patches that
>>> are optimisations by caching the func0 and avoiding QOM casts which
>>> could not be measured to have an effect but these reamaining patches
>>> are still needed to fix USB interrupts on pegasos2
>>>
>>> Gerd, could you please take them?
>>>
>>> Regards,
>>>
>>> BALATON Zoltan (4):
>>>   usb/uhci: Misc clean up
>>>   usb/uhci: Disallow user creating a vt82c686-uhci-pci device
>>>   usb/uhci: Replace pci_set_irq with qemu_set_irq
>>>   hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
>>
>> Thanks, series applied to mips-next tree.
> 
> According to https://wiki.qemu.org/Planning/6.2 freeze starts today and
> I haven't yet seen a pull request with this series. Is it still to come?
> (As it is fixing a bug with USB IRQ it may be OK before hard freeze but
> to be safe I'm asking now to avoid missing a release and having to wait
> months to get it merged).

According to my time zone it is only 1pm here, the day is not yet
finished :)

