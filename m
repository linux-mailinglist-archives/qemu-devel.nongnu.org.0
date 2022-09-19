Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263A5BD16B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 17:48:58 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaJ0z-0008PE-1r
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 11:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1oaIQJ-00033w-Cu; Mon, 19 Sep 2022 11:11:03 -0400
Received: from out0.migadu.com ([94.23.1.103]:61388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1oaIQG-0000b1-6e; Mon, 19 Sep 2022 11:11:01 -0400
Date: Mon, 19 Sep 2022 17:10:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1663600255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6VNrPMZk2oYZl8Kyyhs50ZrHrkKLgAs8UjT+ZS8d8s=;
 b=r7CqAmKaQxqObb0KeFKWfHvmgIYg5vGzswzAO9ld5OX2wK0XnaWd0TO2QY6FcJCa7ATWGc
 Z7PnB9VoTK/d5TkqySwgo16MeW0YEsan+KqaoeON2+kyvxMkn5unoB2emLPdNNKEk+dEdu
 81M01VhHFpfpFOsAUnYAT9qREdAz9x4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, andrew.murray@arm.com,
 andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v4 07/12] arm: pmu: Basic event counter
 Tests
Message-ID: <20220919151049.jtujswjyv5k34log@kamzik>
References: <20200403071326.29932-1-eric.auger@redhat.com>
 <20200403071326.29932-8-eric.auger@redhat.com>
 <8fa32eeb-f629-6c27-3b5f-a9a81656a679@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fa32eeb-f629-6c27-3b5f-a9a81656a679@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Received-SPF: pass client-ip=94.23.1.103; envelope-from=andrew.jones@linux.dev;
 helo=out0.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 11:44:35 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 19, 2022 at 10:30:01PM +0800, Zenghui Yu wrote:
> Hi Eric,
> 
> A few comments when looking through the PMU test code (2 years after
> the series was merged).

Yes, these patches were merged long ago. Now you need to send patches,
not comments.

Thanks,
drew

