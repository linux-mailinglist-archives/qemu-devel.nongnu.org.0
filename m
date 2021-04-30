Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF936FF7A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:27:01 +0200 (CEST)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWuq-0006PN-Aq
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lcWMd-00076I-9Q; Fri, 30 Apr 2021 12:51:39 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:41288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lcWMb-0001Fh-J7; Fri, 30 Apr 2021 12:51:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 593005AC;
 Fri, 30 Apr 2021 18:51:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LrOYcUejyHG; Fri, 30 Apr 2021 18:51:33 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 592D2107;
 Fri, 30 Apr 2021 18:51:33 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lcWMV-003EW4-DJ; Fri, 30 Apr 2021 18:51:31 +0200
Date: Fri, 30 Apr 2021 18:51:31 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
Message-ID: <20210430165131.7ucqmsdqaaua2axt@begin>
References: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
 <1cc238f3-c695-4975-3e26-de98da916ff0@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cc238f3-c695-4975-3e26-de98da916ff0@vivier.eu>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 593005AC
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
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
Cc: Niklas =?utf-8?Q?Hamb=C3=BCchen?= <mail@nh2.me>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier, le ven. 30 avril 2021 18:48:29 +0200, a ecrit:
> CC: +Samuel

I don't know the smb code at all.

> Le 23/02/2021 à 03:41, Niklas Hambüchen a écrit :
> > As the added commend and `man smb.conf` explain, starting
> > with that samba version, `force user` must be configured
> > in `[global]` in order to access the configured `smb_dir`.
> > 
> > This broke `-net user,smb=/path/to/folder`:
> > 
> > The `chdir` into e.g. `/run/user/0/qemu-smb.DCZ8Y0` failed.
> > In verbose logs, this manifested as:
> > 
> >     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.c:159(chdir_current_service)
> >       chdir (/run/user/0) failed, reason: Permission denied
> > 
> >     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.c:167(chdir_current_service)
> >       chdir (/run/user/0) failed, reason: Permission denied
> > 
> >     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/uid.c:448(change_to_user_internal)
> >       change_to_user_internal: chdir_current_service() failed!
> > 
> > This commit fixes it by setting the `[global]` force user to
> > the user that owns the directories `smbd` needs to access.
> > 
> > Signed-off-by: Niklas Hambüchen <mail@nh2.me>
> > ---
> >  net/slirp.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/net/slirp.c b/net/slirp.c
> > index be914c0be0..82387bdb19 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -850,6 +850,11 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
> >      }
> >      fprintf(f,
> >              "[global]\n"
> > +            "# In Samba 2.0.5 and above the 'force user' parameter\n"
> > +            "# also causes the primary group of the forced user to be used\n"
> > +            "# as the primary group for all file activity.\n"
> > +            "# This includes the various directories set below.\n"
> > +            "force user=%s\n"
> >              "private dir=%s\n"
> >              "interfaces=127.0.0.1\n"
> >              "bind interfaces only=yes\n"
> > @@ -871,6 +876,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
> >              "read only=no\n"
> >              "guest ok=yes\n"
> >              "force user=%s\n",
> > +            passwd->pw_name,
> >              s->smb_dir,
> >              s->smb_dir,
> >              s->smb_dir,
> > 
> 

