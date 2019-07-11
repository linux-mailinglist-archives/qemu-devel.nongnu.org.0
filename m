Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA465E0E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 18:56:52 +0200 (CEST)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlcNG-0008Hc-AX
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 12:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52089)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hlcN2-0007tL-O1
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 12:56:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hlcN1-0007Sf-Ix
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 12:56:36 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34542)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hlcN1-0007Ru-BG
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 12:56:35 -0400
Received: by mail-wm1-x341.google.com with SMTP id w9so7402244wmd.1
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nADoGqFUDZNofvaSIAdY16hExFovZ6z93MDS0pJfIgU=;
 b=dW4M2ax0WTYzmIqYE/5XQwwF7RVlCkF3EOgXVhaOTnFBuu+CA2oVrmEprpLC17yCB7
 Aa3CqizPgy6Rk9QEBu6ETtK+JCKfH4MnHpcNH/zZbaJB9LPgm4POJOQE16IhO02DwuY0
 vNaILd+oTPHPmbjoNOeO1O/3TjKXI820/Mrwjm6+rwMr6msSbLREnUcuTGMQ61apXt5x
 XyiA+o9XztVK+R5OLFskz1Hoxu5MXa3JSf1ZI2Fh8FbuhSK1n/5LdLGM40RGEUxwqa74
 9ynZqL9AFyuzNmHSogBPz4CDaVp9Eg5VUmJRF7Qt07Yc1eD3DAGz1+OxCaqgI+Bz2lbu
 A/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nADoGqFUDZNofvaSIAdY16hExFovZ6z93MDS0pJfIgU=;
 b=LEtZyY+wUJU0THAXL8pzfgwwwt+qpvPaEbxuTk72IqIris0OikZm0MkHKnEB2vnh5S
 nUjxh/PxZBcujeWHX/ZWxfIU1m3WnM7PLXW/rVs2fAwIR3xXZj3fuxKJ6bEqFQoZtX8Y
 xsWvGbimVB7/lzMWBjkr7x8gXAQWKm108yfRk380NZgdfELMJauMf7havkCFN4eKgZcF
 AzrdS9GK0p/tTy4h9H4aw33htt/BFcM66yoUXhx/jtvfVAoo9Y9OXN2Nn3pX2p8zOZeL
 YcHgk39OzNhQKKnjcP++cyidRjlwKWSAkD4+7A22yLfaYfAOj87UzD1wSnCCFYRpfRny
 4AUA==
X-Gm-Message-State: APjAAAV6uzkkk/avgMqMNuHXIkpX3ePF21ErKp3elqnGSJrJH8SSTOQF
 I/1YFkRV9i5XJoyaLPi/Zmpo4g==
X-Google-Smtp-Source: APXvYqxW2fG8EHG9wC+x7U0oh27DFgX2yyhrmbBpjhLxHJA1SSKrswAE767D0Yvh7x3JhyPHMQPRAw==
X-Received: by 2002:a1c:345:: with SMTP id 66mr5169343wmd.8.1562864193282;
 Thu, 11 Jul 2019 09:56:33 -0700 (PDT)
Received: from [192.168.12.133] (ip-208-51.sn2.clouditalia.com.
 [83.211.208.51])
 by smtp.gmail.com with ESMTPSA id y10sm4101130wmj.2.2019.07.11.09.56.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 09:56:32 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190711122827.18970-1-armbru@redhat.com>
 <20190711122827.18970-2-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e5139329-82e3-26dc-b72a-136f8a9c1cc0@linaro.org>
Date: Thu, 11 Jul 2019 18:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190711122827.18970-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH RFC v5 1/3] tests: New make target
 check-source
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/19 2:28 PM, Markus Armbruster wrote:
>  include/exec/cpu_ldst_template.h          |  3 +
>  include/exec/cpu_ldst_useronly_template.h |  3 +
>  include/exec/cputlb.h                     |  3 +
>  include/exec/exec-all.h                   |  3 +
>  include/exec/gen-icount.h                 |  2 +
>  include/exec/helper-gen.h                 |  2 +
>  include/exec/helper-proto.h               |  2 +
>  include/exec/helper-tcg.h                 |  2 +
>  include/exec/ioport.h                     |  2 +
>  include/exec/memory-internal.h            |  2 +
>  include/exec/memory_ldst.inc.h            |  2 +
>  include/exec/memory_ldst_cached.inc.h     |  2 +
>  include/exec/memory_ldst_phys.inc.h       |  2 +

The pattern used should not match all *.h, but exclude *_template.h (older
naming style) and *.inc.h (newer naming style; we really should finish the
conversion).

These headers are not standalone, and will be included multiple times by one of
the other headers.


r~

