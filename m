Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266248E706
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:00:00 +0100 (CET)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IRC-0005XE-VQ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBh-0007tl-MA
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:57 -0500
Received: from [2607:f8b0:4864:20::1031] (port=51897
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n8IBg-0007AS-3c
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:43:57 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o3so12824646pjs.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=p3CR2/duSCKvA5SlWGJj0nlQRdf373D5j+rTpuNgiNE=;
 b=nSEZdJTvmH6vGbGmi2mC46qx7VgpbYGaSs+kZlxGedSE80UO2vXOKPywemP8Y9oQp/
 C03FtN0nHbipX3qpqbSJGyvVvmMVPyeLHJpvSbTAFoZs4v9WrlDibf10Kf8vYFXCvX3k
 r/gOmyWnARuDV8O4fDfZVeS3GXxmI4wOxSHjaMv4EXy2Ozgy5urB5F6pKgTaCa9rafD3
 qlh8Urpl8Hk/FUo1iMPbfcRBDmM9gO1Yb2mwaZosg+Q+ZwdB3Io9tDgG2RpjpN/NEw+E
 IFJ79HBXgTq1dm0fGDk4jzlOcStzxESMhQk75H+fpathaDbOfZB6rBXuKSZ1bLg0+7nv
 SGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=p3CR2/duSCKvA5SlWGJj0nlQRdf373D5j+rTpuNgiNE=;
 b=OAZNQ83WmYEo7Uru/c1xs24nr/FoFK/L3/kzOA0QzMrefvPvYlga/hZMGEobLXkp55
 8MeqXGIofhn6aKUoVIGewnmOzJqBfgyOvzeqdu61QgnYY6sQ0fhigKKAQ+ZdR/LMWA2Y
 McQDNDP2Bfoq0sXoDWFapDgzGYa06C81kegeYzFRYGsAOyznGqXgznsRPBxUYY2xCcxd
 OnonNLlmJ1bRxYxG5KW+56R4Un8VMn53uMomc5vHS6ZJ1zq8O9PcJ80+UzxVTmBtDUNt
 SSfjNSQhXXTMEHV5uQxjs9azysAibqONTeYivGq27lgA/8XP4nqccjucGrlkcP+bQ0dv
 FTkQ==
X-Gm-Message-State: AOAM530cfUe4iYyXll7Wf2QnOAxI+0AK7Pj952fHQYpSSnvrvft+zQWH
 ha9bIF6lk6oMIXE49gkPwp8=
X-Google-Smtp-Source: ABdhPJyYqlHuW1i+O/E888APmYCBv3a/YZSYqswWUjB8vXraqOoZ31HZALvV++Wk1I4jv8oDXQZ3aA==
X-Received: by 2002:a17:902:ce88:b0:14a:8fda:e339 with SMTP id
 f8-20020a170902ce8800b0014a8fdae339mr1012482plg.95.1642149834747; 
 Fri, 14 Jan 2022 00:43:54 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 ip14sm983926pjb.11.2022.01.14.00.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:43:54 -0800 (PST)
Message-ID: <2bc90989-fd13-932a-30c7-780cbb691cfe@gmail.com>
Date: Fri, 14 Jan 2022 17:43:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v13 6/7] net/vmnet: update qemu-options.hx
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-7-yaroshchuk2000@gmail.com>
Content-Language: en-US
In-Reply-To: <20220113172219.66372-7-yaroshchuk2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The corresponding change for hmp-commands.hx is missing (Look for 
hmp_netdev_add).

Regards,
Akihiko Odaki

On 2022/01/14 2:22, Vladislav Yaroshchuk wrote:
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>   qemu-options.hx | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ec90505d84..81dd34f550 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2732,6 +2732,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>   #ifdef __linux__
>       "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>       "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
> +#endif
> +#ifdef CONFIG_VMNET
> +    "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
> +    "         [,start-address=addr,end-address=addr,subnet-mask=mask]\n"
> +    "                configure a vmnet network backend in host mode with ID 'str',\n"
> +    "                isolate this interface from others with 'isolated',\n"
> +    "                configure the address range and choose a subnet mask,\n"
> +    "                specify network UUID 'uuid' to disable DHCP and interact with\n"
> +    "                vmnet-host interfaces within this isolated network\n"
> +    "-netdev vmnet-shared,id=str[,isolated=on|off][,nat66-prefix=addr]\n"
> +    "         [,start-address=addr,end-address=addr,subnet-mask=mask]\n"
> +    "                configure a vmnet network backend in shared mode with ID 'str',\n"
> +    "                configure the address range and choose a subnet mask,\n"
> +    "                set IPv6 ULA prefix (of length 64) to use for internal network,\n"
> +    "                isolate this interface from others with 'isolated'\n"
> +    "-netdev vmnet-bridged,id=str,ifname=name[,isolated=on|off]\n"
> +    "                configure a vmnet network backend in bridged mode with ID 'str',\n"
> +    "                use 'ifname=name' to select a physical network interface to be bridged,\n"
> +    "                isolate this interface from others with 'isolated'\n"
>   #endif
>       "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
>       "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
> @@ -2751,6 +2770,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
>   #endif
>   #ifdef CONFIG_POSIX
>       "vhost-user|"
> +#endif
> +#ifdef CONFIG_VMNET
> +    "vmnet-host|vmnet-shared|vmnet-bridged|"
>   #endif
>       "socket][,option][,...][mac=macaddr]\n"
>       "                initialize an on-board / default host NIC (using MAC address\n"
> @@ -2773,6 +2795,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
>   #endif
>   #ifdef CONFIG_NETMAP
>       "netmap|"
> +#endif
> +#ifdef CONFIG_VMNET
> +    "vmnet-host|vmnet-shared|vmnet-bridged|"
>   #endif
>       "socket][,option][,option][,...]\n"
>       "                old way to initialize a host network interface\n"

