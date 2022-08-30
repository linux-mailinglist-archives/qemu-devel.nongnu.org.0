Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4615A7022
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 23:54:08 +0200 (CEST)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT9BP-0000Tn-Li
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 17:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT97E-0005Ac-Vo; Tue, 30 Aug 2022 17:49:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT97C-0001Wk-Fr; Tue, 30 Aug 2022 17:49:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 n8-20020a17090a73c800b001fd832b54f6so10531294pjk.0; 
 Tue, 30 Aug 2022 14:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=RnlWIAApBjHbrNK6LPS8O4ZDdrrnwcinxb/f5ynDCp8=;
 b=S4Y+sGLzbQJRoI1Th+BW4LkKVfKEPwOypREioijxlnpQyDqMLSQzMf6g1TK4UIE7TM
 VcDqH7r1JtqHGLd6Q9DQBryHbm5T6rZknE483Y1+ueGK7fbyS4FAO19BC+ajBTQc/hAK
 Jpl5rduo0uNbq1wNtB9MZtKNVY/+1UsyLIlQ+2ApGxR5cSvA02lKvyWQuMEl6zg9AES/
 g/2S0iEUWlc3g2HJIOoZ1I8/WBl69KGnYbYqmEsTFFxNlMnISjSdbeYZj4xoN2R5Eymd
 v5IbZvQaKyutJgxz7ua6XyUTPUgZFuzdwMsTHlDa2BxCbh8V05GYLmPwh6GPRve0vK4I
 RGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=RnlWIAApBjHbrNK6LPS8O4ZDdrrnwcinxb/f5ynDCp8=;
 b=IygqdVmE3G98Chq/seaVwR2megJdiRXSXErfGMD/74H6kAkUmLBlsCHXAQiGj+Nca+
 MVEeHniyM0X8/omwwYs0SWWfMTwc28ZpgCxAio8uSauz18ltr5f++SUwyLRKGJEkpUhu
 ARyaRP0zsoqrZCf/UnThAhuv78FvLNS3Pc36w8v9ODwaYMiLMmdLv3GJEuV4+d7etDkD
 Bm+jgJA+T66uuI0v/CviKFGn8yfTN72x4Q+cEKbQ+KIKSo80bIXtKotr9i7RdWQnQxvR
 sJUHIaG4gCHTPSGiwzgKtVIZL9MzHmDOAti0wUIFha8DNJKXcl2Ou4QpKK7pKRMl1prc
 X04g==
X-Gm-Message-State: ACgBeo1FPdqLk2hra50QUHdvoGqRaxFlPp1GnEiNaCasIlVESGMEy7pW
 DlHCk9sJt4YiYJpcfUz0f6NxH5XsEiU=
X-Google-Smtp-Source: AA6agR4oXUhaLymKjU6KEhJUzgZMrutJ51MYHnACZ+eI8xCtMc5JiORpA6LumfwHCWCRGo+KAYWmtQ==
X-Received: by 2002:a17:902:e80e:b0:16f:14ea:897b with SMTP id
 u14-20020a170902e80e00b0016f14ea897bmr22450262plg.6.1661896184629; 
 Tue, 30 Aug 2022 14:49:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k191-20020a636fc8000000b0042b435c6526sm2054719pgc.79.2022.08.30.14.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:49:44 -0700 (PDT)
Message-ID: <dafc689a-a7ef-0b98-bc68-6645e513e588@amsat.org>
Date: Tue, 30 Aug 2022 23:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/10] Instantiate VT82xx functions in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220830190048.67448-1-shentey@gmail.com>
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/8/22 21:00, Bernhard Beschow wrote:
> v2:
> * Keep the call to pci_ide_create_devs() in board code for consistency (Zoltan)
> * Create rtc-time alias in board rather than in south bridge code
> * Remove stale comments about PCI functions
> 
> v1:
> This series instantiates all PCI functions of the VT82xx south bridges in the south bridges themselves.
> For the IDE function this is especially important since its interrupt routing is configured in the
> ISA function, hence doesn't make sense to instantiate it as a "Frankenstein" device. The interrupt
> routing is currently hardcoded and changing that is currently not in the scope of this series.

Excellent!

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

