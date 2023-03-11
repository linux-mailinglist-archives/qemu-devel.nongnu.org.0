Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5E6B5DCD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 17:23:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb206-00037p-Gj; Sat, 11 Mar 2023 11:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pb203-00036z-ND
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 11:23:15 -0500
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pb201-0001jH-Tp
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 11:23:15 -0500
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 264390361
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hcR2KKAZBJgkyhVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApD0hhjMFz
 mocWWqCb6qMMzakc4hzbYri/EgH7cKHxoJgTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0i1aYDkpOs/jY8Eg25ayo0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPinu41N2A6DLcX3eYmHUhl1
 6AAKTc0O0Xra+KemNpXS8Fpj8UnadD3ZcYR4yA/iz7eCvkiTNbIRKCiCd1whm9hwJATW6+AP
 4xAOGUHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBpvzOClFcvidABNvKNW/2UY+B5k320i
 WeBxEC6Gi0rFoOQnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN5nNro/FjqwqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXwDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:BePYXK2lWUwDARSS4cCE1AqjBSJxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4OxoS5PwOU80lKQFqrX5Uo3SOTUO1FHHEGgm1/qF/9SCIVy1ygc+79
 YFT0EWMrSZYTdHZITBkW6F+r0boOVvhZrY59s2uE0dLj2CBZsA0y5JTiKgVmFmTghPApQ0UL
 Ka+8p8vjKlPVgHc8ihAXEBfu7b4/nGjojvbxIqDwMurFDmt0Ll1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m992r1xPG0GfXzpJO3P/s0MFKCsCggtUcbm2EsHfmWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r1/BY22vphPp+g/4lBIj8WXrx1O0iWbq5ZeRfkN1N+NxwaZiNjfJ4Uspu99xlI
 pNwmKirpJSST/QgSjn4NDMdhdy0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZMIAvKrKQcVM
 V+BsDV4/hbNXmAaWrCg2VpyNuwGlwuAxavWCE5y4yo+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST/URcbl2CI46MIiK4y32MFDx2VCpUBDa/ZI8SjXwQlnMkfMIDdSRCdk1JV0J6c
 38uR1jxDYPkgnVeLazNdVwg2rwqSOGLHXQI4hlluREUrGQfsuXDQSTDF8piMeuuPMZH4nSXO
 uyIotfB7v5IXLpApsh5XyJZ3D8EwhvbCQ5gKdOZ7u1mLO9FqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YMFN9FqiVHP0iAXYHyqFQD22wbtgVKzBu+QDwokEMYNB9gATlFSi/8mObTlPqLY/ck
 dyKK7u1qm7uW6192DV6HgBAGsVMm9FpLH7F39arw4DNE35Nb4FptWEYGhXmGCKIxduJvmmZT
 K3Z24Hi55fA6bgtBzKUejXTV5yp0Fj2k6iXtMbhrCJ49vjd9cxEosmMZYBZjn2Kw==
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Mar 2023 11:23:08 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 br8-20020a05622a1e0800b003c0189c37e1so4589364qtb.18
 for <qemu-devel@nongnu.org>; Sat, 11 Mar 2023 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678551788;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bxnGNB6rW0fEazo/Lzx2gVdpJTPDhPrwU96NCONZRns=;
 b=J2zZUIDokRJSaJyY/X3ZHW9/npQ5RCtPtFcSH9bO/zqd2g26zGWCAtE7lIhDQ9EqrJ
 LVkQHQwA5trrNs1bFKk5VapB5mEzqFoQtbetqStyVRMW0kSXq5R83cOpPzluRw65wG86
 PmxuY0eJabzvxI7egkcsM7HO0q5niNcoabxqt+m7c152o5Ccdb4EuQD/FH6lw2eoSxyR
 I1onFKuYS99+l4xHiJQXPMbmB/dVDX/LQirLHJg0HrF2py23sYXXwVKS4SOa7z9c00su
 TbyNyMB1Mg6WoSc2MYFmR3SwuocyYuICd5yPCw4NkNB5srBzXmoNKqtvawHl6/llszoG
 5/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678551788;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bxnGNB6rW0fEazo/Lzx2gVdpJTPDhPrwU96NCONZRns=;
 b=ei4cuxsWoKNYa9q7kQc6cAoJF14rECGpDx7sh6qdQQl4lCMI3aEiPa5r4KVKQ9D8sz
 bVT3eYRe41HEa+zgLJDkQps+y4vVNRVe2VI40nYfFmspgiSGQ6h1u1CvAw0gB0xDpjeg
 C7LzCif6d7og0d9nRanx3OBcpCKR1IIdm7OWcJnlD9KAL+OJYLRU9covRZrXo4wCnG6S
 ytN772SicpFVqBX+Dtuull4asO5iR4tF4UDcF7UK9SKjgtIMYS8LU4QhvTZKmvMrbsIe
 ZPO2eNJucofcvIUg5mhtkV7F/PKep0qp3dNbSstx2+tg8HNEDMaaSKq0WrJiHxGGFdUy
 Npcg==
