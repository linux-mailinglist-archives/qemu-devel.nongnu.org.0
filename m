Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC14B8C3E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:17:07 +0100 (CET)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKM3G-0003CS-77
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKM1U-0001Qz-Pi; Wed, 16 Feb 2022 10:15:16 -0500
Received: from [2607:f8b0:4864:20::52c] (port=45979
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKM1T-0004eh-1b; Wed, 16 Feb 2022 10:15:16 -0500
Received: by mail-pg1-x52c.google.com with SMTP id z4so2384982pgh.12;
 Wed, 16 Feb 2022 07:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dqWpjmWTBqUgKA9i/7qf57fdHnci2U5owDk01nOvQ50=;
 b=ExCvhe6DVIWasjvb0lBRxgQph8QH9ox1ueNRGxDB39ukhCGPE5Gt6Ccx1hvz+c2oha
 5Kjzr1YnTFeMclQkOfNUuDVTXner2F4VEsvy3t0YpG049xMjkSXipV52dv5BPXeDCJyP
 6eptGGtMRYFe24ZQZuYw1YsXBz/NV8SnusNdLrNP+K/sIYhHhFHrShP+yc13tqkx99L9
 AwCrrrdz5XFdBTNJGKdT0AxiXA7qYmKUy+chcU6DgxlPqc1ZxdpJ9DAnsp8m/GdfUH6Q
 LhJgTsYoaI9RLRrY8gpOXWS1skIvJXPA9xaoSUfMhVWcHp0usPCFzBMnX2LdjykL7mzD
 INrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dqWpjmWTBqUgKA9i/7qf57fdHnci2U5owDk01nOvQ50=;
 b=6H4gndLASWN0dy1JbBGpJy9Etew0spdVfOUtQK4H2snRIPMsM0sd/zcaiMPeYeMhAn
 T4xEPxvnFIAHp/CXMI04Zc+xCIltGCsYyFXdP/Y5jmAwxxUdryzapT8LhoZjfhkebqY+
 trsptnmZf0HGAaJeEsox+ghr9smfpjYFY1AlM2ba+0UbMd2B6KFwG7CR4U6oMGkqQuX/
 76CkbkMWg+OAt7hhUaQSJXzO70e15BXKTSqMWqT/+RpR6RBn9B2Em64uV7T4cxXxorCZ
 zDrDHgK4Uy6lctWcqYP1P4dw95tMX0bRrl4H/5V73Xo9uxAoXtTOsnpT+UGM9L4XYjEQ
 S/fg==
X-Gm-Message-State: AOAM530k3MfzIG4dpVAk+GBHJGQeA4uQ5P4T+g9nTVSnlCvUpngkQHxz
 0io68rIpIHEpDQO49hT+lg4=
X-Google-Smtp-Source: ABdhPJyLKhGb7g3x1alZLta1bxJ163EcT0i8lvfCQAGGfSn9ivGHPKP313Kdn+QwtUXu+LR2YDnjJw==
X-Received: by 2002:a63:548:0:b0:372:c882:2109 with SMTP id
 69-20020a630548000000b00372c8822109mr2628890pgf.415.1645024497937; 
 Wed, 16 Feb 2022 07:14:57 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id u11sm8158635pfi.126.2022.02.16.07.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:14:56 -0800 (PST)
Message-ID: <959ea128-f2f3-836b-4fc1-503a9e77c3dd@amsat.org>
Date: Wed, 16 Feb 2022 16:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2] tests/qemu-iotests: Rework the checks and spots using
 GNU sed
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20220216125454.465041-1-thuth@redhat.com>
In-Reply-To: <20220216125454.465041-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 16/2/22 13:54, Thomas Huth wrote:
> Instead of failing the iotests if GNU sed is not available (or skipping
> them completely in the check-block.sh script), it would be better to
> simply skip the bash-based tests that rely on GNU sed, so that the other
> tests could still be run. Thus we now explicitely use "gsed" (either as
> direct program or as a wrapper around "sed" if it's the GNU version)
> in the spots that rely on the GNU sed behavior. Statements that use the
> "-r" parameter of sed have been switched to use "-E" instead, since this
> switch is supported by all sed versions on our supported build hosts
> (most also support "-r", but macOS' sed only supports "-E"). With all
> these changes in place, we then can also remove the sed checks from the
> check-block.sh script, so that "make check-block" can now be run on
> systems without GNU sed, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   I've checked that this still works fine with "make vm-build-freebsd",
>   "make vm-build-netbsd" and "make vm-build-openbsd" and the Cirrus-CI
>   macOS tasks.
> 
>   tests/check-block.sh             | 12 ------
>   tests/qemu-iotests/271           |  2 +-
>   tests/qemu-iotests/common.filter | 65 ++++++++++++++++----------------
>   tests/qemu-iotests/common.rc     | 45 +++++++++++-----------
>   4 files changed, 57 insertions(+), 67 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



