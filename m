Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FC62BEBC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHuh-0007Sb-EJ; Wed, 16 Nov 2022 07:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ovHub-0007Rs-EM
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:53:05 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ovHuZ-0000Nv-I3
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Y32HGv7zsoCdtNOhRXEtZ3/2mfEtOEkb5O1+39he2kk=; b=JjFNhQIhnsw1feJCM7lY+7fJ9n
 bMAVfz1FfOqeEW4Vx4s+t0DvVKqNuBZ1fN1TaqUN785JZ+zz5rmpPG9oGVP2bL+KJnkliC1451umj
 Wt1nAY5+6+syV8Eo5MC82TXNUwm6RG+rTqkeN83loYzSIPJWR9mO9lJ4jPYzR7Z394WhUpdr8FOVr
 E999yqVvriVdjePBQPEpUOyAKjbGNnpdDlyJ8ri3ZY9R9Jl1gGOESNafIFoRXPHHLNSGAl5HwpiJN
 976461XEfUQAWADQyFVlVSqDl0PHwLfRU+kkgMSOU3GK9AM/8iWeiwlNcqXZYUgRsl+h6C2V7H9Wy
 WNCqPU2RSnzKkf3xs1z0N8PuQ8wtkLJopy5HFtXEhPBoOzkwXKDpKQsmJVCT65sK74JluWCLPxYYy
 5UWaWBSFtYKb8MyHWJYpjqtK5/caAVrX0LJHcnnq5ie9fx64OVX4JG5Qv5cSs9GHM9GNR01r0u6lm
 d+0brwaHrvsYwYLy+HB+NwPH+Eb8V/QXbprQ9+ds1Ujf4sWY0yugYeqaHBFFljvWccCak5BS7olT3
 T8r/J3aBXUToAMyhjjztXgLdVR/kb3KGqmPGomjih/e2HZy5C2rXv9kCihBKURW7Swx/rvwLlh+vJ
 fhyLZgcaylkMwW/Gt0biK0dfosR4NFThMi0cnUGzk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v2 06/19] hw/9pfs: Add missing definitions for Windows
Date: Wed, 16 Nov 2022 13:52:58 +0100
Message-ID: <46351566.9J2vZs0v1x@silver>
In-Reply-To: <MN2PR11MB417389F84C0A0448A29593A8EF079@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <6443328.Q0H0RdsSbn@silver>
 <MN2PR11MB417389F84C0A0448A29593A8EF079@MN2PR11MB4173.namprd11.prod.outlook.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wednesday, November 16, 2022 10:01:39 AM CET Shi, Guohuai wrote:
[...]
> > > diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h index
> > > 4997677460..7d9a736b66 100644
> > > --- a/fsdev/file-op-9p.h
> > > +++ b/fsdev/file-op-9p.h
> > > @@ -27,6 +27,39 @@
> > >  # include <sys/mount.h>
> > >  #endif
> > >
> > > +#ifdef CONFIG_WIN32
> > > +
> > > +/* POSIX structure not defined in Windows */
> > > +
> > > +typedef uint32_t uid_t;
> > > +typedef uint32_t gid_t;
> > > +
> > > +/* from http://man7.org/linux/man-pages/man2/statfs.2.html */ typedef
> > > +uint32_t __fsword_t; typedef uint32_t fsblkcnt_t; typedef uint32_t
> > > +fsfilcnt_t;
> > > +
> > > +/* from linux/include/uapi/asm-generic/posix_types.h */ typedef
> > > +struct {
> > > +    long __val[2];
> > > +} fsid_t;
> > > +
> > > +struct statfs {
> > > +    __fsword_t f_type;
> > > +    __fsword_t f_bsize;
> > > +    fsblkcnt_t f_blocks;
> > > +    fsblkcnt_t f_bfree;
> > > +    fsblkcnt_t f_bavail;
> > > +    fsfilcnt_t f_files;
> > > +    fsfilcnt_t f_ffree;
> > > +    fsid_t f_fsid;
> > > +    __fsword_t f_namelen;
> > > +    __fsword_t f_frsize;
> > > +    __fsword_t f_flags;
> > > +};
> > > +
> > 
> > Does it make sense to define all of these, even though not being used?
> 
> Windows does not have this definition, so use Linux definition can make less impact to 9pfs code.
> If not, need to add many macro "#ifdef CONFIG_WIN32" in other places to disable the unsupported code.

My bad, I thought most of these were not referenced in code at all, but I just
realized they are indeed. Only exception is probably `f_flags`, but I haven't
checked yet whether you are using that for something new in your patches.

The previous patches LGTM BTW. I still have to look at all following patches
though. So better wait some more days before posting a v3.

Best regards,
Christian Schoenebeck



