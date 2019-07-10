Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C12642FF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 09:42:39 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl7FO-0001Bw-4v
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 03:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39581)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hl7EE-0000en-Kg
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hl7ED-0004qs-Ng
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:41:26 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39551)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hl7ED-0004pc-Gg
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:41:25 -0400
Received: by mail-oi1-x243.google.com with SMTP id m202so880475oig.6
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TXE3kgF44lBVZ/z1dmAO9yFLLK6d84bW2ivIa5t1e0k=;
 b=Tj45pOOcOzaPkP2jDlt4UVz9SkhecD/8yYlQcYbold1vxGwXaJQOwFYFtbkkJGYzYG
 H8+5jO0pgeyY+NnBfw66OY7RjZWnSFcJQnhXwO9gPf1Ca8B6NfGmmmgD3WdBtSKIFUuP
 6zRLI5U10hweMBwN5Kj1eIOzX9QPAe3cAmxXTlEMtpF8iZlnFcWTD/oBNdR1HzlCmzZE
 2Hr1bQEEeCEa+VCnO472XLhmSPKgk24bGRVQKPIP53vPFi2GWp8Oh3xzU0VqBe76bOzm
 MUzqZTN8eOdik6gfEWVgZfwON2+fGoI5kQDG4tg3X6wQ+rg2D4nP/2zOR0zFh5t7EJ0M
 7G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TXE3kgF44lBVZ/z1dmAO9yFLLK6d84bW2ivIa5t1e0k=;
 b=DRJlmcSr2iFm3bpzK52VdOiiO0jFYbFlBJEXo33o4uj6U5KFTO98nOmjcsugV4jXJJ
 3YkMaOlfe1Je25BGDRzqUYMgYK408RaZ+AdI4z5yvryEYyGynNXmn8WhICCapP9opYum
 NSLb2j6F6c1nDvosuJbYEOBeOF4zHhgI8/VXEEE0/TRNmkzUFa25V16NLbgumYvokyQl
 uCmcJiuYhDQdIEEcOoZ1fuVMihp071qcwRZ3g5OvaZtmlwLnV3iRvPuNcnKtgl94xchl
 tzgoWiW+zyD5jijamz/rM1ZM9x/9GBSCDUqFeAbjluvjn+LeEj8WRqOZ4mOpEegIlngO
 KFZg==
X-Gm-Message-State: APjAAAVFW0G+T4UqJxiqOSAzQ9BqQvEM6LaYW43LThiCNkGoloYpFHnw
 EjsF09E420EMC4lv4RRY/LTGpw==
X-Google-Smtp-Source: APXvYqxnyARTB9v12iLs3p2Tp1xCfwcmhzAaUGVe3AqoaJASexYbxPkeQdwzFzZBdqxUDiGAqNq11A==
X-Received: by 2002:aca:e641:: with SMTP id d62mr447627oih.24.1562744484364;
 Wed, 10 Jul 2019 00:41:24 -0700 (PDT)
Received: from [192.168.43.94] ([172.56.7.82])
 by smtp.gmail.com with ESMTPSA id k10sm583391otl.21.2019.07.10.00.41.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 00:41:23 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b42c405b-1b20-28b4-07c0-24df9a183e16@linaro.org>
Date: Wed, 10 Jul 2019 09:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v1 3/5] tests/tcg: fix diff-out pass to
 properly report failure
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/19 6:04 PM, Alex Bennée wrote:
> +diff-out = $(call quiet-command, diff -q $1.out $2 || \
> +				 (diff -u $1.out $2 | head -n 10 && false), \

What about (set -o pipefail; diff ... | head) ?
I think we already rely on bash, right?


r~

