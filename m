Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4FA3BC765
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:42:46 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fjB-0000nW-Ta
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0fiL-00005T-ML
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0fiI-0002BK-SY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625557309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5JxmQR142SToFnXvNeqvekgrcfNRG7Qs5+b0AfBhpQ=;
 b=F5AspFu3BQEy1No10MrKRhLws+oajdRSu9awcmXzSZ7YNhSXpVATa06bRFKdzcOa1SYRuz
 RIn93RZr5njsdo7U7kksy76esCYAQTVTmawVFeQXBj4DfNk1zwKw1ORG5W95eT4oLmE32V
 08/GFrzwyfaUM4iECglTEmA+dufja8I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-sgWwB_A2P-eBJ2g03XOKeA-1; Tue, 06 Jul 2021 03:41:46 -0400
X-MC-Unique: sgWwB_A2P-eBJ2g03XOKeA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so775277wmc.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/5JxmQR142SToFnXvNeqvekgrcfNRG7Qs5+b0AfBhpQ=;
 b=QCE0BE2QWLClUASJwFNPfJv+B7z41gzjZOrj9i1/KUfgd2ETNndveCskKx/IiSoaXn
 6aaMpu5bhKuulOt6bd7U29D6RHIhritUBNPs8++/MJ0h14jvEAttYwrU3D0vENF4MLzB
 w/HeEj4UpskO2SJFcnKpRAvXXh3BkSg4GPhaoFJgPRcWo3FdCAAwEGArA+8ivUnIBFbV
 FJmjsLJsE7NPs4bbMdtCpk5shhu2DxgEuJAWplKgB9lNAFhXvnvI6kdk+CyI8vzLTOzQ
 axDVRRozp9CqDAtGIKGbb1R3WqsPhx/ShyTEogD6YN+5msg6wPWziE/Gx0eqL4S0Dy9v
 yU0A==
X-Gm-Message-State: AOAM533Xfrb8dFzoYC4ayPLxofFKZ1lTw1jlT8nLZiRX8ePS8R544Fl/
 Wn5dpjl3DuFKbmBLjLCzp7pnYY6bPpjJ9vSIReVUiuXDb+iKd0dXLthaZj0CGG1qLNEG43ILdza
 lAFXBuJBl7PQhyUg=
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr3194696wmj.99.1625557305410; 
 Tue, 06 Jul 2021 00:41:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDB42REZlYcVM7CXAcTRoBpUdBaps8rEcnoI+47GWj+TOzy3/wza8yRSICjckOXntNkrVHPA==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr3194680wmj.99.1625557305273; 
 Tue, 06 Jul 2021 00:41:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f18sm16189851wru.53.2021.07.06.00.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:41:44 -0700 (PDT)
Subject: Re: [PATCH 1/2] roms/u-boot: Bump ppce500 u-boot to v2021.07 to add
 eTSEC support
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210706043124.1871866-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <81f41bef-454f-928f-0f93-0deef3ab7716@redhat.com>
Date: Tue, 6 Jul 2021 09:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706043124.1871866-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On 7/6/21 6:31 AM, Bin Meng wrote:
> Update the QEMU shipped u-boot.e500 image built from U-Boot mainline
> v2021.07 release, which added eTSEC support to the QEMU ppce500 target,
> via the following U-Boot series:
> 
>   http://patchwork.ozlabs.org/project/uboot/list/?series=233875&state=*
> 
> The cross-compilation toolchain used to build the U-Boot image is:
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/10.1.0/x86_64-gcc-10.1.0-nolibc-powerpc-linux.tar.xz

Ideally the process to update a firmware blob is (*):

- Add a CI job (as you did for .gitlab-ci.d/opensbi.yml)
- Commit the submodule new hash including "git shortlog current..new"
  in description
- Run the CI, download the almost-reproducible blob
- Test the blob locally
- Amend to the previous commit the CI blob

Since soft freeze is in 1 week, you might won't have enough time
to add a CI job, so this current patch is acceptable, but please
include the "git shortlog current..new" output.

Regards,

Phil.

(*) Yes we should document this somewhere. Wiki or docs?

> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
> Please pull the full contents (the u-boot.e500 binary) from
> https://github.com/lbmeng/qemu, branch qemu-ppc.
> 
>  pc-bios/u-boot.e500 | Bin 406920 -> 421720 bytes
>  roms/u-boot         |   2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/u-boot.e500 b/pc-bios/u-boot.e500
> index d2e29f81d6..8e635c8a5c 100644
> Binary files a/pc-bios/u-boot.e500 and b/pc-bios/u-boot.e500 differ
> diff --git a/roms/u-boot b/roms/u-boot
> index b46dd116ce..840658b093 160000
> --- a/roms/u-boot
> +++ b/roms/u-boot
> @@ -1 +1 @@
> -Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
> +Subproject commit 840658b093976390e9537724f802281c9c8439f5
> 


