Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636434703A4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:17:39 +0100 (CET)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvheT-0008Eh-Hb
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvhbY-0006Wl-Cn
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:14:36 -0500
Received: from [2a00:1450:4864:20::536] (port=41968
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvhbW-0000Qe-M8
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:14:36 -0500
Received: by mail-ed1-x536.google.com with SMTP id g14so30232541edb.8
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e1871oEcQKU3iRjMmaTt/EPbdSEFNOxJRzvtFTpPwcY=;
 b=RuP6AdtL/mtbFjAYGYNeG7/ZsGeMqB/oegvR5s4CSt8427LRjk31ZEe7A4W2DBSPUR
 jrJtU1jSX0e6UsPMpTTBGwZJwF9P+tsWNirIUzC3710zETai82PzcUuK20cfZaSRkniQ
 pTpvxf0tTQOqHQOwpuS1KmbAn+vvPJrs58Tp5XN28P4RGlQTQfWEMjWUY3b6EHpfu2VU
 xFh6VtqRyP09X96eWpbfR3bSjFdmuBl027BBrYNGcVX65tFnxStVhnUQwYfw/Sy5nGzw
 bmaC9Iac5DCB9fkSQzYqJrjPYHbZo6YjMAVeDXpaLkSiTHBCJpYLeylPxC4YhS9BhC+l
 sbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e1871oEcQKU3iRjMmaTt/EPbdSEFNOxJRzvtFTpPwcY=;
 b=a1eWeiwydcn7v/YV21XK71hrx3M1G/YqEuKRrU2QS49eTUH9I2iNrXCxMbKsUS7znM
 YBvyKtAru+tJDPLwPcTrCJkhHYo7pJurIPzCJrq6/tGdLg7vzfqcAW8haQ1D0avMMrF7
 S6fNjJ8qoneR6CsuCdfjwgfc8ig7T8WomuTLKjUA7ANFSkH43BEEf6bixI3HOUDm7vcl
 KMi8f95hCE9omWct2SvufHxGjkmAikIPHBo90q9WuiJy+gZLMcqlhcaTAa5zWPtSOTjD
 NtJK/ZYqTBxNCcyew9PBtK8F+EPFplCaITcCa/gwHVixJZ2+n/TU2w6KQ4sEjKRPv2QE
 RT6A==
X-Gm-Message-State: AOAM533PrnU+m1o+x2zIeYj9jf+0rgkLo5P/OEfeVHpgv4KApIAMU0SJ
 cxNc7pjhwQQPd6ti0+azPXw=
X-Google-Smtp-Source: ABdhPJwsu6MAlIgHunOXvhqXh2UFoSXCCzdJBpGphb35ZvY/AtU6R2zk1nenXU0llqYHBzuV6zhjZg==
X-Received: by 2002:a17:907:7d86:: with SMTP id
 oz6mr24583586ejc.312.1639149239069; 
 Fri, 10 Dec 2021 07:13:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.googlemail.com with ESMTPSA id qb21sm1713152ejc.78.2021.12.10.07.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:13:58 -0800 (PST)
Message-ID: <81f77751-5b01-697e-b9b6-d4583f929120@redhat.com>
Date: Fri, 10 Dec 2021 16:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <YbM5Q+gq89rWoPt8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YbM5Q+gq89rWoPt8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 12:25, Daniel P. Berrangé wrote:
>>> I can't disagree with this. If we carry on trying to evolve vl.c
>>> incrementally we are doomed to be stuck with a horrible starstup
>>> process for enternity (or at least as long as I'll still be
>>> working as QEMU maintainer).
>> ... and if you compare vl.c in 5.2 and now, and consider current vl.c to be
>> horrible, my knowedge of English does not include an adjective to describe
>> the 5.2 state.  Some incremental work_is_  possible or even necessary, and
>> has been done already.
> Right, I'm not saying vl.c hasn't improved, but we're never going
> to get out of the peculiar historical startup ordering rules we
> have today by incremental fixes, without breaking people.

Ok, so the confusion is between a horrible startup process and a 
horrible startup interface.  The latter cannot be improved 
incrementally, the former can (to the point where adding a new 
non-horrible frontend is "trivial").

Thanks,

Paolo

