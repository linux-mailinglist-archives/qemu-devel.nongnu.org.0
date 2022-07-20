Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C457BC88
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 19:23:25 +0200 (CEST)
Received: from localhost ([::1]:34778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEDPw-0008Iz-DB
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 13:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oEDOy-0006wx-FA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:22:24 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118]:5565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oEDOw-0007nV-9U
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:22:23 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 212560051
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jwIDoK21rE1NcdN+7vbD5WJzkn2cJEfYwER7XKvMYLTBsI5bpzQEz
 2JJUTjTb6rcN2OhLtFzaNm//UlVsMLUxtM2TAdkqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7/s9JIGjhMsfjb90k35K2aVA4w5TTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhRiroz6ZGBiuVIPM0SWuSWukwRpukoN2FvwXm8M49mBt4gZJ
 NygLvVcQy9wVkHHsL11vxW1j0iSlECJkVPKCSHXjCCd86HJW3q06vxzM0QwB9Yj47hmPj9D6
 cFFKy9YO3hvh8ruqF66Yuxlh8BmNdeyeY1A4zdvyjbWCftgSpfGK0nIzYUAjXFg24YURKeYO
 JNxhTlHNXwsZzVGPkcRBIgWlvrui3XiG9FdgAjM//dpuzCOlWSd1pDrHISLfdGoTP5LuUCZv
 GL44Vz+GS4zYYn3JT2ttyjEavX0tTr2XZ9XGLCm+/pChlqVyWoOThoMWjOGTeKRj0e/X5dGN
 RVR9HV366c180OvQ5/2WBjQTGO4gyPwkuF4S4USgDxhAIKOi+pFLgDolgJ8VeE=
IronPort-HdrOrdr: A9a23:Qr0EdqMiNlNGLsBcT33155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztCWEwgr5N0tQ/OxoVJPvfZqYz+8S3WBzB8buYOCFghrNEGgK1+KLr1Ld8m/Fh4lgPM
 xbE5SWfeeAb2SS+vyKgzVQfexA/DCvytHRuc7ui1NWCS16YaBp6Al0TiyBFFdteQVADZ0lUL
 KB+8tuvVObCDsqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEiKfwgwVX1p0sPkfGC
 n+4k3ED5eYwrKGIyznpi3uBqFt6ZvcIoEqPr32tiFaEESotu/iXvUZZ1TLhkFOnAjo0idnrD
 CEmWZcAywng0mhAV2dsF/j3RLt3y0p7GKnwViEgWH7qci8Xz4iDdFd7LgpOycxxnBQy+2U6p
 g7qV6xpt5SF1fNjS7979/HW1VjkVe1u2MrlaoWg2ZEWYUTZbdNpchHlXklW6soDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgwJu9CT0TJRgHdlpnFojPA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZnCOIIUaKMexjwqTqlChPtHbzPfJt3R04la6SHlYndyNvaCKDglqFC6a
 gpeGkoxlIaagbpFdCE2oFN/1TEXHi9NA6duP1j2w==
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2022 13:22:14 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 e1-20020ad44181000000b00472f8ad6e71so9945004qvp.20
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ca1H7of0uzyrcaThCPmDiwMv1BXOvvPJu5Hk42sCyoQ=;
 b=e/4nR3/oEQLAF5RoaQfG6DP6kxaP4u+KQEw+EZlF2vaNLzqkiXFICerjTX/I1Q/qBr
 2LKQdI1/njfmcgLMTTK8NcylsyJ02IzASQKk8WIPKErFVbYYe2BS9c2xvQX7KOYVeyZC
 u+4XbiMKHU9+w8SWzbCeNSuAOC+il4BnBHY5cIpt0pouO5GeT7ZTTs2Gkkaa8OCtNJFJ
 We9CfDaaum9J/n3YGkkRDG6Q6bO5fMAR4zfFn+R6+OIbBAOxKrC1Kse963Sk9VH86tj+
 nLHPx8txDqTaVQ064MYxo84JihH76lot94HksC8IVR4FyMojxLJYKDBUxhVuR5DT+Tl+
 oH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ca1H7of0uzyrcaThCPmDiwMv1BXOvvPJu5Hk42sCyoQ=;
 b=ywJyZ5bGn9rDAT/HyqTX6KEWOwOh0ubgsrq1n2oKZUpZCtI1nlp8OoC1B3Ohlv5jPj
 RT6kJaDfyrsbWABo9H/eavhrLxG2rwBsNt8WAB/Cj3hdkwgVFe2S1ytIxDRNyTxbTeZ9
 Toa1Fsw2R5of8R7cxoAULuDkjjEiE2LLzL1CjmL493IIvxyqe0gRTb1SSUHgCTF6w5wR
 rJSdubj8Uubl+zgfh8jolm5YJmoHI0Y8q+Idtyrfzy8dc9Yu8MsRVq+oSrBphxmgl4gi
 i4q/A3IfhW1DLH+xL6KVvPw8pTPL633rJbnvpxwhSrEwS6r6D2VNVabQHTIn0G7qczgO
 +xUw==
