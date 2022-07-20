Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36157B6E6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:58:18 +0200 (CEST)
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9HN-0005wm-Oo
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oE9Ea-0001zc-En; Wed, 20 Jul 2022 08:55:24 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oE9EY-0003nT-V9; Wed, 20 Jul 2022 08:55:24 -0400
Received: by mail-oi1-x236.google.com with SMTP id s188so4320284oie.0;
 Wed, 20 Jul 2022 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eivAo9YWY0+pO3vs8mKBY9XdSXSPwB36jPO9Z33SOR0=;
 b=KH0Ii0R16WMtIzRJayThVNBu1DiU3wojsAA0RBbOlqU7+kGYumCQoEAQjBu0gd3i5C
 kkF3xmr15X+PMrFDqKVcYEKBIQQotyZM4t6LmASdqe2zLh6SE9uCWsQGgd0qmtIojR1I
 Aho3mqY57hgvriTMTgyEU0ceNC6uvdAm/M4kEiE62pkmBgzsLIJVy/9Z0xjP3sLH0CiN
 OLIqfVihLtc7fCh01PZWYIAwQd+veeiGRmoXOigqOU59T/7K2nKSazwfGDYFiwvVFnI8
 nKlybbyc51Bo6g8rmMlYHJ+ZjpPIf8R5PVmNP+uTm+gqn6xAhwM3T56WmUX2+IDIOIpm
 EkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eivAo9YWY0+pO3vs8mKBY9XdSXSPwB36jPO9Z33SOR0=;
 b=kAdJ/spCzIQshmC9YvZB1UIWA03buGRF/H+EIakTpmcuG6fs2QHc+0kaIn5qbzDWWD
 BcqXt7j/gUdT/dyCOB2ULUE2NqP7fTdl+ENsLBgvQOf+13rpjXZF7Ze59Ycwx1Nu8bP1
 zBJUOqOYMs+V3QOhGja/2AfAomPIU3VqcXYLoOgVy/+IN/S8rcrdcSHC6jcmdg1MZx7T
 DX58fi8ouPFil66yLu9374GczUjIdqIHMKcaol+JzR4JDFtwTkCl0ZQf7ejSD89icuXN
 +iu6ZZPOALnHXDcQ3yKg9pNRpgknMKMqcImLJXLYko1AMcakiXhl1p1926gAxHjEpBwM
 i1Ww==
X-Gm-Message-State: AJIora+KvDtDS8dYOBS7eUKkHhi1VgZTQrqFC8xLKjbRMBoYsh7dlGIZ
 FpA+rmAly8lGLw9ErVj6CIvKBSSipFk=
X-Google-Smtp-Source: AGRyM1sbafrCEejpmunKMyincZHbGuUr+hoqa320ALteuiiAsbK9VD7PVPzO11nDyv409JZE5WcnxA==
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id
 ch6-20020a0568081c0600b0033a9b3bb3cemr2181397oib.53.1658321720505; 
 Wed, 20 Jul 2022 05:55:20 -0700 (PDT)
Received: from [192.168.10.102] (200-232-202-163.dsl.telesp.net.br.
 [200.232.202.163]) by smtp.gmail.com with ESMTPSA id
 bq7-20020a05680823c700b0033a9f4c13cesm625396oib.13.2022.07.20.05.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 05:55:20 -0700 (PDT)
Message-ID: <c6729cb2-fec7-2632-9ad1-4205ac0829c4@gmail.com>
Date: Wed, 20 Jul 2022 09:55:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/1] Coverity fixes in hw/ppc/spapr_nvdimm.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, Greg Kurz <groug@kaod.org>
References: <20220409200856.283076-1-danielhb413@gmail.com>
 <CAFEAcA942QJL6KzYMKS=Kwk95xU6qboaEQn4K5Yiu9qgTgxv9w@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA942QJL6KzYMKS=Kwk95xU6qboaEQn4K5Yiu9qgTgxv9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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



On 7/20/22 09:34, Peter Maydell wrote:
> On Sat, 9 Apr 2022 at 21:11, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>> Changes from v1:
>> - clarified in the commit message which kind of errors we aim to prevent
>> - changed the H_HARDWARE return to g_assert() exit
>> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00569.html
>>
>> Daniel Henrique Barboza (1):
>>    hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm.c
>>
>>   hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> Hi -- I was just going through old-but-unclosed Coverity issues, and
> it looks like this patch fixing one got lost somewhere along the line.
> Could somebody pick it up for the ppc tree, please?

I can pick it for the next PR. Just need someone else to ack it.


Thanks,


Daniel

> 
> thanks
> -- PMM

