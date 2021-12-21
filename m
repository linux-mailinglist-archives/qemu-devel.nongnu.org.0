Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423247BF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:04:51 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdsw-0003sk-Bm
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzdox-0002CX-Gf
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:00:46 -0500
Received: from [2a00:1450:4864:20::42b] (port=33506
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzdot-00048s-EZ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:00:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d9so6934153wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 04:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1VLiEiGiBwYNekqQukV9FMsWAMwjKlJmTrON40lIhDc=;
 b=p3kodbZCYZBc3+HXHuTluaqwUBjdq2OdJWKNRmbxVti7UE0maAncXF1GM94ZI+dzl6
 fGLFSy1N6zcl9eDYbBQTwvGQmTbbKqi7S3omOnDomIccS6Vb0zhW7Hq5Rg2OK1WQszdE
 5XsSo5So5CU85T+XLOGCK4ANnpv8NCe4Bgw81qq3WqeZl1Tm87sJHyyzK8XXmreATr0r
 315Ba31Nlot9pUOGs0ThgIx5QroaWrmWh5ydfIaTHCe2MfupCqT2cHGvQbFuowkuSqrD
 SumQto7UNsGweiYZYuyLuVBsxPPcekVfsLE7sqJx75mgu3QDB5zoqsKeWXSX0g2PbI8H
 LFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1VLiEiGiBwYNekqQukV9FMsWAMwjKlJmTrON40lIhDc=;
 b=Zpk+2xr0GK9icECNuDXph7UVQCnXBCBnpcV1r8XDydLQfs3gI2ZXHvOSM4jzJXgQgy
 Du9KrWolwh/zUO3fNmbFCeNqG3X3GDRy0nM/hPWpE2INqKtHrAc95Ez7o/Aedb1sc3Ap
 nD7FvseZEElGx0MnliKnmG9r07aqD3MgQDnt/vIV5Lr2HoICNl1jRF3jgGX2TL2ipM/A
 7yJe2Ka5ytO/4XYzozFj5+pCxzKLnG3oAYB8eHmvIZX6GvGCN7ECUHhwwo7/dpHJsnHl
 /1yfFG3asZ3z6N12hdOESUIRBvXU6epO6p2U+to37HON8h/lTqk6Q6+iY5TSjpsv2Rum
 4+KA==
X-Gm-Message-State: AOAM532rtEzOEnnMYDkCPzmbe4cxCRPjgzbnnsXwrR5nki7PHUY1oT8I
 GmMpXZnfY60Vh2MD5BQlILk=
X-Google-Smtp-Source: ABdhPJy95G++ci7YZbfoqtArJ4y1bCt2kw5tYc3MIOc9dceI9UbKprBoItmh4Zw07HisI2r5TN15VQ==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr2468780wrg.118.1640088036925; 
 Tue, 21 Dec 2021 04:00:36 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m35sm5815152wms.1.2021.12.21.04.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 04:00:36 -0800 (PST)
Message-ID: <3a0b0b3c-7fa5-6324-3e74-d7cadd8e89f5@amsat.org>
Date: Tue, 21 Dec 2021 13:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v11 00/31] LoongArch64 port of QEMU TCG
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <20211221054105.178795-1-git@xen0n.name>
 <e0e4f331-6c40-bce4-fa7d-898fbe74f962@amsat.org>
 <31af4f0f-5e2c-b1c1-70dc-8b207f57aad5@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <31af4f0f-5e2c-b1c1-70dc-8b207f57aad5@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.012,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:36, gaosong wrote:
> Hi,
> 
> On 2021/12/21 下午4:44, Philippe Mathieu-Daudé wrote:
>> I took few hours to translate and read all Taobao contracts before
>> registering, then got blacklisted at my first login... Maybe others
>> will get more luck.
>>
>> Having someone at Loongson helping with hardware is certainly easier
>> for the community.
> 
> Loongson company can donate 3a5000 computers or provide an IP access to 3a5000 hardware environment. 

Wow, this is awesome!

> Which way is better?

Access to 3a5000 hardware environment is certainly better for us,
as this remove the maintenance burden.

