Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0EB21A11A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 15:43:59 +0200 (CEST)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtWqE-0003xr-4r
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 09:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jtWp8-000337-Kc
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 09:42:52 -0400
Received: from relay64.bu.edu ([128.197.228.104]:47037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jtWp6-0004wC-Uh
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 09:42:50 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 069DfsIh027514
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 9 Jul 2020 09:41:57 -0400
Date: Thu, 9 Jul 2020 09:41:54 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/qtest/fuzz: Add missing spaces in description
Message-ID: <20200709134139.t4hfidzkecbo22sc@mozz.bu.edu>
References: <20200709083719.22221-1-thuth@redhat.com>
 <1b4acaae-f80b-68cd-8798-5fc5e0ce1021@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4acaae-f80b-68cd-8798-5fc5e0ce1021@redhat.com>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 09:39:07
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200709 1228, Philippe Mathieu-Daudé wrote:
> On 7/9/20 10:37 AM, Thomas Huth wrote:
> > There should be a space between "forking" and "for".
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  tests/qtest/fuzz/virtio_scsi_fuzz.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
> > index 51dce491ab..3a9ea13736 100644
> > --- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
> > +++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
> > @@ -191,7 +191,7 @@ static void register_virtio_scsi_fuzz_targets(void)
> >  {
> >      fuzz_add_qos_target(&(FuzzTarget){
> >                  .name = "virtio-scsi-fuzz",
> > -                .description = "Fuzz the virtio-scsi virtual queues, forking"
> > +                .description = "Fuzz the virtio-scsi virtual queues, forking "
> >                                  "for each fuzz run",
> >                  .pre_vm_init = &counter_shm_init,
> >                  .pre_fuzz = &virtio_scsi_pre_fuzz,
> > @@ -202,7 +202,7 @@ static void register_virtio_scsi_fuzz_targets(void)
> >  
> >      fuzz_add_qos_target(&(FuzzTarget){
> >                  .name = "virtio-scsi-flags-fuzz",
> > -                .description = "Fuzz the virtio-scsi virtual queues, forking"
> > +                .description = "Fuzz the virtio-scsi virtual queues, forking "
> >                  "for each fuzz run (also fuzzes the virtio flags)",
> >                  .pre_vm_init = &counter_shm_init,
> >                  .pre_fuzz = &virtio_scsi_pre_fuzz,
> > 
> 
> Uh I thought we had fixed these already :/
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Same..
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

