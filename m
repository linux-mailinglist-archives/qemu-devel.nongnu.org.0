Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B8615267
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:38:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opx50-0006z8-E2; Tue, 01 Nov 2022 15:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opx4q-0006xS-EA; Tue, 01 Nov 2022 15:37:37 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opx4e-00039j-6B; Tue, 01 Nov 2022 15:37:36 -0400
Received: by mail-ej1-x631.google.com with SMTP id b2so39703665eja.6;
 Tue, 01 Nov 2022 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kedtu1sqAnEO1bDmksmkoqkl96Ec7WaS/C3RY2yE3s8=;
 b=UmdxAS84FFrJe2CRD30wJ9S3CZt9m1MJvKLDmH0FREfSHPGVxXHyTpRSlun2SXmwnk
 zbrHE9H1gSc6+Ig1oJfsXLNr9rUOAjgwykAsx4yyXBS96kvvByq9SoWjYGXgEJ97xAP/
 WCwJnIgZ0YUOXHzYIeNvUDscQi/eaWPKVAsLoGm+Yb+0EDjxXHDhatKVxXO3v8fnNYA6
 wqZqRnO9t4rQo6oEnJRTwg/jRjQ2WYSX5yx8KLsS92Zk5uzByO5DCH6qDy8FdW+da5cO
 lZ+Hy6Ru+RrYeEh180u+88iTegwSXSaRIEKPY6CLB2/4nWNZIQOTFaNucZfgQS+GaqVk
 ZY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kedtu1sqAnEO1bDmksmkoqkl96Ec7WaS/C3RY2yE3s8=;
 b=jWal+Tm5V4q2SXIsRww3YkwlWDrAuU341LwlB8YCf8h4uuYhYOIx6UAkmPT76vJssY
 Q3s/U8CAQfDTOL+BwCZyCC1QL49BNRxrWPeA23FxWC73lYUOO+RXk/EUwLcdjaoWBEaX
 WFutKwZNoKWlkcA7A+nVGqDrd97XYcPLS2wcLboCJPBdCkTP7r2WWZ/hKYTwcRLwOEXY
 mxbhDS/37UevivqUATnRMPELGjA+xQZH17/N91k7+fzDzY1aP8ezFEyQEL7sw7qBldla
 Poc+9vO6C0M3NvtVV25NS5mddrU+Ld/CmW54EAF+VLal2Qq1BsP1kPxPy/NtVhIlAPfJ
 6HXA==
X-Gm-Message-State: ACrzQf0OOpokKgg55UBbuKwXr9sV+OKLkeIMHAGOgADbidjPxb2gUJ5O
 yG1ShGrNQ8itoS94tdP82R0=
X-Google-Smtp-Source: AMsMyM67x5KcJGqFNQ2rEDWboMnHjIL7E40lWEIf3DRFTforiyUVvKncdt1IaZd+QgDkfd/DxLArvA==
X-Received: by 2002:a17:906:5d0c:b0:7a5:ad82:f319 with SMTP id
 g12-20020a1709065d0c00b007a5ad82f319mr19768803ejt.318.1667331440491; 
 Tue, 01 Nov 2022 12:37:20 -0700 (PDT)
Received: from [127.0.0.1] ([213.235.133.39]) by smtp.gmail.com with ESMTPSA id
 fy8-20020a170906b7c800b0073a20469f31sm4534061ejb.41.2022.11.01.12.37.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Nov 2022 12:37:19 -0700 (PDT)
Date: Tue, 01 Nov 2022 19:37:12 +0000
From: B <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/6=5D_ppc/e500=3A_Add_sup?=
 =?US-ASCII?Q?port_for_two_types_of_flash=2C_cleanup?=
In-Reply-To: <b476934e-20b8-91f5-b0e1-0d84f3ba2707@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
 <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
 <AAFF66C6-6254-44FB-96B8-97B08F413C95@gmail.com>
 <7ee7386e-f754-083a-42e3-44b84bf4908a@linaro.org>
 <b476934e-20b8-91f5-b0e1-0d84f3ba2707@linaro.org>
Message-ID: <7DD9ED50-CB7A-45BF-9105-0FEA065E7546@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 1=2E November 2022 17:43:46 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 1/11/22 17:58, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/11/22 17:01, Bernhard Beschow wrote:
>>> Am 1=2E November 2022 10:41:51 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>>>> On Mon, Oct 31, 2022 at 12:54 PM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro=2Eorg>
>>>> wrote:
>>>>=20
>>>>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>>>>> as an 'UNIMP' region=2E See v4 cover here:
>>>>>=20
>>>>> https://lore=2Ekernel=2Eorg/qemu-devel/20221018210146=2E193159-1-she=
ntey@gmail=2Ecom/
>
>>> Hi Phil,
>>>=20
>>> Is there a chance to get this in for 7=2E2?
>>=20
>> Well 1/ can you review patch #1 and 2/ we need to figure out what to do=
 with patch #2 :) Can you point me to the CCSR datasheet?
>
>Maybe I found it, I'm looking at the "MPC8544E PowerQUICC III Integrated =
Host Processor Family Reference Manual, Rev=2E 1"=2E

This document looks similar to mine: https://www=2Enxp=2Ecom/docs/en/refer=
ence-manual/MPC8569ERM=2Epdf

Best regards,
Bernhard

