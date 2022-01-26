Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA549D050
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:04:53 +0100 (CET)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClj2-0003Sq-2X
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nClOA-0005rY-5g
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:43:18 -0500
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:24836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nClO7-0005FD-Mg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1643215395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ma2biUqHTpSS5SaZFZ5W6hVQcNktSz5lX77ibumn1pA=;
 b=hAj7GM1OJousY/pbrOg1AScRCpTwLQYdqagyh3LJoSMC+siUe5QcK3O+
 ZS2sFAI3xUzzDjhFSCHUraiLWmnYOlQAgp/3fFZMd75yzG8Cq6P0rB7O4
 s8HaqiVwwT6WInigxXlL61wgHWSr3F5tzqOG2IcJZeCo5xKlX7pHq+kpV w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4anLBNFVMj57IlnNQu3Kmr3I7i5pjiwCGonbV3WDFB8uC24qfHeg8qlCHLuFcPNs8850Ig+nBW
 BvUeXidX/ouDSkogpveoYonTgbNkNh515tXgxhfM6sGimiXOQxx5v0/QJL7kaiaX7uN6/y8cBS
 rLpcHCyI5orl15z+aqoQxSnov/Yvqbk8MiXfUw1qaGi+UJY5Cbt5YueH3+Z0eYSasWmcwzxSek
 4KGBwJNYItKEbunjS8LKnDoso3BU3ZCK5lCWvJifUUlI+SOPU27Prcbf8BedzQ5TGtdi1lWwtL
 TB1jM7bMYc01NPjBzUakH2U7
X-SBRS: 5.2
X-MesageID: 62284306
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bjxAPKmVu7Vmhj0ZEaa2L5Xo5gzzIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXD3TbvbYMDOneNx1aIW08khVvMfRnIVlTAttrns3FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IQRp622QiE5ArHNqt0dYjhDTnxnZJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6yEN
 5ZCMWQHgBLoahBmPEkcOokHn7m1jz7mTmJAiErOqv9ii4TU5FMoi+W8WDbPQfSHSdhchEqfj
 mLP9Wf+GQ1cMtGDoRKf83msj/XD2yP2Xo4fDqa/8NZugVua3GtVDwcZPXO+uuWRkEOyW9tDb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6cD3IPQzoHYcQoucs8TCEv/
 lCMltLtQzdotdW9S3ub+q2FsDCaNi0cLGtEbigBJSMd6sTniJE+iFTIVNkLOLe4i8CwFTzuz
 jSiqi84iLMOy8kR2M2T5VrAhSCtoJnhVAM55gzLGGmi62tRf5W5boal7Vza6/doL4uDSFSF+
 n8elKCjAPsmVM/X0nbXGaNUQe/vt63t3CDgbUBHTsUzxjKm3W6fYYFi2TFPBVw0b99dQGq8C
 KPMgj956JhWNXqsSKZ4ZYOtFsgnpZTd+cTZuuP8NYQXPMUoHOOT1GQ3PBPLgTix+KQ5ufxnY
 f+mndCQ4WH24EiN5B6/XK8j3LAi3UjSLkuDFMmgn3xLPVdzDUN5qIvp0nPSP4jVD4ve+W05F
 uqz0ePQmn2zt8WlOkHqHXY7dwxiEJTCLcmeRzZrXuCCOBF6P2oqFuXcx7gsE6Q8wfgOz7yVo
 C3hBx8HoLYauZEhAV/bApyEQOi3NauTUFphZXB8VbpW8yVLjXmTAFc3KMJsIOhPGB1Lxv9oV
 fgVE/hs8dwUIgkrDw81NMGnxKQ7LUzDrVvXY0KNPWZjF7Y9GV2h0oK0L2PHqXhVZgLq5JRWn
 lFV/l6BKXb1b148XJ++hTPG5w7ZgEXxb8orDxKXeYECIRu1mGWoQgSo5sIKzwg3AU2r7lOnO
 8y+Wn/0fMHB/N049sfnn6eBo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99QDYeeJNcrpHUQ/Pg0gaujfh/gYliOLtaY+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy00N4PMyHgyZY83W3AkYBC6h35IsHBILLixYwzg0Qa5LrFSKrsoqEbM9BMxd2L
 2bM1rbCnblV2mHLb2E3SSrWxeNYiJkD5EJKwVsFKwjbk9bJnKZqjhhY8DBxRQVJ1BRXlel0P
 zEzZUFyIKyP+RZuhdRCAD/wS10QWkXB9xyj0UYNmU3YU1KsBz7EI2AKMOqQ+FwUrjBHdT9B8
 bDEkGvoXF4Gpi0qMvfejaK9l8HecA==
IronPort-HdrOrdr: A9a23:4nyGe6552m4nrYLvtgPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; d="scan'208";a="62284306"
Date: Wed, 26 Jan 2022 16:43:03 +0000
To: <paul@xen.org>
CC: Jason Andryuk <jandryuk@gmail.com>, QEMU <qemu-devel@nongnu.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Message-ID: <YfF6F6jG1mDbAMAj@perard>
References: <20211210193434.75566-1-jandryuk@gmail.com>
 <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
 <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
 <2ebaf0d6-a84a-e929-5ac2-597c81d40230@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2ebaf0d6-a84a-e929-5ac2-597c81d40230@gmail.com>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=anthony.perard@citrix.com; helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Wed, Jan 26, 2022 at 01:47:20PM +0000, Durrant, Paul wrote:
> On 26/01/2022 13:43, Jason Andryuk wrote:
> > On Tue, Dec 14, 2021 at 8:40 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
> > > 
> > > On 10/12/2021 11:34, Jason Andryuk wrote:
> > > > commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
> > > > coded setting req.count = 1 during initial field setup before the main
> > > > loop.  This missed a subtlety that an early exit from the loop when
> > > > there are no ioreqs to process, would have req.count == 0 for the return
> > > > value.  handle_buffered_io() would then remove state->buffered_io_timer.
> > > > Instead handle_buffered_iopage() is basically always returning true and
> > > > handle_buffered_io() always re-setting the timer.
> > > > 
> > > > Restore the disabling of the timer by introducing a new handled_ioreq
> > > > boolean and use as the return value.  The named variable will more
> > > > clearly show the intent of the code.
> > > > 
> > > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > > 
> > > Reviewed-by: Paul Durrant <paul@xen.org>
> > 
> > Thanks, Paul.
> > 
> > What is the next step for getting this into QEMU?
> > 
> 
> Anthony, can you queue this?

Yes, I'll send a pull request soon.

Sorry I tend to wait a while before preparing pull requests, especially
when there's only one patch. But there's another one now.

Cheers,

-- 
Anthony PERARD

