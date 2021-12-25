Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5999A47F47E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 22:11:44 +0100 (CET)
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1EKN-00047y-03
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 16:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1EIn-0003H7-6w
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 16:10:05 -0500
Received: from [2a00:1450:4864:20::42c] (port=37650
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1EIl-0004ER-FD
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 16:10:04 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t26so23890713wrb.4
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=opDT46zkJCSGTtvG8b9D86kSHF1twnmQ8aubSHprGRk=;
 b=Oj2bFTWN5RW6g6ljRhRFNiB6kRO/VZ4gHpwBhmYlN9eiX4ZnYzAoQxCaTCwujeCU+O
 jTF+QQI8ChfjSsEUCDNcMyMYV2HAOw3E/A62bHKaM6MqD/NIQWyEru9Gum6SPD6dQLAw
 O1sB4ytIrfURfDV5JhY0hL+TdUg7zXXOpNiYFnioLUPrnODCIDKv23EAKZroDY16AHp1
 1yRMTmtiZtmMPhVWbarDC353pKHjKA9CBexv8OOfsvuSZ1f/gOutU3KHW+Nu1sN78E+s
 eH1UgGFKBkI75XvInrNQIgT92g2sqM2Wz4rJvTISU/9JN5BHp8uSa/2keWW8IIEyZBRH
 8ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=opDT46zkJCSGTtvG8b9D86kSHF1twnmQ8aubSHprGRk=;
 b=kOqb+5t410Nv7hBDQYvWK0EQEHmNL9SVN7QrQYO340ISqvbsbPoNnvPq2mSJvtFFrb
 uXmMKlphuNCSUbSRudI/lPk14XYYc09rFSBZLXjKN+nA7Cbrw7ark/TxzUnf6+NMeQs+
 AWkN+27K2+/s5bKodKIz+sYHMtuiCU00MRVHps0jmgkdY7EjNOb1jel835hvVj9zQAl2
 ePTkv7b66B1Vb52PPtToWLRlggM64qL3gvTPZ1rVUQOQqtkfdmufA/mIxKA47K+MPgry
 XgVcVjuwvAHauT4qwB1M0BDo7VZSY1uPR9QWPaXlhKGck6MDlahZc7hMwWXmYQct1+w0
 tr4Q==
X-Gm-Message-State: AOAM5303Z53BJHIn3APJE8vnlgTZIwQ+FraFaDnpg/p5hr4vA3RqtgVu
 i0341HN9s/TY8KmN1Ji6gpY=
X-Google-Smtp-Source: ABdhPJy/eefhNh50EjiGeT6t82GIFrTXjsUsrKVhUQfPikLg8/5SD7FEmxytjbGdM47UudQaxuFaaw==
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr8023565wrd.108.1640466601657; 
 Sat, 25 Dec 2021 13:10:01 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id i8sm11728072wmq.4.2021.12.25.13.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 13:10:00 -0800 (PST)
Message-ID: <d6531d1f-3c62-f3b3-aad0-25971e5bad95@amsat.org>
Date: Sat, 25 Dec 2021 22:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] tests/tcg/multiarch: Read fp flags before printf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211224035541.2159966-1-richard.henderson@linaro.org>
 <20211224035541.2159966-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211224035541.2159966-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.196,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 04:55, Richard Henderson wrote:
> We need to read the floating-point flags before printf may do
> other floating-point operations which may affect the flags.
> 
> Hexagon reference files regenerated by Taylor Simpson.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <1639510781-3790-1-git-send-email-tsimpson@quicinc.com>
> ---
>  tests/tcg/multiarch/float_convs.c |   2 +-
>  tests/tcg/multiarch/float_madds.c |   2 +-
>  tests/tcg/hexagon/float_convs.ref | 152 +++++++++++++++---------------
>  tests/tcg/hexagon/float_madds.ref |  48 +++++-----
>  4 files changed, 102 insertions(+), 102 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

