Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7956D1AF
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 23:54:29 +0200 (CEST)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAesm-0001ui-Dy
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 17:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alarson@ddci.com>) id 1oAerm-0000U2-08
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 17:53:26 -0400
Received: from phx2.ddci.com ([98.179.132.68]:57291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alarson@ddci.com>) id 1oAerk-0000Qe-CB
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 17:53:25 -0400
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: 
References: 
Subject: Minor tweak to wiki Linux build instructions.
From: alarson@ddci.com
To: qemu-devel@nongnu.org
Date: Sun, 10 Jul 2022 14:36:22 -0700
Message-ID: <OF022D28BB.0220F0EB-ON0725887B.0076AF47-0725887B.0076AF9F@ddci.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1 HF12 May 12, 2020
X-MIMETrack: Serialize by HTTP Server on PHX2/ddci(Release 11.0.1 HF12|May 12,
 2020) at 07/10/2022 02:36:22 PM,
 Serialize complete at 07/10/2022 02:36:22 PM,
 Itemize by HTTP Server on PHX2/ddci(Release 11.0.1 HF12|May 12,
 2020) at 07/10/2022 02:36:22 PM,
 Serialize by Router on PHX2/ddci(Release 11.0.1 HF12|May 12,
 2020) at 07/10/2022 02:53:24 PM,
 Serialize complete at 07/10/2022 02:53:24 PM
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1
Received-SPF: none client-ip=98.179.132.68; envelope-from=alarson@ddci.com;
 helo=PHX2.ddci.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div>On <a href=3D"https://wiki.qemu.org/Hosts/Linux" target=3D"=5Fb=
lank" rel=3D"noopener noreferrer">https://wiki.qemu.org/Hosts/Linux</a> the=
 list of recommended packages currently is a mix of RedHat and Debian names=
.&nbsp; I suggest the following instead:<br></div><div><br></div><div>=3D=
=3D=3D=3D Recommended additional packages =3D=3D=3D=3D<br><br>Package names=
 are for Debian(RedHat).<br><br>* git-email, used for sending patches<br>* =
libsdl2-dev(libsdl2-devel), needed for the SDL based graphical user interfa=
ce<br>* libgtk-3-dev(gtk3-devel), for a simple UI instead of VNC<br>* libvt=
e-dev(vte-devel), for access to QEMU monitor and serial/console devices via=
 the GTK interface<br>* libcapstone-dev(libcapsone-devel), for disassemblin=
g CPU instructions<br><br></div></font>

