Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC5232228
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 18:08:28 +0200 (CEST)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0od1-0007S9-3Q
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 12:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1k0oZl-0003F0-Td; Wed, 29 Jul 2020 12:05:06 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1k0oZi-00019O-Oq; Wed, 29 Jul 2020 12:05:04 -0400
Received: by mail-pg1-x544.google.com with SMTP id o13so14497277pgf.0;
 Wed, 29 Jul 2020 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tCRC4BWdPKFmdFcgkqLu+sgM1ZXvWAb2jvhgPT95/7I=;
 b=D0e3UZvOuPlYsaJBvCdI48k06wh5uaAmeQKaX0+KtscYV5v+QAj0juPm6snRgmRMNh
 QAj7VZvsP/kG18RRSlE0IubGmHkBEm5OuRSJs3QAiQIrQFHoFzU/v1PetmH4gomQ5C/W
 5FSPk50vxlRS6gUUXpeYi/VRp5EFwd7ICAJGd8glimQX1dWOkuIsqvADWeKewTRhInJa
 8B3THb2FCCMxvDLbzu26PuaJaN0ZZB5qoNKdHW5AwPFP20ih1fBBUvrt0wcqcqfHNAgO
 a5UzLu7MKi66V33L3d5g8QlGepNTx/zxqYlKFE4SPFT8DcbwFq//NbQ4qts1iGi6Bv8/
 c3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tCRC4BWdPKFmdFcgkqLu+sgM1ZXvWAb2jvhgPT95/7I=;
 b=Ik0tF4+izDuCEZo0mG4tvHh7siywgckKO8tInQAKWtQoR4e3Jz0MObYE/BWKJfqoep
 jdtNCfFmopIcNjGm/qSXUOMieiqdWgQivjU6kZrpPrz5KjOtqWEFmXB9oiCg2Sud1d51
 k8dbpewq1wOsDANMI2P8AaYvXYGoUld71LlpVSYO3eUA3mVH5BYaY7As7AnM0l5m74Dv
 37xZrY3LInf848BD1MvnIq9thB/YKEp8iRiRMm1v8oEifRLTvQaf8GOBbD6LNAdVezdt
 RTiY2guRCtq1ysPL3w/xJAAek1lBWVUr8sGZ2ndRT4bHlVS2fDuGhZD+/HgcG4439IfA
 DuHQ==
X-Gm-Message-State: AOAM531SV3bR7IzkGmLyWdb/cD6ljf5cSYTbe/8/IzfX2PUu4LXuK6al
 I2mIq+FVW6+DdZrXCE/0tm6evLDming=
X-Google-Smtp-Source: ABdhPJxVXOxzh+2BzFM6KWTNscxFoVG3yive7wAT3QGYW7LF+GeuaOkwEL1+08y7OQGMG0Lhc8K+iA==
X-Received: by 2002:a63:560f:: with SMTP id k15mr29000670pgb.162.1596038700355; 
 Wed, 29 Jul 2020 09:05:00 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id s8sm2870544pfc.122.2020.07.29.09.04.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 09:04:59 -0700 (PDT)
Date: Thu, 30 Jul 2020 01:04:58 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 12/16] hw/block/nvme: refactor NvmeRequest clearing
Message-ID: <20200729160458.GK14876@localhost.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-13-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200720113748.322965-13-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-07-20 13:37:44, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Move clearing of the structure from "clear before use" to "clear
> after use".

Yah, agree on this.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

