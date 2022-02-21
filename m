Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB24BED30
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:25:49 +0100 (CET)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMH7s-0007kl-2F
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:25:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMH6O-00074u-8g
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:24:16 -0500
Received: from [2607:f8b0:4864:20::1035] (port=39693
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMH6J-0006lB-40
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:24:15 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 f19-20020a17090ac29300b001bc68ecce4aso447796pjt.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 14:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j2+13RkfkfjHDkCabqK/bsuO7A4qDALPg/p57H1lAow=;
 b=BdN3D+k9bIcE4CdZitVyIWa8rx7awDV6orS2Z+qszdRg7eNMi691sx8NHCYv74CT0T
 6j7AuIybMrMhMs2dW2mX5z40yc0lbRsQ3yYNpfrAgkkmtiHyqQOyp/Td/rqck1CzBAIr
 GuDokpL99Ejl34OpUYfu0uJwqzur1O9R2megHtdC3kYHW4LLseT//lJIp/cbFWSXlfNG
 3WbW5ah4yPN9jC7Lik7JcWvDFN6xbJbST9wA11aPJIDISMPJZlWwgOfFp/6iq7BW2FVA
 vN/I7kOJ6AjpOvTy6ZwNB/M6ycMp8LJgNQhXLkL3eCulMc+EKE/XlhXY/a3nYQA4u61+
 Fb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j2+13RkfkfjHDkCabqK/bsuO7A4qDALPg/p57H1lAow=;
 b=2QSyR2fm36CmYnO/HbotHS6QLY2ZgGoJbeBYm/BId8ENuNKdAnqIgOy3hx/zAay3U1
 VyYsDHXc6pkI7kWp+EyuB0mb0FEpUV2BrFmxtlw8DY8mAtNBGMX7kKoB+0blKyElRgwX
 Elb5H1Ds+/7lFyyhUrGOBxHlfS2A2zqBnKoCFPln+EXMa3UawtEQQuaDSv/Ry/XmpRVB
 Ay5Z3dskNvnhOOEBk5AiI30jbxAxc4PyVZkXu2zemHO2ctJdEMeuK6Emh+rhJrehfQzx
 iarg1b5jEu0drWAQrySULCzRxbw6T6ChLL8YodUdj2m0BK1DnUn/BqAejd2e7y3FCDdL
 sJ6w==
X-Gm-Message-State: AOAM532DBs3UV5Fo0B5oMlRmQgGjTKcEkyjCIx03ZzhSfaeViq6V+Q+s
 lbwfM8q7D/eWLHlV0NMhfs0=
X-Google-Smtp-Source: ABdhPJwF0lIkGJlvdhqRlRtei+k/N7UGiTALeoIOlVKxNdBYKRLk2m2pKy4y3/7xIBaK1vojHxls4g==
X-Received: by 2002:a17:90a:7e16:b0:1b8:2c11:73da with SMTP id
 i22-20020a17090a7e1600b001b82c1173damr1021560pjl.156.1645482248492; 
 Mon, 21 Feb 2022 14:24:08 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id il4sm311417pjb.28.2022.02.21.14.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 14:24:08 -0800 (PST)
Message-ID: <9e5627e0-0cb9-e1be-40b6-9fdc67b3fd82@gmail.com>
Date: Mon, 21 Feb 2022 23:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] hw/vfio/pci-quirks: Resolve redundant property getters
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220217225351.140095-1-shentey@gmail.com>
 <20220217225351.140095-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220217225351.140095-2-shentey@gmail.com>
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
Cc: Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/2/22 23:53, Bernhard Beschow wrote:
> The QOM API already provides getters for uint64 and uint32 values, so reuse
> them.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
>   1 file changed, 9 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

