Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C0504858
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:36:37 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng7t5-0001y7-JC
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ng7r3-0001BI-5F
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:34:29 -0400
Received: from relay.yourmailgateway.de ([188.68.63.169]:43477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ng7r0-0001NJ-Jw
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:34:28 -0400
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4KhFyL5zgSz8ZQh;
 Sun, 17 Apr 2022 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1650213258; bh=LlTi0Ovl0vinS8AexpwPJyU6B6YNJLmsboPc+44sCzQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cazmPw/kMDIpjPFMgRMQ1RmPEhI7umAgCN0tAXM9Rr/M26VzMM1KgLUlaehTbfvxr
 BaiG5tlSgvuINA3qa3mqbbl29ORtrTsrgECVuwq0eZzvU37Sp6O3JLZ2PFYqgDqG3U
 x+eH4iDxq7YAvq28se6PjHkyCgnX6WfR6KkyrBm56y6fEv3fhn0fw4/gFjLMOHN5hN
 GzdqxB0f2uAO8H4pQrUID9RZ5ohfIK9TyHOVK0jeUDUkqpYb0tPdfEKmrsDgA2b5DP
 jPq4ljROTLcpdRLQHSqAaKnrcGkz3/HBC1Yo5E+HfvtXqrtbcHNolpOe3pTPem9SnZ
 oIBCU7gmZhEcg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4KhFyL5ZrPz8ZQZ;
 Sun, 17 Apr 2022 16:34:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KhFyK5pVFz8sZR;
 Sun, 17 Apr 2022 18:34:17 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-176.um35.pools.vodafone-ip.de
 [95.223.70.176])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id E967562496;
 Sun, 17 Apr 2022 18:34:16 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.176) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <c129c240-e080-c54e-9f71-521451c4987d@zapateado.de>
Date: Sun, 17 Apr 2022 18:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>
References: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
 <CAPMcbCpBL+L2LvZ17yuB1raJoPFtcEzccepi_b-ivUqngQ_VgA@mail.gmail.com>
From: Helge Konetzka <hk@zapateado.de>
In-Reply-To: <CAPMcbCpBL+L2LvZ17yuB1raJoPFtcEzccepi_b-ivUqngQ_VgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <165021325729.820.7925489418697702465@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: Jpf+2lV9WrQIxcM32TWJkuJI3BN5ZE5VzI3KXPsKS3SR
Received-SPF: pass client-ip=188.68.63.169; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Konstantin,

sorry not being clear about QEMU versions.

On building the RCs of QEMU 7.0.0:

qemu-ga.exe is produced
qga-vss.dll is produced
qga-vss.tlb is not created

In RCs of QEMU 7.0.0 qga-vss.tlb is no part of the tarball anymore.

The git history of qga/vss-win32/meson.build suggests that qga-vss.tlb 
was part of the tarball in 6.2.0.

Now, to create qga-vss.tlb either

MINGW_PREFIX=/mingw64 # or any of /mingw32 /ucrt64 /clang32 /clang64
cd qga/vss-win32
widl -I${MINGW_PREFIX}/include -L${MINGW_PREFIX}/include \
     -t "${srcdir}"/${_tarname}/qga/vss-win32/qga-vss.idl -o qga-vss.tlb

needs to be executed or the patch may be applied.

I am not sure what to answer about MSYS2 version. I am talking about 
https://msys2.org with packaging code hosted on 
https://github.com/msys2/MINGW-packages. MSYS2 is a rolling release 
distribution.

Happy Easter,
Helge Konetzka.

Am 17.04.22 um 17:40 schrieb Konstantin Kostiuk:
> Hi Helge,
> 
> In general, the patch looks good but I want to make sure
> that we will not break other compilation environments.
> 
> What version of MSYS2 do you use?
> In my case, I can compile GA without this patch.
> 
> 
> Best Regards,
> Konstantin Kostiuk.
> 
> 
> On Sun, Apr 17, 2022 at 5:50 PM Helge Konetzka <hk@zapateado.de 
> <mailto:hk@zapateado.de>> wrote:
> 
>     Generation with widl needs to be triggered explicitly and requires
>     library and include directories containing referenced *.idl and *.tlb
>     as parameters.
> 
>     Signed-off-by: Helge Konetzka <hk@zapateado.de <mailto:hk@zapateado.de>>
>     ---
> 
>     For tested Msys2 build all referenced resources reside in
>     /<usr>/include.
>     Msys2 provides its flavours in different /<usr> bases.
> 
>     This patch derives the missing include directory path from widl path.
>     Assuming the given widl path is /<usr>/bin/widl, it determines /<usr>
>     as base and appends /<usr>/include as include and library directories
>     to widl command. This way the directory is correct for any Msys2
>     flavour.
>     It makes sure, only existing directories are appended as parameter.
> 
>     ---
>        qga/vss-win32/meson.build | 11 +++++++++--
>        1 file changed, 9 insertions(+), 2 deletions(-)
> 
>     diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
>     index 71c50d0866..51539a582c 100644
>     --- a/qga/vss-win32/meson.build
>     +++ b/qga/vss-win32/meson.build
>     @@ -30,9 +30,16 @@ if midl.found()
>                                  input: 'qga-vss.idl',
>                                  output: 'qga-vss.tlb',
>                                  command: [midl, '@INPUT@', '/tlb',
>     '@OUTPUT@'])
>     -else
>     +elif widl.found()
>     +  widl_cmd = [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
>     +  usr_include = fs.parent(fs.parent(widl.full_path()))/'include'
>     +  if fs.is_dir(usr_include)
>     +    widl_cmd += ['-L', usr_include]
>     +    widl_cmd += ['-I', usr_include]
>     +  endif
>          gen_tlb = custom_target('gen-tlb',
>                                  input: 'qga-vss.idl',
>                                  output: 'qga-vss.tlb',
>     -                          command: [widl, '-t', '@INPUT@', '-o',
>     '@OUTPUT@'])
>     +                          build_by_default: true,
>     +                          command: widl_cmd)
>        endif
>     -- 
>     2.30.2
> 

