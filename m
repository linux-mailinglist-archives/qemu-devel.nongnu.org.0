Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE2436EB8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 02:13:35 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdiBg-00039K-8Q
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 20:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bob@proulx.com>)
 id 1mdiAW-0002Ip-UR; Thu, 21 Oct 2021 20:12:20 -0400
Received: from havoc.proulx.com ([96.88.95.61]:40722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bob@proulx.com>)
 id 1mdiAV-0007e5-7A; Thu, 21 Oct 2021 20:12:20 -0400
Received: from joseki.proulx.com (localhost [127.0.0.1])
 by havoc.proulx.com (Postfix) with ESMTP id C1268BD8;
 Thu, 21 Oct 2021 18:12:15 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proulx.com;
 s=dkim2048; t=1634861535;
 bh=dWD9OGvcj/JcVbCg7UuD1O0B3O1Bm4DD+9NZmth4nwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qE3d0Faf89Xm/K1SpcibwQ9ECafBUCWCknYiDKhV33VAmo24W5isxDegxvHbNZegV
 3xEYcCretJX7oJqqD93wKQmkm3IWO7gzt7lxDkfDkEX4VynNrbEGA2Q013+vCaOb/F
 6/kq2bEDGJ1fToVKtSktT1UlP5Q01JIeNq6mqZYcjHJMFltxtK8ACllFy3jQkLBh+6
 plpzUO29brZqOu6h5aQ5m63bWhzwgJieFgcB9lMz22y/FhLtgd5L3WjKDrtg/OMGXj
 EGbRKqjg995DDXd0Kj7mSePAv48M9gjRBjmGTSqpj42ruO1hQ9nWLmskuOI1+ato7g
 QCGzlAwzuENHw==
Received: from hysteria.proulx.com (hysteria.proulx.com [192.168.230.119])
 by joseki.proulx.com (Postfix) with ESMTP id 8F8FE7A033;
 Thu, 21 Oct 2021 18:12:15 -0600 (MDT)
Received: by hysteria.proulx.com (Postfix, from userid 1000)
 id 76DFA2DCA1; Thu, 21 Oct 2021 18:12:15 -0600 (MDT)
Date: Thu, 21 Oct 2021 18:12:15 -0600
From: Bob Proulx <bob@proulx.com>
To: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
Message-ID: <20211021174735980949462@bob.proulx.com>
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
 <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
 <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
 <da597248-8e06-2f14-b39e-67c457aa5a71@linaro.org>
 <49d356da-30dd-6460-73fa-8a9e165a9091@loongson.cn>
 <143c6683-a84e-c3b3-ab67-33db648c6c0f@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143c6683-a84e-c3b3-ab67-33db648c6c0f@xen0n.name>
Received-SPF: pass client-ip=96.88.95.61; envelope-from=bob@proulx.com;
 helo=havoc.proulx.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 peterx@redhat.com, karl@freefriends.org, laurent@vivier.eu,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 qemu-devel-owner@nongnu.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WANG Xuerui wrote:
> Song Gao wrote:
> > Account yangxiaojuan@loongson.cn It seems that she has been
> > blacklisted. Xiaojuan sent 31 e-mails, which were not displayed
> > since the 21st one, people who don't have a CC can't read all the
> > emails,  and xiaojuan reply can't be in qemu-level@nongnu.org.

I see 18 mails of a patchset accepted and delivered on 10/19 just two
days ago from yangxiaojuan@loongson.cn.  Therefore it does not seem
like there is a problem on the mailing list side of things.

> > Richard and Karl,  How can we solve this problem?
>...
> As for the supposed "ban" on Xiaojuan's account, we cannot diagnose this
> without mailing list owners' help; maybe it was just some kind of automatic
> temporary ban, or even connectivity problem on Loongson's side.

The list owners were CC'd on the previous message and this one.  That
includes a team of people which includes both Karl and myself and
others.  It appears I have read and responded to this message first.

The rejection message that was included said:

    2021-10-20 09:33:59 (in an unknown timezone)
    Can not connect to recipient's server because of unstable network or firewall filter.
    rcpt handle timeout,last handle info: Can not connect to nongnu.org:2001:470:142:3::10:25

I suggest opening a help ticket on this issue by sending a new message
to sysadmin@gnu.org where the FSF admins can look into the problem.
They are the only ones that can look at the incoming mail logs.
Perhaps they can tell if there was anything logged.  It would be good
to know the exact time that the connection problem occurred.

Bob