X-Gm-Message-State: AO0yUKVOYfdCDW/m9/nJmMDaIeY5jx/WRmGisJLe4HtbMsX2ErUk7yGb
 XBRr4cydU1K7Uao64YXiOgJPAHgM8/kow1SQLfubfXHuByXeYoVwyw8cl4MDtUX+FexmDQG61VE
 rU+17ZmFiABk3pjBLFNxjP5SZhCHFIw==
X-Received: by 2002:a05:622a:1647:b0:3b6:93fe:443c with SMTP id
 y7-20020a05622a164700b003b693fe443cmr49538654qtj.32.1678551788251; 
 Sat, 11 Mar 2023 08:23:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/m9KiIHrjH4le7PMxE8H4Ug/U2e4gyAGgh0Y7Vm5ArCUlU4vFUj7ilu6otqKEgpXOu/ZvfTg==
X-Received: by 2002:a05:622a:1647:b0:3b6:93fe:443c with SMTP id
 y7-20020a05622a164700b003b693fe443cmr49538633qtj.32.1678551787983; 
 Sat, 11 Mar 2023 08:23:07 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x26-20020ac8539a000000b003b63a734434sm2125773qtp.52.2023.03.11.08.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 08:23:07 -0800 (PST)
Date: Sat, 11 Mar 2023 11:23:03 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] virtio: fix reachable assertion due to stale value of
 cached region sizey
Message-ID: <20230311162303.nbw72mgbqb4zx3hr@mozz.bu.edu>
References: <20230302100358.3613-1-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302100358.3613-1-clopez@suse.de>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230302 1103, Carlos López wrote:
> In virtqueue_{split,packed}_get_avail_bytes() descriptors are read
> in a loop via MemoryRegionCache regions and calls to
> vring_{split,packed}_desc_read() - these take a region cache and the
> index of the descriptor to be read.
> 
> For direct descriptors we use a cache provided by the caller, whose
> size matches that of the virtqueue vring. We limit the number of
> descriptors we can read by the size of that vring:
> 
>     max = vq->vring.num;
>     ...
>     MemoryRegionCache *desc_cache = &caches->desc;
> 
> For indirect descriptors, we initialize a new cache and limit the
> number of descriptors by the size of the intermediate descriptor:
> 
>     len = address_space_cache_init(&indirect_desc_cache,
>                                    vdev->dma_as,
>                                    desc.addr, desc.len, false);
>     desc_cache = &indirect_desc_cache;
>     ...
>     max = desc.len / sizeof(VRingDesc);
> 
> However, the first initialization of `max` is done outside the loop
> where we process guest descriptors, while the second one is done
> inside. This means that a sequence of an indirect descriptor followed
> by a direct one will leave a stale value in `max`. If the second
> descriptor's `next` field is smaller than the stale value, but
> greater than the size of the virtqueue ring (and thus the cached
> region), a failed assertion will be triggered in
> address_space_read_cached() down the call chain.
> 
> Fix this by initializing `max` inside the loop in both functions.
> 
> Fixes: 9796d0ac8fb0 ("virtio: use address_space_map/unmap to access descriptors")
> Signed-off-by: Carlos López <clopez@suse.de>

OSS-Fuzz confirmed this fixed an issue:
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=52152

Never made a gitlab report for it because, it  seemed very similar to
some other issues
https://gitlab.com/qemu-project/qemu/-/issues/301
https://gitlab.com/qemu-project/qemu/-/issues/781
https://gitlab.com/qemu-project/qemu/-/issues/300

But apparently it was a different one.
Thank you
-Alex

