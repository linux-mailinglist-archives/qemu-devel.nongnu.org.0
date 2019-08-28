Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ABC9F74D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 02:27:59 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2loc-00020J-M3
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 20:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Sandra_Loosemore@mentor.com>) id 1i2lnk-0001ZH-9A
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 20:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Sandra_Loosemore@mentor.com>) id 1i2lni-0006An-LL
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 20:27:03 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:42402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Sandra_Loosemore@mentor.com>)
 id 1i2lni-00068s-9t
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 20:27:02 -0400
IronPort-SDR: T+hjhpdWbTMjEV61ZewG7aTBxyqsLSXlhGhCx97T1FbyfC4B8ozGhik2Mu8Y4iAwjKDSI9VBmb
 yedei7gjeNgHA2XmpDuULJ/gbvPmf0sHY5pLRA6Y1VhxjhfyOForIhWWPHREgvvPBOb0GuRLBk
 eU7I+6c/8CZOmj/E7NBKMqnaEQCwfJV7d9q8Tc03xWkceMzY7aGl0+qZVX0GUmpmy7KmD2Bv40
 IanVVsbhw9E+I0lvQvSZ0pzObKWilmt4suUVIdZSF9cgp0Te4vNn2ozgCEjijX8JHdAsjqlTAY
 byE=
X-IronPort-AV: E=Sophos;i="5.64,439,1559548800"; d="scan'208";a="40787713"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 27 Aug 2019 16:26:59 -0800
IronPort-SDR: GWnyFRCs7PNLSoQuOGByVK7R8MlTkoXNtXgQbW6dVbQkv6+OM2sPQpm4SvB8vA/2M0XrqVv1DA
 zyfEX9qrs+3nY3cHRP+yzCkYz+lPEMDjQo4dm2ogDS21zJD0YuYYBs/lDxFH+/IPHt7eXTAKtC
 dsoQsc3eYZB1YzKhLpnn41lDP49sITa+0Hc8dQOGBMTsaL6uTDqcu871Q0avu/RaAomA226FZg
 QdI6MYVpodNoAJJbCj1LcFS4Q9K5dJyyPmcbIxxGhjBbs2yNMjXoGCT72ec419JnKt3IXhBfYG
 0Oo=
To: QEMU Developers <qemu-devel@nongnu.org>
From: Sandra Loosemore <sandra@codesourcery.com>
Message-ID: <81a8c0ca-c5fb-fc3d-cc7b-00c4da31d621@codesourcery.com>
Date: Tue, 27 Aug 2019 18:26:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.141.98
Subject: [Qemu-devel] libvhost-user: undefined reference to MADV_NOHUGEPAGE
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yesterday I tried to build the recent 4.1 release system-mode QEMU for 
aarch64-none-elf and ran into a compilation error in 
./contrib/libvhost-user/libvhost-user.c.  It's complaining about 
MADV_NOHUGEPAGE not being defined.  I'm not familiar with that code or 
even what it does; should that bit of logic be made conditional on 
MADV_NOHUGEPAGE being defined, or is this indicative of a configuration 
error for this target?  I see the unguarded reference was also present 
in the 3.0 release so it seems like whatever changed is somewhere else, 
and I don't know where to look for it or what I should be looking for. 
:-S  Does this sound familiar to anyone else?

-Sandra


