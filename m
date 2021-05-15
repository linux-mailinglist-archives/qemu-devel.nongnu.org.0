Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2A38184C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:28:34 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsTB-00024N-Ka
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsQM-0008G8-Qw
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:25:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:56894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsQJ-0006zx-Dn
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:25:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsQH-0002Do-QB
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:25:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 996B72E8186
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:17:04 -0000
From: Thomas Huth <1926246@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier nightwend th-huth
X-Launchpad-Bug-Reporter: Wind Li (nightwend)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161950107824.17271.5936509317690090363.malonedeb@chaenomeles.canonical.com>
Message-Id: <162107742489.1329.6885242791141641976.malone@wampee.canonical.com>
Subject: [Bug 1926246] Re: chrome based apps can not be run under qemu user
 mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 455c017a765f7a8130b8823fec2ada92cc6c8176
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1926246 <1926246@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926246

Title:
  chrome based apps can not be run under qemu user mode

Status in QEMU:
  Incomplete

Bug description:
  chrome uses /proc/self/exe to fork render process.
  Here a simple code to reproduce the issue. It's output parent then child =
but failed with qemu: unknown option 'type=3Drenderer'.

  Maybe we can modify exec syscall to replace /proc/self/exe to the real
  path.

  //gcc -o self self.c =

  #include <stdio.h>
  #include <sys/types.h>
  #include <unistd.h>
  int main(int argc, char** argv) {
    if(argc=3D=3D1){
      printf ("parent\n");
  	if ( fork() =3D=3D 0 )
      {
          return execl("/proc/self/exe","/proc/self/exe", "--type=3Drendere=
r",NULL);
      }
    } else {
      printf ("child\n");
    }
    return 0;
  }

  similar reports:
  https://github.com/AppImage/AppImageKit/issues/965  =

  https://github.com/golang/go/issues/42080  =


  Workardound:
  compile chrome or your chrome based app with a patch to content/common/ch=
ild_process_host_impl.cc:GetChildPath, get the realpath of /proc/self/exe:  =


  diff --git a/content/common/child_process_host_impl.cc b/content/common/c=
hild_process_host_impl.cc
  index bc78aba80ac8..9fab74d3bae8 100644
  --- a/content/common/child_process_host_impl.cc
  +++ b/content/common/child_process_host_impl.cc
  @@ -60,8 +60,12 @@ base::FilePath ChildProcessHost::GetChildPath(int flag=
s) {
   #if defined(OS_LINUX)
     // Use /proc/self/exe rather than our known binary path so updates
     // can't swap out the binary from underneath us.
  -  if (child_path.empty() && flags & CHILD_ALLOW_SELF)
  -    child_path =3D base::FilePath(base::kProcSelfExe);
  +  if (child_path.empty() && flags & CHILD_ALLOW_SELF) {
  +    if (!ReadSymbolicLink(base::FilePath(base::kProcSelfExe), &child_pat=
h)) {
  +      NOTREACHED() << "Unable to resolve " << base::kProcSelfExe << ".";
  +      child_path =3D base::FilePath(base::kProcSelfExe);
  +    }
  +  }
   #endif

     // On most platforms, the child executable is the same as the
  current

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926246/+subscriptions

