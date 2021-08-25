Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD53F75DC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:27:53 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIswa-0006QT-Ec
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIssj-000614-UO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:23:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIssi-0001ma-1D
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:23:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id i6so12698999wrv.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nb2VvcoYaGTDo/HfJHjthVQ593NKDPkOd+oltdinJmk=;
 b=T/cc8EGjXr1HGVRSVQBc+GoWujTIGiEaVtc9ZWCvQiWM2p0MqfVVUTj37399wlse0q
 yn5f3gA37QlCjH3llj/Goqc3wssd/4+Asp255tUCbJ8DgUWut/O9um/BY/u6KAn5KDFL
 1k8ZBHaQWQLHsv34Nv+ERf+f/kl+N9vo/wh5BAka19jKmcy8fTWlAb1dMIAHxgDXVqQu
 R0pFKec1Y8H8lOMD254FbrGr007k/rj6ImNUo6/93HX2/TFvP7ZmR685gAi0WQwbaqtD
 YdnROPhpAiWNg7vSazTd0Sg4FAT7AwmP2rrQwR1kk9oNVnSnpCSCVJFNF7qvd8ZP+Eax
 klfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nb2VvcoYaGTDo/HfJHjthVQ593NKDPkOd+oltdinJmk=;
 b=NYrjEsvSL7bBqP9HRlLUK6Er3cdTBX+6Pd6DhvJQAHuri2fCJOQKB1f/cu8MRE1enh
 KzrfkmRToRr17l0nyy1CrnScAWs5VaHGvj2h02dwcJIi0D0mNbQWz03tFjNWYkynyalY
 5kYeaaRfzlMV+tJd6QaiopprH8YPAr3DJFOlUK38+H3FN3ZsCLD3X1aI2o6v6cx/RPiW
 +S2Hn9HqDA+aV2ZADuTXAw8pEO26Tr9xlxWijokgXrpiot3+lurU16vJeWFHqGStozm/
 A9waAOwhm0RATlcxiCUF7FS8bbnlWDKF/qx00zcZlO7uA7LHVYtLJC0/cXHW3M0jMi5I
 UzZQ==
X-Gm-Message-State: AOAM533x0tLUKWOJFYWu3kDszuauW/gjn4HZyoje4bo78KtnbxJsFRaT
 +Pu08LlXVCpKxSnv8zDi0QNCTGUReME=
X-Google-Smtp-Source: ABdhPJy4fMR8Fy9L+iEqfMEMxNw1vose64b5cSbCjrOYmCJC6tUbCabh2i51xscEAQ29QRULFIWMvw==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr18816696wrj.98.1629897830148; 
 Wed, 25 Aug 2021 06:23:50 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c13sm17311989wru.73.2021.08.25.06.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:23:49 -0700 (PDT)
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
Date: Wed, 25 Aug 2021 15:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825124309.223622-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 2:43 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> DTC is widely available, we could consider to stop bundling it.
> 
> curl -s 'https://repology.org/api/v1/project/dtc' |  \
>    jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"' | \
>    egrep -i 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles|homebrew|pkgsrc'
> 
> centos_8: ["1.6.0","1.6.0"]
> debian_oldstable: ["1.4.7"]
> freebsd: ["1.6.0"]
> homebrew: ["1.6.1"]
> openbsd: ["1.6.0"]
> opensuse_leap_15_2: ["1.5.1","1.5.1"]
> pkgsrc_current: ["1.4.7"]
> ubuntu_18_04: ["1.4.5"]
> 
> MinGW package on Fedora pending review.
> (https://bugzilla.redhat.com/show_bug.cgi?id=1997511)
> 
> Debian is lacking the MinGW package.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  configure         | 22 +-------------------
>  meson.build       | 53 ++++++++---------------------------------------
>  .gitmodules       |  3 ---
>  dtc               |  1 -
>  meson_options.txt |  3 ---
>  5 files changed, 10 insertions(+), 72 deletions(-)
>  delete mode 160000 dtc

Does this fix https://gitlab.com/qemu-project/qemu/-/issues/255 ?
"Build on sparc64 fails with "undefined reference to `fdt_check_full'"

