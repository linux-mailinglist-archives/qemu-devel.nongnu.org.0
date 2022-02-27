Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E94C5FA0
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:57:08 +0100 (CET)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSTT-0000gw-KM
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:57:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSSU-0008KR-R8
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:56:06 -0500
Received: from [2607:f8b0:4864:20::62b] (port=37483
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSST-0001xZ-E7
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:56:06 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n15so6938628plf.4
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nC2lMWYfsy+NSZEx2gx3MEdiZQBi4WmcNVWMwo0VdVI=;
 b=G0YqotWnU0yyGoW7r+V+bSlG0WEta+ENBPyhD44wj0wfJiGfcYjRlxheyH2e6u+hhx
 OEyMregxKCYF3W5p6tnZ/3AekJ0nmkz0NZY4lwZPPjwhZI77OrTzyNcF/XG00RclQFei
 Tkz6f6vYhMF8cpi2kflkig1YJc83EULESuYd6rjWYINZ2n7XdcEXkSKNo7pJp2Vug4OL
 VTRWZiiIcid5FuDjvrThJ8EF/e63GzZD+wUrl10n7VA9iyI1EWaDX9jH1U5gOIOHdfM6
 KGLOWL7WBFiKFyxrUEFjTFrFl1Rh2ZvMkhtyA6gIkJW3MBwzvcMIvPnsfF18lVF06YQl
 cWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nC2lMWYfsy+NSZEx2gx3MEdiZQBi4WmcNVWMwo0VdVI=;
 b=IxSE479ZNpSqwCoiTmXbFGSBKx7xPdrnos5JuOgTxrjIi+QAgYLoaB0muUB+B/RIXT
 rlrhgYcT4/xLLp4l+80PqeozVRbRMNgMhx1y6YmUwbEpU8HDmM3MkPldOJKSddP5LWu7
 2dOBxXNmlfciKds4rY6MCJzG2NVaW7uqDs09Xehe78zX33Q9o9BbbEGJdI9dp3wQKjqU
 rvdq1e75McedxpZzKXgGKgSmE2h3xv/qK6xtfjay5qbtvMbmihLCNJU5CMWVpygFEVER
 ZBJQvafEpse99mtBVX+QdFZxIzvlp5ngT2tws804L7GY5KkEgRrO9iEUFosKOT5K7xLF
 2YNA==
X-Gm-Message-State: AOAM5321L5gk3TTc1evT7NfmltTO/b5DQ1p3Iys2w6uiVmPjoh4mrSAq
 UfgSlC5MCYipmsp3a82Li/c=
X-Google-Smtp-Source: ABdhPJzqg7Pj3xQWOK6hyTWN8+tiDalhyeRyWkKWo5RyAsq+GLEtd0dfj6g/3AjBX80qtqWpXnYymQ==
X-Received: by 2002:a17:902:ab52:b0:14d:7ce1:8d66 with SMTP id
 ij18-20020a170902ab5200b0014d7ce18d66mr17781821plb.88.1646002563058; 
 Sun, 27 Feb 2022 14:56:03 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 mi9-20020a17090b4b4900b001bc8dd413fesm8634807pjb.19.2022.02.27.14.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:56:02 -0800 (PST)
Message-ID: <49ffbcf3-b582-47a4-d865-727cea0f5da0@gmail.com>
Date: Sun, 27 Feb 2022 23:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] qapi: Belatedly adjust limitations documentation
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220225084538.218876-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225084538.218876-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/2/22 09:45, Markus Armbruster wrote:
> Commit 57df0dff1a "qapi: Extend -compat to set policy for unstable
> interfaces" (v6.2.0) took care of covering experimental features, but
> neglected to adjust a comment suggesting to cover it.  Adjust it now.
> 
> Fixes: 57df0dff1a1f4c846aa74a082bfd595a8a990015
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/compat.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



