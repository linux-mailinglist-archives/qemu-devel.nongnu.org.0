Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D426E3DA2D6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:07:51 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94pK-0004C7-U1
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m94JX-0008EO-Fr
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:34:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m94JV-0005wZ-Ri
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:34:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b11so1180296wrx.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oawC+TPWjxKQ03eEtUgp89PLYF3jc6u0lG055EwBGZM=;
 b=VqmoFyh+EjPk+fM+N1l+i/9Fi/T1K3VYvcMEa0s8xFmI1Bw8REwXhrGOCp6kLfnQF+
 KcgqvpRrhGmoICfMZk3tOEePgvdFYO4veVUjmX0a0sxCPQ5wsjTD+wR8yzTxXw5gGWSF
 6rHtSD+7bo9NLbjlsOakxPkHvMNbkhRlJPBwC3qL5cTb8EHxMnqCe2KSnWcfwCM5tNAy
 97W3/qX1fJNzjkd/q8kkd8TuxHZ1Vlyp1npa6wE1PpZ/P6DrZ8/iQRistV8MekF7Bwl7
 d+ySOsvOWHkzVKpd2Nin/UR88Lfd7/kpBpFm78Nxbftigc7dDAZ9+oOibuIh7CXTddaf
 Z1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oawC+TPWjxKQ03eEtUgp89PLYF3jc6u0lG055EwBGZM=;
 b=b4oKtUpXPQVJ41jU5+Kd+xOOc9NoTYzViqC17oCn4IJ/SuCijbM/vhREdrNLAi5DGx
 Ty0sLRiQ+kqZJLFypjeh4k2WNDfC6dm5PLxF2k/Omunm6fKDEb74ioDX+KPU+mk8mp65
 VwJGKBwAUqrp8GadsSxBdMRwBAYar2T4HmLBrIvqKqwUGh6b/AtYdH3ItCI5vhlUJrXJ
 p6ExhHgS1XtSYxXa1Q8xPdREFUfUHTAVLV1nPUY29egYMK6lItFGzuo3v0PoSz86HH9O
 S3ZSRwixRkEmNdmL2xCcOxgMjjR6g9c19f/3be5j1vI7r3QC3t1i8GBiXWRbfw6/6NQE
 6E2g==
X-Gm-Message-State: AOAM531vKZJDpI42PQkiyPfynkGNZLsiwNuRdGwwQ7RdrmZgdW+El7QU
 DvJQ1x0HSfCZepE6pdEhB7E=
X-Google-Smtp-Source: ABdhPJwvNjakT6ePyZUQSVys905GaQ19Yo32Io5K9CcNcUBy6GSCd/vAQYzACOhWWhzPpe/ogTiZrA==
X-Received: by 2002:a5d:6905:: with SMTP id t5mr4284267wru.78.1627558496343;
 Thu, 29 Jul 2021 04:34:56 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id u2sm2867646wmc.42.2021.07.29.04.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 04:34:55 -0700 (PDT)
Subject: Re: modular tcg
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <f264970b-b12c-4e36-548f-d2411c7e3842@suse.de>
 <20210729102955.k34jqpetqy6owivr@sirius.home.kraxel.org>
 <75a7378d-63b2-d1d7-c7e1-ca4d13cf01cb@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6514e353-fca6-98a7-cb35-46a90c37389b@amsat.org>
Date: Thu, 29 Jul 2021 13:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <75a7378d-63b2-d1d7-c7e1-ca4d13cf01cb@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 12:44 PM, Claudio Fontana wrote:
> On 7/29/21 12:29 PM, Gerd Hoffmann wrote:
>>   Hi,
>>
>>> And another comment: I think we should have some progress on ARM with
>>> the kvm/tcg split and with the KConfig of boards, before we continue
>>> here.
>>
>> Why?  This can easily be tacked in parallel.  We can flip the switch
>> for modular tcg per target in meson.build.
>>
>> take care,
>>   Gerd
>>
> 
> Because in the end we need to do this for ARM too and for the other archs too (s390 is already ok),
> 
> and in order to be sure not to end up in a dead-end, I think it would be good to have at least a sketch for the other archs as well..
> 
> Just my 2c ofc, I think really here still ARM is behind, and we should help it catch up.
> 
> If I had more time I would have pushed more on the ARM series, but.. yeah.

IIUC Alex is waiting 6.2 release to respin.

