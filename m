Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84E652926
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:42:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lI7-0001uu-D8; Tue, 20 Dec 2022 17:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7lI0-0001uI-6a; Tue, 20 Dec 2022 17:40:49 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7lHw-0003bL-6J; Tue, 20 Dec 2022 17:40:47 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jo4so23800544ejb.7;
 Tue, 20 Dec 2022 14:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bI4Joi+jVDZA74/MSyty5D4nS7kDbDF6pKWOHeIzIGI=;
 b=Drc0WOT/XIbJXSmRlD0qMU3RBKzVqz7jTqXF4DsrrrpLjcOIzo7OMZyjJgESQU18d2
 YG6Hzoh+VyPTnauOWyl8UUfVreNbB76nDJkaNVOrqpANi2UwpBGuV2L6dnkaNQbktHeE
 tn1afMjULSJNijGD/6ZKfuAAg0sX4gqKEg6uZbRUqHyvVwu6u+Bp3AJUohkckFh7IvK5
 xEUtS+YHpOwx/v/m8vUtoqq5LVK08ldDPoTVfMUqd5DjUO+9pWOIPTUa0Q198fyIa9Nh
 FCLkTGqiYPI6iXyW5N9GV6rvRZJasm/o2XZ8m0bEftRg5c1+0VK9mqutgh73mqapAny0
 XGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bI4Joi+jVDZA74/MSyty5D4nS7kDbDF6pKWOHeIzIGI=;
 b=4+auovCXyeMEn6+i5mgEz/+qrTQ45l2537l0EHz4ubBq45IdgSNRliJVEjEl7TiGXW
 l2KNwinM0ty9YoMGxLctnkL4/H59uGZAP8J2fTeeimV5BAyiA+4WvNXz3qkHd59o9okc
 dNrjo9LGlJ2eFao5m8v5hefd3IceidhJjR2e/rpYc3HZvh2X2pA0SX4Bemh9qvtlIZLV
 orsFuSYwkaIJsGKW4liQ8CIKda78V7broc/Lsadp50JKAf6gPnKATWFaUwiZ4xIHwa81
 +QKc0wJ7P9rTAXsArEdevhGW/tZqrEG6CfRV6OJiycoS8ufeC/m6EulZjdlIMBf7LLVU
 X9fA==
X-Gm-Message-State: ANoB5pmXYcKlDJknlY72KXnbNKM+jTpj0oS41+X1D9HcsoC4mOBn0825
 0eCt7uj39th4BkarZTuCUHM=
X-Google-Smtp-Source: AA0mqf5SprCriyxymP8dS6Xqm3A5hiT6evERnmm6G6jaYR7KlhOeF1qgODPXV3Io3FJzmatd1zv+ug==
X-Received: by 2002:a17:907:90d4:b0:7c0:db61:dbd5 with SMTP id
 gk20-20020a17090790d400b007c0db61dbd5mr35056002ejb.62.1671576034570; 
 Tue, 20 Dec 2022 14:40:34 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-170-133.89.14.pool.telefonica.de.
 [89.14.170.133]) by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b007be3aa82543sm6247223ejh.35.2022.12.20.14.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 14:40:34 -0800 (PST)
Date: Tue, 20 Dec 2022 22:40:25 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev <mjt@tls.msk.ru>, 
 qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
In-Reply-To: <6fc82e52-b7a4-778b-1510-4831570a50a3@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
 <6fc82e52-b7a4-778b-1510-4831570a50a3@gmail.com>
Message-ID: <FBA6F5D9-F6B5-445D-BC47-12FD202BC929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 16=2E Dezember 2022 17:50:41 UTC schrieb Daniel Henrique Barboza <danie=
lhb413@gmail=2Ecom>:
>Queued in gitlab=2Ecom/danielhb/qemu/tree/ppc-next=2E Thanks,

Thanks Daniel!

Is there a way we could accomodate for Zoltan's comment still? It's just c=
osmetics, so should be pretty simple=2E

Best regards,
Bernhard
>
>
>Daniel
>
>On 12/16/22 11:57, Bernhard Beschow wrote:
>> These are some patches which helped me when getting a u-boot image to r=
un on ppce500 machine=2E
>>=20
>> Testing done:
>> - `make check`
>> - `make check-avocado`
>>=20
>> Bernhard Beschow (6):
>>    target/ppc/mmu_common: Log which effective address had no TLB entry
>>      found
>>    target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>>    hw/ppc/virtex_ml507: Prefer local over global variable
>>    hw/ppc/e500: Prefer local variable over qdev_get_machine()
>>    hw/ppc/e500: Resolve variable shadowing
>>    hw/ppc/e500: Move comment to more appropriate place
>>=20
>>   hw/ppc/e500=2Ec           | 10 ++++------
>>   hw/ppc/virtex_ml507=2Ec   |  2 +-
>>   target/ppc/mmu_common=2Ec |  5 +++--
>>   3 files changed, 8 insertions(+), 9 deletions(-)
>>=20

