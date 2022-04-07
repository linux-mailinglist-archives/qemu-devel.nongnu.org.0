Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E463D4F8111
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:56:01 +0200 (CEST)
Received: from localhost ([::1]:47316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncScC-0006Aa-OS
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncSZz-0005T4-N8
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncSZw-00042N-8G
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649339618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ed3f1qDONgOJVj4mdgFBEyC+s/aZVtbRJxbLwqwK7Z8=;
 b=MYsg+sk2kM96HnykWnX/vvq60rX2nJ7eOICE3blO6E7/xwoSpBgDW7CTNYAJvIXe0Aqmvk
 QJ/dLSLvNcqz4Q4msxmkXb+NtecmJiDrMV3rShrlYkdq2BSrdoH1mz934pxRBt3+ffwPlO
 iLUGkLXXFCta3Ns1RaOLaBRCnJSi6ns=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-8TanSU8LMf2GaqjvjsTfDw-1; Thu, 07 Apr 2022 09:53:37 -0400
X-MC-Unique: 8TanSU8LMf2GaqjvjsTfDw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h205-20020a1c21d6000000b0038e9ce3b29cso50620wmh.2
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ed3f1qDONgOJVj4mdgFBEyC+s/aZVtbRJxbLwqwK7Z8=;
 b=2uWrADAgXSWU9f/ILYH0viq5NhItV1qC0l2m9zeXrrIErKfPVNpKvD5Z7PDamBUk8S
 lLhPBr5vh/qfK6WP/RWwNzDVMUGqxJmxL2tJ2/oD2X1qLqVl07kjy/xy8rOznhmLl17B
 Bb7D1z9R50FxN+r3CCP0wzj36HccTO/yxzkQDELXxmqqoOomxLtW51ZzkTN3aQoAwHj8
 kQBLNg66cc1COaM5dF3fANEamvCUkQVngYejHJ94dMCJJrxZQP2auxGjPZml3RI/YPqs
 IeqiKLtzvp94ZWYRsrJnMoSIKRgiSQKX6hIHN7+AAspuzcwGJtuPboPO1Sn0Cb8+s098
 tgUQ==
X-Gm-Message-State: AOAM530TkzmBKXM85ldaj7SKPLEtGJWJSUdVTY+SVflvFgYZVF4hbPPH
 AdAP8+Bqqrqpm+kCMwO0pkfaKJ+oNKoWHe9An1sH/RuznpYPdkezn6GAKlptDR7wTNJShY1dceJ
 Bu0o2eaBRZYSumdY=
X-Received: by 2002:a05:6000:1acc:b0:204:2ae7:da14 with SMTP id
 i12-20020a0560001acc00b002042ae7da14mr10814235wry.609.1649339615920; 
 Thu, 07 Apr 2022 06:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmvaFUqyOUjGTSHgtkmt2MJICMBndIdYz7uRdtyQkYWZhpHJyVZoABdwSc5vV+hRlEtKLbDg==
X-Received: by 2002:a05:6000:1acc:b0:204:2ae7:da14 with SMTP id
 i12-20020a0560001acc00b002042ae7da14mr10814212wry.609.1649339615622; 
 Thu, 07 Apr 2022 06:53:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b00203fb25165esm20721410wrc.6.2022.04.07.06.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:53:34 -0700 (PDT)
Date: Thu, 7 Apr 2022 14:53:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <Yk7s3CSYTKiZPPON@work-vm>
References: <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
 <YjNNqzb7eBBwMFJN@work-vm>
 <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
 <Yj2nh1LRZ54BXuds@redhat.com>
 <47af35ec-2ca8-26ae-f4e4-d81f18f2a05b@suse.de>
 <YkFycBMT0HsYUfJr@redhat.com>
 <c5924d0a-78e4-29ed-e856-e8ab823bc560@suse.de>
 <Ykv/TLS8zgwh/ros@work-vm>
 <9e990c54-746f-eb97-1e6a-1ce298d511b9@suse.de>
MIME-Version: 1.0
In-Reply-To: <9e990c54-746f-eb97-1e6a-1ce298d511b9@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, andrea.righi@canonical.com,
 Jiri Denemark <jdenemar@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 4/5/22 10:35 AM, Dr. David Alan Gilbert wrote:
> > * Claudio Fontana (cfontana@suse.de) wrote:
> >> On 3/28/22 10:31 AM, Daniel P. Berrangé wrote:
> >>> On Sat, Mar 26, 2022 at 04:49:46PM +0100, Claudio Fontana wrote:
> >>>> On 3/25/22 12:29 PM, Daniel P. Berrangé wrote:
> >>>>> On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
> >>>>>> On 3/17/22 4:03 PM, Dr. David Alan Gilbert wrote:
> >>>>>>> * Claudio Fontana (cfontana@suse.de) wrote:
> >>>>>>>> On 3/17/22 2:41 PM, Claudio Fontana wrote:
> >>>>>>>>> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
> >>>>>>>>>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
> >>>>>>>>>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
> >>>>>>>>>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>>>>>> the first user is the qemu driver,
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> This improves the situation by 400%.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
> >>>>>>>>>>>>>>>> compared with direct qemu migration to a nc socket to a file.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
> >>>>>>>>>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
> >>>>>>>>>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
> >>>>>>>>>>>>>>>>  src/util/virfile.h        |  1 +
> >>>>>>>>>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
> >>>>>>>>>>>>>>>> so you can find the discussion about this in qemu-devel:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> Current results show these experimental averages maximum throughput
> >>>>>>>>>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
> >>>>>>>>>>> "query-migrate", tests repeated 5 times for each).
> >>>>>>>>>>> VM Size is 60G, most of the memory effectively touched before migration,
> >>>>>>>>>>> through user application allocating and touching all memory with
> >>>>>>>>>>> pseudorandom data.
> >>>>>>>>>>>
> >>>>>>>>>>> 64K:     5200 Mbps (current situation)
> >>>>>>>>>>> 128K:    5800 Mbps
> >>>>>>>>>>> 256K:   20900 Mbps
> >>>>>>>>>>> 512K:   21600 Mbps
> >>>>>>>>>>> 1M:     22800 Mbps
> >>>>>>>>>>> 2M:     22800 Mbps
> >>>>>>>>>>> 4M:     22400 Mbps
> >>>>>>>>>>> 8M:     22500 Mbps
> >>>>>>>>>>> 16M:    22800 Mbps
> >>>>>>>>>>> 32M:    22900 Mbps
> >>>>>>>>>>> 64M:    22900 Mbps
> >>>>>>>>>>> 128M:   22800 Mbps
> >>>>>>>>>>>
> >>>>>>>>>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
> >>>>>>>>>>
> >>>>>>>>>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
> >>>>>>>>>> libvirt attempt to raise the pipe limit to 1 MB by default, but
> >>>>>>>>>> not try to go higher.
> >>>>>>>>>>
> >>>>>>>>>>> As for the theoretical limit for the libvirt architecture,
> >>>>>>>>>>> I ran a qemu migration directly issuing the appropriate QMP
> >>>>>>>>>>> commands, setting the same migration parameters as per libvirt,
> >>>>>>>>>>> and then migrating to a socket netcatted to /dev/null via
> >>>>>>>>>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
> >>>>>>>>>>>
> >>>>>>>>>>> QMP:    37000 Mbps
> >>>>>>>>>>
> >>>>>>>>>>> So although the Pipe size improves things (in particular the
> >>>>>>>>>>> large jump is for the 256K size, although 1M seems a very good value),
> >>>>>>>>>>> there is still a second bottleneck in there somewhere that
> >>>>>>>>>>> accounts for a loss of ~14200 Mbps in throughput.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
> >>>>>>>> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
> >>>>>>>>
> >>>>>>>> ~50000 mbps qemu to netcat socket to /dev/null
> >>>>>>>> ~35500 mbps virsh save to /dev/null
> >>>>>>>>
> >>>>>>>> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).
> >>>>>>>
> >>>>>>> It might be closer to RAM or cache bandwidth limited though; for an extra copy.
> >>>>>>
> >>>>>> I was thinking about sendfile(2) in iohelper, but that probably
> >>>>>> can't work as the input fd is a socket, I am getting EINVAL.
> >>>>>
> >>>>> Yep, sendfile() requires the input to be a mmapable FD,
> >>>>> and the output to be a socket.
> >>>>>
> >>>>> Try splice() instead  which merely requires 1 end to be a
> >>>>> pipe, and the other end can be any FD afaik.
> >>>>>
> >>>>
> >>>> I did try splice(), but performance is worse by around 500%.
> >>>
> >>> Hmm, that's certainly unexpected !
> >>>
> >>>> Any ideas welcome,
> >>>
> >>> I learnt there is also a newer  copy_file_range call, not sure if that's
> >>> any better.
> >>>
> >>> You passed len as 1 MB, I wonder if passing MAXINT is viable ? We just
> >>> want to copy everything IIRC.
> >>>
> >>> With regards,
> >>> Daniel
> >>>
> >>
> >> Crazy idea, would trying to use the parallel migration concept for migrating to/from a file make any sense?
> >>
> >> Not sure if applying the qemu multifd implementation of this would apply, maybe it could be given another implementation for "toFile", trying to use more than one cpu to do the transfer?
> > 
> > I can't see a way that would help; well, I could if you could
> > somehow have multiple io helper threads that dealt with it.
> 
> The first issue I encounter here for both the "virsh save" and "virsh restore" scenarios is that libvirt uses fd: migration, not unix: migration.
> QEMU supports multifd for unix:, tcp:, vsock: as far as I can see.
> 
> Current save procedure in QMP in short:
> 
> {"execute":"migrate-set-capabilities", ...}
> {"execute":"migrate-set-parameters", ...}
> {"execute":"getfd","arguments":{"fdname":"migrate"}, ...} fd=26
> QEMU_MONITOR_IO_SEND_FD: fd=26
> {"execute":"migrate","arguments":{"uri":"fd:migrate"}, ...}
> 
> 
> Current restore procedure in QMP in short:
> 
> (start QEMU)
> {"execute":"migrate-incoming","arguments":{"uri":"fd:21"}, ...}
> 
> 
> Should I investigate changing libvirt to use unix: for save/restore?
> Or should I look into changing qemu to somehow accept fd: for multifd, meaning I guess providing multiple fd: uris in the migrate command?

So I'm not sure this is the right direction; i.e. if multifd is the
right answer to your problem.
However, I think the qemu code probably really really wants to be a
socket.

Dave

> 
> Thank you for your help,
> 
> Claudio
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


