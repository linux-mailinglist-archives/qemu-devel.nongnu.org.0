Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090314B8D90
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:13:17 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMvb-0002U1-MZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>) id 1nKMsY-0001RX-Iu
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:10:07 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:51982)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1nKMsU-0006kc-Sg
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:10:04 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 1F02F72C905;
 Wed, 16 Feb 2022 19:09:57 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 03BED4A46EA;
 Wed, 16 Feb 2022 19:09:57 +0300 (MSK)
Date: Wed, 16 Feb 2022 19:09:56 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Message-ID: <20220216160956.e4hyfgxfsxjh72db@altlinux.org>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <20220214144351.dp57o6jyfvliwkos@altlinux.org>
 <20220215080137.021f6938@bahia> <1736989.e8qiMhLugc@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <1736989.e8qiMhLugc@silver>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian,

On Wed, Feb 16, 2022 at 11:30:12AM +0100, Christian Schoenebeck wrote:
> On Dienstag, 15. Februar 2022 08:01:37 CET Greg Kurz wrote:
> > On Mon, 14 Feb 2022 17:43:51 +0300
> > 
> > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > Why g_new0 and not just g_malloc0? This is smallest code change, which
> > > seems appropriate for a bug fix.
> > 
> > I prefer g_new0() for the exact reasons that are provided in QEMU's
> > official coding style docs/devel/style.rst:
> [...]
> > I'm fine with the acceptable version as well. The only important thing is
> > to fix the synth backend.
> > 
> > Cheers,
> 
> Hi, is anybody working on a v5 of this patch? If not I will send one this 
> evening to bring this issue forward, because it is blocking my queue.

I will send in a few hours if it's not too late.

Thanks,

> 
> Best regards,
> Christian Schoenebeck
> 

