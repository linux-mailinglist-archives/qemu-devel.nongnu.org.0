Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE8F46619B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 11:41:14 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjWb-0003ss-0z
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 05:41:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msjVL-00030y-Km; Thu, 02 Dec 2021 05:39:55 -0500
Received: from [2a00:1450:4864:20::435] (port=40682
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msjVI-0002p9-Vg; Thu, 02 Dec 2021 05:39:54 -0500
Received: by mail-wr1-x435.google.com with SMTP id t9so41663975wrx.7;
 Thu, 02 Dec 2021 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vVgTyjOsXANdycRGqNptFC5vMIS3dbaT6dJlVNl31Ro=;
 b=l4NGuU2+6YmP+fkYmBGPRNCdyDKhlfwyCv0Yob+X3AD+hz9J8t7sANWheDUa50R6OT
 1Ku27KL0fAVF8jOj11mn4AVB/x6bLogHlVMA7ejDEOxVJenDW+ynaew3LmjNJ6Fwgl2I
 DPUu+VHHqukaWKBqukKEKymdxPIx6c0YonwQR81SzAiJitzqNbKbWxtxPO/kUKahhfBa
 nIRG6vmZthaQC82pYDa5PA2f9yurbBIP8LWeX3IFx9Hb0deyIwajTke6bhHS8hWCcmWV
 m0MRHtYFDC1mgliX4rj4aV2idUpOrA1WgtDbhc4rCaSM+iSl8mH7qG+z0frNfLxdbEXp
 hAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vVgTyjOsXANdycRGqNptFC5vMIS3dbaT6dJlVNl31Ro=;
 b=wX8FW3UNIpwLcXArJzYB7rDEDMx2nnQKY5JqCXIXmAIYI1iDUmswvcHu4Wbp1IL24r
 5fQMGYQMmvckeO8PwqnnZ1cODNKS4j7n+VOIwoBQ7EKcU+jK1K8vl7EtGiFq0Ue+bQDs
 MNRINQJHd5wAIx2GWz+6eFHKlLGhfD3Fxc++8ur6cmGlxhM87Cel7lJKdfW3Ac75dcxo
 f9zbPf7vLtReTp5XWQDC8Yn19q/Y2JQvyxWwdv9ZYrSXmhZYJJ4cXN2J9LOZYzNAxO6e
 N55nTBGbKrsMf68qhhv+BVaB2g6XA1eBTXi3KteGNTa/yYO+J73q8eN3EWaOR0t8CB+9
 FVDA==
X-Gm-Message-State: AOAM5339mGmvs0NLZyqd3lFz+xzZ1lRdZycnv5ZrE1qNUjMxzcXm2gUU
 ZvpbCJlv5lPGmT/0+qPdfkA=
X-Google-Smtp-Source: ABdhPJx4AM7hPA8euYJ7IxBjOE93WM+DsB8dUjRskNtCgf+8d6s0BRHke03k5DvMxcCEXB3j9t3BKQ==
X-Received: by 2002:adf:e702:: with SMTP id c2mr13694766wrm.586.1638441590794; 
 Thu, 02 Dec 2021 02:39:50 -0800 (PST)
Received: from [192.168.1.12] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id r8sm2604631wrz.43.2021.12.02.02.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 02:39:50 -0800 (PST)
Message-ID: <81d05a81-8ade-2a6c-427e-79a93543554f@amsat.org>
Date: Thu, 2 Dec 2021 11:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tests/plugin/syscall.c: fix compiler warnings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juro Bystricky <juro.bystricky@intel.com>
References: <20211128011551.2115468-1-juro.bystricky@intel.com>
 <87r1azyv88.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <87r1azyv88.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 qemu-devel@nongnu.org, jurobystricky@hotmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 13:58, Alex Bennée wrote:
> 
> Juro Bystricky <juro.bystricky@intel.com> writes:
> 
>> Fix compiler warnings. The warnings can result in a broken build.
>> This patch fixes warnings such as:
> 
> Queued to for-6.2/more-misc-fixes, thanks.

I wondered if this single patch would justify delaying the 6.2
release by one week, but then I noticed the IDE pull request,
so let it be...

Note, -Werror=maybe-uninitialized forces an ugly alignment style
to the g_autofree + g_strdup_printf() combination.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

