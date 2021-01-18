Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D652FA04C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:48:36 +0100 (CET)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1TxT-00010l-Fr
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TrJ-0007de-FJ; Mon, 18 Jan 2021 07:42:13 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TrI-0006Yu-22; Mon, 18 Jan 2021 07:42:13 -0500
Received: by mail-pj1-x1035.google.com with SMTP id x20so4334928pjh.3;
 Mon, 18 Jan 2021 04:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=Lk+EplPr4Qc05c7kq0DJyLBHh2yUCaTdSucSgKOCxTzFYReiuFdDvyrOIMjxxi2MLq
 5hSoU0sJrwG1ckOe70vhTwmZsEQgx+41+XS/TbOVXWFhPjE0mVGMgpShzcI8SWyJxvHQ
 fly4uJGnbVpb0cYeYuN1OUpP1xSxsuZZjMiS0UuWP2GVT+6G+P1nCGxBP/txAM4YKRAf
 FC4Mmm0rtJZZsk9PdaT9aXOb+D70t22aikxk2IWcTqxqAQfk99LEl7r5TkWDlXGm1Rxd
 nmaxUmmf41iS0aJet6REwJ3vkxBKYmvt92bGU69xyXs7akRiYxmp64qMWfbZB9Gi0Jr+
 /9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=Uv89a360FIi4lDg839jGhJD5JUHJZzGuK4aEC8o5fR5v0Wk3ROE5etrOf9qdWJR0eC
 K47GgBkb9aByaIM8QG4wErBMJaCi5o8W7m+KV3D/Ivgl45QIJUvv+8I7JtfCIvWjr832
 hPhq3QAv0NeOeDRN0wVLNnII99nITaGlYwk//xIrjSDtDOoF3ZjCf5ZzqO6mwpRTQSwH
 oLwMOufDTSEghOdBLfXeDue+Sl0IJJbvFfSjuLD0VLnEMPQErwX0uqQn6c8qJIrJirGb
 HXfUZJgOuZS4yTlIC+M5L3ppg4eRu9rAkhLx1P2333nA8BBtJ3Cely/6H1bbowqPjg+I
 dWRA==
X-Gm-Message-State: AOAM530H21sEf4Q8oc2Z/D1NlqMx32vLZLTbNosC1JocZbi9G1Eurifg
 Cbr43l7r+Gi4iJmBRMKbrPo=
X-Google-Smtp-Source: ABdhPJz4Pb8z4w8cEAYMxl6FQnLWX1kdA82JawQ6TyH9FWHxpHMIGHPbNhU6XJTrUkoY6EZ6of3D9A==
X-Received: by 2002:a17:90a:6ba4:: with SMTP id
 w33mr26989119pjj.32.1610973730436; 
 Mon, 18 Jan 2021 04:42:10 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a204sm2375634pfa.49.2021.01.18.04.42.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:42:09 -0800 (PST)
Date: Mon, 18 Jan 2021 21:42:07 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 03/12] hw/block/nvme: indicate CMB support through
 controller capabilities register
Message-ID: <20210118124207.GC18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-4-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsky@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

