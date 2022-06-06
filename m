Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0DE53E55B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:20:58 +0200 (CEST)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEXJ-000626-4V
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyEDI-0001CH-MI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:00:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyEDG-0004WW-VM
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:00:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so12774246pjq.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6hOvDYsbmFCJxmyGzlE+tsvXKBA4ymld0jrJ5cSFtU=;
 b=kyaEZs+YlIa60buMMC4o3cL7l69nZhHWis78tFsqlEvMwWCG21Q4sr8g3SI8tuTh1x
 563Hpt8Vk7RlRAg9ElPd0Pew//o4tWq1egI9If+zIKVyzHiHrOSVgc5Q40wNFQN43YG9
 S7TklE9TlgCPs63mNqF9su37xOf/G/2BcYpKFfJMoLsuEoHB9EiP27XJxJv7LFvDc+5Q
 uw8DZWol+EugGvY37iTnvMIW4mbmaFih7cQLsoG646jJErjFzsA+i9MLNg+Q1B8kpXnZ
 ll57SHheRxzREIwbdKnmXz3bepTjHeLg6Shd33xixD6+tGG4SNGCtllQUsNFhNzBZDbH
 BV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6hOvDYsbmFCJxmyGzlE+tsvXKBA4ymld0jrJ5cSFtU=;
 b=rLQSO3ocrbRUKAvFwP+kdwcmC7HFfpBXrNjHmkSdJCvTw8jK8xC/TpvfRf/0r+oOyd
 HjR3LshHbRtB+UDhCCPfSjFwe3B+R4r5rId8QgfeiaAnTQqLuwk1FYfMWCco9IyMEybX
 /6xwZRvBF/4X1rxSH4XT6a7vNWBR7+zJMFke8F5YwyOafKjQdN48XP2Cepf4nHsHjB9n
 W8Utz+EFRzND98OClwebjy27M0T+4EGnaMp01Iq+Cm3Ae7yUW51K9OMw+PSRHKriiP5u
 JTNXD3d7eeaLbHUi1vskeYM6DtzENLtWGktFhu0VTL/h/4NyD/YSSrhuYGEok1qF0CRw
 7tXg==
X-Gm-Message-State: AOAM531jHqCQ4pS5P6hNOuAnA36T84zxoZesrYf9Z1Ihjgf9N4qAqTYq
 U7bI1X4WPokU304hSIiUO+w=
X-Google-Smtp-Source: ABdhPJzGAI4mdPZFlzm8Ul2KBp0OOqz9YFaxXASH2WYxUzROt8Yt2qsMjD/PmuVuSecrJKboQHSD5w==
X-Received: by 2002:a17:902:9006:b0:167:5c8c:4d37 with SMTP id
 a6-20020a170902900600b001675c8c4d37mr13990561plp.109.1654527612950; 
 Mon, 06 Jun 2022 08:00:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f82-20020a623855000000b005184031963bsm10834695pfa.85.2022.06.06.08.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 08:00:12 -0700 (PDT)
Message-ID: <086849d4-759e-c600-a8db-2bdb0fbf5aea@amsat.org>
Date: Mon, 6 Jun 2022 17:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] configure: remove reference to removed option
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220606104701.1107015-1-pbonzini@redhat.com>
In-Reply-To: <20220606104701.1107015-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
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

On 6/6/22 12:47, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index b9ccff9067..ac18ed4f3a 100755
> --- a/configure
> +++ b/configure
> @@ -1035,7 +1035,6 @@ Advanced options (experts only):
>     --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
>     --static                 enable static build [$static]
>     --bindir=PATH            install binaries in PATH
> -  --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
>     --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
>     --without-default-features default all --enable-* options to "disabled"
>     --without-default-devices  do not include any device that is not needed to

Leftover from commit f5c730698a ("tests/vm: do not pollute configure 
with --efi-aarch64").

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

