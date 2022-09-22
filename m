Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CA5E6F57
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 00:06:42 +0200 (CEST)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obULB-0004io-Kx
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 18:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUGT-0000Ox-6H
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:01:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUGR-00050N-LY
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:01:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b23so10580127pfp.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=+oA01bkk6/836xtrMiY24Mw/nsVIzXLjbgMaKFvR6p4=;
 b=TAimhlMRiH1FtlcqawPfJTaWC+SzcSF1TZ6BEvJTzxTB69BonmFEFvLta+H8XVWhRl
 hayHGLH2tVv3WKYO2jIvNF2YeXMcgqIf8LDvZOyo34nLcLdnVVdxUq15NvB1uswj9O+1
 WaBFNhNDHNJopNdXiB7iHFVdan/ayOD0Ga6K9/IIvDee2v3qgPjTG6iidZXgneOBY9O5
 q9QJtuyqK8RTSUA7FA9+R+5wtBfs5XONA//P3Ooz4oZ3L8D+c4A18sgaiZq6hFF0zJI3
 HhJ+XJ+YGh/Af6G++rY1nEndCucfPYKNpY3sD5kC6V0xWgSalF+mGU2A4pCYdJkhmPYn
 odIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=+oA01bkk6/836xtrMiY24Mw/nsVIzXLjbgMaKFvR6p4=;
 b=epgm9/seRNEOuTCOXf8LvdeOTgANhoXoDVfzLbLOmHqXKnw5mQpTiSbVZdsmv/FjB7
 Tjptp+Tmr47R9eKRFyh/3uGUkp/UMtyAFcOtx/LRRSfFNJ3M/gTpaHcn/085oYwB898L
 mXYgTnI1lco4aGZIoSGYJmCfwaKzMsKJzoERw+me+Zk/VAdxIUuSiNABSoDiU75U4NQR
 DXIe7+BXuR1iTv8PI6Ldmp933zKnyIKXp8TpNDdRy5w/HMLwNHxae2kjUW/2X1GW64PG
 iuTyiaUmw0mJEaFjGn6OAlsHwoVJEJ5OLxu/mJIasOboXCyQrI7drZrCPZdB0V9uWhxV
 r54g==
X-Gm-Message-State: ACrzQf1Cf2U4BR0by1easo2V+XNk7hrJC7i6MdfHSn/LNUkhnomQ3Q3B
 IDM6RikVmOpiFuLi705XdJk=
X-Google-Smtp-Source: AMsMyM41SJJcjgtQnFBaphn7PRzM2SNmQnCqz00cVzLCHHxbCKTFBrArrWZ7xws5Tcd090D2DY5T4Q==
X-Received: by 2002:a63:1a4c:0:b0:43b:e648:a7a4 with SMTP id
 a12-20020a631a4c000000b0043be648a7a4mr4863173pgm.7.1663884106285; 
 Thu, 22 Sep 2022 15:01:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x18-20020aa79412000000b005546642e815sm2709144pfo.31.2022.09.22.15.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 15:01:45 -0700 (PDT)
Message-ID: <39889f98-4397-074c-ded9-60b0516530af@amsat.org>
Date: Fri, 23 Sep 2022 00:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 09/22] hw/virtio: add some vhost-user trace events
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-10-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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

On 2/8/22 11:49, Alex Bennée wrote:
> These are useful for tracing the lifetime of vhost-user connections.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/virtio/vhost.c      | 6 ++++++
>   hw/virtio/trace-events | 4 ++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

