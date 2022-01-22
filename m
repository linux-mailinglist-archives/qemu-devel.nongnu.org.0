Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37BE496B27
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 10:13:11 +0100 (CET)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBCSM-0004Q1-KE
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 04:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBCN1-00038f-Nm
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:07:39 -0500
Received: from [2607:f8b0:4864:20::936] (port=35762
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBCMz-0005MJ-Sz
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 04:07:39 -0500
Received: by mail-ua1-x936.google.com with SMTP id m90so21285902uam.2
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 01:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R05jXNQJBnqdeNw8BBj5I7oVGQ6Zp3Pkc1JTanALTBo=;
 b=OfHbV/rV2luAjdmr5ceCAr4pNjgeuZ11a6JGSyfnfS5yV23luwjTS6RVRyORomfpnL
 5XEBxrVZ5HPOVArHxEzYKw7N4nShU8X3p2Yp4RuEcmSDwKzYNIHFd6Gs7Gqqa7V7FfBy
 pzvirwNevuTxqHvXdA3+bFQq4nEV2pRdR6FkEyMgU2G9WNXIKZruUqMvtvNeOzki2rrS
 jR18zwa3Rvwrb9lj1mxNvr3uC0eCNPYSlS9sYJy+biU6YBEZVdwIqzshVN27VJy2niMe
 DPaJFtpt3QA19ugctclUKlR6lGDUKD3xKxulOU0TajBS0CFs519lI6vmS42OLvjwsIKG
 SPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R05jXNQJBnqdeNw8BBj5I7oVGQ6Zp3Pkc1JTanALTBo=;
 b=Lmi7KtEc2URPqn9pSJQbQg6PIOO/180Qp4ZLDiwn7vLKVLb/dt3Do3t5VP3djq9vg+
 ARLV883plJ73svK1M5MZTRa95MtK5bfI+lhr5g2m044jfKWSk7YWKO2y1OKtJph4z9nn
 8+B8IMLVkzptxCFRqOAR8Ttfz/PonzcF4N11uhs6W93/abmeTWG+BGuJNwgifU7zdLVi
 ViK/vHWspILQrkUrzBcYQX0vEsPFaqKzL/qgtMNwcJke63h4oLMEXuTMu7//xMMBCB5F
 kJI+JDG092yXCk9mkwe18SpBgLvhvFiPn38yMSWJv1Pfipudn4NIASipVChA6wGFoYz4
 GpRQ==
X-Gm-Message-State: AOAM5325EKHNR55JByqHV2cISY2PxfS+6EHukyteAKbdwp3BpXbL5Fa4
 H1c/Z8HnXLElrQkz5iuY1bZvEppo50w=
X-Google-Smtp-Source: ABdhPJzBq4/drduy9rxIi9jQjxn3mbIWebj2zgQs/kQ/NZCWLTKE2c2FwEvULCL0t/iT9IgfRkjLIw==
X-Received: by 2002:a62:1c12:0:b0:4bc:6d81:b402 with SMTP id
 c18-20020a621c12000000b004bc6d81b402mr6847153pfc.40.1642842444641; 
 Sat, 22 Jan 2022 01:07:24 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s7sm10159947pfu.133.2022.01.22.01.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jan 2022 01:07:22 -0800 (PST)
Message-ID: <aa00dae7-e092-573a-a6ce-f7cf347f294c@amsat.org>
Date: Sat, 22 Jan 2022 10:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] docs: expand firmware descriptor to allow flash without
 NVRAM
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, David Edmondson <david.edmondson@oracle.com>
References: <20220121153444.527707-1-berrange@redhat.com>
In-Reply-To: <20220121153444.527707-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

+Gerd & David.

On 21/1/22 16:34, Daniel P. Berrangé wrote:
> The current firmware descriptor schema for flash requires that both the
> executable to NVRAM template paths be provided. This is fine for the
> most common usage of EDK2 builds in virtualization where the separate
> _CODE and _VARS files are provided.
> 
> With confidential computing technology like AMD SEV, persistent storage
> of variables may be completely disabled because the firmware requires a
> known clean state on every cold boot. There is no way to express this
> in the firmware descriptor today.
> 
> Even with regular EDK2 builds it is possible to create a firmware that
> has both executable code and variable persistence in a single file. This
> hasn't been commonly used, since it would mean every guest bootup would
> need to clone the full firmware file, leading to redundant duplicate
> storage of the code portion. In some scenarios this may not matter and
> might even be beneficial. For example if a public cloud allows users to
> bring their own firmware, such that the user can pre-enroll their own
> secure boot keys, you're going to have this copied on disk for each
> tenant already. At this point the it can be simpler to just deal with
> a single file rather than split builds. The firmware descriptor ought
> to be able to express this combined firmware model too.
> 
> This all points towards expanding the schema for flash with a 'mode'
> concept

