Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D454689A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:43:45 +0200 (CEST)
Received: from localhost ([::1]:47702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfrU-0001SV-Ud
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfpC-00070R-7S
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:41:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfpA-0002uA-P0
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:41:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so2438558pjl.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zLJNPPzEUyZvuyMFuHinoW60t+mjPzxt5dlM62276AQ=;
 b=In7AH7F39IDlt5XLZAm6hAr1A7R9MbUp4Gh0k8IpDtI/B+7gFWHcEdrzr2fhQFUP9S
 /ZP0wgZJ9q0iWd930OnmbCHiAIqPAWoVWnEqJLSN+giRhApGdQzTxYWcHCAC5AnJRjIJ
 qp+7SidjGKCHEE/OcOxcvR+Um2G27WOpI30+XrCE4MxN8N0kvNvIskUXEI/Uo7Mw69CC
 xN4jiA8+KDOWR57/sEC3bRCchAgs0oHtWBCp45mRkq/aM14e+kBYKLYjkgYGG9D8IDJb
 ccb8C7X4Xc2hmH2+tP1zz3QUUKRmsheObUE4WeRjGts72uwqVVeAf4kEBB9prAEX9gva
 aNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zLJNPPzEUyZvuyMFuHinoW60t+mjPzxt5dlM62276AQ=;
 b=HEZvlzkOI34R3G/9VDW71S/tfxd5Xvugpng3UfW4oOVcUfeix3BerW+8WIXGTUcvWj
 eVHgSBVkm6Nbzpv8+zb7qMnEQy9JMtOG8AP4Eii0/O41arHl7Zo5Q3JK0cDFcoElBUK7
 eTlBrsVBVH0eLZKOE8ROuYxYP23bhrO0nlmG5d9/CNk2HkxOEp+UJGusOpj1/fFbs4Wv
 CvyBo04CnahqPGM1XHt5GuQ+v3XW2fv1FMLpUhJkSI/jQ2MDkimNMuxZXQF+tSG9Qu6S
 +BnLqTOUpdqxsE7NS62yryBr1GYwZc2SOTdoYP/51t+fKmU2hDIhBgf2MuFWXlhCjt4B
 JIEQ==
X-Gm-Message-State: AOAM532zdQw0O4COZSm5+NUg4o14aqQiALbLktdnk29QfD1jeMxkaSO+
 654+bOEydJhJg/FMjpkfsGbcEFX4PTc=
X-Google-Smtp-Source: ABdhPJwvnBYNALa7FisnzlG94U2E5azc26uPixCxHYdgFbrLmdRq5+FokZMB09A+turgXtaSrE4q7g==
X-Received: by 2002:a17:90b:21d3:b0:1e3:2eee:3aba with SMTP id
 ll19-20020a17090b21d300b001e32eee3abamr96967pjb.232.1654872079482; 
 Fri, 10 Jun 2022 07:41:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a63450e000000b003fdb97e6961sm11018432pga.28.2022.06.10.07.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 07:41:18 -0700 (PDT)
Message-ID: <ef86883c-fdc8-b27f-9ce9-d284f8243b18@amsat.org>
Date: Fri, 10 Jun 2022 16:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 0/7] Undeprecate nanoMIPS and fix multiple bugs
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-1-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
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

On 4/5/22 13:03, Stefan Pejic wrote:
> This series of patches aims to undeprecate nanoMIPS architecture and fix
> several issues that were found in recent testings.
> 
> Dragan Mladjenovic (4):
>    target/mips: Fix emulation of nanoMips EXTRV_S.H instruction
>    target/mips: Fix emulation of nanoMips BPOSGE32C instruction
>    target/mips: Fix emulation of nanoMips BNEC[32] instruction
>    target/mips: Fix handling of unaligned memory access for nanoMips ISA
> 
> Stefan Pejic (3):
>    target/mips: Fix emulation of nanoMips MTHLIP instruction
>    target/mips: Add missing default cases for some nanoMips pools
>    target/mips: Undeprecate nanoMips ISA support in QEMU

Thanks, queued to mips-next.

