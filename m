Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3F5A9EAB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:11:11 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oToeh-0004gS-Vn
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTocc-00030Z-Cj
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:08:58 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTocY-0005a1-KP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:08:57 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-12243fcaa67so10888223fac.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wz2zghdb0WuP0w8zos30IZXlygDKXBqFShLT7myYizM=;
 b=TEgjI5o9PyBuoUumAWRjMANkO56SesWA2mUSmH68O4+nysquC8YDI2Zn6QFhTkn7Xl
 9/mRdlmpkWt5UmtsnikBEfCtmG6jF0V9akHQuHBHMp9BYdJvoquJi3zkLLox0odm8LLs
 +bCyC7xh21eRIzHAyj11tNWPOjVkqB3VzSrnicazpjNPqzWNjEnoynbKD0wJdE29bLT4
 haG/nJHp96T5TKJvdGJNgO1KikeSUoOVA/Ma4oLNt8Kb+dwql/nEOP1ui2Q643oKFf3E
 TM1FsFjbxhcAEPXlq00vL/jyPWSqefj9p7Ny8P4SOROTkRv7qaRG52SzX9KOK2mx3t0z
 xlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wz2zghdb0WuP0w8zos30IZXlygDKXBqFShLT7myYizM=;
 b=pVS0AkbepsKN0pAholcIZhWhv+3sT+r0RrPQjn8ixMnNtORJR+30nRtYsn1PJ/dNzL
 4NmYxHvI/Ti9n1240hdB6j9BeUj0EH3mcK1NF3TmTGiBoSKQSX1ye/czGOBmoPp3n0DD
 98jGSAtdIvwW2QcpmbmERZ0uAnfYFYIg9oSma+gzL/wdstmjrcDsY4+m/s//tXwRA6jF
 S7NxVJVnyaRFlpwnrJ5TYWJkFqkFtrXOSbodkrOAGucguKWoaaUap/84U+DiBkZG0feA
 b8nk8EpClCPXjpx0p9OTDmdim+CKU33+ekEOtQbYEN9GK8LNpPP0ejvj8FlME32UUOci
 lkAw==
X-Gm-Message-State: ACgBeo2A4wMKIuskmXDgdE6HAXrLaKMkj8GgzRPgWNSYoXnDK0222Coy
 3WVzzTWylREhlBGXcSo68MI=
X-Google-Smtp-Source: AA6agR7S7/CAvM//iJ7VcpsJcOnRa7toLPIQT2Ohpwmpttydn+4oVC+C620z3z0D0btl3lmjRz4/PQ==
X-Received: by 2002:a05:6870:a90f:b0:11e:949a:e3ef with SMTP id
 eq15-20020a056870a90f00b0011e949ae3efmr236022oab.106.1662055733070; 
 Thu, 01 Sep 2022 11:08:53 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 d23-20020a056830139700b00639443424f8sm10670861otq.8.2022.09.01.11.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 11:08:52 -0700 (PDT)
Message-ID: <c8393f90-1718-a2be-213b-2dcec6af7ed9@gmail.com>
Date: Thu, 1 Sep 2022 15:08:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: QEMU 7.2 release schedule
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org
References: <Yw59JU3ja/EU3HL6@fedora>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yw59JU3ja/EU3HL6@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 8/30/22 18:12, Stefan Hajnoczi wrote:
> Hi,
> Richard Henderson has tagged QEMU 7.1 and handed over to me for the 7.2
> release cycle. Thanks to Richard and Michael Roth their work on 7.1!

Are you going to handle the pull requests for this release cycle? I saw
that you've handled Thomas' PRs.

If that's the case I'll CC you in the PRs instead of Peter/Richard.


Thanks,


Daniel

> 
> Please check the proposed release schedule and let me know if they fall
> on inconvenient dates:
> - 2022-08-30: Beginning of development phase
> - 2022-11-1: Soft feature freeze. Only bug fixes after this point. All feature changes must be already in a sub maintainer tree and all pull requests from submaintainers must have been sent to the list by this date.
> - 2022-11-8: Hard feature freeze. Tag rc0
> - 2022-11-15: Tag rc1
> - 2022-11-22: Tag rc2
> - 2022-11-29: Tag rc3
> - 2022-12-06: Release; or tag rc4 if needed
> - 2022-12-13: Release if we needed an rc4
> 
> The release planning page is now available on the wiki:
> https://wiki.qemu.org/Planning/7.2
> 
> The changelog has been created so you can add items when code is merged:
> https://wiki.qemu.org/ChangeLog/7.2
> 
> Stefan

