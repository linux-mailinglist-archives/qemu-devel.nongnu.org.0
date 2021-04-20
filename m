Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5FD365DB2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:50:44 +0200 (CEST)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtaF-0004UA-FY
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYtXK-0003az-G1
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:47:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYtXI-00086p-QP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:47:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so10743714wmh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0LgKoR8adDj0ONoi1GU2dCinN0IpUGcWEhC+xwCQf3o=;
 b=LjZq7FtG51YM60NZ5ngDPUJ5paNIJNfp/gZ1PD4ZiSaBae+fNuuUxOSpkxjb9kTzKe
 QiktxW/voRDJe1y8iSl387ZAawyGx7PExYtdkOZJ4vhC1U2R3svn1mWEihbCXt2YFWRc
 mwksnvIrmmSLvhtKEPPJx+gxciTZe5GiD5l6dXhsoG56cLEQU7fZm+woCnRzk+ni2xJ+
 Job2jEhaTDF8QZnSA0d0JKk4nXo6hE4sVFillLNqdmjYJC26NRt2y2XlUgn31L2/3aCx
 jL6UZOTBsWZqRzMPaVDJsXrH25LJ3XqiaJt/mgL15w2VsMJAf1IkUEGkrrq/1MQGa4pY
 /kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0LgKoR8adDj0ONoi1GU2dCinN0IpUGcWEhC+xwCQf3o=;
 b=kKJahejGwQjOabSRR4hI7SqODrucdmocQMhNHSbTFEi3+V6ZCLK2UnJdT5/0wDDcE5
 aQnmNHGIywFfwbbwJsO5cctvwXfDCMLsv10r2/y5lgofdQDZEmnKLowXaRQL3iN00l6i
 Dg/T7qYycAr8nT0911RoZgBsCUsLV06NQmn9Ban9fYfkR00oOxsbpwr0rZTDsb/kdwom
 rqWo3P97guws8vumDBZin9fAI//2xykNbLkZGZN3D/3TRkQsMYw9XaTPbqyums8ivhIP
 9JkYQpQu92lSJjpYctGV72BhuhCCUHdRdc6tO1VsEu3onEwFsEpI3wLaFT4OblazgNwt
 oaHQ==
X-Gm-Message-State: AOAM5300ONbpCyy1O92IwKMnkznI7p8TujtTC4HvnoZNTwnw6zLl1EOc
 vbUyF6zbhqSNLVQj2L1BcLU=
X-Google-Smtp-Source: ABdhPJzCC+BAEBbFPSavWsayMtJ2KIjPzPHkKPYZqht5dpjJfGiulv7BygIQ2oxgnqdjXCFh4izDSg==
X-Received: by 2002:a1c:1f8d:: with SMTP id f135mr5531960wmf.30.1618937258906; 
 Tue, 20 Apr 2021 09:47:38 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d133sm4010692wmf.9.2021.04.20.09.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 09:47:38 -0700 (PDT)
Subject: Re: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
To: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
 <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
 <7c630c72-580f-ab67-be62-aaf01768c5a6@amsat.org>
 <VI1PR0302MB3486B078E5E08DF7EC15792C9C489@VI1PR0302MB3486.eurprd03.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c8560e72-0775-031f-3304-1eb762224265@amsat.org>
Date: Tue, 20 Apr 2021 18:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <VI1PR0302MB3486B078E5E08DF7EC15792C9C489@VI1PR0302MB3486.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 Stefan Weil <sw@weilnetz.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 6:06 PM, Aleksandar Rikalo wrote:
> Hi Philippe,
> 
>> The plan is to drop the nanoMIPS disassembler because it is broken
>> since more than 2 years and nobody ever cared to fix it after Stefan's
>> attempt in Nov 2018:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg576504.html
>> So it is certainly unused. Unused unmaintained code has a cost and
>> negative impact to the generic project development.
> 
> How do you conclude it is broken ? It seems to work well.
> Aleksandar Markovic did few fixes during 2019.

One community user tried it, reported a bug which got never
fixed. This means the code is not used by the mainstream community,
but is a burden for maintenance.

> 
> NanoMIPS needs disassembler, like other architectures...

I totally agreed, but we need a working disassembler; this is why
I started looking for other alternatives (binutils libopcodes or
capstone) and realized nanoMIPS toolchain was never upstreamed,
so started the deprecation process.

