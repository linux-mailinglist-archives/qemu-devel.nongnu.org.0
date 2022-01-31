Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6524A531F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:22:34 +0100 (CET)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEg0H-0000yU-1L
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEfxg-0007jL-Fl; Mon, 31 Jan 2022 18:19:52 -0500
Received: from [2607:f8b0:4864:20::1032] (port=35402
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEfxe-0006e7-LJ; Mon, 31 Jan 2022 18:19:52 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so762724pjq.0; 
 Mon, 31 Jan 2022 15:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bYMEGy1sfD++uBFCWEhu3dHUI1tZlW19zcULxGg+P20=;
 b=e4cw3j0vQfsUU+ePSou6V9K7WDtePwL1mQxdhbVPrlS3jmczdVNzBlaE4DHdzCU626
 wE2lXWVRbRz8dPpPqcRgjb+uVEg2LagZ6h8+GzPBZ9YWieaxOsQ5JefK36LUDDRehKz8
 UqaAB7BuMoKm/xmBMPXcwaxAXj5r2Xy6UixTgtsHOSBRpIar0CxnqMWGPBghAFvL87Hp
 MUtUbaeUkgDR/vDjQfIJ08ROfsszUQ5Y9BTc9Bvo5ZdjrLgTsDOe88XAo0Rnc+QhYKW6
 RzfjxSUW2wMeAWx1ajjeGSg9Z3dwoqixERbe/mXc2A4o6YqPVdaB+CGrBDmqIdDavUd6
 YUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bYMEGy1sfD++uBFCWEhu3dHUI1tZlW19zcULxGg+P20=;
 b=PEri4v+ItZ8+dFLKfUBnbDiF1eGD5UqvPRrna8MjiOwD7jvCX7W1CifAQBueQIay/b
 gcZg+DD5crPSXke7XHyYyF6LVkU2JG7Ck67pEnL0MeTLVlySCLZpv2ZspuVwJJvUsVp8
 /O/SMV1oh8hJ6mtxH+85qfyCPaD3xrHSej9XiHk1wIkjIdxt64vn2od9AYb0mAR+FOcs
 1aZQYGu3Rg3aaWq5+/VUFvt9vJqtRW/L3lfxKmgn5AcC1n2YZv9mlo64Ylb9SII/fub2
 hWpuwx4t0ZEbRC6TWG5cJhenxWFlZuakIO0bk2tnKynPlvmrDdpClHXWz6cNVOiKbYT0
 XsoA==
X-Gm-Message-State: AOAM533noUbEAMBwr2p4B7H6jkEXdSTIL/J0c7HhVhUlnOCPmXmQxoBb
 ZPN7KETtEUdVN90hYF0kbkU=
X-Google-Smtp-Source: ABdhPJz19TVQh6KKWnytLcepZQsK0W79xweqhATwy4UTl0kdBBB093nFoZVWcaqfex82kzBDegCO/w==
X-Received: by 2002:a17:90b:4f87:: with SMTP id
 qe7mr27223919pjb.207.1643671188342; 
 Mon, 31 Jan 2022 15:19:48 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o8sm20128553pfu.52.2022.01.31.15.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:19:47 -0800 (PST)
Message-ID: <55d51751-218e-5fbd-7e8c-5eebe25d2fba@amsat.org>
Date: Tue, 1 Feb 2022 00:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] qapi/block: Cosmetic change in BlockExportType schema
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20220119121439.214821-1-f4bug@amsat.org>
 <20220128205430.ispmytuw2vrpar4g@redhat.com>
 <50848a6d-98a9-3218-479b-7406850a06a2@amsat.org>
 <20220131213700.7smrzizfuhg2befo@redhat.com>
In-Reply-To: <20220131213700.7smrzizfuhg2befo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 22:37, Eric Blake wrote:
> On Sun, Jan 30, 2022 at 07:50:41PM +0100, Philippe Mathieu-Daudé wrote:
>> On 28/1/22 21:54, Eric Blake wrote:
>>> On Wed, Jan 19, 2022 at 01:14:39PM +0100, Philippe Mathieu-Daudé wrote:
>>>> From: Philippe Mathieu-Daude <f4bug@amsat.org>
> 
> 'git am' used this line to insert the authorship...
> 
>>>>
>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> ...then left this line in the commit body, which I manually deleted,
> without spotting the difference between the two.
> 
>>>
>>> The doubled From: looks odd here.  I'll double-check that git doesn't
>>> mess up the actual commit once I apply the patch.
>>
>> I played with the git --from option to not appear in the list as
>> '"Philippe Mathieu-Daudé via" <qemu-devel@nongnu.org>':
>> https://lore.kernel.org/qemu-devel/efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org/
>> by using a different sendemail.from (removing the acute in my
>> lastname) to force a correct author.from.
>> git-am should have picked the 2nd form, but I see the 1st in commit
>> 3a8fa0edd1. Just curious, did you had to modify it manually?
> 
> Alas, since I managed to overlook the change in the acute (I suppose
> I'm cursed with having a boring name, so unlike many list participants
> who are overjoyed by the power of UTF-8 to make self-expression more
> accurate, I have not had as much experience with thinking about it),
> my manual edits explain why the merged commit ended up with a less
> desirable spelling.  I apologize for the mishap.  Do we need/want a
> .mailmap entry to aid git at listing your preferred spelling?

A missing acute is not a big deal, compared to other alphabets where
people try to approximate their name pronunciation to Latin symbols,
and is still better than UTF-8 mojibake :)

