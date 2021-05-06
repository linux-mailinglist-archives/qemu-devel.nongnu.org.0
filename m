Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039A374FA3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:55:41 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXvA-000198-7Y
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leXu1-0000fM-4q
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:54:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leXtx-0002fB-Iw
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:54:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so2413367wmv.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 23:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7G+jgUV9Y9CrtPr6PNPnkHvlprzGSMTDJCIxD3nvopM=;
 b=yjJDs0HLuHviZLiICiXxDL8268lLahNfVYy8qkEbwgm5vtmyiHH0YwaPFDbGh2yUI1
 hGjX+UB2YS0MaUy8EKtqlNmsETPCMzRb+x03GhCgeBOl+bmFJAKDHcovbA0HYtNPyf0G
 VFmfCwtU7eVyrYSitbU2epSrx45Vw4mIyslay3DhxPLl1OcMTn5cQNW4AOMwFIucy45A
 1pfNxLTK0KQ8CB5FO0QOVsfl4QDVhsWoBS4H7d3R16arshIwnkcZB1LJs/zsEOCGDBEN
 o+YZ2vkBPG6OQRqmRCmW02Itllc1akGQzzsaQ1rJrAQqaPqGLPtnA62RlRSSvCF6gqVs
 cA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7G+jgUV9Y9CrtPr6PNPnkHvlprzGSMTDJCIxD3nvopM=;
 b=SvxUz/oY+/Q+MVq1i0+Y9SRJKUCfhfVQNBr6tCNzZR6D7AJ32n3rdfroq6ajOy6fuH
 86UFmopXvc1JXWX3OT09lL2lH+9C4JR85+bWyjaBtrQj/U5RsWLc+JtqtQgQBUYFMRsy
 R903SE1NpNvdCBqMzpDKq/EzAYK7D2fKMuNuGxmBnAU77FIf7cIekfE4I5F2q8zQvhwN
 XIWPGiIbHzOm9NFR6g19tOAODLZ1D0KBx16UPOqyLM7oHZRsAnON4i6gfJjPYnfVSvk6
 XlfSx2Loe7KMIOePCLvZ+uzFGLqoUbDd+fH3dipeeI19cp1n6+ut4FTK1XeAhaKmnKNu
 QH6A==
X-Gm-Message-State: AOAM5309y20DTnFQvU4APfafepCh2pkph1Ir7/yGVQzKVg4rKWgFPQrB
 OCjkT0n+0xg1Qd4Wpr8rAkFRNw==
X-Google-Smtp-Source: ABdhPJzVpHUGdjQMeTJ3QiKjoBAt1J2G+mO1/mOp1OlBKwxbqD9D0F51sBtmDCGZuSqSsmzJhOTsWQ==
X-Received: by 2002:a1c:b786:: with SMTP id
 h128mr13249542wmf.119.1620284063894; 
 Wed, 05 May 2021 23:54:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm9127845wmj.8.2021.05.05.23.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 23:54:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1692F1FF7E;
 Thu,  6 May 2021 07:54:22 +0100 (BST)
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Help with record/replay 
Date: Thu, 06 May 2021 07:50:41 +0100
Message-ID: <87czu4nyht.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pavel,

I'm trying to get reverse debugging working to look at a Xen problem and
I'm confused about what is going wrong. I've converted by normal setup
which uses a ZFS block device to qcow2 so I have a place for the
snapshots:

  ./qemu-system-aarch64 -machine virt,virtualization=3Don -cpu cortex-a57 \
    -serial mon:stdio -netdev user,id=3Dnet1,hostfwd=3Dtcp::2222-:22 \
    -device virtio-net-pci,netdev=3Dnet1 \
    -device virtio-scsi-pci \
    -drive file=3Ddebian-buster-arm64.qcow2,id=3Dhd0,index=3D0,if=3Dnone,sn=
apshot=3Don \
    -device scsi-hd,drive=3Dhd0 \
    -display none -m 8192 \
    -kernel ~/lsrc/xen/xen.build.arm64-xen/xen/xen \
    -append "dom0_mem=3D2G,max:2G dom0_max_vcpus=3D4" \
    -device guest-loader,addr=3D0x47000000,kernel=3D$HOME/lsrc/linux.git/bu=
ilds/arm64/arch/arm64/boot/Image,bootargs=3D"root=3D/dev/sda2
  console=3Dhvc0 earlyprintk=3Dxen" \
    -icount shift=3D5,rr=3Drecord,rrfile=3Dxencrash.bin,rrsnapshot=3Dinit \
    -object filter-replay,id=3Dreplay,netdev=3Dnet1

but when I try to replay I get:

  qemu-system-aarch64: Snapshot 'init' does not exist in one or more devices
  qemu-system-aarch64: Could not load snapshot for icount replay

So do I need another qcow device just for snapshots?

--=20
Alex Benn=C3=A9e

