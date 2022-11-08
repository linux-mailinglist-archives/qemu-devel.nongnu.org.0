Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA3621AD8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:37:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSWR-0004uD-Hr; Tue, 08 Nov 2022 12:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osSWN-0004tS-Sr; Tue, 08 Nov 2022 12:36:23 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osSWK-00047A-KP; Tue, 08 Nov 2022 12:36:23 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13b23e29e36so16992350fac.8; 
 Tue, 08 Nov 2022 09:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aM03Lnbwx+LxDm83p7x8hPMZGtBIw203KVosZ7eBCv4=;
 b=m9rYsW5kZsWuUBydW0ktlLs71QmcDVAUg0YqJZWelBRReu0Fq93IXycASNOZAWMX/M
 9lcMTCWj/u4tE5PNIAX/lkudLeku6/wG/4COIXt4mbzlbo4gsGW70B4NUk193yS2WF6h
 AdBPBkqLrtup8g0XMvBoUKFQ3/jP1xnoS8x812ho/HzWUdY/cNRLW6xlSbb+mG2HSp1G
 CYqToXQMYl9dSNEMgPH0AZXpY2hhwcUtN1Zrkec60w3/8pdtXeoUO68t8ol7eqGi+Exg
 gE4b222aNsXgUskRx+bwUW2/bdkrq7pdhEEKAqcjTOIOQ8REuvBWUA+gMcxcBvg1Vu5Y
 8WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aM03Lnbwx+LxDm83p7x8hPMZGtBIw203KVosZ7eBCv4=;
 b=G71ZW5nv35hDSmzoeOOLvoMCGZFmmtQS98OjJybx1BY5BRDvJuSK9BlAW3w5M/F0GV
 yMTJlQZWBP91xRbxP7h42zUDBCiHQMrL/emJQKYxcnSECgi9kPnV4CnG1v8USL424t1l
 gxMebTpFNcxdKQ/rTG7bTZqP7a6erkpBOHwBN1Zc8nWaqEDv3yFTDmKrMe9hiNXS1Boq
 1CypPio6r+2MqbNwRG8rtU+nUG7DixARUFe8lKKLSobSiTNbuYd9UzMN4WDmSsm3ALyv
 aD14lRYChgPWhFIH3kU4M7TVdmLtlX6TbGPOrcAlHM9s20sIR1vIheV50KFIqGTf3wrZ
 rypw==
X-Gm-Message-State: ACrzQf2BUbdwJL5fi1KhaFa+1z1oCBUsXANQaTSN6O2/UFZAucoIWwli
 cXjINxikhPWF9PP0LNH7SnA=
X-Google-Smtp-Source: AMsMyM5h9aeXz4hndSNfy5RNxxN9Ov9wgIGP1fnBJiQnMwdrfe/9guWm273KdZ7NeR9BuFFyZPCe1A==
X-Received: by 2002:a05:6870:f60e:b0:131:b7cc:f994 with SMTP id
 ek14-20020a056870f60e00b00131b7ccf994mr33786641oab.113.1667928977949; 
 Tue, 08 Nov 2022 09:36:17 -0800 (PST)
Received: from [192.168.10.102] ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a4aeb06000000b00494ed04f500sm3410667ooj.27.2022.11.08.09.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 09:36:17 -0800 (PST)
Message-ID: <dbc5fe9b-8817-28e2-1a2f-180933440550@gmail.com>
Date: Tue, 8 Nov 2022 14:36:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PULL 59/62] hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221028163951.810456-1-danielhb413@gmail.com>
 <20221028163951.810456-60-danielhb413@gmail.com>
 <CAJSP0QWiE2gmUB4Fcb_TdS1SzXiS3fFvjoCXjqYbvts0Nvb+HA@mail.gmail.com>
 <78b914c5-ce7e-1d4a-0a67-450f286eb869@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <78b914c5-ce7e-1d4a-0a67-450f286eb869@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Phil,

On 11/1/22 19:49, Philippe Mathieu-Daudé wrote:
> On 1/11/22 23:23, Stefan Hajnoczi wrote:
>> There is a report that this commit breaks an existing OVMF setup:
>> https://gitlab.com/qemu-project/qemu/-/issues/1290#note_1156507334
>>
>> I'm not familiar with pflash. Please find a way to avoid a regression
>> in QEMU 7.2 here.
> 
> Long-standing problem with pflash and underlying images... i.e:
> https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@redhat.com/
> 
> Let's revert for 7.2. Daniel, I can prepare a patch explaining.

Just sent a revert. I'm not sure if the explanation I provided is
good enough. I appreciate if you can review it.

If it's plausible I'll send a pull request ASAP.


Thanks,

Daniel

