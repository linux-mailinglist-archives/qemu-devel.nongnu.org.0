Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25655A7D1
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 02:11:39 +0200 (CEST)
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hh0xu-0000sW-KB
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 20:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60033)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hh0ws-0000Li-9k
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 20:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hh0wr-0002xw-Dj
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 20:10:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hh0wr-0002wz-5p
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 20:10:33 -0400
Received: by mail-wr1-x442.google.com with SMTP id n4so7902193wrs.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 17:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W+njdGYXMwVUlALGNOEmZlA+AIB17I1tvTOGcXyYBh8=;
 b=D7DO1Zx4LFlZv82Ve8Ko0ckgqU+QXNdsUmp8uS7zRoQw6dANh88Y1fNuhyWq+wezYU
 135DGD1jyq9AI9G9iFlx92vbF+Osuz4uMWg1vgeH6EROGOHGeP+cSQ0F0868rdQrrML8
 CBxt/GBos0abrAEsuS5F/AHv7exN4QoRsrbHuqOF2uXhXhpmQJaZN7TC/1m9TS6gcisI
 BOnRz2awErC1feNxG/HIu+OkUAht06YQ/uF3VXqqfPaXSBk1XybkYebirJFpx8gI8ezK
 d0P2ZI1T2gFVDiCeRtFQaEHg3TqNM5XfHGf+y71a1DBd9fjAKGM5sWEwhoD8KT8HLzlj
 AIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W+njdGYXMwVUlALGNOEmZlA+AIB17I1tvTOGcXyYBh8=;
 b=PXW6j7OfwsDs+LxYX3N9gdTzIdgxaENpthgGE1Et+E1xpg2Duw2awFnx6a4M3S69Wk
 P4Mfc70sLemCm4J/kUEDgL1Y/oLNprddNwQckiDJivzRtFiNdsfTzQ5U9aHY0vlIVUHz
 6cqBM0P++C2fETQxTg4cixCThDs7tpI3sh5a100Tlk7eaxQewRTV4LwoRK9mJaF93aO0
 0W7Hh+KmAVOmK2eUdMoo5cT0RJ3RqrDJ4rbXgiZpgb1HJdHY1FWZx2I2o6mDZeQwPjdS
 MG4JBquKC3nTkX37DoGKvEzz41Hd/VF1tW+esvjIi6yoN14QvLro6z+AQpu6qRY+bNqk
 t5tA==
X-Gm-Message-State: APjAAAWIrt3zen2ocy1sKPySlrp0jfuVLT5gch/OXgyFXqrcCpX0WTyR
 iUMt2LAiSiPmyemlXZZeeWb+Nw==
X-Google-Smtp-Source: APXvYqzXU4YGekZflP4unR6sVeEcOT5iZjp1JU2syJ42wVg/T4f3tOjW9MnQGTWXP6aSfqv7DZ+puA==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr9694825wrp.220.1561767031306; 
 Fri, 28 Jun 2019 17:10:31 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id z5sm3470476wmf.48.2019.06.28.17.10.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 17:10:30 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
 <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4e7e78a6-1e6f-4190-4b15-12f443d9be78@linaro.org>
Date: Sat, 29 Jun 2019 02:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/19 9:27 AM, Andrew Jones wrote:
> Also, while it's true we can always
> get the max vq with next-smaller(ARM_MAX_VQ + 1), having it cached in
> cpu->sve_max_vq is convenient. That said, I think we'd rather keep it.

When is it convenient, and for what?

Certainly the only thing that we check after boot is the largest enabled vq not
larger than x.  And for that I don't see that sve_max_vq is relevant at all.

Oh, something that we should also think about is -cpu foo, where foo is one of
the Fujitsu thingumies.  We should be able to default sve_vq_map to that which
a real bit of hw actually supports.  I, for one, welcome our typedef long
overlords.  ;-)


r~

