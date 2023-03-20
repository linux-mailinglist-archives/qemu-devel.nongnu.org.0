Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4346C118A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peEK4-0003f2-Ox; Mon, 20 Mar 2023 08:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <secalert@redhat.com>)
 id 1peEK1-0003eX-Uk; Mon, 20 Mar 2023 08:09:05 -0400
Received: from outbound404.service-now.com ([149.96.5.209])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <secalert@redhat.com>)
 id 1peEK0-0004Ch-4A; Mon, 20 Mar 2023 08:09:05 -0400
Received: from outbound25.service-now.com (unknown [10.248.2.211])
 by outbound404.service-now.com (Postfix) with ESMTPS id D968E21A4B1E;
 Mon, 20 Mar 2023 05:09:01 -0700 (PDT)
Received: from app139045.ytz3.service-now.com (unknown [10.248.2.236])
 by outbound25.service-now.com (Postfix) with ESMTP id 167CE60A7363;
 Mon, 20 Mar 2023 05:08:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 outbound25.service-now.com 167CE60A7363
Date: Mon, 20 Mar 2023 05:08:58 -0700 (PDT)
From: Red Hat Product Security <secalert@redhat.com>
To: marcel.apfelbaum@gmail.com, mcascell@redhat.com,
 qemu-security@nongnu.org, yuval.shaia.ml@gmail.com,
 qemu-devel@nongnu.org, soulchen8650@gmail.com
Message-ID: <9832229.27994.1679314138081@app139045.ytz3.service-now.com>
Subject: Re: [PATCH v1] hw/pvrdma: Protect against buggy or malicious guest
 driver
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_27992_3739619.1679314138081"
X-ServiceNow-Source: Notification-ec04d32213ede300196f7e276144b04e
X-ServiceNow-SysEmail-Version: 2
Precedence: bulk
Auto-Submitted: auto-generated
X-ServiceNow-Generated: true
Received-SPF: pass client-ip=149.96.5.209; envelope-from=secalert@redhat.com;
 helo=outbound404.service-now.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Red Hat Product Security <secalert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

------=_Part_27992_3739619.1679314138081
Content-Type: multipart/alternative; 
	boundary="----=_Part_27993_28304353.1679314138081"

------=_Part_27993_28304353.1679314138081
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hello!

INC2534320 ([PATCH v1] hw/pvrdma: Protect against buggy or malicious guest =
driver) has been updated.

Opened for:=C2=A0yuval.shaia.ml@gmail.com
Followers:=C2=A0qemu-devel@nongnu.org, soulchen8650@gmail.com, Mauro Matteo=
 Cascella, qemu-security@nongnu.org, yuval.shaia.ml@gmail.com, marcel.apfel=
baum@gmail.com

A Guest updated your request with the following comments:

Reply from: yuval.shaia.ml@gmail.com [mailto:yuval.shaia.ml@gmail.com]
=C2=A0Hi,
Patch is currently under review.
From my end, it was tested and proved to solve the problem.
=C2=A0To follow up you may need to check qemu-devel@nongnu.org [mailto:qemu=
-devel@nongnu.org] from time to time.
=C2=A0Marcel, any feedback?
=C2=A0Yuval
=C2=A0On Mon, 13 Mar 2023 at 18:56, Red Hat Product Security <secalert@redh=
at.com [mailto:secalert@redhat.com]>
wrote:
=C2=A0> Hello!
>
> INC2534320 ([PATCH v1] hw/pvrdma: Protect against buggy or malicious gues=
t
> driver) has been updated.
>
> Opened for: yuval.shaia.ml@gmail.com [mailto:yuval.shaia.ml@gmail.com]
> Followers: qemu-devel@nongnu.org [mailto:qemu-devel@nongnu.org], soulchen=
8650@gmail.com [mailto:soulchen8650@gmail.com], Mauro Matteo
> Cascella, qemu-security@nongnu.org [mailto:qemu-security@nongnu.org], yuv=
al.shaia.ml@gmail.com [mailto:yuval.shaia.ml@gmail.com],
> marcel.apfelbaum@gmail.com [mailto:marcel.apfelbaum@gmail.com]
>
> A Guest updated your request with the following comments:
> Reply from: pjp@fedoraproject.org [mailto:pjp@fedoraproject.org]
>
> Hello Yuval,
>
> *How can I track and update my request?*
>
> To respond, reply to this email. You may also create a new email and
> include the request number (INC2534320) in the subject.
>
> Thank you,
> Product Security
>
> Ref:MSG71528958
>

How can I track and update my request?

To respond, reply to this email. You may also create a new email and includ=
e the request number (INC2534320) in the subject.

Thank you,
Product Security

Ref:MSG71828656
------=_Part_27993_28304353.1679314138081
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div><p style=3D"margin-top:0;margin-bottom:10px;"=
>Hello!</p><p style=3D"margin-top:0;margin-bottom:10px;">INC2534320 ([PATCH=
 v1] hw/pvrdma: Protect against buggy or malicious guest driver) has been u=
