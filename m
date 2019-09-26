Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AABF3A3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 15:03:50 +0200 (CEST)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDTQy-0004Vy-RU
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 09:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDTMT-0001yE-LT
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDTMS-0003Rz-Ij
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:59:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51574)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iDTMS-0003Ra-CK
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:59:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D06F99BAC;
 Thu, 26 Sep 2019 12:59:07 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 522D061F2D;
 Thu, 26 Sep 2019 12:59:06 +0000 (UTC)
Message-ID: <67b5d2969705c36cd566f7b7b2381a23c5884dcc.camel@redhat.com>
Subject: Re: qcow2 native encryption -- change passphrase?
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Craig Mull <cmull@us.ibm.com>, qemu-devel@nongnu.org
Date: Thu, 26 Sep 2019 15:59:04 +0300
In-Reply-To: <OFCD06A903.1875D335-ON00258481.00455734-00258481.004625E5@notes.na.collabserv.com>
References: <OFCD06A903.1875D335-ON00258481.00455734-00258481.004625E5@notes.na.collabserv.com>
Content-Type: multipart/alternative; boundary="=-2PGALIh4uPuQCCW9l+ef"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 26 Sep 2019 12:59:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: John Ferlan <jferlan@redhat.com>, Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-2PGALIh4uPuQCCW9l+ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-09-26 at 12:46 +0000, Craig Mull wrote:
> How do you change the passphrase for QCOW2 native encrypted volume?
> 
>  
> 
> I've played with qemu-img create and it appears I can only add a passphrase to slot 0 at volume creation time.  I don't believe cryptsetup is supported with QCOW2 native encryption to manage LUKS
> slots.
> 
>  

Hi!
Currently you can't change the pass-phrase for qcow2 luks encrypted files, but I am working on this exact feature,
and it will suport both luks images (as an alternative to cryptosetup, and qcow2 luks images).
I expect that soon it will be merged upstream.

Best regards,
	Maxim Levitsky

--=-2PGALIh4uPuQCCW9l+ef
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Thu, 2019-09-26 at 12:46 +0000, Craig Mull wrote:</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"f=
ont-family:Arial, Helvetica, sans-serif;font-size:10pt"><div dir=3D"ltr">Ho=
w do&nbsp;you change the&nbsp;passphrase for&nbsp;QCOW2 native encrypted vo=
lume?</div>
<div dir=3D"ltr">&nbsp;</div>
<div dir=3D"ltr">I've played with qemu-img create and it appears&nbsp;I can=
 only add a passphrase to slot 0 at volume creation time.&nbsp; I don't bel=
ieve cryptsetup is supported with QCOW2 native encryption to manage LUKS sl=
ots.</div>
<div dir=3D"ltr">&nbsp;</div></div></blockquote><div><br></div><div>Hi!</di=
v><div>Currently you can't change the pass-phrase for qcow2 luks encrypted =
files, but I am working on this exact feature,</div><div>and it will suport=
 both luks images (as an alternative to cryptosetup, and qcow2 luks images)=
.</div><div>I expect that soon it will be merged upstream.</div><div><br></=
div><div>Best regards,</div><div>	Maxim Levitsky</div></body></html>

--=-2PGALIh4uPuQCCW9l+ef--


