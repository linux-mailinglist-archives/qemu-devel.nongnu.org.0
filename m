Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9979484034
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 11:56:36 +0100 (CET)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4hUZ-0003DW-SW
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 05:56:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4hSl-0001mr-2b
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:54:43 -0500
Received: from [2607:f8b0:4864:20::1032] (port=41844
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4hSj-0000vg-HL
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:54:42 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so2755027pjp.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 02:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WqiznmldmdS+WgbA3Mvn0H7To945cODoGMJVLqM9ggQ=;
 b=lq1HsZpsQ/Isf72mx1EuAskMkqySXRWzQfdzwMx8F1nz40CM63SKqZhXUk60SmiZq9
 vbzzbMRJwcApBB6ysi2PjY4pU36sHwc7YmVfWqzYYpy9xH0EUVp86+wF9cnVRS7AizF8
 ggMNDGVr2+ZnE1DKuMJBYoRqqNVBYXtW7my3sf7eGHZ170pKcC36RiF/OKegqAqLUlZs
 cksrWbCvd1C5pD9Zj1/pZ+ilM6SK9Sbw2lVJs8YzV3rwM15PqgsmDmE/Aevfjc0ez39E
 LfcmQIP0xMZmiCBinYPo5ZifukR3q0AmdCFPv7TYgDez4YrOUFk3ECobeXyxqYQ1ndEe
 b2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WqiznmldmdS+WgbA3Mvn0H7To945cODoGMJVLqM9ggQ=;
 b=39spgkX6rSAvFxGeXtOKAndrCa9XU9M44PNRL37wE0iE/ANp0rwTsJkuf+E+GJ2i0E
 wXaIv1ZKx16C2ID+CzD/D7emQqprCyu75iXW23mbG3PdeSzXg5j2sanleMAEt0UQW0L3
 ZpG6DIaZ8ErEIUoRpbcG5u+OIEXm97ezKbh5QyJ0I0aR16ob1sTcweDtxEFbfzt4Iowv
 4iGgU2E0n7YemBz6MmF1fa+ReBJILi7jt6s2Bw4UzYvWrb6lpuHXi+I5rYAexxhnNbbk
 stopEPLlO+oIJkVUkUq7r7ljpcD2mJ2f8k5UUmSDIeCg35XUAFIek4D4DiNO4y2m9fuL
 HPdA==
X-Gm-Message-State: AOAM5309XKAJD3/346PUfmesZEmx1SC71UIZgg0HukU5QG9FJAzStZds
 4WwBfPJCE/sazmQY0raIPZw=
X-Google-Smtp-Source: ABdhPJwD1ph9U37BeKu3kmdekWiGabTyvICG+VKiaZzBklSlcb1D1+GSB3u0kYBw/Up2cF64ZTnrtw==
X-Received: by 2002:a17:903:24d:b0:149:b68f:579 with SMTP id
 j13-20020a170903024d00b00149b68f0579mr12818947plh.1.1641293680222; 
 Tue, 04 Jan 2022 02:54:40 -0800 (PST)
Received: from [192.168.1.37] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id u6sm41982366pja.32.2022.01.04.02.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 02:54:39 -0800 (PST)
Message-ID: <71ef7095-754d-33af-3f84-95713ee03010@amsat.org>
Date: Tue, 4 Jan 2022 11:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU
 binary name
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220104103319.179870-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220104103319.179870-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 11:33, Thomas Huth wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the stap trace doc, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/tools/qemu-trace-stap.rst | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

