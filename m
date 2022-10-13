Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582715FDC59
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:22:10 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiz69-0003P3-D7
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oiyMY-0003LU-E3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:35:02 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oiyMW-0005yX-52
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=db41sPlWm7amjy+k1+PhmkjaLxe+O1b0IM3waxrkjvE=; b=NBBoTAplWS6nZsQpVkJ2ekZ+cy
 /ktKUsWjv0UQSuyTLxakbTf6M1pf4YDFIi2pORwPH3N5Viob9hRgT2l+djUM1UrX2YqqXBocO6u5E
 x1RUfnkHALRluXsszFrYMjxenRGRA2LjJKOXcyTKO1GYXgdPfMBB6mLVQxhrfgxY2b6MnqP+LZcHf
 R6eUvFA1Z6jyYG7sw5GCfuod7Mtkh8TGQxneLHK+xgXODvn7dpdF9yXOs/vvxW/wTTmKdF6/9T8O5
 XxhH5dedWAlVPcT5nkOW9RM+qOX4UufsqlnQ6Vwu/13TOZMuRFlzKSdkgSCugWH5ix0ovr2UlTpxQ
 GBS2/Fd6zi5WFcBRVi50MiNxaSxzIyHBZYEO1QgcCSismonfWOTbvn7z86ozTrRg4rpMxJ1HkHjmp
 rcguenzR7DYZLgriFWftRnPVpivkVqrRnWyxTCE02RMKqEJeJBWyEbywgg12PXB570M2YUCvhmmU9
 1Ur/jDL6/jgdrRvtk6rxM2Tqr+9C7M0PzBAjkYrDISezOpIkjnKfDQujglVzUIAK5CtKLwHrECzJb
 69UFw56HbMy0ldbTbnMbNOsGeaI9VbSq0hj4UDtyK7PDcxTZVwvO6BvxjNOuTVxHfrxDuF96hhhRC
 jVUt6ksnnVHRn0uN8041s2q7evJhZs0t5IbZ5OjBo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 00/20] tests/9p: introduce declarative function calls
Date: Thu, 13 Oct 2022 15:34:54 +0200
Message-ID: <4473521.5piZKajXiT@silver>
In-Reply-To: <20221012155806.64f67dc8@bahia>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
 <2170356.SogY61Bk0U@silver> <20221012155806.64f67dc8@bahia>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 12. Oktober 2022 15:58:06 CEST Greg Kurz wrote:
> On Wed, 12 Oct 2022 12:00:40 +0200
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> 
> > On Dienstag, 4. Oktober 2022 22:56:44 CEST Christian Schoenebeck wrote:
> > > This series converts relevant 9p (test) client functions to use named
> > > function arguments. For instance
> > > 
> > >     do_walk_expect_error(v9p, "non-existent", ENOENT);
> > > 
> > > becomes
> > > 
> > >     twalk({
> > >         .client = v9p, .path = "non-existent", .expectErr = ENOENT
> > >     });
> > > 
> > > The intention is to make the actual 9p test code more readable, and 
easier
> > > to maintain on the long-term.
> > > 
> > > Not only makes it clear what a literal passed to a function is supposed 
to
> > > do, it also makes the order and selection of arguments very liberal, and
> > > allows to merge multiple, similar functions into one single function.
> > > 
> > > This is basically just refactoring, it does not change behaviour.
> > 
> > Too massive for review?
> > 
> 
> Yeah, sorry :-(
> 
> But since the approach you're taking here may be valuable elsewhere,
> and this is qtest, it seems fair to ask Thomas and Laurent to have
> a look :-)

Thomas, Laurent, if you had some spare cycles to look at this, that would be 
much appreciated!

Otherwise if not possible then I'll go ahead with PR next week as said.

Best regards,
Christian Schoenebeck



