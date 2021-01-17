Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7D2F9269
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 14:08:29 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l17nA-0004gT-B2
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 08:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l17gQ-0003FT-MR; Sun, 17 Jan 2021 08:01:32 -0500
Received: from smtpout2.vodafonemail.de ([145.253.239.133]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan-guix@vodafonemail.de>)
 id 1l17gB-0004ov-2L; Sun, 17 Jan 2021 08:01:28 -0500
Received: from smtp.vodafone.de (unknown [10.2.0.34])
 by smtpout2.vodafonemail.de (Postfix) with ESMTP id E0C4C12453A;
 Sun, 17 Jan 2021 14:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
 s=vfde-smtpout-mb-15sep; t=1610888452;
 bh=/rza7j/PIZM2aQG/N/JBwdhTsYZXcfWvWO1vmDYvtX4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=a5263tIzLrbcKJG3Y3bebzv8mVUeD67ktn6LUZ+duiZm7kKedcskrWjFygnXOxE8D
 QlILBgA7vUuWvkPkomVx0sLZr7ACWCam9Jq7Td4U3jMOYPOJp/EExbSCLSLjrDZeLN
 Dx5ohpNoKvpAN0FYbMcAm+JURxdsnwrJbhTHdA2c=
Received: from macbook-pro.kuh-wiese.my-router.de
 (dslb-002-206-141-230.002.206.pools.vodafone-ip.de [2.206.141.230])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id AB91A141060;
 Sun, 17 Jan 2021 13:00:52 +0000 (UTC)
Subject: Re: [PATCH 1/1] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/html; charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Stefan <stefan-guix@vodafonemail.de>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://16/
In-Reply-To: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
X-Apple-Windows-Friendly: 1
Date: Sun, 17 Jan 2021 14:00:41 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1ADCBF56-A0D6-42AF-A2AF-1824F411397F@vodafonemail.de>
References: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
X-Mailer: Apple Mail (2.3124)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 619
X-purgate-ID: 155817::1610888452-00003440-4433C19F/0/0
Received-SPF: pass client-ip=145.253.239.133;
 envelope-from=stefan-guix@vodafonemail.de; helo=smtpout2.vodafonemail.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<html><head></head><body class=3D"ApplePlainTextBody" dir=3D"auto" =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: =
after-white-space;">ping<br><br>http://patchwork.ozlabs.org/project/qemu-d=
evel/patch/60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de/<br><br>
<div><br></div><div>Hi!</div><div><br></div><div>I=E2=80=99d like to =
remind you to this trivial patch to get&nbsp;ioclt(=E2=80=A6, =
SIOCGIFCONF, =E2=80=A6) working properly on 64 bit target =
architectures.</div><div><br></div><div><br></div><div>Bye</div><div><br><=
/div><div>Stefan</div></body></html>=

