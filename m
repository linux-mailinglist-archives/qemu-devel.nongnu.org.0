Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB03BB9AB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:56:22 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KOr-0004fq-Jz
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0KNx-0003h9-NX; Mon, 05 Jul 2021 04:55:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0KNw-0000DU-D5; Mon, 05 Jul 2021 04:55:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so3034609wmq.3; 
 Mon, 05 Jul 2021 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uJS9EHXw2cv8JLTRpOpg7EAmW/KO72G+zdn+srv0eTk=;
 b=sdBjJ3fXtJkMauy2xml+MQ/sMjEQNrfxk2WWDzAS2yKaNMAcK+0J6PKQl4whArmQAG
 OVXEKagwwFbTSfpfLDBTuBAdvhrOun4+6X+myqb5gaPMHxhfNpz94uZ9fk5glCQb0mq0
 Cj9NpJC1ZKhemyB/a/jVYSQEVubs+ssS8WPDcTnchHoj0xJRtncCLItixHrv+ydfBxke
 xAUUx27yH+odCsHL16o8pao729TIdeu94zCm1jTsLCQjU2KIoLRfbtfkptPg403Gfs94
 N5BWp+FlOnSGw8fJQIM/OrkiXgwbr5uEdU43wn8izdMj6kxpNusGLXHWJ+YitnUilAZq
 inbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJS9EHXw2cv8JLTRpOpg7EAmW/KO72G+zdn+srv0eTk=;
 b=WA/+BbC3zo1xzNNN7yuJbiGaICEj5LWhND4FoDfe5ZWueDZDXNKlyXqoDWwOHoI15A
 tBBFCUj9Vp1SCWosBY2IFIWCA5LySBnU5jUew2WZRlT/rboHN0hhL2Lz9GWsUFkXv+Ij
 DUp57MLFOeAKvBJk7fpYwS6X5hVI2pjj/qCV1fhTLpYdSONHItMHQvBZY/wAm3dU+Ry6
 exCKHo1jgHJ84wQefwhqAkKIh+7Yzgv7o2zjGvvAm3gt0SK7+fmpYyk9kH7eCAY+HqHH
 E4vJigT18YeCDSl77yejSwsr6jEP/Iivdk8xEsN+ipjtumE4zSbfMesqWO+SucDN3x3+
 pDeg==
X-Gm-Message-State: AOAM531M+rMHsC0LirmKG8E246Tp+RzBSKzxsiNJHrgQKAN+tAtV6mBS
 d+qwZMLYg5KH+uIw0Uo0goA=
X-Google-Smtp-Source: ABdhPJy3EZnqqorir8tUgl29nYvAEhKCfr8UOeZq45KCyoPukXh7MSY8PQxozZQgen4u7FGu+/YS9g==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr13740037wmj.167.1625475322642; 
 Mon, 05 Jul 2021 01:55:22 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id d24sm16833958wmb.42.2021.07.05.01.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 01:55:22 -0700 (PDT)
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
 <6dc3fe10-924f-9f3d-baea-90e2539f58ee@amsat.org>
 <CAAdtpL6+M2e=SvGFMgJBxanQJgTz0kg1th-9BxHy1TaWEfafog@mail.gmail.com>
 <CAPan3WqaXEGchtJNN0UfcXxu+wJQttCjyFW5CrtS=+5eqa7wow@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <10114d64-aa8c-997d-dc0a-09d541f61962@amsat.org>
Date: Mon, 5 Jul 2021 10:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPan3WqaXEGchtJNN0UfcXxu+wJQttCjyFW5CrtS=+5eqa7wow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niek,

On 7/4/21 2:35 PM, Niek Linnenbank wrote:
> for test_arm_orangepi_uboot_netbsd9:
> 
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com
> <mailto:nieklinnenbank@gmail.com>>

Thanks for the review. Does your R-b tag applies for this single
patch or all patches related to test_arm_orangepi_uboot_netbsd9
in this series (3-5)?

