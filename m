Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF8F51FE4A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:27:26 +0200 (CEST)
Received: from localhost ([::1]:50730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Q4-0002Ln-Lz
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vw-00012H-VE; Mon, 09 May 2022 08:56:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vu-0003Yq-80; Mon, 09 May 2022 08:56:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso12708180pjb.5; 
 Mon, 09 May 2022 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w4AeUr0BFIhhf922QI1NXhJUfL+9jerCz4gsvLff1gc=;
 b=mMpGHOeOjvAyCQpJjLRKY4Wzl1nSNHWCr0jR9AE93lDUBvzt/bw6tGdoz6jy06KfBp
 jM0SZW47ipz8ONQRL/ntCSIwTZyKmbEw2IfL5TBeyXK2ch+pa2t/tcKCyTIgxrRGqofw
 Lk/Sr3Q3zwPQYYh+jND5doKky2YZ8Xgr6TlocBdbYcIK0JRGVDdUTxFjK3N0fyx4CexP
 9QJAa5/4bq7lrrCNTsR0Be2JKIY1UU9ySYMIrQ4l0MBIRUJcHyWcYxymFU2qk6eWjUzw
 65nhfYFktUAc3qPMeWJmWvx8JAiQuk6suk/vNiYYHOgrnbZS6CLA5U1Xr1X5g21i+fqS
 4AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w4AeUr0BFIhhf922QI1NXhJUfL+9jerCz4gsvLff1gc=;
 b=wxDed2bokQfJgnx7HYWWSwkXWhV/nTJTUi3T+TavZYWZc81lzASZbPRYr83eFgKxOf
 t887HvUZP6JqmWpZREk+ccVEntxlJsJBd3+l8EWzl74gve+7NrKj+ixf271GyBy/T90T
 njMFOWaXndKog7QpcsKZwuadMAjV1uihq3R7rDzxAGBYRQjCTB00SzNFN5L5nCex6NTG
 btpe7Plal+JR53KMwINhaQOmb2hwKS/KYWk620VW41GwzP9DTy1M9i2ObFOcKkSXYQiT
 NPNYl0zKhch9x7RB7595xhxrTerB+xfmlX4m7hsrnn58GNtT+jvl2QpqysOceRizQoDy
 y/Zw==
X-Gm-Message-State: AOAM530uuiBNQVkr3UlPJx5Zg3JZaXyzcpKJOstQxny9cLtCPdefXCCi
 bRvcjicPv3ZvDCNVAx57nBQ=
X-Google-Smtp-Source: ABdhPJzCi9J2svHwofv4khOBc98fZYS0MpFLyEkbqOvQ3qBMymj4+3UuGJX+KLOxuZ3dmBSRLWv1Iw==
X-Received: by 2002:a17:902:ce02:b0:153:bd65:5c0e with SMTP id
 k2-20020a170902ce0200b00153bd655c0emr15933806plg.160.1652100971922; 
 Mon, 09 May 2022 05:56:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa79e01000000b0050dc7628175sm8595665pfq.79.2022.05.09.05.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:11 -0700 (PDT)
Message-ID: <76b369e1-76b5-1ed2-803f-3466ac376656@amsat.org>
Date: Mon, 9 May 2022 14:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH for-7.1] target/mips: Remove stale TODO file
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220412113824.297108-1-thuth@redhat.com>
 <739db399-e95a-ea02-6c2a-d353e1236171@vivier.eu>
In-Reply-To: <739db399-e95a-ea02-6c2a-d353e1236171@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 26/4/22 12:36, Laurent Vivier wrote:
> Le 12/04/2022 à 13:38, Thomas Huth a écrit :
>> The last change to this file has been done in 2012, so it
>> seems like this is not really used anymore, and the content
>> is likely very out of date now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   target/mips/TODO | 51 ------------------------------------------------
>>   1 file changed, 51 deletions(-)
>>   delete mode 100644 target/mips/TODO

> Applied to my trivial-patches branch.

Thanks :)

