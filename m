Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67E6A8048
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgVh-0000AY-8W; Thu, 02 Mar 2023 05:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgVc-0000AE-ON
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:50:00 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXgVa-0002GV-TC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:50:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id e13so4548728wro.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677754197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o31DpofQKMwiF0QXWl2+GYaR9yoFmSvIR1KMvMRXpIA=;
 b=cGoUa8jITh/klMb9sPzqutvZ+2ywhbZs9/utVOAAefK9BTj8J0eWhZ99yYFqrLXLmy
 shwkWpAz70zsOE7aCLqvOT12b/HXvNLF91KVMcXHNz1vlCr1WSDubPwXeDnrcpfs1TO1
 huC/aq9FIsT5ftpqyvBN/dpku2MthY6kQrksyuIS/GqzdMkghJWoD0pVwbgYDde6/xW3
 hk3qnOJBq2bYFPGZCaZQd8KUmRgOR19dkWP2LqjKWRUml0ChfjaifjSrE8RegO5ZGkeJ
 NQ8XW2OJqI8PBYOKwK1Fi0GIfzebcDKqN2JXGSdxxHoQ2Rb2U392ikstfdg8tMJx0j4l
 5gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677754197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o31DpofQKMwiF0QXWl2+GYaR9yoFmSvIR1KMvMRXpIA=;
 b=pCnD/INvQG9s1XjuSPlPP74ijAsGT/kZONeFbauVSGMCeUSqcu2vvwKG63lV3kTxl3
 oqtLM85fYTzJA7K1sREuyQ/rMZbiU+FOMb0ji+WF9U6ecHFY1CXE+nb+XauWuIgPz9NF
 we491oYtzPGIonur10DzD+B1f4xBvay8tOHUcP+vVuyCTdDBvtHXG5eH7Q3Oq7ydP85C
 8G+Z7jHP2HfkVRSV8pbw6lyZq3fygHPRLjD6JBPZfBkW60kOIv+RINkCl2Kd4l4mvz3c
 OVNuSqOFZBhhV+p4LRLZ8hNHrBBImZ22S2VUutpQakNCN6ZClZM3IL9CggXJ6pcwAigl
 czJA==
X-Gm-Message-State: AO0yUKUKmtOZe18dqnAfTjXPIrVyIAhGqaq/iPInkUIclf9pBdH4x50I
 wylbiaJCHzWrE9zxHOmJxWBvjQ==
X-Google-Smtp-Source: AK7set9hmycUPj+D+niptJeSnYhnttfxjkmSrtnQ5y7asTcrN3riMxxCyfvsVGSeBMw3NUyvl9vaMQ==
X-Received: by 2002:a5d:6589:0:b0:2c7:c49:e881 with SMTP id
 q9-20020a5d6589000000b002c70c49e881mr6979035wru.20.1677754196901; 
 Thu, 02 Mar 2023 02:49:56 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 y1-20020adfdf01000000b002c6d0462163sm15056720wrl.100.2023.03.02.02.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:49:56 -0800 (PST)
Message-ID: <e9287de7-94a6-944b-1627-3fa8f7f1a9bc@linaro.org>
Date: Thu, 2 Mar 2023 11:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v6 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Cameron via <qemu-devel@nongnu.org>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>
References: <20230227112751.6101-1-Jonathan.Cameron@huawei.com>
 <20230227112751.6101-9-Jonathan.Cameron@huawei.com>
 <20230302100608.00005bcd@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302100608.00005bcd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 2/3/23 11:06, Jonathan Cameron wrote:
> +CC Michael Roth.
> 
> Michael Tsirkin noted I'd missed CCing QAPI maintaintainers on the
> poison injection series so I went back to check the others I had out for review.
> For this series I'd managed to pick up one of two as Markus gave comments on
> earlier versions.

Now LGTM for meson/QAPI (although I'm not a QAPI maintainer).

Hopefully MST can take your series just in time for soft freeze.

> On Mon, 27 Feb 2023 11:27:51 +0000
> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> 
>> CXL uses PCI AER Internal errors to signal to the host that an error has
>> occurred. The host can then read more detailed status from the CXL RAS
>> capability.
>>
>> For uncorrectable errors: support multiple injection in one operation
>> as this is needed to reliably test multiple header logging support in an
>> OS. The equivalent feature doesn't exist for correctable errors, so only
>> one error need be injected at a time.
>>
>> Note:
>>   - Header content needs to be manually specified in a fashion that
>>     matches the specification for what can be in the header for each
>>     error type.
>>
>> Injection via QMP:
>> { "execute": "qmp_capabilities" }
>> ...
>> { "execute": "cxl-inject-uncorrectable-errors",
>>    "arguments": {
>>      "path": "/machine/peripheral/cxl-pmem0",
>>      "errors": [
>>          {
>>              "type": "cache-address-parity",
>>              "header": [ 3, 4]
>>          },
>>          {
>>              "type": "cache-data-parity",
>>              "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
>>          },
>>          {
>>              "type": "internal",
>>              "header": [ 1, 2, 4]
>>          }
>>          ]
>>    }}
>> ...
>> { "execute": "cxl-inject-correctable-error",
>>      "arguments": {
>>          "path": "/machine/peripheral/cxl-pmem0",
>>          "type": "physical"
>>      } }
>>
>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> ---
>> v6: (Thanks to Philippe Mathieu-Daudé)
>> - Add Since entries in cxl.json
>> - Add error prints in the stub functions so that if they are called without
>>    CONFIG_CXL_MEM_DEVICE then we get a useful print rather than just silently
>>    eating them.
>> ---
>>   hw/cxl/cxl-component-utils.c   |   4 +-
>>   hw/mem/cxl_type3.c             | 281 +++++++++++++++++++++++++++++++++
>>   hw/mem/cxl_type3_stubs.c       |  17 ++
>>   hw/mem/meson.build             |   2 +
>>   include/hw/cxl/cxl_component.h |  26 +++
>>   include/hw/cxl/cxl_device.h    |  11 ++
>>   qapi/cxl.json                  | 128 +++++++++++++++
>>   qapi/meson.build               |   1 +
>>   qapi/qapi-schema.json          |   1 +
>>   9 files changed, 470 insertions(+), 1 deletion(-)


