Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5B376CEC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 00:49:04 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf9HL-0001Io-Fn
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 18:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lf9Ga-0000Fd-5U; Fri, 07 May 2021 18:48:16 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:35320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lf9GX-0005OI-7W; Fri, 07 May 2021 18:48:15 -0400
Date: Fri, 07 May 2021 22:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=remexre.xyz;
 s=protonmail3; t=1620427680;
 bh=518ViLPJ2NrUR+mJyOwnTS0ZQtqtGl8TwGZ9l5hJPOQ=;
 h=Date:To:From:Reply-To:Subject:From;
 b=hvaR2JxxGGzMMfOE61MTWHGAPTTcVIbW4MSbNN2llaWV7u6hoCqeQFV/qHn5Wl7le
 xbou3xPSjR3D7qYjbXVqHsl1GDMqNKfaoIhwCjzK/FUatv6g40FRSDTLLlyqoU1d1U
 NXZnf2ocKeoFVuH9yJn7TUhJgOzZttAXmTHpgmFNLAaPq80uVu032uBeTH1SF+Uhux
 c1wAFGpFEh5zAOrebZQvHvs1Vz+DZJp0p3e3Pc9fmwSdCfKUalKQMy2HUFfHZVU5/F
 OeZEOvkGPcI5i8mzYpWAR6pzl/GdYQ3HlUC8WRCgfr2IPNjTPBxTxbKcY9LeHrsJ9C
 HnP+6olO3R4eA==
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Nathan Ringo <nathan@remexre.xyz>
Subject: (No Subject)
Message-ID: <IgSjybfo8Lvz5jFa6CjbwypfMaGKHnOYwQE6pmUak@cp4-web-040.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.133; envelope-from=nathan@remexre.xyz;
 helo=mail-40133.protonmail.ch
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, FROM_SUSPICIOUS_NTLD_FP=1.999,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: Nathan Ringo <nathan@remexre.xyz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updates for QEMU 6.0.0.




