Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE42490B48
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:19:50 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TnR-0008Ji-Jc
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:19:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TTY-00068j-If
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:59:16 -0500
Received: from [2a00:1450:4864:20::332] (port=54790
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TTX-0001r9-1x
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:59:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id p18so20960787wmg.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2//u51+G64ypLQn4+9r+/Lpoz3IiEayIZi5RWV3IwfM=;
 b=aM5PVq1euh3iXGt/aeVyl/zPYPf4R2R9oK+N1w3lhaO7iYVERy5aoIvKrfBBTcKr3y
 vCWeDZA7WQWkok9mUkMUnMuRHvbtE9ZoiG3LieRrgvf4MhzJme35/XEFeBU1npFqcRlW
 ou5wGF9zFNl+7hDNFZFIe5Z6088hHBcX6QMcrrPq6InFCkq4Fji6mdrWw+NakpkOjznm
 V7b2qwjBzR5zTyK+Z/X2MVvbPdkBLLK7MdV36KWE+WOrF2ZcfThjZmWq9SqrvejPXktO
 aQTbVjtn80U0uDhnRXQhICOa3D6PibNF8x7aLbgYIQWYDLz4qAmOcnC3wOGA79qOYHxB
 WBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2//u51+G64ypLQn4+9r+/Lpoz3IiEayIZi5RWV3IwfM=;
 b=F683/YTEsKi3SX9BMDoNLlOIBDkCmeKOdFQQFzCjBO/d5TABhiBi0Q9No2GbrTZIi0
 pBJCiS61oMhSUr2DkJnqX9tHTyBWiEtFEvuI12gUK7W02tVsRu2510eI1TKGDAYdcxBT
 ZU0R5fg3q+JbAk0wCIoa6bHcD6PIWsBe8JRwNB/L06eHafNC5RkHqU7vJ2u7lPgj8pZ+
 HTwak0EoDws2vqET/r9tZq6N+rvFytEeuyd59LJ3W34ybQqsXUQvNf16kKRYcDHAS4pC
 tkvU+38+pitKvJl7e6kFRYaOeNjNqV/y6ocobmy3PHJKBuyvNHLBO9iPv/sXgrviv7xE
 oiMw==
X-Gm-Message-State: AOAM532P5B4e6JD5v4CUR3gWXTXpp5djc474tZGjJO4d9zCPriwHITKB
 rmeVg2Mpo5UnBNieD/XWJ6EDNIHQpj2lF639
X-Google-Smtp-Source: ABdhPJxj2OGvuZA4OlPx00x6I7Drj69zeQeCgUzgcmCNUvZ8X5LBqiy+ODDPyLYzxateJvcx8S8roA==
X-Received: by 2002:a7b:c5c4:: with SMTP id n4mr20443795wmk.134.1642431551188; 
 Mon, 17 Jan 2022 06:59:11 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q206sm14683997wme.8.2022.01.17.06.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:59:10 -0800 (PST)
Message-ID: <02479c57-d2b2-19de-ca97-caf10cfee754@amsat.org>
Date: Mon, 17 Jan 2022 15:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: 9p root fs HOWTO
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
References: <2785520.nJZE4KsnAZ@silver>
 <37a251a7-b6bc-ac80-8c2f-02a03f4fab26@amsat.org> <3065564.DFbkM2JXdW@silver>
In-Reply-To: <3065564.DFbkM2JXdW@silver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/17/22 15:44, Christian Schoenebeck wrote:
> On Montag, 17. Januar 2022 15:03:05 CET Philippe Mathieu-Daudé wrote:
>> On 17/1/22 14:14, Christian Schoenebeck wrote:
>>> As I was still reading claims on the net that 9p was not usable for more
>>> complex use cases, I decided to write a complete HOWTO for installing and
>>> configuring an entire guest OS (with Debian 11 "Bullseye" as example) on
>>> top of 9p being guest's root fs:
>>>
>>> https://wiki.qemu.org/Documentation/9p_root_fs
>>
>> Thanks for doing this!
>>
>> Doesn't it deserve its entry in the sphinx-generated manual,
>> rather than the wiki?
> 
> I already had a run on this for the 9p developer docs before, but 
> unfortunately there does not seem to be an adequate solution:
> 
> https://lore.kernel.org/qemu-devel/2001177.cHeAXU27Kk@silver/

OK I see :(

Thanks for the clarification,

Phil.

