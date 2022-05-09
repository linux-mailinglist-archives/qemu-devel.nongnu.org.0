Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D551FE27
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:26:20 +0200 (CEST)
Received: from localhost ([::1]:47038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3P1-0008Ev-V2
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2wM-0001bL-N8; Mon, 09 May 2022 08:56:42 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2wL-0003cZ-6q; Mon, 09 May 2022 08:56:42 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q76so11945019pgq.10;
 Mon, 09 May 2022 05:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iiRZ28P8pEaIujina4zq4eLInWZpy4kIyMX2HELgfoI=;
 b=m9iV17czICaZ338clcsut8/vdkNKRZDN7UU7vNQn2xVojpkR1+bFBhpVES8DysYioi
 +we6/63cLD9e6sAQlYJfLAcCkgjc+f3EUNaYfsPB3xh5zQzF0W6TI4QCpI9LRECdUFdQ
 ZpJhTzdElUhUwOEsSn6stPXI2QhpEqbm4Gh3bztbHirjr2KSZzy28dec6+k84X+yqism
 JVkhO/XGZLZwRLbstjM19U8+HVoaN1HvRG7wjUU5KBi0ti+iaGo+s7ukS+TRraHXf3WZ
 5oZ1LY7eL5OU5tHLk0l2/c6wqmkwUYpxq2kJJk63Od+5mYRqqno7MtBofle/e1DlBLSs
 oZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iiRZ28P8pEaIujina4zq4eLInWZpy4kIyMX2HELgfoI=;
 b=NsxKqrexj4x5VD6qmUm6A4KuOSwxXXKSMcXfkHjnU0X75DJgGcT2drzsppGFbXAVU+
 SiVfJj6KE6l40i2yz1phzVJGJU3unvAQKB8RbZMqOQQye1gLENL/vaJc+qBT01YvzUVl
 MXDTvT8hhZfJOCo0v/EKOoDHObFaz52ugFI8YAZzVeCYe72/Vpr35B5jVypxMAfUMHgS
 b86AwXSWgGp9/QfmAXvjb/LSWE/7mvz1ET9Zy4hBmd3+xcOIzGn+NYRKF6maYyp4GhCp
 OvOJEDLfTkZtPCE2/Icz+lqGoYXTetp7zD5dce3hufRgP/+cHTVm/MopflXfbLwFJYe1
 h7XQ==
X-Gm-Message-State: AOAM5328jBmooB/X/cMHsIQki79DwpfCLtsSqlsEkgc/yXsxmig677nu
 VskfxSonScfKa7ZYWAfr1WY=
X-Google-Smtp-Source: ABdhPJxCrbe566TWPGPH0P3Tyv4Uq+iAqSqUFLZQr/Zhq2JBxlc5dv+RzdVT5gAt5Dbt+0frtcayBw==
X-Received: by 2002:a05:6a00:1950:b0:510:739f:a32c with SMTP id
 s16-20020a056a00195000b00510739fa32cmr15814026pfk.77.1652100999667; 
 Mon, 09 May 2022 05:56:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a170902869300b0015e8d4eb271sm7060105plo.187.2022.05.09.05.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:39 -0700 (PDT)
Message-ID: <57396d69-1dff-ec35-0c16-b2410c1d30e6@amsat.org>
Date: Mon, 9 May 2022 14:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v7 00/22] host: Support macOS 12
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Silvio Moioli <moio@suse.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <b0933f87-3a73-fbfb-f3ee-52e7ecde73a0@suse.de>
In-Reply-To: <b0933f87-3a73-fbfb-f3ee-52e7ecde73a0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/5/22 11:40, Claudio Fontana wrote:
> On 3/7/22 12:17 AM, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Few patches to be able to build QEMU on macOS 12 (Monterey).
>>
>> Missing review:
>>   0006-hvf-Fix-OOB-write-in-RDTSCP-instruction-decode.patch
>>   0013-osdep-Avoid-using-Clang-specific-__builtin_available.patch
>>   0014-meson-Resolve-the-entitlement.sh-script-once-for-goo.patch
>>   0015-meson-Log-QEMU_CXXFLAGS-content-in-summary.patch
>>   0016-configure-Pass-filtered-QEMU_OBJCFLAGS-to-meson.patch
>>   0017-ui-cocoa-Constify-qkeycode-translation-arrays.patch
>>   0020-ui-cocoa-capture-all-keys-and-combos-when-mouse-is-g.patch
>>   0021-ui-cocoa-add-option-to-swap-Option-and-Command.patch
>>   0022-gitlab-ci-Support-macOS-12-via-cirrus-run.patch
>>
>> Since v6:
>> - Dropped merged patches
>> - Addressed Akihiko Odaki comments (squashed 2 patches, added R/T-b)
>> - Dropped 'configure: Disable out-of-line atomic operations on Aarch64'
>> - Add few macos patches on the list pending for 7.0 so tested by CI
> 
> 
> Hi Philippe, I did not find v6 somehow,
> 
> and I was looking for patch:
> 
> "[PATCH v5 06/16] hvf: Enable RDTSCP support"
> 
> was it dropped / merged with something else? I do not see it in latest git, nor in this respin,
> maybe it is in your tree somewhere?

The patch stayed unreviewed during 2 months, so I dropped it.

Now it got at least a Tested-by tag from Silvio, I'll include it in the
next PR.

Regards,

Phil.

