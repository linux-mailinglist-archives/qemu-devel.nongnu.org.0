Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD46E206B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 12:12:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnGOQ-0001pT-NM; Fri, 14 Apr 2023 06:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pnGOM-0001o6-1w
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 06:10:54 -0400
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pnGOI-0007sS-9q
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 06:10:53 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 271582007
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w3Svua8oTtMNc1AtyS7GDrUDOXyTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zBNXTuDa66INmX1fNBzOtvl9R9SsJeDx4NiSQprriAxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNFg06/gEk35q+q5GpE5gVWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHgvH5AdpbxmPX9D8
 uc2GgkCfBLEuO3jldpXSsE07igiBMziPYdao3I5iD+AXKdgTpfETKHHo9Rf2V/chOgURaeYN
 5dfM2A1Kk2RMnWjOX9OYH46tO6sln/zaRVStRSYqbdfD237llMojei3aIKKEjCMbYZYt1imn
 lvDxWneWSEYPt+/1iqHqUv504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LExrQmlF4isGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYfM7TKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:DN46nKohLCYaYwHocoIa72caV5oXeYIsimQD101hICG9E/b1qy
 nKpp9w6faaskdzZJheo6H5BEDtexLhHOdOkO8s1NSZMzUO2lHYTr2KtrGSpwEIcheWnoNgPM
 FbAs1D4bXLfD9HZK3BjjVQfexB/DHUm5rY/Nvj8w==
X-Talos-CUID: 9a23:pMFKB2MI4+J0FO5DYTBF6UtLQNEZbHDa11niGkCqCyFWR+jA
X-Talos-MUID: 9a23:cXraLAjNA3x8k63Q1PkYEcMpd8pB/ZqWMUU3nLJdi8uONgxvKzXGtWHi
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 06:10:22 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 r22-20020a37a816000000b0074abffe8a68so3886206qke.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 03:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1681467021; x=1684059021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R9KD1rgLB2W+V5kdKAy5zfSbJZ9JU6/SV6jMg8Z6K4s=;
 b=b8Og7401tqNvQZTJEaJyLj9tlH9NdVbGVIX5jyc/q9hWmWX7F62qmGu4VcKbxeWZTA
 m1jw1MrjAeNyTO5hZcg3C1sQEoBUQ2imwtPDzv/PHDTUb1egz0rICc591x/XsN6OyI0m
 4ZomnxK6KNtROPSOOA/Fn+xvK395pBhZfxSLheuyEpAa1qFoyb2l7NY1B8U2TMIxu/mI
 +NAkM3DSKOOXr019lZupGkg8GQ1VVoeqMQj8LtSDrUTKY0u7QG58GxuZzGPjUfOd/it5
 N5IV9cChdkr7JiHg+md22T2tBzPQJ9rPBAL2MS8y0sXDXrx6n78tm1LgA0/U2FDK5Iz3
 8Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681467021; x=1684059021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9KD1rgLB2W+V5kdKAy5zfSbJZ9JU6/SV6jMg8Z6K4s=;
 b=URIfz3WR21qyloAU0htki7AF+YbbLR8JYjwPbxK964GMu6WccOqwiZHvoLRVPQGiR5
 dEIKv1jMqSYCJn0Q2humQvDJDlWSGWWTHEd18Kc6Y7UFSZkOynQ0nsk/FC/t/255vUdw
 +0iMjb2OKpWVODuOZoK9LQMxTA7QVyE7kEpPi3vLxZAiAsuBo+ks91Ls1CUEPRzJiojg
 LE1tNw2vKvMJcolLBwMaFy1zWz7skeyVcfqE8HVmF5pCnPiBOJXBFxFOHSeKEeNYuYdz
 6B282scTuvc3aG56OaC5P3juJlVb3jacoX+U5ECYmt21JHWaJXHp9TfEEM+L0bVHBBnw
 CKzA==
