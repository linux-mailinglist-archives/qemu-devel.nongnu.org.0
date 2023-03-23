Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D26C5F36
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDtG-00024v-Ql; Thu, 23 Mar 2023 01:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pfDtF-00024m-7X
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:53:33 -0400
Received: from [209.195.0.149] (helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pfDtD-00062U-Ba
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:53:33 -0400
Received: by npcomp.net (Postfix, from userid 1000)
 id 7E34E1332D2; Thu, 23 Mar 2023 05:53:28 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1679550808;
 bh=Dt2NWnCb8pQfjCFVrovjs32kruRRzC1YiYdT6r4Su6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=wRppjIlvjUMYnWk8JEzntLNhg0SR/4k+t0Yj/VV+dgq5dhDo8khtHoY1OBXWjwUzD
 bs69s8DgMAB8x2HbDd43KColF/d7EmYsE0eloAgy+/BxVLi0UirOIP13pYigkNay6D
 l1BCr9tqcDbElBtMC/HmV7IVm33Jkh2Jwy7XHSNk=
Date: Thu, 23 Mar 2023 05:53:28 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Ben Dooks <qemu@ben.fluff.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <ZBvpWMguR89kfZDG@invalid>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
 <Y/zhZ4brfdQ7nwLI@redhat.com>
 <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
 <ZBnd4/UTH6CD5vx7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBnd4/UTH6CD5vx7@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Mar 21, 2023 at 04:40:03PM +0000, Daniel P. Berrangé wrote:
> 3 weeks later... Any progress on getting Red Hat to assign someone to
> setup Azure for our CI ?

I have the physical machine that we have offered to host for CI set up
with a recent version of fcos.

It isn't yet running a gitlab worker because I don't believe I have
access to create a gitlab worker token for the QEMU project. If creating
such a token is too much hassle, I could simple run the gitlab worker
against my fork in my gitlab account, and give full access to my repo to
the QEMU maintainers, so they could push to trigger jobs.

If you want someone to get the gitlab kubernetes operator set up in AKS,
I ended up getting a CKA cert a few years ago while working on an
operator. I could probably devote some time to get that going.

If any of this sounds appealing, let me know.

Thanks,
Eldon

