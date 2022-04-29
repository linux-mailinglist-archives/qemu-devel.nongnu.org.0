Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E49514A87
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 15:31:27 +0200 (CEST)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQiT-0006uc-Px
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 09:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.nguetchouang@ens-lyon.fr>)
 id 1nkMZJ-0006g7-1V
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:05:41 -0400
Received: from lxc-smtp2.ens-lyon.fr ([140.77.167.81]:35260)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kevin.nguetchouang@ens-lyon.fr>) id 1nkMZG-0001w8-Nc
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:05:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by lxc-smtp2.ens-lyon.fr (Postfix) with ESMTP id 52CF0E5619
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 11:05:33 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at ens-lyon.fr
Received: from lxc-smtp2.ens-lyon.fr ([127.0.0.1])
 by localhost (lxc-smtp2.ens-lyon.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPhaBm4c74-L for <qemu-devel@nongnu.org>;
 Fri, 29 Apr 2022 11:05:33 +0200 (CEST)
Received: from webmail.ens-lyon.fr (lxc-m2-webmail1.ens-lyon.fr
 [140.77.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by lxc-smtp2.ens-lyon.fr (Postfix) with ESMTPSA id 4375BE5607
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 11:05:33 +0200 (CEST)
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="=_84dfe39756b915b402c35296beab0f1b"
Date: Fri, 29 Apr 2022 11:05:33 +0200
From: Nguetchouang Ngongang Kevin <kevin.nguetchouang@ens-lyon.fr>
To: qemu-devel@nongnu.org
Subject: mount host directory as disk in VM
Message-ID: <6ce88abda38291752cae0875c74c4dc3@ens-lyon.fr>
X-Sender: kevin.nguetchouang@ens-lyon.fr
User-Agent: Roundcube Webmail/1.2.7
Received-SPF: pass client-ip=140.77.167.81;
 envelope-from=kevin.nguetchouang@ens-lyon.fr; helo=lxc-smtp2.ens-lyon.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URI_TRUNCATED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 29 Apr 2022 09:28:46 -0400
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

--=_84dfe39756b915b402c35296beab0f1b
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hello everyone, 

I'm trying to mount a host directory as a disk in my VM at startup but
I'm facing a problem. 

QEMU-SYSTEM-.... is returning "could not read directory". 

I'm using this
https://qemu.readthedocs.io/en/latest/system/images.html#virtual-fat-disk-images


as "-hdc fat:/mnt/data/output" but I'm getting this error: 

-- 
Nguetchouang Ngongang Kevin
ENS de Lyon
https://perso.ens-lyon.fr/kevin.nguetchouang/
--=_84dfe39756b915b402c35296beab0f1b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>Hello everyone,</p>
<p>I'm trying to mount a host directory as a disk in my VM at startup but I=
'm facing a problem.</p>
<p><strong>qemu-system-....</strong> is returning "could not read directory=
".</p>
<p>I'm using this <a href=3D"https://qemu.readthedocs.io/en/latest/system/i=
mages.html#virtual-fat-disk-images">https://qemu.readthedocs.io/en/latest/s=
ystem/images.html#virtual-fat-disk-images</a></p>
<p>as "-hdc fat:/mnt/data/output" but I'm getting this error:</p>
<p><img src=3D"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyUAAAAYCAYAAA=
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3D=3D=
" /></p>
<div>-- <br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Nguetchouang Ngongang Kevin<br /> ENS de Lyon<br /> <a href=3D"https://pers=
o.ens-lyon.fr/kevin.nguetchouang/" target=3D"_blank" rel=3D"noreferrer">htt=
ps://perso.ens-lyon.fr/kevin.nguetchouang/</a></div>
</div>
</body></html>

--=_84dfe39756b915b402c35296beab0f1b--