":"?

> 
>   - "split" - the current implicit behaviour with separate files
>     for code and variables.
> 
>   - "combined" - the alternate behaviour where a single file contains
>     both code and variables.
> 
>   - "stateless" - the confidential computing use case where storage
>     of variables is completely disable, leaving only the code.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/interop/firmware.json | 54 ++++++++++++++++++++++++++++++++------
>   1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> index 8d8b0be030..884e99864b 100644
> --- a/docs/interop/firmware.json
> +++ b/docs/interop/firmware.json
> @@ -210,24 +210,61 @@
>     'data'   : { 'filename' : 'str',
>                  'format'   : 'BlockdevDriver' } }
>   
> +
> +##
> +# @FirmwareFlashType:
> +#
> +# Describes how the firmware build handles code versus variable
> +# persistence.
> +#
> +# @split: the executable file contains code while the nvram
> +#         template provides variable storage. The executable
> +#         must be configured read-only and can be shared between
> +#         multiple guests. The nvram template must be cloned
> +#         for each new guest and configured read-write.
> +#
> +# @combined: the executable file contains both code and
> +#            variable storage. The executable must be cloned
> +#            for each new guest and configured read-write.
> +#            No nvram template will be specified.
> +#
> +# @stateless: the executable file contains code and variable
> +#             storage is not persisted. The executed must
> +#             be configured read-only and can be shared
> +#             between multiple guests. No nvram template
> +#             willbe specified.

"NVRAM"? (multiple times), "will be"

> +#
> +# Since: 7.0.0
> +##
> +{ 'enum': 'FirmwareFlashMode',
> +  'data': [ 'split', 'combined', 'stateless' ] }
> +
>   ##
>   # @FirmwareMappingFlash:
>   #
>   # Describes loading and mapping properties for the firmware executable
>   # and its accompanying NVRAM file, when @FirmwareDevice is @flash.
>   #
> -# @executable: Identifies the firmware executable. The firmware
> -#              executable may be shared by multiple virtual machine
> -#              definitions. The preferred corresponding QEMU command
> -#              line options are
> +# @mode: describes how the firmware build handles code versus variable
> +#        storage. If not present, it must be treated as if it was
> +#        configured with value ``split``. Since: 7.0.0
> +#
> +# @executable: Identifies the firmware executable. The @mode
> +#              indicates whether there will be an associated
> +#              NVRAM template present. The preferred
> +#              corresponding QEMU command line options are
>   #                  -drive if=none,id=pflash0,readonly=on,file=@executable.@filename,format=@executable.@format
>   #                  -machine pflash0=pflash0
> -#              or equivalent -blockdev instead of -drive.
> +#              or equivalent -blockdev instead of -drive. When
> +#              @mode is ``combined`` the executable must be
> +#              cloned before use and configured with readonly=off.
>   #              With QEMU versions older than 4.0, you have to use
>   #                  -drive if=pflash,unit=0,readonly=on,file=@executable.@filename,format=@executable.@format
>   #
>   # @nvram-template: Identifies the NVRAM template compatible with
> -#                  @executable. Management software instantiates an
> +#                  @executable, when @mode is set to ``split``,
> +#                  otherwise it should not be present.
> +#                  Management software instantiates an
>   #                  individual copy -- a specific NVRAM file -- from
>   #                  @nvram-template.@filename for each new virtual
>   #                  machine definition created. @nvram-template.@filename
> @@ -246,8 +283,9 @@
>   # Since: 3.0
>   ##
>   { 'struct' : 'FirmwareMappingFlash',
> -  'data'   : { 'executable'     : 'FirmwareFlashFile',
> -               'nvram-template' : 'FirmwareFlashFile' } }
> +  'data'   : { 'mode': 'FirmwareFlashMode',
> +               'executable'     : 'FirmwareFlashFile',
> +               '*nvram-template' : 'FirmwareFlashFile' } }
>   
>   ##
>   # @FirmwareMappingKernel:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

