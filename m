Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE016EAC4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 17:03:04 +0100 (CET)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6cfn-0005sO-Uk
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 11:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1j6cf2-0005Mq-BI
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:02:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1j6cex-0002OY-E1
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:02:16 -0500
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:62268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1j6cex-0002Iq-1J
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582646531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vrkm1pEDcoFOsLkuNzDV5ymO4VMUfcnMbepTVDMIEXY=;
 b=MvMfIcjTO0g8q/aGEay1H4tj7kJLnPXG/h5OaMFngnp6xp4ru5EfM53b
 zbadYF09/T64t+2QbSrOD9RmQWBXSBh46KxlkPsohetWFoBpxRp4OhjeD
 2uJwXBylQS53yJH06ntiNfv5KzqIPl3j+t3wd+adxwwnuJG9Z4QZe2TeL Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B716wH3cwf+8gj4NIwwksPXCjCuVqqLPy37MeCoJsJf14CmaoluLuUE22vkPq88F5e8YdHXjlN
 uDWQviAsHEd9eUcwA2xzd3L+/4QZT2B5DdYy6rgWx39mVEPDFonyWiIIM/KRcq0yEdB8DB5E9b
 qn9LDZWFvcY09Y/6fNpVgb0BiYUP//i1Dv2b28UIh+AzlJiPT3L6g5+gpE1Ew6FAwLXXIs85kn
 vONAm3amILUSOzt7XQQaXFA+K7IR8qL/9EwALgJOVkVzyhKvusii8Zuwe7coC5BFGQkEGdTur+
 P7I=
X-SBRS: 2.7
X-MesageID: 13160685
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="13160685"
Date: Tue, 25 Feb 2020 16:02:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] Memory: Only call ramblock_ptr when needed in
 qemu_ram_writeback
Message-ID: <20200225160203.GD2193@perard.uk.xensource.com>
References: <20191219154214.GE1267@perard.uk.xensource.com>
 <20191219154323.325255-1-anthony.perard@citrix.com>
 <87immc190v.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87immc190v.fsf@trasno.org>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.145.142
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
Cc: Beata Michalska <beata.michalska@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 19, 2019 at 07:10:24PM +0100, Juan Quintela wrote:
> Anthony PERARD <anthony.perard@citrix.com> wrote:
> > It is possible that a ramblock doesn't have memory that QEMU can
> > access, this is the case with the Xen hypervisor.
> >
> > In order to avoid to trigger an assert, only call ramblock_ptr() when
> > needed in qemu_ram_writeback(). This should fix migration of Xen
> > guests that was broken with bd108a44bc29 ("migration: ram: Switch to
> > ram block writeback").
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> This is exec.c, nothing related to migration.
> 
> Paolo, are you taking this one?
> It could even go through the trivial one.

Hi,

I'm going to send a pull request for the xen queue with this patch.
Unless that's an issue?

Cheers,

-- 
Anthony PERARD

