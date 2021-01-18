Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A52FA0A7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:03:04 +0100 (CET)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UBT-0003jv-N2
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U7d-00028v-Vq; Mon, 18 Jan 2021 07:59:06 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U7b-0005Qn-Pn; Mon, 18 Jan 2021 07:59:05 -0500
Received: by mail-pj1-x102f.google.com with SMTP id b5so9760581pjl.0;
 Mon, 18 Jan 2021 04:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UBaXB4xuaCxesorXs2P7VE03FO1Ru5v0trCr+yS6j+I=;
 b=Z/zWpEJ5bCas33GpQY7M9CRBi9ZWnh9BxBG1BDdDsGdv9WFixGFOYoJU4UVn+aGdiR
 L5eLQ1CeGsYkqD7FnM1Dca9hSX3dvcDxgewFAoLhlEZuSp4ACvD16GrZiENYTt8pN5lF
 6+picrMSRlq4hnG1BIxAfE9UWYFAy+tALm1M9Ed9YKbhdq/LbOarCkvrS12BUfRFc8xJ
 nH08CPatgMwdjkt58tkpNlcqp2ailCb+SYonjtujjM238F2V5fdZFn3eRAkHKP6w0cWc
 v/ADja+m1AfkFw5l9uQojniS7QCTxpee4fwXFaAAmYu0kM4aiEvQ1IN4IM22j5b3arfa
 RqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UBaXB4xuaCxesorXs2P7VE03FO1Ru5v0trCr+yS6j+I=;
 b=eFMmW9u6RTD6tKQfGCoOsafB14TE5H74L6GrT2fGRSwohIYDLeiZ8joBVHS0aryr8E
 QS9aKchLpsgVlW1YMSzpPJaDa0xQtKGcUa5hGJCjg75mi2m3Ts9XyJxP2rnj2NrBxduZ
 ELtWYSJ3rrp2a2FKIjFsIb/XXamAhemRIzVxqfGXjwq7OImn0b0UHpBrhabmcW3GBLzN
 u5VEQKYpRM569vd8NG0c3StIKjcscMpI22y6HgJ7EmbP83xUdMk/3L+jCoh6n07TkhVd
 uK2EML2EFksaQvGghyptnBr3rEGg7eY9lcem5qbIJoCyXkLR+cow/89GBoh2PB+zooc6
 cmiA==
X-Gm-Message-State: AOAM532oEZfXKvZ2BPGK2seeWgaRPqxCZgckeuIAJqZY4dw1un1WPbTa
 SUHRPMoB2JGMgIPw37QFE08=
X-Google-Smtp-Source: ABdhPJw6CQc0m+YQ6/gUQGGHgNdaKmZSEYTigSVOrHZeFX7eNH3cLIC1Uv0hYkphwkNRzyJyacaheA==
X-Received: by 2002:a17:90a:b78a:: with SMTP id
 m10mr7630317pjr.164.1610974741933; 
 Mon, 18 Jan 2021 04:59:01 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id w9sm15670166pfj.128.2021.01.18.04.59.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:59:01 -0800 (PST)
Date: Mon, 18 Jan 2021 21:58:59 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <20210118125859.GH18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-11-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102f.google.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 21-01-18 10:47:03, Klaus Jensen wrote:
> From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> 
> Implement v1.4 logic for configuring the Controller Memory Buffer. This
> is not backward compatible with v1.3, so drivers that only support v1.3
> will not be able to use the CMB anymore.
> 
> Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Yes, CMB in v1.4 is not backward-compatible, but is it okay to move onto
the CMB v1.4 from v1.3 without supporting the v1.3 usage on this device
model?

