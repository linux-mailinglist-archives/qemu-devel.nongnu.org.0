Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882926F31E2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:15:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptUHW-0005VD-Iv; Mon, 01 May 2023 10:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ptUHU-0005Up-Bm
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:13:32 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ptUHS-0000TM-Bp
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:13:32 -0400
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 275805338
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O0EhGaIxDqxHV36zFE+RaZclxSXFcZb7ZxGr2PjKsXjdYENS0GYCn
 2EWDz+EbPqCZzSke9kjPoS19E9U7cXTm9BmQVZorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8lWo4ow/jb8kg34ayr4GpwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69RCFGE7OL8gxstQIjlp0
 P8qDQ89fCnW0opawJrjIgVtrsEqLc2uJZ9G/385nG6fAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2M+M3wsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTeOnFQsi+O9WDbTUv+BWJ1ntB6hn
 GHppUfIKEgcPfaY9iXQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMy9O08rR30CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBUEG4phAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:UffBRqDdscR1wOblHel155DYdb4zR+YMi2TDtnoBNCC9F/byqy
 nAppUmPGDP+VAssR0b9exoe5PwOE80jKQFmrX5ZI3SJjUO21HYUL2Kj7GD/9SIIUSXnNK1s5
 0OT0EUMrDN5DZB4/oTnWGDYq4dKQ28gcKVbZu39QYLcegTUdAC0+6PMHf+LqTefngiOaYE
X-Talos-CUID: 9a23:vd8hf2AhyZzcRCf6EwhL7G4ZH/IdTlD67y/3BkyKLFlZWoTAHA==
X-Talos-MUID: 9a23:FhaTbguZFI1zmIF0qM2npzp/bPVCu52UC29XsqQs4s+NHytPJGLI
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 May 2023 10:09:40 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef3b962f24so13480071cf.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682950179; x=1685542179;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kgHB65/hfkmsX441cKSWOqZ2+czn8D5BYUbYWr6/970=;
 b=mJpdANYOqWhvt/M2BMp2ucf7r7FdCieEYCEOYfCg6TC+8bLA9Y6Of7gBZy7jf+Skdm
 XCNZ89G6cYrZqoDTX/l4rixyjf3/Ywgncxdb+7HbxVeoWXZAgWZu98X4Ejih2XJkimkW
 4oCv5EMZaVbcce0IzzcpBaaTGUy9XL7BKnuUJvJh71TBpdYsqrtymgs46RApfcj5xM3z
 YuSz91oE0BIUZMu52M+3PFPj9dBLuIrjOH0sGopKl02pm8IpxLafA+IAbLRLrrpxK6xF
 KkZp3jzE7ps1YjHAw8o+JlRix+AhyPkxFjTzq5XDI1a8HCVO6Iwg6NGTEtrT29lZbDJz
 u9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682950179; x=1685542179;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgHB65/hfkmsX441cKSWOqZ2+czn8D5BYUbYWr6/970=;
 b=THSDngog2gysLJxd8FEcKIx++pzvpkJByqgQyv3AVQ+x3WRtv0SfhRMz5yiUynuGWn
 bKxd7nlUtpvgrTgmQz3qPipRRTq/rsnNsOyEJvL6kANbRYnMIX0OFxDntJant5AM3Xnb
 qJLkXJ38smAvXTNgGFsXVfMGaH0Ala2vSAsAast9P9Z3GP0+3AVhstkbMBcHaVy4Ip37
 /mKNzOgO4wKLAm8mISpL9nV0syZgqoh2iNx0N+x12ZIKHjCBDnrxf/pSxX3upXzM5BX8
 79VUnmecOKP1Ukt0q3TzzDONcq6SEUI8QTFdDsuugIxkTB9Qdkut3CImTh/K5TjX6Nga
 M/lw==
X-Gm-Message-State: AC+VfDzAOX8qbSnaqTpBSHUX1UwEPLZy7orvfydm5x/LiuhIWpGrX6hZ
 68Fj0KBmk51NssvctiV6cXdXKNm9kJj8MrwmD1qbXH4A8+247sL5RYPm02fE75LIE3dXK4tjREZ
 7ctuE67+tvbNQK52H2leQ2kjqcpv+kA==
X-Received: by 2002:a05:622a:20a:b0:3ef:3b04:b8d8 with SMTP id
 b10-20020a05622a020a00b003ef3b04b8d8mr21944624qtx.0.1682950179065; 
 Mon, 01 May 2023 07:09:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6EQhQzeKmKKePryo4RQpbygmSSl99ze11ezCSp1BVLP3bI/mb/qyJGZAJIZEMlbHcdkRdXTQ==
