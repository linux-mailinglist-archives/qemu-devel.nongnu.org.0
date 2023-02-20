Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4469C74D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU25i-0007ux-MY; Mon, 20 Feb 2023 04:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU25V-0007n4-Oc
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:04:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU25T-0001jE-RJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:03:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id c5so990019wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=012l1QKzM8GDXsREXmgLDGOitaK1A9lTtGbaCckSZvk=;
 b=G/nNr0Z8VlJinGxzqlYE2+JTTcKSd+zW7h2TevN0ln/XMDlbi1CWLY+6HHXJDb74dM
 WLMZvTJ9U11tgTWYAz6Vr/rhiLz94Vv5K7XioIMbSToVnP2ZbZARgAdRgZRxLZn7P1nJ
 Hzdom2dxW6eClnPiEq/o5YB9aR2lHLhcLL20AWymS2ueBAcFbOLHI8Uy64Y1ZPWoWOss
 dv1XyjaUXbQi/Icmi5yfjVoDgdotkw58LP/302K7kNc+Bms27he8SHQAdOsOWJ1ops00
 fipCgZ9IpKLusQqEYaUa0TFjMMhWWx9/PUfxmkZo1PL6BASFNt6ziY66ZDG/l14lMvFH
 PL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=012l1QKzM8GDXsREXmgLDGOitaK1A9lTtGbaCckSZvk=;
 b=EN/qyJsPCC7vapXqqNgD+XwfvFSdGcP5G1SY7eXRBPSzNn3rQoa7aktiqXMDobjR3r
 9pLsbZaIROKojnFyVT3whVgwVplrmTh6CN68aVZ4kOzKQGjucTscg1yRcvqbPmL8SfkA
 MBwyCPVGwxYuYK5exB5X7QlLUz7hLUo98BHD66Ws1E8HyAG7QK7RT6h8JOIk29o0s86g
 SoHbrPrfA4fJABcIBgbHu02z4zCAcFZ1zqZa2StyK9h2ctl/xruHZRrM4+7uacHtAoo+
 h+2AlA1dV1YWap+cif83Bdr9dHIt0QA2X06+mhh3lHSAx1cELto65SasdjKsX0SD/saE
 sZ9Q==
X-Gm-Message-State: AO0yUKUX2ctVD94M2JMqT7U1Z4Rmw64cHA3tHgctNdvov00cCIWlceyj
 M2NNy5Q07yvgSB0KmMp0WjPetg==
X-Google-Smtp-Source: AK7set+Jy2Akeh/Ue90j2hlzvRXO0Ni3PMVOU6aMGclBxTi5dzXCThwV1fjgwj5hf+sYjF6UufCv3A==
X-Received: by 2002:adf:f1c4:0:b0:2c5:594b:10d5 with SMTP id
 z4-20020adff1c4000000b002c5594b10d5mr428550wro.1.1676883834077; 
 Mon, 20 Feb 2023 01:03:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j2-20020adfea42000000b002c573cff730sm11698703wrn.68.2023.02.20.01.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:03:53 -0800 (PST)
Message-ID: <58e18d8f-4381-a809-35e7-2145bd4bcbbf@linaro.org>
Date: Mon, 20 Feb 2023 10:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/4] linux-user: add target to host netlink conversions
Content-Language: en-US
To: Mathis MARION <mamarion1@silabs.com>,
 Mathis Marion <Mathis.Marion@silabs.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230217163527.619486-1-Mathis.Marion@silabs.com>
 <20230217163527.619486-4-Mathis.Marion@silabs.com>
 <823c5357-4403-ed2b-61aa-58b99d80f20a@linaro.org>
 <b2776059-7922-ce15-c63b-d5580f20aa5d@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b2776059-7922-ce15-c63b-d5580f20aa5d@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 20/2/23 09:24, Mathis MARION wrote:
> On 20/02/2023 08:22, Philippe Mathieu-Daudé wrote:
>> On 17/2/23 17:35, Mathis Marion wrote:
>>> From: Mathis Marion <mathis.marion@silabs.com>
>>>
>>> Added conversions for:
>>> - IFLA_MTU
>>> - IFLA_TXQLEN
>>> - IFLA_AF_SPEC AF_INET6 IFLA_INET6_ADDR_GEN_MODE
>>> These relate to the libnl functions rtnl_link_set_mtu,
>>> rtnl_link_set_txqlen, and rtnl_link_inet6_set_addr_gen_mode.
>>>
>>> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
>>> ---
>>>   linux-user/fd-trans.c | 64 +++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 64 insertions(+)

>>> +                                               abi_long 
>>> (*target_to_host_nlattr)
>>> +                                                        (struct 
>>> nlattr *))
>>> +{
>>> +    unsigned short aligned_nla_len;
>>> +    abi_long ret;
>>> +
>>> +    while (len > sizeof(struct nlattr)) {
>>> +        if (tswap16(nlattr->nla_len) < sizeof(struct rtattr) ||
>>> +            tswap16(nlattr->nla_len) > len) {
>>> +            break;
>>> +        }
>>> +        nlattr->nla_len = tswap16(nlattr->nla_len);
>>> +        nlattr->nla_type = tswap16(nlattr->nla_type);
>>> +        ret = target_to_host_nlattr(nlattr);
>>> +        if (ret < 0) {
>>
>> If this fail, guest's nlattr is now inconsistent. Is this OK?
>>
> 
> The same check is done in target_to_host_for_each_rtattr(), and in all
> host_to_target_for_each* functions so I think this is OK.

Yeah this is pre-existing, so your patch is OK, but I still wonder
if this is safe. Laurent?

>>> +            return ret;
>>> +        }
>>> +
>>> +        aligned_nla_len = NLA_ALIGN(nlattr->nla_len);
>>> +        if (aligned_nla_len >= len) {
>>> +            break;
>>> +        }
>>> +        len -= aligned_nla_len;
>>> +        nlattr = (struct nlattr *)(((char *)nlattr) + aligned_nla_len);
>>> +    }
>>> +    return 0;
>>> +}


