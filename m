Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168DB67434C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbCu-0007bt-AG; Thu, 19 Jan 2023 15:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIbCs-0007b3-IO
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:08:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIbCq-0002qe-Ne
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:08:18 -0500
Received: by mail-ej1-x630.google.com with SMTP id bk15so8610914ejb.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UzYtxbMrks1cTP/ZjT2aQmHNFakV/2CSgts7B06Ow1c=;
 b=A64ZxDeNq8EVwCNGXs29AZo8WLPOrBVOXq2zhheetsVCNxa0dv3zfC4BMzzb5uZ3Jk
 NnURjVZiYl2TYbNyGm2zRJmIcsc7cpsS/qTiciNmuyFDJd3EctNwKTEKP0CL8Y/mG58w
 C4SKHqnpvNga8Ory4850dzwHA+uy1X0eqiinl2D67eeNiapwZh5/JEYsIsB8v6ppFWoB
 dkAWcFl1kUAQpBbLzDpwcdi16g8f8uZwjwygp8p6V4cctEySbQ8K7fl6IWIJZngkLbvT
 7djrgToudk0WAHzbqUkYrF48TXu3oDK2OE4Bur2MkLgGmxy44eEYUk0TjLnNYdWntdt3
 cA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UzYtxbMrks1cTP/ZjT2aQmHNFakV/2CSgts7B06Ow1c=;
 b=MsDkZZE+K7LHoUwfQgwC1C8VsrmRJQGAmuLpV7kgXVVZ3/6n1+SxHdo3t/jb9Z9vp/
 UgDTgkJ27xX/C7zu5BPFDh6yWGMDZFGg7Ooi1fYS9OVM6AxbsJpx2nW7lv9QANkxX9S+
 plltmNLfVltFyU8Br+kA+eiEYY7bFmwvTnmdfzwvcehncIqn5FMKYer0TIR9eYmOTyFv
 F0UicnQXGA+0Ktr3i4dsEHFKh9egVoLGiSWk5BomxtBv1THT9ksr4iNPOqF/VQ39ctEo
 4f19HLl8eFqAErCC4X5GQU5p1UPQq4QaQXmAYZO0QCPbnxVeTd5kPLnpTpuGZrroYoqn
 aNhw==
X-Gm-Message-State: AFqh2kosdEpqUqSaezH0Qwd3tGnM0WLP+nJ/NR8mueMjq+0XA8onsYHB
 GCi5a2PccL5efFLvyUlwDSrvgg==
X-Google-Smtp-Source: AMrXdXtQ7cyIIZkUvKCTWx0XG6/E3xpn69sgx2cPD3s14wZm4MOyHeEcNgoko/qWee9tWX5FyStOPg==
X-Received: by 2002:a17:906:9495:b0:7c1:6fc:6048 with SMTP id
 t21-20020a170906949500b007c106fc6048mr11526204ejx.24.1674158894971; 
 Thu, 19 Jan 2023 12:08:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a17090623f200b007add62dafbasm16595473ejg.157.2023.01.19.12.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:08:14 -0800 (PST)
Message-ID: <0e4e2776-c44e-343b-1142-e236e38f35cc@linaro.org>
Date: Thu, 19 Jan 2023 21:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 15/15] arm/Kconfig: Do not build TCG-only boards on
 a KVM-only build
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-16-farosas@suse.de>
 <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 19:50, Richard Henderson wrote:
> On 1/19/23 03:54, Fabiano Rosas wrote:
>> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
>> statements in Kconfig. That way they won't be selected when
>> CONFIG_TCG=n.
>>
>> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
>> keep the two default.mak files not empty and keep aarch64-default.mak
>> including arm-default.mak. That way we don't surprise anyone that's
>> used to altering these files.
>>
>> With this change we can start building with --disable-tcg.
>>
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> ---
>> sbsa-ref has an explicit check to avoid running with KVM
>> xlnx-versal-virt has avocado tests tagged with tcg
>> ---
>>   configs/devices/aarch64-softmmu/default.mak |  4 --
>>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
>>   hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>>   3 files changed, 41 insertions(+), 42 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

The previous version was cleaner IMHO, not restricting only the
machines but also the cores:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777724.html

