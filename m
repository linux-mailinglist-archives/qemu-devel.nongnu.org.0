Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748B6B7E58
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 17:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pblTt-0001UG-6S; Mon, 13 Mar 2023 12:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <secalert@redhat.com>)
 id 1pblTb-0001Tc-C9; Mon, 13 Mar 2023 12:56:51 -0400
Received: from outbound404.service-now.com ([149.96.5.209])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <secalert@redhat.com>)
 id 1pblTY-0000uQ-MR; Mon, 13 Mar 2023 12:56:46 -0400
Received: from outbound27.service-now.com (unknown [10.248.2.211])
 by outbound404.service-now.com (Postfix) with ESMTPS id 417454144970;
 Mon, 13 Mar 2023 09:56:37 -0700 (PDT)
Received: from app134031.ytz3.service-now.com (unknown [10.248.2.236])
 by outbound27.service-now.com (Postfix) with ESMTP id CA10F605F020;
 Mon, 13 Mar 2023 09:56:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 outbound27.service-now.com CA10F605F020
Date: Mon, 13 Mar 2023 09:56:31 -0700 (PDT)
From: Red Hat Product Security <secalert@redhat.com>
To: marcel.apfelbaum@gmail.com, mcascell@redhat.com,
 qemu-security@nongnu.org, yuval.shaia.ml@gmail.com,
 qemu-devel@nongnu.org, soulchen8650@gmail.com
Message-ID: <10513163.6254.1678726591818@app134031.ytz3.service-now.com>
Subject: Re: [PATCH v1] hw/pvrdma: Protect against buggy or malicious guest
 driver
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_6252_27230420.1678726591818"
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

------=_Part_6252_27230420.1678726591818
Content-Type: multipart/alternative; 
	boundary="----=_Part_6253_1743224.1678726591818"

------=_Part_6253_1743224.1678726591818
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

Reply from: pjp@fedoraproject.org [mailto:pjp@fedoraproject.org]
=C2=A0Hello Yuval,

How can I track and update my request?

To respond, reply to this email. You may also create a new email and includ=
e the request number (INC2534320) in the subject.

Thank you,
Product Security

Ref:MSG71528958
------=_Part_6253_1743224.1678726591818
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div><p style="margin-top:0;margin-bottom:10px;">Hello!</p><p style="margin-top:0;margin-bottom:10px;">INC2534320 ([PATCH v1] hw/pvrdma: Protect against buggy or malicious guest driver) has been updated.</p><p style="margin-top:0;margin-bottom:10px;">Opened for:&nbsp;yuval.shaia.ml@gmail.com<br>Followers:&nbsp;qemu-devel@nongnu.org, soulchen8650@gmail.com, Mauro Matteo Cascella, qemu-security@nongnu.org, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com</p></div>
<p style="margin-top: 10px; margin-bottom: 10px;">A Guest updated your request with the following comments:</p>
<div style="padding: 10px 0 10px 10px; background-color: ivory;"><div>Reply from: <a target="_blank" href="mailto:pjp@fedoraproject.org" rel="noopener noreferrer nofollow">pjp@fedoraproject.org</a></div><div>&nbsp;</div><div>Hello Yuval,</div></div>
<div><p style="margin-top:20px;margin-bottom:10px;"><strong>How can I track and update my request?</strong></p><p style="margin-top:0;margin-bottom:10px;">To respond, reply to this email. You may also create a new email and include the request number (INC2534320) in the subject.</p></div>
<p style="margin-top: 14px; margin-bottom: 0;">Thank you,<br>Product Security</p><div>&nbsp;</div><div style="display:inline">Ref:MSG71528958</div></body></html>
------=_Part_6253_1743224.1678726591818--

------=_Part_6252_27230420.1678726591818--

