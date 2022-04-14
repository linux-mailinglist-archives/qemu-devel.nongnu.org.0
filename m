Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77174500C1A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 13:25:23 +0200 (CEST)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nexbG-0006PU-6J
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 07:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nexZk-0005iV-K5
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 07:23:48 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nexZh-0003TB-QM
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 07:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2dxNhLdhFauPU+W81M5WwoC17Qkk0zY1KohVRE9w/lQ=; b=XOEUtmmIE3jEI8wLsMmMJTiQmx
 1rH8kQP5rRz9stiAe8UDVzn84iXHS2N69uxHy9wcY0wL7JOx0p5CTHUl8sFM35g8yh0NcVRBPohZH
 CfARb6gY9CTfxQlOJBuqKB7e0SR4AMe51IlZYsOr8JHUkk2wsXNEikIMCKtFOBeIxtUEB9KIgqETV
 xfqBRvyUzkJtCK7j5XZ3jP3UHtkenwpf4U83xrpDODx4Fw1SjKqnFjS9D56bjaxQNqQejJsra6p3/
 gFIok73S4lQMA+m0igCmzh+0nu0/t9jCW5CVitgoAOJbHRgmSUwxwOTaaBMYHITzQyE/y58GnR+N2
 /V92kk5moOxDZjinSEGGlM2++KqY3IJYn2+89s+PxK9dKhphe4BP5voZXoFLI0qeWLzofaFZmV5YI
 l6s/7PeHyGtVCxp8Pm4POeliTPTqFYRRSdBAxcd2+tpI8XWGSWSJB+g5qwXUZMic9mlnGcUVuXgPp
 gbtd2iX6+V+xSOziUAGa8Zan+PwM5k1ba8OgkFhUmsUb5o13elW3Mx1B+tVLcGmJWOMYmGE3dPM/Y
 Fn1X+otnvEk/A121Z5Bq3O5Y7xPsKm3ONvSXwH7P3eO74vOQ6gFlTzro9AGSxt8VS4RmiwStNUarC
 xhux2rGsxz2IYR470EwRKiG3ktMnUA2qvd8CNn/S0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Date: Thu, 14 Apr 2022 13:23:38 +0200
Message-ID: <9940864.osJUfx695o@silver>
In-Reply-To: <CH2PR11MB445450AE2D1666B623ABD1BAEFEC9@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <CAEUhbmVVnz7iFZ6RpW7V45b6xAVv-YxXWv2Esxu4YBZf4yA0LA@mail.gmail.com>
 <CH2PR11MB445450AE2D1666B623ABD1BAEFEC9@CH2PR11MB4454.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mittwoch, 13. April 2022 05:30:57 CEST Shi, Guohuai wrote:
> > We have 3 fs drivers: local, synth, proxy. I don't mind about proxy, it is
> > in  bad shape and we will probably deprecate it in near future anyway.
> > But it would be good to have support for the synth driver, because we are
> > using it for running test cases and fuzzing tests (QA).
> 
> synth driver can not be built on Windows platform (or cross build on
> Linux). So the test cases can not work on Windows.

Could you please be more specific what kind of challenge you see for making 
the synth driver working on Windows? The synth driver is just a simple mockup 
driver [1] that simulates in-RAM-only a filesystem with a bunch of hard coded 
dirs and files, solely for the purpose to run test cases. So the synth driver 
does not interact with any real filesystem on host at all. My expectation 
therefore would be that it just needs to tweak some header includes and maybe 
declaring missing POSIX data types, which you have done for the local driver 
already anyway.

BTW support for macOS hosts has just been recently added for 9p, I know it is 
different as its a POSIX OS, but maybe you might still find the diff [2] 
helpful.

[1] https://wiki.qemu.org/Documentation/9p#9p_Filesystem_Drivers
[2] https://gitlab.com/qemu-project/qemu/-/commit/f45cc81911adc772

> > What are the limitations against security_model=mapped on Windows? Keep in
> >  mind that with security_model=none you are very limited in what you can
> > do with 9p.
> 
> MSYS library does not support extend attribute (e.g. getxattr),
> And does not support POSIX permission APIs (e.g. chmod, chown).
> Security model is useless on Windows host.

That would be security_model=passthrough, yes, that's not possible with msys. 
The recommended way in practice though is using security_model=mapped [3] for 
all systems, which should be possible to achieve with msys as well ...

[3] https://wiki.qemu.org/Documentation/9psetup#Starting_the_Guest_directly

> It is possible that to "map" extend attribute to NTFS stream data.
> However, if Windows host media is not NTFS (e.g. FAT) which does not support
> stream data, then the "map" can not work.

... yes exactly, it would make sense to use ADS [4] instead of xattr on 
Windows. ADS are available with NTFS and ReFS and maybe also with exFAT 
nowadays (?), not sure about the latter though. But I think it is fair enough 
to assume Windows users to either use NTFS or ReFS. And if they don't, you can 
still call error_report_once() to make user aware that
seucrity_model=mapped(-xattr) requires a fileystem on Windows that supports 
ADS.

[4] https://en.wikipedia.org/wiki/NTFS#Alternate_data_stream_(ADS)

Best regards,
Christian Schoenebeck



