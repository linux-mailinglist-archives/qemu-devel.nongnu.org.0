Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127EC6C3698
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peeWv-0001eD-2Q; Tue, 21 Mar 2023 12:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1peeWr-0001ci-Ms
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:08:05 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1peeWo-0001BJ-O8
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GWDLzT5oo7xZAobUaKBLN1dAXJ9uGKix9SgY90QoKk8=; b=AZTUYpovrDX2qhGqz46Vuv2mxx
 7pGim013NpYj6+4jtjmgsSTRkh7lJmwM9KKmxq4xHc/+Mx6RBl95kHQw7sC6OLVWrkFVgULHNfZW4
 IZ1EtzrYhaJD1SY91S709H7tN7hxhrIm60d7gvlVu0AoXKVWZzk6nSWpPnJ5rpRpGVsk=;
Date: Tue, 21 Mar 2023 17:06:52 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 06/10] includes: move irq definitions out of cpu-all.h
Message-ID: <20230321170652.170d1741@orange>
In-Reply-To: <20230320101035.2214196-7-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-7-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 20 Mar 2023 10:10:31 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> +#define CPU_INTERRUPT_HARD        0x0002

Out of curiosity, do we have a policy when to use `const` globals as
opposed to `#define`?
In theory, if a constant is never used in any preprocessor directive,
we could turn it into a global `const`.

It'd be nice to reduce the pre-processor usage, sometimes I end up
debugging build issues by taking a compiler's command line and adding
`-E`, and the less you use the pre-processor, the better.

Reviewed-by: Alessandro Di Federico <ale@rev.ng>

--=20
Alessandro Di Federico
rev.ng Labs

