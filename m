Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294E4944AF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 01:33:04 +0100 (CET)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nALNu-0006NK-ST
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 19:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nALFM-0003yk-PD
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:24:16 -0500
Received: from [2a00:1450:4864:20::32d] (port=52895
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nALFL-0006FQ-6r
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:24:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v123so8498498wme.2
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C0fLc7yWwR5HPY/fKzObrV75Hdt2CC7qCclUQtSmJOQ=;
 b=j/GJ6OlvpLz0NnebBpsaeiddPj15sHSw1yvAoKbj+H6Bhj2hHxj9/ZMdjfowCIxmau
 KMkt8clu0oxtzPK5Ix9yNKemHSOWaiJPLiljlr4JYfWPspUqIN//cv6U31KBMClojItg
 fCmjQ72fOOC7l8zGlgUUhVKP/wuwWADb/alrnpwagHR4tmvokv2F4wGFAWHUel7+aP3n
 QYj60NpxNFhZMrcJmrUZeRNK+IcJ5CQgz1gA9HLnHup3w9fmHoIO+q4+4OFUMiG3MjJt
 5EBnGiZEbxyP0+VTqqbXPIPBk1Is15F9P4hGTM+jUVZdIawZmg8qoZjSiziEbGNeZST9
 segA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C0fLc7yWwR5HPY/fKzObrV75Hdt2CC7qCclUQtSmJOQ=;
 b=h3oDDxBH8MG67s5pEH0T+jPaLsgY0gE0fWtwVYikNCGIn5JLfO3lP95rcSAW+9IZ4k
 1On2CaYFSZEb2VbKtKVgPjb4XT2Zse+HhXinuHluuigfGO6btTzepugJx7BGoBkApkCe
 uZLUg8bFLTGbouvRGzSyRLUtPSvonSxU9o+8W8P6ATCH61jLvq6X+OdxCzJdt75PNiB/
 S/eG5tDcHOdIkrVJgaOngv/wFrI6NRxxnMvoeoByHzP2h1WA5TvRXXhodLPvq+tSm7B0
 NQ6Yd6LQn9+IOoKP2fgSpDa6XX9FW1ERBRwvV+CxKFLDD/NPhn2Fy1wy12qClckFNxeY
 Bpzw==
X-Gm-Message-State: AOAM533JnukobR5ht2O1c+8kOQBszVvvyeC0YMTrxJjMeogKzZ1kWB6E
 My87fGr4f9w1cx/5NA9NzBU=
X-Google-Smtp-Source: ABdhPJy44VaFuxZfdSnm+yfAJLSpwslOz6iUyaJdXxywJ3NuhgeEaVQPa9w9hIVP91I3wW59mODd+g==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr30619932wrf.451.1642638249664; 
 Wed, 19 Jan 2022 16:24:09 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m5sm806388wms.4.2022.01.19.16.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 16:24:09 -0800 (PST)
Message-ID: <25bab675-5977-c5ed-e9c5-b870a3445ecb@amsat.org>
Date: Thu, 20 Jan 2022 01:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, berrange@redhat.com,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20220119235720.371961-1-yang.zhong@intel.com>
In-Reply-To: <20220119235720.371961-1-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

+Markus for QAPI deprecation

On 1/20/22 00:57, Yang Zhong wrote:
> The SGX NUMA patches were merged into Qemu 7.0 release, we need
> clarify detailed version history information and also change
> some related comments, which make SGX related comments clearer.
> 
> The QMP command schema promises backwards compatibility as standard.
> We temporarily restore "@section-size", which can avoid incompatible
> API breakage. The "@section-size" will be deprecated in 7.2 version.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  qapi/machine.json     |  4 ++--
>  qapi/misc-target.json | 17 ++++++++++++-----
>  hw/i386/sgx.c         | 11 +++++++++--
>  3 files changed, 23 insertions(+), 9 deletions(-)

> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 1022aa0184..a87358ea44 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -344,9 +344,9 @@
>  #
>  # @node: the numa node
>  #
> -# @size: the size of epc section
> +# @size: the size of EPC section
>  #
> -# Since: 6.2
> +# Since: 7.0
>  ##
>  { 'struct': 'SGXEPCSection',
>    'data': { 'node': 'int',
> @@ -365,7 +365,9 @@
>  #
>  # @flc: true if FLC is supported
>  #
> -# @sections: The EPC sections info for guest
> +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)

See commit 75ecee72625 ("qapi: Enable enum member introspection to show
more than name"). I'd change as:

  # @section-size: The EPC section size for guest
  #                 Redundant with @sections.  Just for backward
compatibility.

> +#
> +# @sections: The EPC sections info for guest (Since: 7.0)

and then add:


  # Features:
  # @deprecated: Member @section-size is deprecated.  Use @sections instead.

>  #
>  # Since: 6.2
>  ##
> @@ -374,6 +376,7 @@
>              'sgx1': 'bool',
>              'sgx2': 'bool',
>              'flc': 'bool',
> +            'section-size': 'uint64',
>              'sections': ['SGXEPCSection']},
>     'if': 'TARGET_I386' }

