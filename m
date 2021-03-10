Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8EC3332AA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 02:15:18 +0100 (CET)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJnRV-0002b2-5j
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 20:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lJnQA-00029p-HN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 20:13:54 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:50168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lJnQ9-0004NS-01
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 20:13:54 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 897413AE;
 Wed, 10 Mar 2021 02:13:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWAuys97vFO3; Wed, 10 Mar 2021 02:13:49 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 9DF5776;
 Wed, 10 Mar 2021 02:13:48 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lJnQ3-00CaJk-Dq; Wed, 10 Mar 2021 02:13:47 +0100
Date: Wed, 10 Mar 2021 02:13:47 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH v2 4/4] slirp: feature detection for smbd
Message-ID: <20210310011347.rs4f622uf5nd2af2@begin>
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-5-j@getutm.app>
 <b1c93f8e-5c4c-9ad8-e9b3-a846fe9f5661@redhat.com>
 <CA+E+eSCPTbqsXYqtfVKbVDVCHjF12keOoSYnKFdu0+ugyuj12Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+E+eSCPTbqsXYqtfVKbVDVCHjF12keOoSYnKFdu0+ugyuj12Q@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 897413AE
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_ALL(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Joelle van Dyne, le mar. 09 mars 2021 10:11:31 -0800, a ecrit:
> On Tue, Mar 9, 2021 at 6:09 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > On 3/9/21 1:27 AM, Joelle van Dyne wrote:
> > > Replace Windows specific macro with a more generic feature detection
> > > macro. Allows slirp smb feature to be disabled manually as well.
> > >
> > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > > ---
> > >  configure   | 26 +++++++++++++++++++++++---
> > >  meson.build |  2 +-
> > >  net/slirp.c | 16 ++++++++--------
> > >  3 files changed, 32 insertions(+), 12 deletions(-)
> >
> > Hmm v1 had: Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> > did you change something to not include Samuel A-b tag?
> 
> Sorry, I must have missed it!

NP :)

Samuel

