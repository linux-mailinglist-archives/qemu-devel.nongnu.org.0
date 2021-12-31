Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC5482545
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:09:28 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3LPD-0005TS-7D
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3LN8-0004SM-Ik
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 12:07:18 -0500
Received: from [2607:f8b0:4864:20::535] (port=44597
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3LN6-00060g-VQ
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 12:07:18 -0500
Received: by mail-pg1-x535.google.com with SMTP id m15so24208958pgu.11
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 09:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gD9IMl8lKPsagPgqq/h5Kw5jUTv+BmZ5IqrqglLzvtg=;
 b=Ad50f73DCByoRN1K6aoyQWfTqWehDkRHTqzHmDznsggRmodWaOGAF0zMlKecjTeszu
 WlwFpFBgzWrTJHHEew4qj2wk5QA1isGB7Pt5veSMOFXvkats+lYYI0tQ4IY+990B298z
 ycTkoF0CFAgnIN84nY2mh+qNDxrY30sr5Uo3x144VAmtoppzImDr5U8QAxHrTh8lBVuV
 ywygJ+T2tgo1bCgypBz7SyvxWrkrZD6slXstbjab5PgrhYrGIdCkPDU5h68oNfiZcwxn
 sM79amH7Ncu3QudChoShq7S8GMVvedcvQmzVuAf4a8qeynK/uo3/jKGMvuUAncqbYgma
 J3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gD9IMl8lKPsagPgqq/h5Kw5jUTv+BmZ5IqrqglLzvtg=;
 b=MBSzxt0OsRsvDRNauT3T7AxmPtq2+Z3IwO06S7wBptHp33/DFNCyCzrZbf9wZqJ9Iw
 8ss/pXmpWPr57R0VZ90i187J7nJCaQr3V5gT7xeF9dPq8vj8QJlMSNdqWL/iuLlNEMKg
 Dxg+4tM+jlDU/R1N7MJWDt4O8JvF3Gjq2KJhWlSBlsqrvP2jm0jfd45c9aIqhkTq3ryb
 Hv81FlJ9AUaatdGzgf2gJEzhgvWTrfATs0i5I73LXkxbXkMSvJ/BrEWSeNd5x0FtSB+K
 fSXbanHh/B6xtMNABBWtbwd7JqHJgaSSIczlNAxXbZj07hsElf6y7aJdaIluY2GDxY6O
 /gQw==
X-Gm-Message-State: AOAM533rFfD47kxeNWBZWyMoZCCvXvKO+mlCDWbZbUJtveUZdSLnZCJK
 TVILAOeNItnvlV4ammt0EUrvuQ==
X-Google-Smtp-Source: ABdhPJx91L/coSgE50VkmHAiuCDNqtD6yvMwMGFcK0KXf/bheMpTmPB78SOXSN9UtZsFg9OUtFDH4A==
X-Received: by 2002:a63:f1a:: with SMTP id e26mr32204751pgl.590.1640970431802; 
 Fri, 31 Dec 2021 09:07:11 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id lw5sm31111586pjb.13.2021.12.31.09.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 09:07:11 -0800 (PST)
Subject: Re: [PULL 00/20] Machine-next patches for 2021-12-31
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211231124754.1005747-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b80ab7e-2225-d23d-38d5-8468d5fdf190@linaro.org>
Date: Fri, 31 Dec 2021 09:07:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 4:47 AM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 69f153667fce723ee546d2f047d66d0cfa67c3cc:
> 
>    Merge tag 'memory-api-20211231' ofhttps://github.com/philmd/qemu  into staging (2021-12-30 17:02:42 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git  tags/machine-core-20211231
> 
> for you to fetch changes up to 2ece6e64846e1929c4ed338c73328d3b126e48d3:
> 
>    MAINTAINERS: email address change (2021-12-31 13:42:54 +0100)

gpg: Signature made Fri 31 Dec 2021 04:45:35 AM PST
gpg:                using RSA key FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE
gpg: Good signature from "Philippe Mathieu-Daudé (F4BUG) <f4bug@amsat.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: FAAB E75E 1291 7221 DCFD  6BB2 E3E3 2C2C DEAD C0DE

Wanna push a refresh to your key?


r~

