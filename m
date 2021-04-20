Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E75366275
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 01:25:45 +0200 (CEST)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYzkW-00015E-4y
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 19:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mips32r2@gmail.com>)
 id 1lYzjP-0000el-9d
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 19:24:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mips32r2@gmail.com>)
 id 1lYzjN-0006r4-Fb
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 19:24:34 -0400
Received: by mail-wr1-x434.google.com with SMTP id h4so30368071wrt.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 16:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=8e5HxLZQzIt4qj0aUtSofxD+HW8y0qA8K9AAAn1v6ck=;
 b=tjdpDCBjWpSdrzU5Qoj3kJMwmiBMy0Kf89Aont6qff75vQvR+cyhbRSn1clwANhgDt
 3dVPrTL55tnAZVEl8LdANXSe4fa1mCXNnasbQE8y2+7c8PJg95Hxr4amX/Yl8HhYZhWM
 8fKgz7SSb0o+ZJjb4CCFB0CtxluIgUBHoSWEjSwP17g+zjnKa/lWrGwGzrnNLC7knLuh
 HAHzfp5zbtw8t7OxVXheDY+XmQkJIFfkNcEDaAcVZx4/SjABTr7991eA6+wQCxtdSrat
 LGlmB83Bjs6wMK5yNCxVBCAgnooNClkO+jVmWdBvb0i5mp73kR0ROBxnO5GSMfg3t4ci
 B5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=8e5HxLZQzIt4qj0aUtSofxD+HW8y0qA8K9AAAn1v6ck=;
 b=SCK1OcJNQB+D2kqH0PmxKazGvnDSI/ahrupaxzBrPIB41va1HrhAOd2O1rissYu5Kp
 XHqcYKZ8dSfKKG3xeb3ccBZlAMqlviOgIag12wIYOvjYZqV/ZcK/WwCP7nhJ4mkekRzc
 iAtqYflmFKFH584IK2/QFgckXw+XTERLIGCft4WHF1tapnwgduqsybUiSn2CxAL9tW20
 OxgBX/0/69Bm3+GrwfREQ6HTYiOBatGEUdpj2K6YLKtrmD2bBQwjg9LjgRU+nAHg9X8g
 2SGz1/qDyFcik0uwUuHbjTjf820EHxawGlUpyxI7jt4SR4Wx5t8YgglwAHQBSNYatZMK
 eSWQ==
X-Gm-Message-State: AOAM532ehtlGfwAvBVlLOyj2/UdTB+Gs9FkfZVPO18rqyP0aWX5bFTyt
 iLGvhmXo+M04vzRxw+vzeu8=
X-Google-Smtp-Source: ABdhPJw0yHKPdC5AHA1AKZmLUayS9rnfSc27t4naDUrPsiTEPKOf037+Zxd1xzmfB1ItdIfNmuq5ZQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr23767431wri.125.1618961071213; 
 Tue, 20 Apr 2021 16:24:31 -0700 (PDT)
Received: from rtrkn153 ([46.240.135.222])
 by smtp.gmail.com with ESMTPSA id x25sm297968wmj.34.2021.04.20.16.24.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Apr 2021 16:24:30 -0700 (PDT)
From: "Petar Jovanovic" <mips32r2@gmail.com>
To: =?iso-8859-1?Q?'Philippe_Mathieu-Daud=E9'?= <f4bug@amsat.org>,
 "Aleksandar Rikalo" <Aleksandar.Rikalo@syrmia.com>,
 "'Vince Del Vecchio'" <Vince.DelVecchio@mediatek.com>,
 "'Richard Henderson'" <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
 <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
 <7c630c72-580f-ab67-be62-aaf01768c5a6@amsat.org>
 <VI1PR0302MB3486B078E5E08DF7EC15792C9C489@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <c8560e72-0775-031f-3304-1eb762224265@amsat.org>
In-Reply-To: <c8560e72-0775-031f-3304-1eb762224265@amsat.org>
Subject: RE: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Date: Wed, 21 Apr 2021 01:24:28 +0200
Message-ID: <000201d7363c$501f5f90$f05e1eb0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHXLFVcDWm9FQ9LmUmRmYmlgVEYZaqq1qRYgAAXXwCAAHOMAIAQ1IEAgAFlP+aAABXBAIAAbhVw
Content-Language: en-us
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=mips32r2@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: 'Stefan Weil' <sw@weilnetz.de>, chenhuacai@kernel.org, aurelien@aurel32.net,
 paulburton@kernel.org, Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 6:06 PM, Aleksandar Rikalo wrote:
> Hi Philippe,
> 
>> The plan is to drop the nanoMIPS disassembler because it is broken 
>> since more than 2 years and nobody ever cared to fix it after 
>> Stefan's attempt in Nov 2018:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg576504.html
>> So it is certainly unused. Unused unmaintained code has a cost and 
>> negative impact to the generic project development.
> 
> How do you conclude it is broken ? It seems to work well.
> Aleksandar Markovic did few fixes during 2019.

> One community user tried it, reported a bug which got never fixed. This
means the code is not used by the mainstream community, but is a burden for
maintenance.

Hi Philippe,

I am not sure I understand this. What bug about nanomips disassembler was
reported?

> 
> NanoMIPS needs disassembler, like other architectures...

> I totally agreed, but we need a working disassembler;

We have a working disassembler in. If there is a bug that needs to be
resolved, please bring it to our attention.
Thanks.

Regards,
Petar


