Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7C690117
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1Bi-0002uO-Fy; Thu, 09 Feb 2023 02:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1BQ-0002rb-Mf
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:17:31 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1BO-0008Fl-Ra
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:17:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id bk16so769848wrb.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tbbPjDnPudgU1eF55ucotaUlTyYhWOp9K1zYbcU8oc0=;
 b=bzQ+6tCvcqkCZ9gO0jBBCZ+kk6uMXObFuidSSx/94OiNYYBy271TbOfWY/Ayyy01hn
 US5Si3OiPIG49IGrBN+WZjcEfWBrBEdWimSWF0xQEoyZtTYn0D7ScUkSrJRqjqAo9vdJ
 5rlODSQoD8QHGCp11fWCWcKd7wNvJhZiMlcpDmBX1J1owg3vJ6SdwHRVs4CW5FU6euBB
 Omm3YthlffCQzV0rE9g8GwuEe0GjZGypWYp/ntebpaFOokEzttApuUhmB1AGvLR4wcIj
 YuZ6vVeMvrG1CPZUTH1MwPRkFF6gHpYt/FoiIfayXICjlisA/XemGTaa3Z4u7ustqBY/
 XfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbbPjDnPudgU1eF55ucotaUlTyYhWOp9K1zYbcU8oc0=;
 b=FYNclgteGCoN4FhEbbf/thsc+J4o4hlFmGvOPLLPr6GC/H5Ct6bBEwCPFOlvhUeQlC
 Psr+p+aSX8Q6yjKmacm2Udxh58YwtNuahvwhwxM0PDQCyr7Q3ywjhZ9c/7nkRb30z1rc
 uMjLqC+RyRfdqgmD2D401/eIJpSJfUKXIS3JmH0U96v3ET7ro4+TJh+pPqWBULfKbejj
 3DARblQck6UTJpw/NTmOue0an7kaXVrhr+dVTlOaw+SFF7H8hR6wy9WYHtv1YGzjeYWR
 Jg7F4fKLLeqCbkwDnnCqMxYG6CPja5VT2E+lynH2cbvmu5grV9J012GLEJgKvXrOGuRN
 9ygw==
X-Gm-Message-State: AO0yUKXM+WCqoUdvM/vjYw+QA/vurbkB8/rKv32wF0N9zvJxsvq46zPF
 bhvAP1qfpMHRjgIXhq3uSMf+Tg==
X-Google-Smtp-Source: AK7set+u2i1imx+EH/8CiM6SOcrpB0QEW741EUBrrWy7COQNFPXEo5G/HGNwbOYo8Uverzbi92paqg==
X-Received: by 2002:adf:f287:0:b0:2c5:3d1c:efda with SMTP id
 k7-20020adff287000000b002c53d1cefdamr258774wro.31.1675927045297; 
 Wed, 08 Feb 2023 23:17:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df14531724sm4186729wma.21.2023.02.08.23.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:17:24 -0800 (PST)
Message-ID: <08bdc197-7f4e-7fa4-05d5-d05934662dbe@linaro.org>
Date: Thu, 9 Feb 2023 08:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Thomas Huth <thuth@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
 <3863220f-08b2-6cf2-20e7-eb67691d525b@linaro.org>
 <CAMvPwGqsB3vMRhdMLiBJs51Xhy7izQ_wVUWu6UfL=8Q2UGHmLA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAMvPwGqsB3vMRhdMLiBJs51Xhy7izQ_wVUWu6UfL=8Q2UGHmLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 23:40, Titus Rwantare wrote:
> On Mon, 6 Feb 2023 at 13:38, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Titus,
>>
>> On 6/2/23 20:49, Titus Rwantare wrote:
>>> This is a simple i2c device that allows i2c capable devices to have
>>> GPIOs.
>>>
>>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>> Signed-off-by: Titus Rwantare <titusr@google.com>
>>> ---
>>>    hw/arm/Kconfig                  |   1 +
>>>    hw/gpio/meson.build             |   1 +
>>>    hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
>>>    hw/gpio/trace-events            |   5 +
>>>    hw/i2c/Kconfig                  |   4 +
>>>    include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
>>>    tests/qtest/meson.build         |   1 +
>>>    tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
>>>    8 files changed, 615 insertions(+)
>>>    create mode 100644 hw/gpio/pca_i2c_gpio.c
>>>    create mode 100644 include/hw/gpio/pca_i2c_gpio.h
>>>    create mode 100644 tests/qtest/pca_i2c_gpio-test.c

>>> +#define PCA6416_INPUT_PORT_0                 0x00 /* read */
>>> +#define PCA6416_INPUT_PORT_1                 0x01 /* read */
>>> +#define PCA6416_OUTPUT_PORT_0                0x02 /* read/write */
>>> +#define PCA6416_OUTPUT_PORT_1                0x03 /* read/write */
>>> +#define PCA6416_POLARITY_INVERSION_PORT_0    0x04 /* read/write */
>>> +#define PCA6416_POLARITY_INVERSION_PORT_1    0x05 /* read/write */
>>> +#define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
>>> +#define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
>>> +
>>> +#define PCA6416_OUTPUT_DEFAULT               0xFFFF
>>> +#define PCA6416_CONFIG_DEFAULT               0xFFFF
>>> +
>>> +#define PCA_I2C_OUTPUT_DEFAULT               0xFFFF
>>> +#define PCA_I2C_CONFIG_DEFAULT               0xFFFF
>>
>> (These register definitions could be kept internal in pca_i2c_gpio.c).
> 
> I put these here to use them in the qtests.

Oh right, I missed that.

>>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>>> index e97616d327..49f406af6b 100644
>>> --- a/tests/qtest/meson.build
>>> +++ b/tests/qtest/meson.build
>>> @@ -241,6 +241,7 @@ qos_test_ss.add(
>>>      'ne2000-test.c',
>>>      'tulip-test.c',
>>>      'nvme-test.c',
>>> +  'pca_i2c_gpio-test.c',
>>
>> Should this be conditional to
>> config_all_devices.has_key('CONFIG_PCA_I2C_GPIO')?
> 
> Is that the guidance for qos tests? All these tests would also need to
> be separated out.
This is not clear to me, adding Thomas.

