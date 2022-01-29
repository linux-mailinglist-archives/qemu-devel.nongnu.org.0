Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13DA4A31A9
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 20:44:27 +0100 (CET)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDte6-0000O7-DW
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 14:44:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDtbp-0007vh-TN; Sat, 29 Jan 2022 14:42:05 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:49596)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nDtbm-0001gk-Kw; Sat, 29 Jan 2022 14:42:05 -0500
Received: from spider (unknown [176.195.59.180])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id A15661BF470;
 Sat, 29 Jan 2022 22:42:08 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/alpha: Fix target rlimits for alpha and
 rearrange for clarity
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
 <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
Date: Sat, 29 Jan 2022 22:41:52 +0300
In-Reply-To: <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu> (Laurent
 Vivier's message of "Thu, 27 Jan 2022 14:49:30 +0100")
Message-ID: <87ilu2l473.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: none client-ip=213.131.7.21;
 envelope-from=belyshev@depni.sinp.msu.ru; helo=depni-mx.sinp.msu.ru
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <laurent@vivier.eu> writes:

>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> Applied to my linux-user-for-7.0 branch.

Thanks!

> perhaps you could also add RLIMIT_RTTIME (15) and update target_to_host_resource()?
>
> The next step would be to move the generic definitions to a new file
> in linux-user/generic/target_resource.h and the specific ones to
> linux-user/alpha, linux-user/mips and linux-user/sparc.

Will submit in a moment on top of the previous patch.  End result is cleaner
but slightly bulkier.

