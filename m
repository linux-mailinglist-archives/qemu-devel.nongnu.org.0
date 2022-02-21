Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275424BDB1A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:13:37 +0100 (CET)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCFj-0006lV-Nh
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:13:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMC4g-0001Ol-K8
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:02:11 -0500
Received: from [2607:f8b0:4864:20::62a] (port=36660
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMC4e-0004Ji-EF
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:02:10 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u5so13397417ple.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=9vXzpw8D2thHm4l6G89spobSrQI2dgw+m1XDxj3GvoQ=;
 b=UQPY5Eqdaqg3EPTOlPtqSPDw79pWDtZ+bfh3J6pFD1SFNLiSyvhAPvt01PHMQ0dr2K
 trrA6ixzmQ2IF7gVt7dNBVQmRl1X6H3krZCMv/UDbjboMpL3iHwnuY7d3jLWLv2WknMk
 mGPdvk57FApdv4JlW6sEYm6D6TDYamOPsWR5JWF8jeitxuhQg5l43X6bkc44/QfWB3UQ
 ZknOZG2Yvfmt2SRUERTcFF7SwzrTs86tPW+rdRMUTh0e76gLv+vCom3Wil59t0dSvt76
 DFatxSYZXlkqLHXPs/Ox1zuXliVb/34uU5FBE1o81o6OpYy5BhqQ/XCubMXbfI2louyi
 rq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=9vXzpw8D2thHm4l6G89spobSrQI2dgw+m1XDxj3GvoQ=;
 b=nxaHzTiPV3RQHIPIfMfB5jM7ZrPfMr8+kkxXZnJugh5LjWQRG1ssqiB9BsGrxViawu
 bRycV1tMVIliTJ+rZv0Coqgle3F3zN2ITHEZhfZt7p7c0INmLjUJnwZnWxBhc1eYdKAk
 AonnMocoNyp5ikpMDQJYnI2fTUy68H3k2RyveEGogqsmAU66cnzLXrEc8zB6j8TmpkzR
 gzcfr1qaFg1js/ne2l3HzmnKWiBmXAsxvgg/3Gr3ur1GfPBIZU+NUvbUZuHoTJH5hZZr
 ujiNAi90je+5hiM53l9kFCv7o4KxF/EMAQ4hKyDo6r5zWz9KqRJJ/2z7WZBFibi8IC7U
 oGnA==
X-Gm-Message-State: AOAM530K3BP9e8ll4vEkRFHZ/n3AP+9POLRC55pJiFAVOUVG4q844PKO
 0L5TSNWTRjDt8oBsjAy//AQ=
X-Google-Smtp-Source: ABdhPJxf5mCSSl62OLIUYhsyvn4DHkHK4sab0uoQi2meOdcFhAivwju5W4F5AwPeN4wKSUHx96Yu/g==
X-Received: by 2002:a17:902:900c:b0:14d:81e9:75d with SMTP id
 a12-20020a170902900c00b0014d81e9075dmr19571931plp.69.1645462926821; 
 Mon, 21 Feb 2022 09:02:06 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q2sm13881259pfj.94.2022.02.21.09.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 09:02:06 -0800 (PST)
Message-ID: <64908613-fc36-9b95-d14c-23452d3630a3@gmail.com>
Date: Mon, 21 Feb 2022 18:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] scripts/qemu-gdb/timers.py: the 'last' attribute is
 no more
Content-Language: en-US
To: David Edmondson <david.edmondson@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220221164948.2873713-1-david.edmondson@oracle.com>
 <20220221164948.2873713-3-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221164948.2873713-3-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 17:49, David Edmondson wrote:
> The 'last' member of QEMUClock was removed some time ago, but the
> python gdb helper did not notice.
> 
> Fixes: 3c2d4c8aa6 ("timer: last, remove last bits of last")
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   scripts/qemugdb/timers.py | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Ouch, 2+ years.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


