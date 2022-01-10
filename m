Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30D489B22
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:17:58 +0100 (CET)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vUj-0005O7-0c
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6vRn-0004PG-Fr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:14:56 -0500
Received: from [2a00:1450:4864:20::436] (port=38662
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6vRl-0003zQ-QK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:14:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id a5so23099993wrh.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m9Tx30Ibh0X9JPjRexB+saQq9M+yI/BU+XXQrp2TUiA=;
 b=cekOFWzkr5OUQr+dxqP8iqC4G17k/3F4QHrZ8+GaA8dJc6fVlmp5GGpaYBRzviAkWx
 qLbo95s/sSevPOBTGKR/fE2CuzpmR8uxRbYe0nPh3MqKriDNcvK1LJ7eKraR0ipzjbof
 7Jtvt9UDMfyPbyurxAuvKduAdIHVe0rMMJKhOh0BRxG/m0x6ByGjP3AJZcU2yxuePy+0
 WMY07lJnm7kpphhbbrpUyTjVCZwbES/LA4TDwZrXGZsJueTsNrDR02r+RzWXhRuchqVA
 jxia8bzIou++lPRqvivpwp0MPw+m78CeSpVbCt1fM+RebMG3GTIyQGr7oe6U/Ldo5c7n
 DNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m9Tx30Ibh0X9JPjRexB+saQq9M+yI/BU+XXQrp2TUiA=;
 b=h2t7KTUQ/Y/FCcNoYGEA3oZXjGAtXoxNrAMaor6EAFZ1Ahj15sQA4ML5sTYEdQEx7T
 YtC/OkbiGyo02rimbW1oP6teVljI5NBNRlPFwU8aZv/nvaIzE9xf5lKtKveHf5l8WK32
 VmXuv3APF+J3QUMXmfgq+RyAviMT+pJxedSouWemnB9aIpLvL0gYCISov6Q6dyJDkxQX
 450ssOKBdNYtVhlbP6alnl85pdLpJi8z7ylq1Yn0e1pBln7DhOS1/WJqyfgS2XzndPJC
 CfUbWjR0gu+SMHGnoEWSHB5vw3KKhTEFQyOVweuSPdyqVWJzEa+ktjLEQKFQaB9NrLH7
 v3NA==
X-Gm-Message-State: AOAM533fQYgDKYlb2qaiF+R/AAhy0qpORqAdR7e6pUf4UDO6PbV6ktIg
 ncUtjvO81r1r3hFxa0TbUeQ=
X-Google-Smtp-Source: ABdhPJzytamkGpRd+w0sASR3M3uIx8f//n93lUlaf61Zvy5bJ95y1wwd9YMp+vqPOfdQdh/ztXuBhA==
X-Received: by 2002:adf:fec2:: with SMTP id q2mr4654678wrs.546.1641824090059; 
 Mon, 10 Jan 2022 06:14:50 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id b16sm3401239wrq.52.2022.01.10.06.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 06:14:49 -0800 (PST)
Message-ID: <14abede7-090b-8a8e-41d7-3b782455d6d4@amsat.org>
Date: Mon, 10 Jan 2022 15:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 0/9] qemu-ga-win patches
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220110134644.107375-1-kkostiuk@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110134644.107375-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/22 14:46, Konstantin Kostiuk wrote:
> The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:
> 
>   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/kostyanf14/qemu.git tags/qga-win32-pull-2022-01-10
> 
> for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2affc759fd:
> 
>   qga-win: Detect Windows 11 by build number (2022-01-10 13:05:25 +0000)
> 
> ----------------------------------------------------------------
> qemu-ga-win patches
> 
> * Fix memory leak in get_pci_info function
> * Add support for Windows 11 in guest-get-osinfo command
> 
> 
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> 
> ----------------------------------------------------------------

I see the patch 'Message-ID' tag is not required on the guide:
https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html
but it is sometime useful.

For your next PR I recommend the 'b4' tool which includes it:
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

