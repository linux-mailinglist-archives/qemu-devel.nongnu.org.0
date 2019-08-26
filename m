Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C19C6F0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 03:12:31 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i23Yc-00026Q-FO
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 21:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i23XB-0001Zc-IM
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 21:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i23XA-00051a-LT
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 21:11:01 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i23XA-000514-Gg
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 21:11:00 -0400
Received: by mail-pf1-x444.google.com with SMTP id y9so10260604pfl.4
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 18:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YlVxrPSpJtVUI0ukGunV7p/yIvUAp7XhFNmZCnoyr9U=;
 b=d7P8XFwTZVLINw8ol36XPgsceTQ9fmVIqDVXAd/mwGQAfRvEOB/QtvmWV2YxOwVr9x
 tIp5dcJkxhhmWThL4DiB5vzYaQhvMBxp3WzmIU5FmxbiVYzCmzn4uCwptyP1Rd4nlju5
 UzgJYBO9DZN90dZ2DVmWGL3OlrL5H5gcSv06vBi8TTYcyzuJ11nBkQl22hiruOksFSer
 GXnzG5InmUU6n6tUDuIJO6zt4iaVp4R2xLN3778b5qt5dk/FddLYN4pGFnk2iJISL/Sh
 ZGpmezOcL772WFU9TBGJpgWLSODFO9PXTf64tRV+L0ZhEFOKqguzzXr2Npke9yq7+sBl
 SdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YlVxrPSpJtVUI0ukGunV7p/yIvUAp7XhFNmZCnoyr9U=;
 b=SMyP2DavA0js7tLeOHZm8l0RoHyto21JrqeupMhctgHjLtsI+H5EiPlhPT9nIoC8d3
 jv7BkQm+tZM3q7BIbrE+Y0WhvzAe5Ii4L14PL9n6FcYJJOk7LfooWrV/O1xgfU8QVg6D
 QENSR+9jIZYFUAYeLjhXX9g4VcCwiNN7AEkl2aGzmZ+XFC9FtxVNw5WlT+3HPvvM+4Al
 4QrnQbyKrNHKURkZo9zNsL2nbSsSX9IWLOuO2rV0Y1BtIv28scQ5whEZtqKsFjx79fkj
 Vwg8nticRmPOBrv4DaHCiZMcBkLHCFQvp58DEadRzITai4ljw0Eo8C+voAhvL/jTMgaw
 1t/g==
X-Gm-Message-State: APjAAAXpZLhiHXV6qaNtTmp1TYmHisLKsit8nLLxaGgiE5r0T5YVqH8j
 VEiOsQvGYIIdVyhz9quw7MnDm8Mz1wA=
X-Google-Smtp-Source: APXvYqwaC+lo5LzBGU1/z1VeLh9/LmW989OrDbT9eTPQjgkhR7X9ftqor3fGjMZPijWMWU4Ai2H90w==
X-Received: by 2002:a65:6713:: with SMTP id u19mr13211669pgf.403.1566781858576; 
 Sun, 25 Aug 2019 18:10:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v189sm10115477pfv.176.2019.08.25.18.10.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 18:10:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
 <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
 <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
 <CAFEAcA-m76JW2=t8uX6nC8E54TMKLe4nbCGvd8bOKx+wSYRtGg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <516fa14a-2e6c-9496-9318-920ccd164b6a@linaro.org>
Date: Sun, 25 Aug 2019 18:10:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-m76JW2=t8uX6nC8E54TMKLe4nbCGvd8bOKx+wSYRtGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v2 35/68] target/arm: Convert CPS
 (privileged)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/19 1:43 PM, Peter Maydell wrote:
> I'm still confused, I think. The hint space is
> +  NOP            1111 0011 1010 1111 1000 0000 ---- ----
> (plus the more specific hint insns before that pattern with
> fixed values in the [7:0] bits).
> CPS falls into that space; but you've placed it with
> SMC and HVC which don't fall into the hint space, because
> they have 0111 in bits [27:24], not 0011.

Oops.  I see what you mean.


r~

