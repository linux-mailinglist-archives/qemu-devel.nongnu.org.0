Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64B694CC3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbhI-0007WU-TW; Mon, 13 Feb 2023 11:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pRbgz-0007Vu-LY; Mon, 13 Feb 2023 11:28:38 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pRbgl-0000rm-Sx; Mon, 13 Feb 2023 11:28:36 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-52ec329dc01so150770147b3.10; 
 Mon, 13 Feb 2023 08:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8b+X2P1yGlmruOMU0rvAHEKfacIwCC/xngt49aGw2lo=;
 b=T/PwpB3F4VWnuHe4DCsMNdpqcvVholqCJp5rCe369JZoQ16RP4jXudqXnU7wQK7D0y
 AZYJT7TcaX2PPG3JiZpYvfmgGEMSU0HjnM0LTHvAmDG13rHb5facAVVwgDw7gsA1aThe
 OsmDXREsHCvhpYqfRqE/YT8Slmz19KKbXdo6uaE0aB+M0nvcnpDa3DcE8XaFAgQAxhlu
 IM+AoyOAXiGXNM6fjeVehkotXOteUKxrAYk/mMHAbOTY0wqEo1hiUTgNvOj6jVOUzvjb
 LPzV3nh7BHkNROVB/k553CPQqsbkgVomrnDL21HIlwwhlwk9S0fQJhX3xXKzD1/iTTrm
 DiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8b+X2P1yGlmruOMU0rvAHEKfacIwCC/xngt49aGw2lo=;
 b=WhzDDtKSHJsJDRptid+H00purXYLnRN8AmdNo90qappkdFcqxNNyeQmCB9GPa0A1XT
 IAxX8wQu5oAKXbrqNiexSZlaXRUJA6CFEJOeSsbUgPQXM6bmThyaRvZEOC4WAkEXykPs
 sRxRxV8ZV8PeN11lRjQvUm6FGMoJ+MCCC9nQZt5F7Ktn5Fqn8+d/u2dRYbnkioDE8gIg
 eIWIVMqXrr8FwZtebllHp6AKuh+PKP91nlwbjIripPG8Ris/vGPQUr/u+n5uCCYQxcRi
 OODUzLsMIIZe/3AheUMgJxf2HsBLINPkIn7XPhMgQnKaekYbM2TAOEGgrjmFbFCvXFIm
 MIMQ==
X-Gm-Message-State: AO0yUKXcmTXRpuFCtT40PI4qHmZPe3oaRZnZVeobXfN6KGKWLvTPT7tC
 sxwZekxc8m/CRkv2F6skf9JUL0DmZu4cwOoe8As=
X-Google-Smtp-Source: AK7set9u3ZKVeFfcSuo5X53ky0HquVkVkhbfDkO+4xvBF9ZvkhVJmOsDKW4M2nLDHZHtKUSaMK+0tfVQ2ZyAxobqyQA=
X-Received: by 2002:a0d:f581:0:b0:506:466c:480c with SMTP id
 e123-20020a0df581000000b00506466c480cmr3245151ywf.253.1676305702199; Mon, 13
 Feb 2023 08:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-2-fcagnin@quarkslab.com>
 <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
In-Reply-To: <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Mon, 13 Feb 2023 17:28:11 +0100
Message-ID: <CAF8_6KmYyCwKEoNx626uEKUJZAFB_MgLRHrTyeAkDdC4C2YfMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

> New files must all start with the usual boilerplate
> comment stating the license and copyright. Sorry I didn't
> notice this in previous rounds of review.

Pardon my naivety, since the new file only contains code from
'target/arm/kvm64.c',
should I just copy the license and copyright comments from that file
(and adjust if needed)?
I'm not able to find any particular procedure to follow.

Thanks,
Francesco

