Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E14CD828
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:43:23 +0100 (CET)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA5S-0006mp-M2
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:43:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1nQ9Hv-0001pT-0h
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:52:11 -0500
Received: from [2604:1380:4641:c500::1] (port=51026 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1nQ9Ht-0006ti-5X
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:52:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8178C6198C;
 Fri,  4 Mar 2022 14:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794D6C340E9;
 Fri,  4 Mar 2022 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646405519;
 bh=AT2JwFZK4R80fXfi6mI5Yy/+I2OZfe52iBjT/WcWcjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SYNM++vx40+cdt2Xkg8K72ecn6Kkx2kxHsfvGyZJyKjg0STGse0t+DYWUYExHBlAH
 1VeiiozmkqKDD+06880KW8xD8wimsbWao63B0q3wGnwyly6IHFo131DZsKP9v+fqxk
 8e9TrWNqAtlIh85e0sISD3PVzB8Sg34WhYFTqXQdEeFyATNzgzpxsKxX7Jg8cLsFqG
 5rqToCJVoMJbxVI6mskiADBvC8ma+b4H3pnQ2oIoSf2nejx3FSk2YeGaEXmoZV0DdI
 u10iP3MW+HJ0fqellsCdh2XhEoTfxh+QzXDOGiHoZXHWL80UJsDUPqdcof/ldXElx4
 RS0mnxQ1gPPJA==
Date: Fri, 4 Mar 2022 06:51:57 -0800
From: Keith Busch <kbusch@kernel.org>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH] qga: Introduce disk smart
Message-ID: <20220304145157.GC2824821@dhcp-10-100-145-180.wdc.com>
References: <20220304085407.1334358-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304085407.1334358-1-pizhenwei@bytedance.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: michael.roth@amd.com, philippe.mathieu.daude@gmail.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 04:54:07PM +0800, zhenwei pi wrote:
> +        smart->u.nvme.temperature = le16_to_cpu(log.temperature);

The 'temperature' offset is not properly aligned, so I think you need to
use an unaligned le accessor like 'stw_le_p()'.