X-Gm-Message-State: AJIora8LPmEx8xDneyqNuton1pxeyzYCdJNUVYNesS3J+LYDbqQSrTqj
 rW2Jlg1+UQcfz2OvCjDIAY2FQo3ke+jgFDaDuVfveuk9tbGucXcgCr8oZIYNg7knkiXuVGXW7PX
 XOoUScX71RzXnwc2DTpvqtQK61jXc3Q==
X-Received: by 2002:ad4:4ee4:0:b0:474:4a1:a798 with SMTP id
 dv4-20020ad44ee4000000b0047404a1a798mr3539376qvb.87.1658337733555; 
 Wed, 20 Jul 2022 10:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1skL/QK1f6aeicKFyGXjXWUPuvJD1gDkY4QnxiaV3SV9953GTWccDE6ysM3Lt25p45Do7AsAw==
X-Received: by 2002:ad4:4ee4:0:b0:474:4a1:a798 with SMTP id
 dv4-20020ad44ee4000000b0047404a1a798mr3539361qvb.87.1658337733285; 
 Wed, 20 Jul 2022 10:22:13 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 bp9-20020a05620a458900b006a793bde241sm17037899qkb.63.2022.07.20.10.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 10:22:12 -0700 (PDT)
Date: Wed, 20 Jul 2022 13:22:09 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] oss-fuzz: remove binaries from qemu-bundle tree
Message-ID: <20220720171918.mx2aa64kd2tygfp4@mozz.bu.edu>
References: <20220720084009.603423-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720084009.603423-1-pbonzini@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 220720 1040, Paolo Bonzini wrote:
> oss-fuzz is finding possible fuzzing targets even under qemu-bundle/.../bin, but they
> cannot be used because the required shared libraries are missing.  Since the
> fuzzing targets are already placed manually in $OUT, the bindir and libexecdir
> subtrees are not needed; remove them.

Thank you for catching this. OSS-Fuzz shouldn't be treating binaries in
subdirectories as fuzzers. For the initial integration we even had to
make modifications to how qemu looks for the datadir, because of this
requirement.. And at least parts of OSS-Fuzz will not try to look for
fuzzers in subdirectories. Thats why the build and build-checks have
been succeeding: 
https://oss-fuzz-build-logs.storage.googleapis.com/index.html#qemu
How fuzz targets are enumerated for the build-test:
https://github.com/google/oss-fuzz/blob/4138b03a9871e09d5d25753681c489aab006d830/infra/base-images/base-runner/test_all.py#L70

However, the oss-fuzz internals must be using some different method to
find targets, which looks in subdirectories, as well...

> 
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/build.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> index 2656a89aea..5ee9141e3e 100755
> --- a/scripts/oss-fuzz/build.sh
> +++ b/scripts/oss-fuzz/build.sh
> @@ -87,8 +87,10 @@ if [ "$GITLAB_CI" != "true" ]; then
>      make "-j$(nproc)" qemu-fuzz-i386 V=1
>  fi
>  
> -# Prepare a preinstalled tree
> +# Place data files in the preinstall tree
>  make install DESTDIR=$DEST_DIR/qemu-bundle
> +rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/bin
> +rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/libexec
>  
>  targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
>  base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
> -- 
> 2.36.1
> 

