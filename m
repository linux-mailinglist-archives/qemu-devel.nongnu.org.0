Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A51106745
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 08:48:11 +0100 (CET)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY3fl-00046a-Iy
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 02:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iY3e6-0003cV-6T
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 02:46:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iY3e5-000209-3A
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 02:46:25 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45698)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iY3e4-0001yO-Ow
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 02:46:25 -0500
Received: by mail-wr1-x443.google.com with SMTP id z10so7360393wrs.12
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 23:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KzF+wf9uQqfbz246ba8hUqqMzZU9UhjUNPeddx8SVR0=;
 b=VOLe9OcdXO4oIIZTMPFQmiQgEQXMNPdYQddiAJyixrAVwGIEf0Bgk40MwcO2zzNYqd
 SrVe1ArreyHtpZJ6dTY9PYuMWQSuzP1gIvmRWwVeRbFOZimpsclk9a6bxGuS5qBEzArx
 6w+jGgjIchDlzGpCX6TLVvMwKYCtk99rlDtr+/6ARH91/ZRvwbGNqErtBfX8oV2xajoi
 aTM/LGtA3/DXjl3+NV7mI/m95FyVhouo5W60w+jzTDWbrkGOHrf6GNZGBUCU/i/X0dqE
 RbnAVhUVT1DwL6U5AgiAj5XLYYaJWd5hUsxMGfDTGn0vjUwcE4CqHgkHmKVH1rThJPBj
 lbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KzF+wf9uQqfbz246ba8hUqqMzZU9UhjUNPeddx8SVR0=;
 b=sX328iF7x5h3HIsmrQrc91gs6g7ymTi1m1J4KSYE5BmIaXj8cBagv5Z00KDBMuOqSC
 eJEWVsG3v0g00krQ2ypwy9Mjd+Au3/08Cwpo0c6loIcxP0xI8btKrwBu7B8k7tvIk0vC
 YNkbOnLA6oe1ayO4aB1WjvSbxc1C18+dCPKmhPk1GXyLpLyWCzZ4PJEWMX0miw9Y7KNL
 JDA1pVjUoUik3MflNi2gx85mtvUtw5x94OVJ840EisvOspG5NcIkw28EdHKWzmxLK+sN
 /OA+aHNLwvojC5GUj2IZ+GdtiOor9/m6Dyz2/v6QbaXyMYmQiFyBUfrVjBftn99jbiW8
 61jQ==
X-Gm-Message-State: APjAAAXIbMhxxzV1ayJ8g9FciiBv4+9oa0j8RRT6X9jGlAcrObrXFz2K
 98lCVi2Feiff0uAlRrbLgg1Y5A==
X-Google-Smtp-Source: APXvYqzxFNwEFFUymDjQtULkOrsD0MCCxTriZkBrtT3pmA9E29L+mTF3JSiDCgwYFJYpza6h9u5+QA==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr17278734wrt.260.1574408782926; 
 Thu, 21 Nov 2019 23:46:22 -0800 (PST)
Received: from ?IPv6:2a00:23c5:4e1b:3700:8d83:30a1:2751:30ec?
 ([2a00:23c5:4e1b:3700:8d83:30a1:2751:30ec])
 by smtp.gmail.com with ESMTPSA id b8sm6536267wrt.39.2019.11.21.23.46.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Nov 2019 23:46:22 -0800 (PST)
Subject: Re: [PATCH v35 01/13] target/avr: Add outward facing interfaces and
 core CPU logic
To: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20191029212430.20617-1-mrolnik@gmail.com>
 <20191029212430.20617-2-mrolnik@gmail.com>
 <750745b9-e51c-3757-3eb6-ffce51042d9c@redhat.com>
 <CAK4993gtPkqESswLBoo1cMuvJFzwSVgUP=Oh-hpG2JSTKezjmw@mail.gmail.com>
 <CAK4993iFuC3LTzkwjAx7uKA18jh-zOo5aYx2+1ugc9fw8UPtYg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e1fedeff-3eab-f215-a376-334417f5bf53@linaro.org>
Date: Fri, 22 Nov 2019 08:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK4993iFuC3LTzkwjAx7uKA18jh-zOo5aYx2+1ugc9fw8UPtYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/19 8:53 PM, Michael Rolnik wrote:
> It seems to be a huge investment. this function should parse the
> binary data as `decode_insn` does, so I suggest to modify decodetree
> tool to make decoding information available to the instruction print
> function.
> what do you think?

See target/openrisc/disas.c, which makes use of decodetree.
It shouldn't be difficult to do something slimiar for avr.


r~