X-Gm-Message-State: AAQBX9dMmaVf8JXdU2AUJwYHPXGI24kM0eanrhzglpiLFDxzZnFx/9rq
 vV2N0oN42K0+X9wcICZidwGft7asUHx8jW6mPV6FbBDqs+aoYLd0wXjtZIJw5qcvAFQ4RN8FJSV
 +qR7H2XlXHt5WGgWKvPVb49/Mtz9SBQ==
X-Received: by 2002:a05:6214:2403:b0:5ef:5361:6134 with SMTP id
 fv3-20020a056214240300b005ef53616134mr3051241qvb.43.1681467021507; 
 Fri, 14 Apr 2023 03:10:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHD7f5fCbgDsk+1KtU9frxbXfwe5a5DIFVs5efoEgVcmGwOsECfE+C9L9op305WHiKo16rBA==
X-Received: by 2002:a05:6214:2403:b0:5ef:5361:6134 with SMTP id
 fv3-20020a056214240300b005ef53616134mr3051212qvb.43.1681467021243; 
 Fri, 14 Apr 2023 03:10:21 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l22-20020ac81496000000b003e4c6b2cc35sm1118234qtj.24.2023.04.14.03.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 03:10:21 -0700 (PDT)
Date: Fri, 14 Apr 2023 06:10:17 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] rtl8139: fix large_send_mss divide-by-zero
Message-ID: <20230414101017.hobc5vwnrzfy5sfu@mozz.bu.edu>
References: <20230413171946.2865726-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413171946.2865726-1-stefanha@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230413 1319, Stefan Hajnoczi wrote:
> If the driver sets large_send_mss to 0 then a divide-by-zero occurs.
> Even if the division wasn't a problem, the for loop that emits MSS-sized
> packets would never terminate.
> 
> Solve these issues by skipping offloading when large_send_mss=0.
> 
> This issue was found by OSS-Fuzz as part of Alexander Bulekov's device
> fuzzing work. The reproducer is:
> 
>   $ cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
>   512M,slots=1,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
>   rtl8139,netdev=net0 -netdev user,id=net0 -device \
>   pc-dimm,id=nv1,memdev=mem1,addr=0xb800a64602800000 -object \
>   memory-backend-ram,id=mem1,size=2M  -qtest stdio
>   outl 0xcf8 0x80000814
>   outl 0xcfc 0xe0000000
>   outl 0xcf8 0x80000804
>   outw 0xcfc 0x06
>   write 0xe0000037 0x1 0x04
>   write 0xe00000e0 0x2 0x01
>   write 0x1 0x1 0x04
>   write 0x3 0x1 0x98
>   write 0xa 0x1 0x8c
>   write 0xb 0x1 0x02
>   write 0xc 0x1 0x46
>   write 0xd 0x1 0xa6
>   write 0xf 0x1 0xb8
>   write 0xb800a646028c000c 0x1 0x08
>   write 0xb800a646028c000e 0x1 0x47
>   write 0xb800a646028c0010 0x1 0x02
>   write 0xb800a646028c0017 0x1 0x06
>   write 0xb800a646028c0036 0x1 0x80
>   write 0xe00000d9 0x1 0x40
>   EOF
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1582

Maybe instead:
Closes: https://gitlab.com/qemu-project/qemu/-/issues/1582

so that gitlab will auto-close the issue.

Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thank you
-Alex

> Fixes: 6d71357a3b65 ("rtl8139: honor large send MSS value")
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/net/rtl8139.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 5a5aaf868d..5f1a4d359b 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -2154,6 +2154,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>  
>                  int large_send_mss = (txdw0 >> CP_TC_LGSEN_MSS_SHIFT) &
>                                       CP_TC_LGSEN_MSS_MASK;
> +                if (large_send_mss == 0) {
> +                    goto skip_offload;
> +                }
>  
>                  DPRINTF("+++ C+ mode offloaded task TSO IP data %d "
>                      "frame data %d specified MSS=%d\n",
> -- 
> 2.39.2
> 

