Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B24B0D3A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:11:05 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8Hu-0006O5-QM
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:11:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7zv-0004Qu-59
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:52:27 -0500
Received: from [2607:f8b0:4864:20::42a] (port=44855
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7zt-0000kF-6p
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:52:26 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y8so7041235pfa.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4VpQBYAlTYgr5cwfncMpF3h/VRdgtp+KVSUqDwUPz8=;
 b=QZ5+E/Ql3gZdR8f3C9SUyAASYR2IRntXowEEts7opK6zjhghp2qbafAGmsPPMCAv1x
 Pqu6RaEGoU7LQPyesrN9WVqmEXAyUndARsQMwTlD79eFH7NW97fFx+kgDiUGqqSU5FRd
 BN+87Nd+8MFOLjqDz1TezGy5wc8gzt8hW8Uf9v+8VAy039kcl7HNtMSGmZxLVDabsX2t
 vEH6RsUxPLiDFo3d2RSkcKvooWWI7pbJetcT3ec+NsD+w5e4x0zKn/bRvFdToeKmgv1W
 F3DcDqUUAOmY88aNZSO/2L/m1YUkkmguHQZKJRUeToSTz3W/L72F8JNpnET9ExC4//BE
 MZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4VpQBYAlTYgr5cwfncMpF3h/VRdgtp+KVSUqDwUPz8=;
 b=yfhHVPf8gepfRyeDwGrcx0S1Or+5BIVnkv93pHrxhuJdAAmnpIVYurgQ78L+51SzV5
 yYGrDcPwokCmWXvw7Pvw/jM7PlnXQesycPIz52MUiCHrBaKrohkkKvjcMdPYW5ueED0Q
 YZBumTFqXLg7bJlqdEoAYhNoX0oOJIx7xBnFEhBgZWlndosFCNBQ0QkQamrzKEjvcl8B
 cKbJp3HsYXbRIJiDhfRUvlBaf/qAHEIvA/eky/AcvL4nlB9+Or6IOQCQjijZzXL4migZ
 VUOILwdtY3g7v+Fsc68eUHFdX1aIBsuDofaZvvuaD61G3Q5iq7QYarhyrJFCUvy09Jzy
 X/cg==
X-Gm-Message-State: AOAM5326aTxXf/89o1gKK7utXzfyCS6d94HrY6aL/6Dkaes1CbcfUR99
 l95t2xTaRsEy91pD9c2OlpqUCuDbp3M=
X-Google-Smtp-Source: ABdhPJxje4ZUoUBM9rHBnXSqzw/JBJ+W88gvu9Ji0yM4+kusjGrOXxdqMoq/15hW7k56C5IlmSWuyA==
X-Received: by 2002:a63:1c1:: with SMTP id 184mr5912859pgb.66.1644493943276;
 Thu, 10 Feb 2022 03:52:23 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oo7sm2543736pjb.33.2022.02.10.03.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:52:22 -0800 (PST)
Message-ID: <793c7d61-88ed-2820-5866-c0236cd5ebea@amsat.org>
Date: Thu, 10 Feb 2022 12:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] meson: put custom CFLAGS after default CFLAGS
Content-Language: en-US
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
References: <164449347000.2210159.3879447183273643758.stgit@dynamic-vpn.dhcp.yndx.net>
In-Reply-To: <164449347000.2210159.3879447183273643758.stgit@dynamic-vpn.dhcp.yndx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Hi Konstantin,

On 10/2/22 12:44, Konstantin Khlebnikov wrote:
> Flags passed to configure must be at the end to override defaults.
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---
>   meson.build |   12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 5f43355071..d94f3ee3e3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3293,13 +3293,13 @@ if targetos == 'windows'
>       summary_info += {'Windows SDK':   config_host['WIN_SDK']}
>     endif
>   endif
> -summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
> -                                               + ['-O' + get_option('optimization')]
> -                                               + (get_option('debug') ? ['-g'] : []))}
> +summary_info += {'CFLAGS':            ' '.join(['-O' + get_option('optimization')]
> +                                               + (get_option('debug') ? ['-g'] : [])
> +                                               + get_option('c_args'))}
>   if link_language == 'cpp'
> -  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args')
> -                                               + ['-O' + get_option('optimization')]
> -                                               + (get_option('debug') ? ['-g'] : []))}
> +  summary_info += {'CXXFLAGS':        ' '.join(['-O' + get_option('optimization')]
> +                                               + (get_option('debug') ? ['-g'] : [])
> +                                               + get_option('cpp_args'))}

These are just informative... What is your problem? AFAIU This patch
doesn't have any logical impact on the build system.

