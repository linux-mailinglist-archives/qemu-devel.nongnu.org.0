Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E024D263555
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 20:03:33 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG4RR-0005hk-06
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 14:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kG4P3-0004VM-3L; Wed, 09 Sep 2020 14:01:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kG4Oy-0001ie-Vt; Wed, 09 Sep 2020 14:01:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id c18so3916701wrm.9;
 Wed, 09 Sep 2020 11:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWr/YwTt4WUSL01JYpZATKxD1oyh2WODIXz1W4tUS0I=;
 b=Xwun+t2/TnZ8tbpHsVvmuNeokhwgG60cqzfojguisHiRATD+KZ9zzpN6CtXzb6P0SP
 GE5gZjhi6zestCZ/MtTY6yYYAj28fRMvP8w+kxM5nWLAst3CR7NT7m6Z1dorSfZcySXL
 JcclSoI76SMoD3FIT/oXXJCxUBGo+h04fk7Li7od95+70ywInGCvT0C3xMtBUE8D8MZk
 bcUVgKFg217bDYws+N6T/B2KSOyZhEm8N/cigXPdXw3SWc8al7c5f6Us7oEOnmABUpMi
 8D474h4eNr/0JtKwLMKhwmOQlnDgkS8tikG+8xLWw5gWqFFb4hdCkbaevWCvAGdcxhaW
 pq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FWr/YwTt4WUSL01JYpZATKxD1oyh2WODIXz1W4tUS0I=;
 b=YQZKyb2z7l1Jl4c9fauIgHOVb3qpuf/PHEaxJC3bQoTyTr0ZytrD3/Hp7zPupGgt4R
 kDFxwRgfdOTnfcXlNCvTy6hZ8/fVRz0/VE1wszsPerZVzwMTFhrucrRXpl0eoVe18JP0
 Hag6k+V1CT1gP8GYZ30Wy/8oNbu2uMWLZAT6IHcB2MLbOIIFR1JDGEiGeVXkEytg0/cx
 62cIEnmMO3Bg3M8APWEK6h1izgw/N2m02k88iEziKNDmEMFDpB1WEji7/2o79hAhqDN9
 MLOEwhwVzaE0/mmZkbE0rOQ87XG0mLzx6O5bQDU/apZODCiXsUMU5y81J+eYG/liDQdk
 G2Vw==
X-Gm-Message-State: AOAM531KfNk4E+zJOwSP7FjJIIEcLcuqhbzggDx1HfP9t9Tdivb5dggX
 etU28iuA7HQGR2ivhg7YiN8=
X-Google-Smtp-Source: ABdhPJzy4CGnUowK8rBbHuVJD46qg3NdtRedveYVeIteDRAsfu7UAYvQ34k7K6i4Ost+4wF8UeMBJQ==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr5279217wrs.416.1599674457940; 
 Wed, 09 Sep 2020 11:00:57 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id n4sm4987232wmd.26.2020.09.09.11.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 11:00:56 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw/net/opencores_eth: Trivial patches
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20200608091508.19838-1-f4bug@amsat.org>
 <e472244f-d764-6cd6-70cd-86d71358b999@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <9836f385-ccb8-981f-4677-95d22b2c0a90@amsat.org>
Date: Wed, 9 Sep 2020 20:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e472244f-d764-6cd6-70cd-86d71358b999@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.576,
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
Cc: qemu-trivial@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/20 2:26 PM, Philippe Mathieu-Daudé wrote:
> On 6/8/20 11:15 AM, Philippe Mathieu-Daudé wrote:
>> Remove unnecessary mask, use #define instead of magic.
>>
>> Philippe Mathieu-Daudé (2):
>>   hw/net/opencores_eth: Use definitions instead of magic values
>>   hw/net/opencores_eth: Remove unnecessary address masking
>>
>>  hw/net/opencores_eth.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
> 
> Ping to Jason as the series is reviewed :)

Ping^2

