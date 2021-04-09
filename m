Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0224359CC4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:13:02 +0200 (CEST)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUp4P-0001XH-NY
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lUp2a-0000Oi-Qa
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:11:09 -0400
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:48534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lUp2W-0001RE-KT
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1617966664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mV5wkRhTj1XR3mr5lXH6PkobsVTQTCIQ/d/jDKmZOig=;
 b=b5gffxWf/VvfcUQEZ18E/skJ6gpn1QNWvlHLkUFPNHnidvzr5fLwWhcS
 4Yo77L+kIFyN6O5sRCJ4HteRgJsETIdeZmXEuApEMLpp22DmcyCqytdL7
 76QojRbYoV4V0EjWy1umoniY+Sa4bBzMa3oj/WhqTtPqwEozjDnF2SImg Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vi7MDkjMAv45IhMxTjeXx6J/XnIDuVRnuvgfs9sclh/X1K0sxSyeF4THxvdboaly+NMvFwrPki
 dnGu6GyF93xTdCLg7VWslQRkD1WiCMTW9a7pYgVlUhow7iLrsh/z7gF8zzAJyRRSmVAMllbbAu
 7yQPv0jmwC05HFzSIHPOP/Q1nruI8AqFtGOa+Fg/vmTG9KmFktzDkGfbyuzx6gxoFSY+F0MrJi
 zi4MpFK4eTVZ/UNhxvb8djCmry/JJD0/vIUKvq7fZg397UmZO7Pkg8/ZhevMbLFBvsxClxO6Os
 N0U=
X-SBRS: 4.0
X-MesageID: 41637793
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:N7TN/61kQmel9KuES08l1AqjBAIkLtp033Aq2lEZdDV+WKWj9v
 yGtvIdyBPylXI9WGs4n8qBJamHRhrnhPlIyKMWOqqvWxSjhXChK5ts4ZCn7zrrHSD/8eA179
 YHT4FVDtrsAV9myfvr+QXQKadF/PCr+L2l7N2z815DVgdvApsO0y5YDUKhHlRyVE16A/MCZe
 Ohz+5mgxblRngNdMS8ARA+Lo3+jvnGjojvbxJDJzNP0njssRqS5LT3EweV034lOlslq9of2F
 PInADj6qKov+vT8G6/60bp44lLg9yk89NfBaW3+7AoAw/xgQWlbpkJYd2/lQ0yydvA1GoX
X-IronPort-AV: E=Sophos;i="5.82,209,1613451600"; d="scan'208";a="41637793"
Date: Fri, 9 Apr 2021 11:59:14 +0100
To: George Dunlap <George.Dunlap@citrix.com>
CC: Stefano Garzarella <sgarzare@redhat.com>, John Simpson
 <ttr9droid@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: An error due to installation that require binutils package
Message-ID: <YHAzgmeVXHUZrgwd@perard>
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
 <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
 <20210330124646.jl4re5srmbzhkipm@steredhat>
 <2BBB0D5A-87FA-49A7-AA75-08CB20078D49@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2BBB0D5A-87FA-49A7-AA75-08CB20078D49@citrix.com>
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=anthony.perard@citrix.com; helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Wed, Mar 31, 2021 at 11:03:55AM +0100, George Dunlap wrote:
> [Dropping some irrelevant cc’s]
> 
> > On Mar 30, 2021, at 1:46 PM, Stefano Garzarella <sgarzare@redhat.com> wrote:
> > 
> > Hi John,
> > 
> > On Mon, Mar 29, 2021 at 09:46:49PM +0300, John Simpson wrote:
> >> Hello,
> >> 
> >> Kindly ask you to have a look at this bug.
> >> Thank you for your replies.
> > 
> > It's already fixed in QEMU upstream and the fix will be released with the 6.0 version next month (the rc0 is already available):
> > https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53
> > 
> > I guess xen-4.14.1 is using an older version, so if you want you can backport that patch in your version, the change should be simple.
> 
> Anthony,
> 
> Is this the kind of thing we could / should cherry-pick onto our qemu-upstream branches (both 4.14 and 4.15)?

Done, I've backport the build fix to both staging branch.

Thanks,

-- 
Anthony PERARD

