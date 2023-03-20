Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE126C1336
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:25:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFVd-0006oz-Nv; Mon, 20 Mar 2023 09:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1peFVb-0006op-Ja
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:25:07 -0400
Received: from ciao.gmane.io ([116.202.254.214])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1peFVZ-0004wQ-Ub
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:25:07 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1peFVV-000AEv-OX
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 14:25:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: Milan Zamazal <mzamazal@redhat.com>
Subject: Intent to add a VirtIO SCMI device
Date: Mon, 20 Mar 2023 14:12:38 +0100
Message-ID: <87wn3bwoqh.fsf@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Cancel-Lock: sha1:1D5nezCo6UiepAbmY9LXY9HTO7c=
Received-SPF: pass client-ip=116.202.254.214;
 envelope-from=gceq-qemu-devel2@m.gmane-mx.org; helo=ciao.gmane.io
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi,

FYI, I intend to create patches to add a VirtIO SCMI vhost user device
to QEMU.

As for the vhost user daemon part, I wonder whether there is already
something publicly available, which could be used or benefit from
cooperation.  If not then I'll start making my own implementation.  At
the moment, I don't need anything fancy requiring kernel changes or so,
I would probably aim for stuff accessible via /sys/bus/scmi_protocol and
possibly stuff exposed via VirtIO SCMI some way.

Thanks,
Milan


