Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53814615001
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optiD-0001w6-Sd; Tue, 01 Nov 2022 12:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1optiA-0001vn-GB; Tue, 01 Nov 2022 12:01:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opti8-0005DG-Ot; Tue, 01 Nov 2022 12:01:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so10179503wmb.3; 
 Tue, 01 Nov 2022 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lX5J59iADq0yCOZ6olpRq9oFTs+l+t19WTBQOpUde0=;
 b=f9lCnDWQtRRNFq7U5qOWafuza7+owTKhZl9DAqQjSux5NbDH8bNRM/EIM62V7/yhaO
 kjBbAX6htshz6jgaE3wsd5JpezJaNfCiW0JBx5XmyrxC34tCtor0FgAlTD2lcKhFkQrk
 sK5wJnatw30JK6wNQi+InkaKlscSw//vFS7Eh4EdamL8rxTCvhczdLYrLToDhZX38jh3
 RLWESt6a5TE6+iAuslZgmRmxnLUwnXvN5nusUp5T+PMDIbuDu8Fe4u8UH8elFTlbXDZX
 JVDj26h7SDlJ4lcoxqA4HzckdmteaWkt0GCMNZIYZwtuXHkFCAulLrNDT7HLWmpe1SGO
 1V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5lX5J59iADq0yCOZ6olpRq9oFTs+l+t19WTBQOpUde0=;
 b=YdiLpQyyueqJrZznS8c4sVNRp34I036tqHUbQo8mmebnlsR17Q4xmTkEgh0cBL/Hdm
 VC8kv2ppVI7RhekKgyMAS11dPv8xc+giz3WGG+02gvTCKXYiqZujoWCPs5h9p/Suu5/T
 hw9P3wmoFbF4q26A2yc0iVzFF01HmiWS22UqArDXqT7NA5tT/RntJ43920raQGrx6cMG
 J/l/sw7aLOOBbIEa1vbvZ+/e4LrGptWRrssHrEQyT91Arw234z6U++tb4qldCFGoUV4o
 tGjOU/siG84JczK8Daytqnw6yd1GZQ7sgQfcfzx5xaIV8iRG4st1iwKUh5TuMT1CuQou
 WPqg==
X-Gm-Message-State: ACrzQf038kpl5BngzKdNG9uqaI1FPKiJ1A80uzRAsDNBr7JesKHM1FUP
 t/LIS2cnJsI+DAGHDSa0r/c=
X-Google-Smtp-Source: AMsMyM7qQxFMjYvU4mGat58N3buCc/+1cnB+218Trb/aQ/QvF/KsRclSVWeaFMHompy4qM3oAYNZqw==
X-Received: by 2002:a1c:7207:0:b0:3cf:8115:b39a with SMTP id
 n7-20020a1c7207000000b003cf8115b39amr2231863wmc.80.1667318513661; 
 Tue, 01 Nov 2022 09:01:53 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb20008d20b2c0629916b.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8d2:b2c:629:916b])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a5d6f13000000b00236b2804d79sm10639716wrb.2.2022.11.01.09.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 09:01:53 -0700 (PDT)
Date: Tue, 01 Nov 2022 16:01:46 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/6=5D_ppc/e500=3A_Add_sup?=
 =?US-ASCII?Q?port_for_two_types_of_flash=2C_cleanup?=
In-Reply-To: <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
References: <20221031115402.91912-1-philmd@linaro.org>
 <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
Message-ID: <AAFF66C6-6254-44FB-96B8-97B08F413C95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 1=2E November 2022 10:41:51 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>On Mon, Oct 31, 2022 at 12:54 PM Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro=2Eorg>
>wrote:
>
>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>> as an 'UNIMP' region=2E See v4 cover here:
>>
>> https://lore=2Ekernel=2Eorg/qemu-devel/20221018210146=2E193159-1-shente=
y@gmail=2Ecom/
>>
>> Only tested with the ppce500 machine (no further regression testing)=2E
>>
>> Since v4:
>> - Do not rename ESDHC_* definitions to USDHC_*
>> - Do not modify SDHCIState structure
>>
>
>Works beautifully, both for the buildroot load and for my proprietary loa=
d=2E
>So:
>Tested-by: Bernhard Beschow<shentey@gmail=2Ecom>
>
>>
>> Bernhard Beschow (4):
>>   hw/block/pflash_cfi0{1, 2}: Error out if device length isn't a power
>>     of two
>>   docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>>   hw/ppc/e500: Implement pflash handling
>>   hw/ppc/e500: Add Freescale eSDHC to e500plat
>>
>> Philippe Mathieu-Daud=C3=A9 (2):
>>   hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
>>   hw/sd/sdhci: Map host controller interface in host endianess

Hi Phil,

Is there a chance to get this in for 7=2E2?

Best regards,
Bernhard
>>
>>  docs/system/ppc/ppce500=2Erst |  38 +++++++++--
>>  hw/block/pflash_cfi01=2Ec     |   8 ++-
>>  hw/block/pflash_cfi02=2Ec     |   5 ++
>>  hw/ppc/Kconfig              |   3 +
>>  hw/ppc/e500=2Ec               | 127 ++++++++++++++++++++++++++++++++++=
+-
>>  hw/ppc/e500=2Eh               |   1 +
>>  hw/ppc/e500plat=2Ec           |   1 +
>>  hw/sd/sdhci=2Ec               |   6 +-
>>  8 files changed, 180 insertions(+), 9 deletions(-)
>>
>> --
>> 2=2E37=2E3
>>
>>


