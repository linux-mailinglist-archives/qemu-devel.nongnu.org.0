Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29964C186E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:21:11 +0100 (CET)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuO6-00027t-Iv
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMuLS-0000fA-T3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:18:26 -0500
Received: from [2607:f8b0:4864:20::1035] (port=39610
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMuLQ-0006Vd-L3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:18:26 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso2756848pju.4
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=398plGivOsK6ge8WsrtVBdb3UVDGBk8vyQJLsAcowOE=;
 b=QMVhl5sU7//1SNP2V2T/kBw01atcKlhersVyJOoS0odT0wC0HEiTa9A2fatV2MBrMP
 9FzbDYnIfEqDed9ZR1bqQzRso2s9+6aCDqbhgnfaziwou5RZmYIEIEz32Ill5Oczo947
 WxvtoBY2kV14XYuL9+9L/1oIiZpW0d0EZSeyBLQPJ9YlWggDbfWCS+9Ag8GOT+TyiS1j
 ldGbn+hAI6hik78Fvwh2IY3KhyvygHkhNjTT6fCyHqiQHw3JyakTm0l88K/ComdHlMIn
 9ENanp8JK4bB6TWrviImWKnsp4sLbMXY6nGwNTGvqd4JLcmbgOvCTUVffpBqcuBbYCgu
 TNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=398plGivOsK6ge8WsrtVBdb3UVDGBk8vyQJLsAcowOE=;
 b=54n4yvcymq+d7X6e+eH50b328tGOPDhKkeainbzIhODm2/Pq5pyibfrusHZeIKcLka
 ij5t2i7wyKGaXsuMplZn0XEjcqPrRHQgOZPpDz9zSI2CdvU6je0T5YN3EDUR+SNWzvnS
 aX1Myfcmy5+jYbJd03Ci/f9QxHw2wpU0l5Yc/shOIfKSOoTEDrqdpXSwkcj+bdcC6wZq
 CQB2HuOqbDe/1cQvyY3+D8suXYh2rkD0QMIIEK64Af3USFr309I2ofepbdWxV3MBqiNv
 WkIdaOx2jKsNkw6i3ehBAmCPRYr+VyeSRyJYlVyT8/suaEq8YgjM4hok3DzJcrWWu3Ax
 Rhvw==
X-Gm-Message-State: AOAM530QpkEg2X6O21VjG6F+M6KuGJLC7BepVwNPsR4ip3Z5APUElhPC
 r/e4ogIi1yMWFO5NhFz32Ws=
X-Google-Smtp-Source: ABdhPJwYwJYP/qdzYffXjhDEtdqt4daC1lSOFnCl72nvx7Yd+suMT/gLQMADWfaKWfDcJia4Y16IYw==
X-Received: by 2002:a17:90a:9b08:b0:1bc:9b4f:8dff with SMTP id
 f8-20020a17090a9b0800b001bc9b4f8dffmr3193412pjp.159.1645633101469; 
 Wed, 23 Feb 2022 08:18:21 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id d15sm23054077pfu.72.2022.02.23.08.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:18:21 -0800 (PST)
Message-ID: <6381b8e6-c0d6-03aa-7b30-a47c724a6747@gmail.com>
Date: Wed, 23 Feb 2022 17:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Fix a potential Use-after-free in virtio_iommu_handle_command()
 (v6.2.0).
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, wliang@stu.xidian.edu.cn,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
 <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 17:02, Thomas Huth wrote:
> On 23/02/2022 15.36, wliang@stu.xidian.edu.cn wrote:
>> Hi all,
>>
>> I find a potential Use-after-free in QEMU 6.2.0, which is in 
>> virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).

>> I'm looking forward to your confirmation.
> 
>   Hi,
> 
> thanks for your report and patch - but to make sure that the right 
> people get attention, please use the scripts/get_maintainer.pl script to 
> get a list of people who should be on CC:, or look into the MAINTAINERS 
> file directly (for the next time - this time, I've CC:ed them now already).

You can find the contribution guidelines here:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html

