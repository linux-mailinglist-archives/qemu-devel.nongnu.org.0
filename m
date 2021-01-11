Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038892F1917
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:04:06 +0100 (CET)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyjk-0002a4-US
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1kyyfq-00087B-OQ; Mon, 11 Jan 2021 10:00:02 -0500
Received: from mail.mutex.one ([62.77.152.124]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1kyyfo-00012w-UF; Mon, 11 Jan 2021 10:00:02 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id B9A74BF4048F;
 Mon, 11 Jan 2021 16:59:56 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31n7mnM33THg; Mon, 11 Jan 2021 16:59:56 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id EE8D5BF4010A;
 Mon, 11 Jan 2021 16:59:55 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1610377196; bh=YdTUoUk+skkqNAaKlUTiQZsyezzqhs0DzOvszAagqMQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UqNcLOAvJ/IxbvZxM2D8iAabYEQPDAMF5R+fPBVVucPDK5gAdv4zPMHAeZi8n/i2W
 TSbHxIgBOjEYlQXByHN8k4JUh0Zm6mCqYP+IB0ksVW5DK9fM+nOivFkH5EcwEvxcpr
 NJ7uysxeauGGiEVxmYRiominuJNFFBJa9kh4y8z0=
From: Marian Posteuca <posteuca@mutex.one>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] acpi: Permit OEM ID and OEM table ID fields to be
 changed
In-Reply-To: <20210106182430.6bf1823a@redhat.com>
References: <20201230221302.26800-1-posteuca@mutex.one>
 <20210106182430.6bf1823a@redhat.com>
Date: Mon, 11 Jan 2021 16:59:54 +0200
Message-ID: <87bldvldsl.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> overall looks good.
> Please add a test case for it, see
> tests/qtest/bios-tables-test.c for description how to do it
> an/or at
>   "[PATCH v3 08/12] tests/acpi: allow updates for expected data files"
> and follow up patches on the list.
When you say add a test case, do you mean only updating the binary
files in tests/data/acpi/{microvm,pc,q35,virt} according to the steps
at the start of the file bios-tables-test.c? Or do you also mean an actual
test case to be added in bios-tables-test.c?

Also the step 6 described in bios-tables-test.c mentions that the diff of
the ACPI table must be added to the commit log, but my change touches
all the tables for all architectures so that would mean that I would
have to create a huge commit log. How should I approach this?

