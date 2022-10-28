Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB4610ED4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:42:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMoW-0000SM-1n; Fri, 28 Oct 2022 06:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ooMoT-0000BI-Cm
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:42:09 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ooMoR-0002bY-CF
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=MQsdHA5lTLRoWaGb5iSKD8+SBNii+sKXJcN6cHxZCMg=; b=B83Jut/oBAvfCYD1Fu1FoJclex
 +2tHv+bpCzKNOIpt9bUDfOXCBRqvAS4XCtd8IoA6Zm4Ij9eRY2lSdggtNb1eacoaocgIrXX3SF0pU
 ldI3+JUnFnsr0HbrVW0Uyb3ubtwn8Hd9/dGScnZknsTR8IZHDiD9Jsmb1Hwhmx+1wLHDZfuE5+x5B
 uUiPn+PY0W6MiF+Tk8VZgOhcsfkM49+LbNVUfY3GCnNjf1gyh3PIYPrIf44+e0vykZO4E5tfqKuxk
 1YtEvYxBIsjFOJJSRol5jy8vHkuX64cTCpWH0qQoIB3Dz2+qFIr8l1mgwdD0+SHuQq0s4pjoWf70E
 QHbD6iv55EW6XZ4eq1G+ZUm0iVE4FJDELfl/IIeGoaSCJDLq4PH8QMpRM+dIxqyf+VEaUKvg+f5pC
 qAVC1OstzX2Vd/I89vtx8dK1is2RDNfVyFP8dzo78vMEVUkZgUDUcRf7LVfovDggQgHx2n83Q1Zf0
 zDIPfESD6Ufi/gK2dlABW4W9//pAPTqV0w/+ml+NVF+NKaYVPNJ832URxgBtM/2YhfF3Hulhouxwd
 L0ogEp8woCWsWFhU0sK6cc2ecRwD3j87rXIc2QhhcmoPsaC3qoqKs7hV3XflJ2BTecwF9lVLRl6VX
 ngmrQidriQgc3FX/R3al2FJQohuts5q+AWJBEn08s=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>, Bin Meng <bin.meng@windriver.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
Date: Fri, 28 Oct 2022 12:40:54 +0200
Message-ID: <2690108.PsDodiG1Zx@silver>
In-Reply-To: <85b322d3-04c4-bbb5-f0cf-4be1cd73d671@redhat.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
 <11340963.ZY6gCF45se@silver>
 <85b322d3-04c4-bbb5-f0cf-4be1cd73d671@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, October 28, 2022 9:07:17 AM CEST Thomas Huth wrote:
> On 27/10/2022 22.42, Christian Schoenebeck wrote:
> > On Thursday, October 27, 2022 7:37:07 PM CEST Stefan Hajnoczi wrote:
> >> On Thu, 27 Oct 2022 at 12:38, Christian Schoenebeck
> >> <qemu_oss@crudebyte.com> wrote:
> >>>
> >>> On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:
> >>>> On 24/10/2022 12.54, Christian Schoenebeck wrote:
> >>>>> The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> >>>>>
> >>>>>     Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> >>>>>
> >>>>> are available in the Git repository at:
> >>>>>
> >>>>>     https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
> >>>>>
> >>>>> for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:
> >>>>>
> >>>>>     tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)
> >>>>>
> >>>>> ----------------------------------------------------------------
> >>>>> 9pfs: performance, Windows host prep, tests restructure
> >>>>>
> >>>>> * Highlight of this PR is Linus Heckemann's GHashTable patch which
> >>>>>     brings massive general performance improvements of 9p server
> >>>>>     somewhere between factor 6 .. 12.
> >>>>>
> >>>>> * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
> >>>>>     Windows host support of 9p server.
> >>>>>
> >>>>> * The rest of the patches in this PR are 9p test code restructuring
> >>>>>     and refactoring changes to improve readability and to ease
> >>>>>     maintenance of 9p test code on the long-term.
> >>>>
> >>>>    Hi Christian,
> >>>>
> >>>> I think this PR broke the FreeBSD CI jobs:
> >>>>
> >>>>    https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116
> >>>>
> >>>>    https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372
> >>>>
> >>>> Could you please have a look?
> >>>>
> >>>>    Thanks!
> >>>>     Thomas
> >>>
> >>> I try, but will certainly take some days, especially as I currently don't have
> >>> a BSD installation at hand to try the changes.
> >>
> >> QEMU has the automation to run FreeBSD builds locally (in a VM):
> >> $ make vm-build-freebsd
> >>
> >> Not sure if that FreeBSD environment matches the one in Cirrus CI
> >> though. If they are different then maybe it won't reproduce locally.
> > 
> > Something must be different, because e750a7ace492f0b450653d4ad368a77d6f660fb8
> > compiles fine locally with `make vm-build-freebsd` and all tests pass, too.
> > 
> > Ideas?
> 
> You've got to --enable-werror to make it fail, try something like this:
> 
> make vm-build-freebsd J=8 TARGET_LIST=x86_64-softmmu \
>       BUILD_TARGET=check-build DEBUG=1 \
>       EXTRA_CONFIGURE_OPTS="--enable-werror"

That was it, reproduced. Thanks Thomas!

statfs is defined in <sys/mount.h>. I prepare a patch.

Best regards,
Christian Schoenebeck



