Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920C84B8DBF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:21:46 +0100 (CET)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKN3o-0007m8-GJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKN2R-0006ym-9y
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:20:19 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKN2P-0000cb-DV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TyI+r3ynMkguZfMLNorVgO9+UrG79d8igAzcs9ddTSE=; b=lr7weY//Pnu6SVVPd9dYdxlmIn
 CVuB3MhMyLji9SNNyVvQKfbqoJg3g0y01MXzCQrEM+MVhLQtrGZ27tfnp80d1jN6xa6vANJtM3E5X
 hU7/6/1LNwyAi00+76zkZXP4y9hnlYT5J1P1AhJX4dO42Oc5aVuTU8L1ipKPzJhCqYw8vH40LOkd6
 XtHKD+UOjppmlbDfKD3pXxWy8G0G4FF9tB80Spjx9BLpa5UC7IPwXTDk24n4pkcZUuHmZv3IKfACb
 PSdd3TxJrIQpztO3H+047bL8crGypQUWPIt2AuWzbeWo+LuXjScxPP/zy972cRz5LKHbFlrXbKnDy
 ANLO15AEszgAUmtkIe+SSyGk80l/Kds+sI5FwYzZaBzpb1gyiZ1DYT/d11A9ask0iNMQEMBAeB/K4
 66T20gyjlv9Z9leA9PLCGH8NsTKZBQnAvNdECBew3EHEySpza6doOjhUeXM4BHNo8EismDCSuHJRK
 7CrgRXusuLzvz1hpUgLMqeM7CZAnW0Gzu699nvQ9iY1/HJwXMgZath91VnWUZ+7pcFtQ/SaZ1Mufu
 QBSwRuEvjRLDoW0Gr1KwAiodNElph6bAnU4wP9OTjfwiidcB3/uEgzdIyrMnly1tgSi6mAOkQPXCl
 3pPyFKitUIDBROE1jytivJjWyDjxQ3xYfgy/RTk0E=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Date: Wed, 16 Feb 2022 17:20:12 +0100
Message-ID: <22849366.2vcfeukOcY@silver>
In-Reply-To: <20220216160956.e4hyfgxfsxjh72db@altlinux.org>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <1736989.e8qiMhLugc@silver> <20220216160956.e4hyfgxfsxjh72db@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 16. Februar 2022 17:09:56 CET Vitaly Chikunov wrote:
> Christian,
> 
> On Wed, Feb 16, 2022 at 11:30:12AM +0100, Christian Schoenebeck wrote:
> > On Dienstag, 15. Februar 2022 08:01:37 CET Greg Kurz wrote:
> > > On Mon, 14 Feb 2022 17:43:51 +0300
> > > 
> > > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > > Why g_new0 and not just g_malloc0? This is smallest code change, which
> > > > seems appropriate for a bug fix.
> > > 
> > > I prefer g_new0() for the exact reasons that are provided in QEMU's
> > 
> > > official coding style docs/devel/style.rst:
> > [...]
> > 
> > > I'm fine with the acceptable version as well. The only important thing
> > > is
> > > to fix the synth backend.
> > > 
> > > Cheers,
> > 
> > Hi, is anybody working on a v5 of this patch? If not I will send one this
> > evening to bring this issue forward, because it is blocking my queue.
> 
> I will send in a few hours if it's not too late.

Great! I would have been also just able to do that in several hours.

Best regards,
Christian Schoenebeck



