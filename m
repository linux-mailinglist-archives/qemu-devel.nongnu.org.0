Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED72414712
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 12:56:32 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSzvS-0004aF-Nz
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 06:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSzu2-0003kq-CB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:55:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSzu0-00087h-BN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:55:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id w17so5377199wrv.10
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=p/shQS68/YGywWxAsAVUUxnpd22nzEJE1moktyZV4S8=;
 b=IwefvRncBidtDXa71H7riBwzgMoeGmd5DEH6em+k5FZ0i5m1YQWDRBVK8Zxx5X8ZOM
 7RYaQAdzAF//gyXLLHZqqVpoOnvGuKYihKyfNN2jtC93EiBqhBV5CHMR3FHv9i8o7u5g
 lQ0DPfopktv639iqxDFKv53xoffVcuMLmDj3poZQeAbEcw46H4AyWFELpwwF8qesqs8V
 J1sfyGFsbzPTjGOvSXIGmJ/sU4omFEXQc909WFs4TC/IH/faVgAvrSQJYhAhOnsWQ1pU
 Dr0IWt1Ko8t3F/YII4KRPTdlyLQdZA8WPyMB8hhfR8YaCNuDCpAcXlDtciJRghPt56+O
 d14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=p/shQS68/YGywWxAsAVUUxnpd22nzEJE1moktyZV4S8=;
 b=M14PS76nKOGy7K4I4Sw6VULtWu8iXolz1uKhv4F1I7qOVSZxHG+Uf/Hao7f7M3B63c
 uiHCZg8W2nPhCrJKKWVnzXmYdufh3hYXooXUwb/A1FhhQsHdxtWy4y6KDKVUD6V4K2iy
 MD6GSPHLGtnO8YPXy4gD3EUzr12k7or4PgrSEAV4zR85yIl0rorijrjxx9YdsHV5t6po
 oibNS51gFk1zFu3nXQYi7umMk9h1HjaDu6yXWXFbTCBJ6yNIFslZxi6Lhp9MoiTESqBk
 p+8qQHMfjuhZeRimgvMHxetJycJU1947ofXq0AG/f9XZSvYa77fyxNBswMyoLs3R/inB
 yOqw==
X-Gm-Message-State: AOAM531o4CKKbUqJSxuik5YJaHCE4NhVP1yZZm5gOoZ01r0nSHPql9lz
 ZWKugAymkQ9q9DWm6WW+kVsvuA==
X-Google-Smtp-Source: ABdhPJwHQrpfF1uPkhPFlVH71TlEmrg5D6+pP9b47gjYg6yFrw95AEw1z71ILCVzbfl+8YOh8MYaNg==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr9955760wmh.46.1632308097815;
 Wed, 22 Sep 2021 03:54:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x14sm1619817wmc.10.2021.09.22.03.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 03:54:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5745E1FF96;
 Wed, 22 Sep 2021 11:54:56 +0100 (BST)
References: <CAK7rcp9HjoCVbFmT9rwAteAVdCCMgobt1jvCLuhL3CCBKJZSsA@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Subject: Re: Change TCG cache size?
Date: Wed, 22 Sep 2021 11:47:21 +0100
In-reply-to: <CAK7rcp9HjoCVbFmT9rwAteAVdCCMgobt1jvCLuhL3CCBKJZSsA@mail.gmail.com>
Message-ID: <87a6k4op6n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> Hello all,
>
> I just want to ask this one question: if I change the qemu tcg cache
> size (TB_JMP_CACHE_SIZE), will that force any errors at run time?

Hopefully not - for both user-mode and softmmu we take some care to
ensure tb_jmp_cache_hash_func and tb_jmp_cache_hash_page return
appropriately masked values for the table lookup.

What has not been done since Emilio's work in 6f1653180f (tb-hash:
improve tb_jmp_cache hash function in user mode) is a deeper look at the
hit rate and bounce rate of the softmmu jump table hashing. Any
suggested changes will need some benchmarking to show what difference it
makes.

--=20
Alex Benn=C3=A9e

