Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6976574E91
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:04:16 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByVr-0002cK-Fs
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oByRx-0005qs-N1; Thu, 14 Jul 2022 09:00:22 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oByRr-0003Je-SG; Thu, 14 Jul 2022 09:00:13 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w81so2311614oiw.0;
 Thu, 14 Jul 2022 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3iKtUTjwkPeXFOZkVxoh7hBpO9kc2fmLkefP6OMZEuw=;
 b=A0D8L8/ahSrjjixPdBAmhxqAzok2TjSNBnQk/6E10rex4zSKCT5FfjUoq55SHr94aL
 tO6kUgW5+gqH7NoDJPNoS98I514VDPtj0mOelUarQOXID3FIn43xpBi4TxpzGyk13JGI
 Iy6FhrBFTY9vUOr3BZM62KcLhYosOfFaJXueejVdcGWvSVBkdjIHUZKOTcAXK2rzwpSa
 AWToFv7D/Euxq+568HAffGJVaW6yMBc3xzxElm+a5KuvkQa/bXsMcUYeS6+8Iwn6Oe60
 UEMhDLl8cLDbA8uoSUPabMo4iv1XyiDdE/z9XTZhnaEyJI+qfASb3zseCpF2+32ZwzrW
 KxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3iKtUTjwkPeXFOZkVxoh7hBpO9kc2fmLkefP6OMZEuw=;
 b=rn/9m3NFkn9AfxZhBi/XNjZlZE5hz/2bJ/nV/QrPKKX89G6aOTg97HCMXwdt3Y5kNR
 /C18VPHeZaEUV5mYTYtpGvp1s6mDumGLmGNpuOKNvq4f+xKgRK7FN35qxnXR5gBSjxnN
 zRyapR3083J6YS6yBElCGoFUX+O+6t5jR7/vZw1R2NmiPCjPbcDqzpuBd6N4qVN49EtH
 ZbeitZvh8BK7i2sy5BWGoCY/Jy9UfkkI5vPoKM3Jf1Ia369fW5mb9LzBapm4jHcGtM0b
 9uT98yqQtXaxtabHLwpVrZN44Cqbcvsecuf74AUV57D8swHMP104CXBQn5SdngDtHHWF
 CZoQ==
X-Gm-Message-State: AJIora+h+RAJRrsF/+RMx6DItotdZAZpIv3E9vUsQ9XlRMOVYrYfMI2P
 D4ZKMs3vAuspw9D2flSe/E4=
X-Google-Smtp-Source: AGRyM1uUP1nE6rHHbWlJVWIQ2q6EhPR4p3gjdzr3NqRFCh47cVg1YOhtpxPTbqYWEhBFkzZXg3v2nQ==
X-Received: by 2002:a05:6808:1204:b0:325:73cc:867c with SMTP id
 a4-20020a056808120400b0032573cc867cmr4265027oil.95.1657803606074; 
 Thu, 14 Jul 2022 06:00:06 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 e65-20020aca3744000000b0033a169f9282sm360004oia.52.2022.07.14.06.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 06:00:05 -0700 (PDT)
Message-ID: <53ed8d76-ba31-7f01-4f50-be862a2b3e85@gmail.com>
Date: Thu, 14 Jul 2022 10:00:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/6] Fix gen_*_exception error codes
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com, laurent@vivier.eu
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 6/27/22 11:10, Matheus Ferst wrote:
> The first patch of this series is the RFC of [1] (hence the r-b in v1).
> Patches 2~4 follow the other problems that Laurent pointed out, and
> patches 5-6 fix similar problems that I found.
> 
> [1] https://lists.gnu.org/archive/html/qemu-ppc/2022-01/msg00400.html
> 
> Matheus Ferst (6):
>    target/ppc: Fix gen_priv_exception error value in mfspr/mtspr
>    target/ppc: fix exception error value in slbfee
>    target/ppc: remove mfdcrux and mtdcrux
>    target/ppc: fix exception error code in helper_{load,store}_dcr
>    target/ppc: fix PMU Group A register read/write exceptions
>    target/ppc: fix exception error code in spr_write_excp_vector
> 
>   target/ppc/cpu.h                 |  6 ++----
>   target/ppc/helper.h              |  2 +-
>   target/ppc/power8-pmu-regs.c.inc | 10 ++++-----
>   target/ppc/timebase_helper.c     |  6 +++---
>   target/ppc/translate.c           | 36 ++++++++------------------------
>   5 files changed, 20 insertions(+), 40 deletions(-)
> 