X-Received: by 2002:a05:622a:20a:b0:3ef:3b04:b8d8 with SMTP id
 b10-20020a05622a020a00b003ef3b04b8d8mr21944593qtx.0.1682950178778; 
 Mon, 01 May 2023 07:09:38 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j14-20020ac84c8e000000b003ef3df76ec7sm9430109qtv.93.2023.05.01.07.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:09:38 -0700 (PDT)
Date: Mon, 1 May 2023 10:09:33 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: Re: [PULL 07/13] async: Add an optional reentrancy guard to the BH API
Message-ID: <20230501140933.ijw26dswocmynh5k@mozz.bu.edu>
References: <20230428094346.1292054-1-thuth@redhat.com>
 <20230428094346.1292054-8-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428094346.1292054-8-thuth@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 230428 1143, Thomas Huth wrote:
> From: Alexander Bulekov <alxndr@bu.edu>
> 
> Devices can pass their MemoryReentrancyGuard (from their DeviceState),
> when creating new BHes. Then, the async API will toggle the guard
> before/after calling the BH call-back. This prevents bh->mmio reentrancy
> issues.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Message-Id: <20230427211013.2994127-3-alxndr@bu.edu>
> [thuth: Fix "line over 90 characters" checkpatch.pl error]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

<snip> 
>  void aio_bh_call(QEMUBH *bh)
>  {
> +    bool last_engaged_in_io = false;
> +
> +    if (bh->reentrancy_guard) {
> +        last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
> +        if (bh->reentrancy_guard->engaged_in_io) {
> +            trace_reentrant_aio(bh->ctx, bh->name);
> +        }
> +        bh->reentrancy_guard->engaged_in_io = true;
> +    }
> +
>      bh->cb(bh->opaque);
> +
> +    if (bh->reentrancy_guard) {
> +        bh->reentrancy_guard->engaged_in_io = last_engaged_in_io;
> +    }

This causes a UAF if bh was freed in bh->cb(). 
OSS-Fuzz reported this as issue 58513.

==3433535==ERROR: AddressSanitizer: heap-use-after-free on address 0x6060000427d0 at pc 0x565542b09347 bp 0x7fff2a4cf590 sp 0x7fff2a4cf588
READ of size 8 at 0x6060000427d0 thread T0
#0 0x565542b09346 in aio_bh_call /../util/async.c:169:19
#1 0x565542b0a2cc in aio_bh_poll /../util/async.c:200:13
#2 0x565542a6a818 in aio_dispatch /../util/aio-posix.c:421:5
#3 0x565542b1156e in aio_ctx_dispatch /../util/async.c:342:5
#4 0x7fc66e3657a8 in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x547a8) (BuildId: 77a560369e4633278bc6e75ab0587491e11d5aac)
#5 0x565542b153f9 in glib_pollfds_poll /../util/main-loop.c:290:9
#6 0x565542b13cb3 in os_host_main_loop_wait /../util/main-loop.c:313:5
#7 0x565542b1387c in main_loop_wait /../util/main-loop.c:592:11

0x6060000427d0 is located 48 bytes inside of 56-byte region [0x6060000427a0,0x6060000427d8)
freed by thread T0 here:
#0 0x56553eff2192 in __interceptor_free (Id: ba9d8c3e3344b6323a2db18d4ab0bb9948201520)
#1 0x565542b0a32f in aio_bh_poll /../util/async.c:203:13
#2 0x565542a6ed7c in aio_poll /../util/aio-posix.c:721:17
#3 0x565542380b4d in bdrv_aio_cancel /../block/io.c:2812:13
#4 0x56554231aeda in blk_aio_cancel /../block/block-backend.c:1702:5
#5 0x56553f8fc242 in ahci_reset_port /../hw/ide/ahci.c:678:13
#6 0x56553f91d073 in handle_reg_h2d_fis /../hw/ide/ahci.c:1218:17
#7 0x56553f91a6c5 in handle_cmd /../hw/ide/ahci.c:1323:13
#8 0x56553f90fb13 in check_cmd /../hw/ide/ahci.c:595:18
#9 0x56553f944b8d in ahci_check_cmd_bh /../hw/ide/ahci.c:609:5
#10 0x565542b0929c in aio_bh_call /../util/async.c:167:5
#11 0x565542b0a2cc in aio_bh_poll /../util/async.c:200:13
#12 0x565542a6a818 in aio_dispatch /../util/aio-posix.c:421:5
#13 0x565542b1156e in aio_ctx_dispatch /../util/async.c:342:5
#14 0x7fc66e3657a8 in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x547a8)