pdated.</p><p style=3D"margin-top:0;margin-bottom:10px;">Opened for:&nbsp;y=
uval.shaia.ml@gmail.com<br>Followers:&nbsp;qemu-devel@nongnu.org, soulchen8=
650@gmail.com, Mauro Matteo Cascella, qemu-security@nongnu.org, yuval.shaia=
.ml@gmail.com, marcel.apfelbaum@gmail.com</p></div>
<p style=3D"margin-top: 10px; margin-bottom: 10px;">A Guest updated your re=
quest with the following comments:</p>
<div style=3D"padding: 10px 0 10px 10px; background-color: ivory;"><div>Rep=
ly from: <a target=3D"_blank" href=3D"mailto:yuval.shaia.ml@gmail.com" rel=
=3D"noopener noreferrer nofollow">yuval.shaia.ml@gmail.com</a></div><div>&n=
bsp;</div><div>Hi,</div><div>Patch is currently under review.</div><div>Fro=
m my end, it was tested and proved to solve the problem.</div><div>&nbsp;</=
div><div>To follow up you may need to check <a target=3D"_blank" href=3D"ma=
ilto:qemu-devel@nongnu.org" rel=3D"noopener noreferrer nofollow">qemu-devel=
@nongnu.org</a> from time to time.</div><div>&nbsp;</div><div>Marcel, any f=
eedback?</div><div>&nbsp;</div><div>Yuval</div><div>&nbsp;</div><div>On Mon=
, 13 Mar 2023 at 18:56, Red Hat Product Security &lt;<a target=3D"_blank" h=
ref=3D"mailto:secalert@redhat.com" rel=3D"noopener noreferrer nofollow">sec=
alert@redhat.com</a>&gt;</div><div>wrote:</div><div>&nbsp;</div><div>&gt; H=
ello!</div><div>&gt;</div><div>&gt; INC2534320 ([PATCH v1] hw/pvrdma: Prote=
ct against buggy or malicious guest</div><div>&gt; driver) has been updated=
.</div><div>&gt;</div><div>&gt; Opened for: <a target=3D"_blank" href=3D"ma=
ilto:yuval.shaia.ml@gmail.com" rel=3D"noopener noreferrer nofollow">yuval.s=
haia.ml@gmail.com</a></div><div>&gt; Followers: <a target=3D"_blank" href=
=3D"mailto:qemu-devel@nongnu.org" rel=3D"noopener noreferrer nofollow">qemu=
-devel@nongnu.org</a>, <a target=3D"_blank" href=3D"mailto:soulchen8650@gma=
il.com" rel=3D"noopener noreferrer nofollow">soulchen8650@gmail.com</a>, Ma=
uro Matteo</div><div>&gt; Cascella, <a target=3D"_blank" href=3D"mailto:qem=
u-security@nongnu.org" rel=3D"noopener noreferrer nofollow">qemu-security@n=
ongnu.org</a>, <a target=3D"_blank" href=3D"mailto:yuval.shaia.ml@gmail.com=
" rel=3D"noopener noreferrer nofollow">yuval.shaia.ml@gmail.com</a>,</div><=
div>&gt; <a target=3D"_blank" href=3D"mailto:marcel.apfelbaum@gmail.com" re=
l=3D"noopener noreferrer nofollow">marcel.apfelbaum@gmail.com</a></div><div=
>&gt;</div><div>&gt; A Guest updated your request with the following commen=
ts:</div><div>&gt; Reply from: <a target=3D"_blank" href=3D"mailto:pjp@fedo=
raproject.org" rel=3D"noopener noreferrer nofollow">pjp@fedoraproject.org</=
a></div><div>&gt;</div><div>&gt; Hello Yuval,</div><div>&gt;</div><div>&gt;=
 *How can I track and update my request?*</div><div>&gt;</div><div>&gt; To =
respond, reply to this email. You may also create a new email and</div><div=
>&gt; include the request number (INC2534320) in the subject.</div><div>&gt=
;</div><div>&gt; Thank you,</div><div>&gt; Product Security</div><div>&gt;<=
/div><div>&gt; Ref:MSG71528958</div><div>&gt;</div></div>
<div><p style=3D"margin-top:20px;margin-bottom:10px;"><strong>How can I tra=
ck and update my request?</strong></p><p style=3D"margin-top:0;margin-botto=
m:10px;">To respond, reply to this email. You may also create a new email a=
nd include the request number (INC2534320) in the subject.</p></div>
<p style=3D"margin-top: 14px; margin-bottom: 0;">Thank you,<br>Product Secu=
rity</p><div>&nbsp;</div><div style=3D"display:inline">Ref:MSG71828656</div=
></body></html>
------=_Part_27993_28304353.1679314138081--

------=_Part_27992_3739619.1679314138081--

