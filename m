Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920945203D8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:56:57 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7cu-00011X-My
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1no7bs-0000AO-7D; Mon, 09 May 2022 13:55:52 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:36268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1no7bq-00045F-Py; Mon, 09 May 2022 13:55:51 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-edeb6c3642so15600779fac.3; 
 Mon, 09 May 2022 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PU6WRIqH2uLgdmPNGw+ty7E3A/MDUJ92ZNu2kwDo2cI=;
 b=jKla70Yqu5d1uM/8mgvOUFnelnWjfqJg9leN88xNcdRS/yA6s87hgZwppowniVEYAE
 m9fC0lnj1yFfRjFtR5K9mKrtBvkUymLoaaHsjT+xAgBIJ3zRLMVGZZOvWH+zM25NWmVk
 F/FA4/GB5EO6XVsOPr/eyv8hDDez/dOQ+Verd+2fKAU9rv6RwK+Hpjo3mD+S4n3sZfjS
 TtpjUlBj7li7Y8KlVb7ZvRglteXPTp3++KIiDd0zUnOwUDv8cqRw+NNwyql4Yz+x+hco
 KK5c3k0LWw4iM+49S5BSj+IRoCZQIxX4Z45VazEmEupcnuh/+OqHom1dZBBeqQV3uUXl
 uc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PU6WRIqH2uLgdmPNGw+ty7E3A/MDUJ92ZNu2kwDo2cI=;
 b=P9/q8nNgKMwQvKvXxiWnf6NRYVGIJsxwHkUl1Nr7cGSsTv1j57mjWR8n19zmPKV8Iy
 U4nW6Sd1/50aZwSV6glP+zpiQBkT8rNqlPxtR1lor4IgHi5/FHXph19x4hD6b9d8cj01
 pxJBW+GCsVWXBCrt4TkGj8RLTM/NF/zQEFWpwLbk1d8p0lz0E89HT0MycHXjFQ51oKh4
 q32fZjilGIQZUN2IDNLLrIFp9lHC+Q/C2BDQoKlIkc9+IETsxNQEFLHrPO8/Y1sYxHIk
 BC3Q9Gc1ja8VJt3Db4IR1FFc+mvI1A6PVOk6/Ve+70ql1Wp8RMKzZZnnah38cKA5cQPN
 qo1g==
X-Gm-Message-State: AOAM530nWsx8dbcI/3VqVUwN4Mgfu9//twK8XtZUt7F3cJfEWMysS86q
 9AXiL4zAvm0FU1b0JJfc5Yg=
X-Google-Smtp-Source: ABdhPJyBVSF7YopiipRkMg+srOv5oGV4r1PN0zlctNv/QPizsW/vOcYZrvhqZrd6gyh6/rwcurNLWA==
X-Received: by 2002:a05:6870:4346:b0:ed:28d4:159f with SMTP id
 x6-20020a056870434600b000ed28d4159fmr7635103oah.223.1652118949234; 
 Mon, 09 May 2022 10:55:49 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056870310500b000ead8b89484sm4562573oaa.5.2022.05.09.10.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 10:55:48 -0700 (PDT)
Message-ID: <56007fd0-0fa3-4eac-4ba4-3c3aa3477ab0@gmail.com>
Date: Mon, 9 May 2022 14:55:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] disas: Remove old libopcode ppc disassembler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220505173619.488350-1-thuth@redhat.com>
 <84f0248c-ac10-4ce7-bb5d-3ed6ce90a9ae@gmail.com>
 <5d81e793-945c-7195-dae5-e341f8c0bbe2@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5d81e793-945c-7195-dae5-e341f8c0bbe2@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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



On 5/9/22 14:53, Cédric Le Goater wrote:
> On 5/9/22 19:37, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/5/22 14:36, Thomas Huth wrote:
>>> Capstone should be superior to the old libopcode disassembler,
>>> so we can drop the old file nowadays.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>
>> Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,
> 
> I think Thomas sent a PR already.

True. Carry on then :D


Daniel

> 
> C.

