Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E04696A9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:17:51 +0100 (CET)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDsL-0004jH-76
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muDcO-0006pf-8T; Mon, 06 Dec 2021 08:01:20 -0500
Received: from [2607:f8b0:4864:20::a2b] (port=44736
 helo=mail-vk1-xa2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muDcL-000374-KM; Mon, 06 Dec 2021 08:01:19 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id u68so6683542vke.11;
 Mon, 06 Dec 2021 05:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wLhENF0Eet/0ZWZ+jmFleRSbGTJbI6cm4TT6MEkN2hY=;
 b=m3Wg5Qct86e0ct/v3HxrE08f5UQ7rkuhFD64aB2A8Zy8n7uLg4tOADGxZAYuAEDIaa
 jx01H55hsgUuzM/cYD6acP73nYxyEqHFHEiKk0d1nT+iHPMwGXaynU1UfH7qypSloIFz
 Y27mBZ4k1V72oy1ZvlpdIoCEos5kcMDQyPym9vxJ7+B4Pr2zTCaI+8Nt3OS3+jR3Eh/A
 IJ76t1AvvOVWuyuURohTMChGCBIBAUsUudKWu+Mc4iuV3RFqwg14sp9HG3RuH+RngfZw
 DZDn5cZYGwMlpV/pL18zrHIFBc2BjdOqNCOn2Y/mz35UNyyc6YkLQZopjB8Y9hn04Lar
 P2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wLhENF0Eet/0ZWZ+jmFleRSbGTJbI6cm4TT6MEkN2hY=;
 b=HWfVQw798XmYgS3ZSC87ZmOyc88+YtV+kopmP4umNnKaxV2d7r6JkEG+J3od9ypSTy
 J4sFXTmyTkoGuWXgHk58qo3g2rkXcqXIJJHrrhujhiLxHVOD8jGdzQWqcjC4ujtC6uhW
 3ghlptd2MJJtHkzm8xE4hnTlfgcq1o9t52eZdQsyom0wEGYaEZ1OS8UoKmgGPlmIashS
 +j8FQ+/M8WyS4QeWAKrhdwosfmLoZQ66Iqe07alAeR0BXtgufFarbT712YDaDTAiOzJq
 uDplc7TqD/vz2wETJB90wPwGseh59nGKr2zSDbiVR9C+T4beRLq0A4QL6c69T5psHGQV
 WtOQ==
X-Gm-Message-State: AOAM532E4SlsdGNV/qu5ASPzyD3v5OWqYUBj5LEpJLAc9jf0cAHy1rz2
 SHiLbR5S1lTKtL/XcW8gUgM=
X-Google-Smtp-Source: ABdhPJxn3H26gkLFo65+6KAg0oN9yjVKuSDB2HDZVXgXkPKcS1qcfcjeIN9pzPnzTX7YYPaRr1LaeQ==
X-Received: by 2002:a1f:c9c2:: with SMTP id z185mr41605657vkf.26.1638795674856; 
 Mon, 06 Dec 2021 05:01:14 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id c24sm4147337vkn.30.2021.12.06.05.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:01:14 -0800 (PST)
Message-ID: <1bcace94-500c-0898-29ed-0c80bfaa26d9@gmail.com>
Date: Mon, 6 Dec 2021 10:01:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set
Content-Language: en-US
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211206124538.627920-1-danielhb413@gmail.com>
 <CPXPR80MB522484DC28B535343BCE837DDA6D9@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CPXPR80MB522484DC28B535343BCE837DDA6D9@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.076,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "clg@kaod.org" <clg@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/6/21 09:59, Luis Fernando Fujita Pires wrote:
> From: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Subject: [PATCH] ppc/pvn.c: fix "system-id" FDT when -uuid is set
> 
> I don't know enough to review this, but there's a typo on the commit message (pvn.c -> pnv.c). :)

ooops :D

> 
> --
> Luis Pires
> Instituto de Pesquisas ELDORADO
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
> 

