Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BD4A3850
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 20:02:31 +0100 (CET)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEFT4-0002Ad-Iy
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 14:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEFHn-0007Dx-RS; Sun, 30 Jan 2022 13:50:52 -0500
Received: from [2a00:1450:4864:20::32b] (port=56136
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEFHk-0004tX-CS; Sun, 30 Jan 2022 13:50:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r7so8701286wmq.5;
 Sun, 30 Jan 2022 10:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GJpoSDCKo1RxFAlQY+7VUVU+goEtVhcjhXyZ2bsPkys=;
 b=N3jbfsAwsiC6uuA437a/Z3Fg93C5VhA0EiwHnEBUnmQ9OkgLzOa7fsDkO92bPuk6eV
 un3W+pkTz0/BvhIgUjmjU2fstgB49TLvIgLpo3lg19U8YSzjQb8EB2bMxxDukC3v7Vja
 xO+ue+hTywQTPT3WmL15D4OpK6cfpbBKMdyRt9VJq2F/T17pPhFbsoLZ2zmQTr2SPr7H
 I+ZP0sWSGmc4hdsjuHMloIZHeKlCdzNi2uHOsEOWs1NS880UhPeSbEJCRVg/E9HO/bfy
 cJKY3qC/k+5WCfmDPL1/vy5PRRNgA3fDGFLirf+TgmwDBwQFQS35PrR8kttf15NmbtaL
 yBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GJpoSDCKo1RxFAlQY+7VUVU+goEtVhcjhXyZ2bsPkys=;
 b=lOfgK39sQIdWeBWwu/sj6cs+Ns3fH6Z5s/VpGpEWqdVRR9GH4qnDQ44O01PDwdtwPz
 Se0jd2OyqztP4mYm0VYm1wKRa5uarcGTlTfzcCsv9ryJBoiRPrmVrk/Nud0UmgS869GG
 bapa4hwoVpkxKzpHyxipMgEvd+qLgC7WzBN9YOPD5Mt+euBe8ib61EleTuL0blAYi/Qb
 OCmbvPBhpIZa41ZKpkkiZTJeqYSFTX3Kt0M32HafK1R5qEOwqwhitf53ZEKGd7Opue2J
 e4UqBSpGXphhJAy4p35Bnp+qBwLKtzbJYtsmC9lDTncfYRYKqle9RQibFEF7lgbmSuAD
 jm8g==
X-Gm-Message-State: AOAM5304bMnb4AzqYo77p3IbPjhwnKviZAWtDx2hCFEzruDRpKswu3cb
 rMpFpw0U6FdbaupxtrkobNE=
X-Google-Smtp-Source: ABdhPJzkhdZt2ihlJT+95JrEj9V62VxIpYBA/30LCI1Cp7SIYNA9HHNFqykbpQk9pBcw8/Hl7jOfcw==
X-Received: by 2002:a05:600c:3846:: with SMTP id
 s6mr18295370wmr.26.1643568642962; 
 Sun, 30 Jan 2022 10:50:42 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n8sm7323933wmq.42.2022.01.30.10.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 10:50:42 -0800 (PST)
Message-ID: <50848a6d-98a9-3218-479b-7406850a06a2@amsat.org>
Date: Sun, 30 Jan 2022 19:50:41 +0100
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
In-Reply-To: <20220128205430.ispmytuw2vrpar4g@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

On 28/1/22 21:54, Eric Blake wrote:
> On Wed, Jan 19, 2022 at 01:14:39PM +0100, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daude <f4bug@amsat.org>
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The doubled From: looks odd here.  I'll double-check that git doesn't
> mess up the actual commit once I apply the patch.

I played with the git --from option to not appear in the list as
'"Philippe Mathieu-Daudé via" <qemu-devel@nongnu.org>':
https://lore.kernel.org/qemu-devel/efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org/
by using a different sendemail.from (removing the acute in my
lastname) to force a correct author.from.
git-am should have picked the 2nd form, but I see the 1st in commit
3a8fa0edd1. Just curious, did you had to modify it manually?

Anyway, thanks for merging this :)

>>
>> Fix long line introduced in commit bb01ea73110 ("qapi/block:
>> Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER").
>>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   qapi/block-export.json | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)

