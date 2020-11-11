Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A0F2AEEBB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 11:28:33 +0100 (CET)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcnMe-0002Sg-65
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 05:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1kcnLS-0001mP-1A
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:27:18 -0500
Received: from mail.webarch.email ([81.95.52.48]:46414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1kcnLP-0004c6-Ry
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:27:17 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 4170A1A85D1E; Wed, 11 Nov 2020 10:27:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fosshost.org;
 s=20200501; t=1605090423;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:  in-reply-to; 
 bh=wuK21CIO8TeAg2hU1aPLkjKikHdUHjjaWrxh6gItzvI=;
 b=xf86Q83fgYCLA67NBmpwWQK3wFmn3VqqV1unWy79wrMkekcV2lxWfmhho4G+4T+TJakCt2
 uFYsXOcIBY/WYFYjguS+8GzmTk9M07rzyYOtpFNqvUuZqnUsOCH+5N4YuT5Inou/2tdwja
 +MCOafBnBsEP7Z6tObAEb+hNN4WoAVCSPfPyd4BC2+wPgT8xaqasXcSvbnWq4JV8JA2eAB
 lFW+cPr6VEkclMMO8tYZKmTDuS3CnXRYXO9EzK9sGf2Ci7S4FrP9KDcMWqEh/jLFUlgWNy
 FpHQocvoAfpKUaCG6F+Xs7MB5K9uaLLoBMNMVbf72WxEFArOL0xIOZfv2VfntQ==
From: "Fosshost" <admin@fosshost.org>
In-Reply-To: <20201111094023.GB1275139@stefanha-x1.localdomain>
Content-Type: multipart/alternative;
 boundary="----=_=-_OpenGroupware_org_NGMime-16811-1605090423.075964-3------"
Date: Wed, 11 Nov 2020 10:27:03 +0000
To: "Stefan Hajnoczi" <stefanha@gmail.com>
MIME-Version: 1.0
Message-ID: <41ab-5fabbc80-17-6e09e200@3585681>
Subject: =?utf-8?q?Re=3A?= Fosshost.org
User-Agent: SOGoMail 5.0.1
X-Last-TLS-Session-Version: None
Received-SPF: none client-ip=81.95.52.48; envelope-from=admin@fosshost.org;
 helo=mail.webarch.email
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 05:27:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu@sfconservancy.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_=-_OpenGroupware_org_NGMime-16811-1605090423.075964-3------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1075


On Wednesday, November 11, 2020 09:40 GMT, Stefan Hajnoczi <stefanha@gm=
ail.com> wrote:
=C2=A0On Sun, Nov 08, 2020 at 12:32:28AM +0000, Fosshost wrote:
> We would like to donate some hosting to the QEMU project, mainly in p=
art due to the fact that we use it ourselves!=C2=A0
>
> If this is something you would like to explore, please let me know.=C2=
=A0 We look forward to hearing from you.

Hi Thomas,
Thanks for reaching out to QEMU! An area where QEMU currently does not
have server resources is dedicated machines for performance regression
testing. Is that an area where Fosshost could help?

Thanks,
Stefan
Hi Stefan

For sure, no problem.=C2=A0 Please feel free to apply on our website fo=
r a VM.=C2=A0 If you need more than one in a particular region just add=
 to the notes.=C2=A0 The application form will get you to agree to our =
terms and conditions, etc.

You can apply at https://fosshost.org/apply

--=C2=A0
Kind regards,

Thomas Markey
Chief Executive and Founder
Fosshost.org
M: +44 (0) 7731 988 759

You can book a call with me by clicking here

------=_=-_OpenGroupware_org_NGMime-16811-1605090423.075964-3------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1459

<html><br />On Wednesday, November 11, 2020 09:40 GMT, Stefan Hajnoczi =
&lt;stefanha@gmail.com&gt; wrote:<br />&nbsp;<blockquote type=3D"cite" =
cite=3D"20201111094023.GB1275139@stefanha-x1.localdomain">On Sun, Nov 0=
8, 2020 at 12:32:28AM +0000, Fosshost wrote:<br />&gt; We would like to=
 donate some hosting to the QEMU project, mainly in part due to the fac=
t that we use it ourselves!&nbsp;<br />&gt;<br />&gt; If this is someth=
ing you would like to explore, please let me know.&nbsp; We look forwar=
d to hearing from you.<br /><br />Hi Thomas,<br />Thanks for reaching o=
ut to QEMU! An area where QEMU currently does not<br />have server reso=
urces is dedicated machines for performance regression<br />testing. Is=
 that an area where Fosshost could help?<br /><br />Thanks,<br />Stefan=
</blockquote><br />Hi Stefan<br /><br />For sure, no problem.&nbsp; Ple=
ase feel free to apply on our website for a VM.&nbsp; If you need more =
than one in a particular region just add to the notes.&nbsp; The applic=
ation form will get you to agree to our terms and conditions, etc.<br /=
><br />You can apply at https://fosshost.org/apply<br /><br />--&nbsp;<=
br />Kind regards,<br /><br /><strong>Thomas Markey</strong><br />Chief=
 Executive and Founder<br />Fosshost.org<br />M: +44 (0) 7731 988 759<b=
r /><br />You can book a call with me by clicking <a href=3D"https://ca=
lendly.com/fosshostorg/fosshost-call">here</a></html>

------=_=-_OpenGroupware_org_NGMime-16811-1605090423.075964-3--------


